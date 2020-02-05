# frozen_string_literal: true

class ImportPeopleFromCsvService
  def initialize(user_id, csv_file)
    @user_id = user_id
    @csv_file = csv_file
    @counter = 0
    @errors = []
  end

  def import
    CSV.foreach(csv_file.path, headers: true, header_converters: :symbol) do |row|
      next if missing_name?(row)

      person = assign_from_csv(row)
      if person.save
        @counter += 1
      else
        @errors << "#{person.name} - #{person.errors.full_messages.to_sentence}. "
      end
    end

    result
  end

  private

  attr_reader :user_id, :csv_file

  def user
    @user ||= User.find(user_id)
  end

  def assign_from_csv(row)
    person = user.people.find_or_create_by!(first_name: first_name(row), last_name: last_name(row))
    person.assign_attributes(email: email(row), position: position(row), company: company(row))
    person
  end

  def missing_name?(row)
    first_name(row).nil? || last_name(row).nil?
  end

  def first_name(row)
    # google_contacts: :name
    # linked_in: :first_name
    row[:first_name].presence || row[:name]&.split(' ')&.first
  end

  def last_name(row)
    row[:last_name].presence || row[:name]&.split(' ')&.last
  end

  def email(row)
    # google_contacts: :email_1_value
    # linked_in: :email_address
    row[:email_1_value].presence || row[:email_address]
  end

  def position(row)
    # linked_in: :position
    row[:position].presence
  end

  def company(row)
    # linked_in: :company
    row[:company].presence
  end

  def result
    if @errors.empty?
      "Imported #{@counter} connections successfully"
    else
      "Imported #{@counter} connections successfully, but errored on #{@errors.to_sentence}"
    end
  end
end
