# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InterestsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/users/1/people/36/interests').to route_to('interests#index', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #new' do
      expect(get: '/users/1/people/36/interests/new').to route_to('interests#new', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #show' do
      expect(get: '/users/1/people/36/interests/1').to route_to('interests#show', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #edit' do
      expect(get: '/users/1/people/36/interests/1/edit').to route_to('interests#edit', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #create' do
      expect(post: '/users/1/people/36/interests').to route_to('interests#create', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1/people/36/interests/1').to route_to('interests#update', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1/people/36/interests/1').to route_to('interests#update', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end

    it 'routes to #destroy' do
      expect(delete: '/users/1/people/36/interests/1').to route_to('interests#destroy', :id => '1', 'user_id' => '1', 'person_id' => '36')
    end
  end
end
