# frozen_string_literal: true

json.extract! event, :id, :person_id, :date, :duration, :role, :description, :title, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
