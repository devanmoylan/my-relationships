# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user

  has_rich_text :notes

  has_many :mentions, as: :sourceable, dependent: :destroy

  after_save :distribute_mentions

  def distribute_mentions
    person_mentions.each do |person|
      mention = mentions.find_or_initialize_by(mentionable_type: 'Person', mentionable_id: person.id)
      mention.update!(
        body: notes,
        source_person_name: self.user.name.familiar,
        source_path: "/users/#{user_id}/events/#{self.id}/edit",
        source_title: title
      )
    end
  end

  def person_mentions
    @people ||= notes.body.attachments.select { |a| a.attachable.class == Person }.map(&:attachable).uniq
  end
end
