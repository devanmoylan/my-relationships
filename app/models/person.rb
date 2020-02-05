# frozen_string_literal: true

class Person < ApplicationRecord
  include ActionText::Attachable

  has_person_name

  has_one_attached :avatar

  has_many :relationships, join_table: 'relationships', class_name: 'Relationship'
  has_many :users, through: :relationships

  has_many :bonds, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :interactions, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :mentions, as: :mentionable, dependent: :destroy
  has_many :reminders, as: :memorable, dependent: :destroy

  accepts_nested_attributes_for :reminders, reject_if: :all_blank, allow_destroy: true

  def self.import(user_id, csv_file)
    user = User.find(user_id)
    counter = 0
    CSV.foreach(csv_file.path, headers: true, header_converters: :symbol) do |row|
      next if row[:name].nil?

      person = assign_from_csv(user, row)
      if person.save
        counter += 1
      else
        puts "#{person.name} - #{person.errors.full_messages.join(",")}"
      end
    end
    counter
  end

  def self.assign_from_csv(user, row)
    first_name, last_name = row[:name].split(" ")
    person = user.people.find_or_create_by!(first_name: first_name, last_name: last_name)
    # person.assign_attributes row.to_hash.slice(:first_name, :last_name)
    person
  end
end
