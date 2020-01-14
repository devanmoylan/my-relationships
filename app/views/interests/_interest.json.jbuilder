# frozen_string_literal: true

json.extract! interest, :id, :name, :level, :person_id, :created_at, :updated_at
json.url interest_url(interest, format: :json)
