# frozen_string_literal: true

json.extract! bond, :id, :person_id, :first_name, :last_name, :relationship, :birthday, :created_at, :updated_at
json.url bond_url(bond, format: :json)
