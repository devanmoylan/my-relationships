# frozen_string_literal: true

json.extract! interaction, :id, :person_id, :user_id, :notes, :key_take_aways, :follow_ups, :location, :private_interaction, :created_at, :updated_at
json.url interaction_url(interaction, format: :json)
