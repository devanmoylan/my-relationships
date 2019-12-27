# frozen_string_literal: true

json.extract! experience, :id, :experience_type, :start_date, :end_date, :location, :description, :role, :created_at, :updated_at
json.url experience_url(experience, format: :json)
