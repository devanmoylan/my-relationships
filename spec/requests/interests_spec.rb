# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Interests', type: :request do
  describe 'GET /interests' do
    it 'works! (now write some real specs)' do
      user = FactoryBot.create(:user)
      get user_person_interests_path(user, user.people.first)
      expect(response).to have_http_status(200)
    end
  end
end
