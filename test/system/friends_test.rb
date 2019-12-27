# frozen_string_literal: true

require 'application_system_test_case'

class FriendsTest < ApplicationSystemTestCase
  setup do
    @person = friends(:one)
  end

  test 'visiting the index' do
    visit friends_url
    assert_selector 'h1', text: 'Friends'
  end

  test 'creating a Person' do
    visit friends_url
    click_on 'New Person'

    fill_in 'First name', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    click_on 'Create Person'

    assert_text 'Person was successfully created'
    click_on 'Back'
  end

  test 'updating a Person' do
    visit friends_url
    click_on 'Edit', match: :first

    fill_in 'First name', with: @person.first_name
    fill_in 'Last name', with: @person.last_name
    click_on 'Update Person'

    assert_text 'Person was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Person' do
    visit friends_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Person was successfully destroyed'
  end
end
