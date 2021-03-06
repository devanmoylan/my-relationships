# frozen_string_literal: true

class Interaction < ApplicationRecord
  belongs_to :person
  belongs_to :user

  has_rich_text :notes

  has_many :reminders, as: :memorable, dependent: :destroy, inverse_of: :memorable
  has_many :mentions, as: :sourceable, dependent: :destroy

  accepts_nested_attributes_for :reminders, reject_if: :all_blank, allow_destroy: true

  after_save :distribute_mentions

  def distribute_mentions
    people = person_mentions - [person]

    people.each do |person|
      mention = mentions.find_or_initialize_by(mentionable_type: 'Person', mentionable_id: person.id)
      mention.update(
        body: notes,
        source_path: "/users/#{user_id}/people/#{person_id}/interactions/#{id}/edit",
        source_person_name: self.person.name.familiar,
        source_title: title
      )
    end
  end

  def person_mentions
    @people ||= notes.body.attachments.select { |a| a.attachable.class == Person }.map(&:attachable).uniq
  end
end
