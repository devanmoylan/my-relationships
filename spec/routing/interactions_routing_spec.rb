# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InteractionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/people/36/interactions').to route_to('interactions#index', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #new' do
      expect(get: '/users/1/people/36/interactions/new').to route_to('interactions#new', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #show' do
      expect(get: '/users/1/people/36/interactions/1').to route_to('interactions#show', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/people/36/interactions/1/edit').to route_to('interactions#edit', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #create' do
      expect(post: '/users/1/people/36/interactions').to route_to('interactions#create', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/people/36/interactions/1').to route_to('interactions#update', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/people/36/interactions/1').to route_to('interactions#update', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/people/36/interactions/1').to route_to('interactions#destroy', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end
  end
end
