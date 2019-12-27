# frozen_string_literal: true

require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = friends(:one)
  end

  test 'should get index' do
    get friends_url
    assert_response :success
  end

  test 'should get new' do
    get new_friend_url
    assert_response :success
  end

  test 'should create person' do
    assert_difference('Person.count') do
      post friends_url, params: { person: { first_name: @person.first_name, last_name: @person.last_name } }
    end

    assert_redirected_to friend_url(Person.last)
  end

  test 'should show person' do
    get friend_url(@person)
    assert_response :success
  end

  test 'should get edit' do
    get edit_friend_url(@person)
    assert_response :success
  end

  test 'should update person' do
    patch friend_url(@person), params: { person: { first_name: @person.first_name, last_name: @person.last_name } }
    assert_redirected_to friend_url(@person)
  end

  test 'should destroy person' do
    assert_difference('Person.count', -1) do
      delete friend_url(@person)
    end

    assert_redirected_to friends_url
  end
end
