# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "users/:user_id/people/:person_id/interests/new", type: :view do
  before(:each) do
    assign(:interest, FactoryBot.create(
      :interest,
      name: 'Dancing',
      level: 2,
      person: FactoryBot.create(:user).people.first
    ))
  end

  it 'renders new interest form' do
    render

    assert_select 'form[action=?][method=?]', user_person_interests_path(User.last, Person.last), 'post' do
      assert_select 'input[name=?]', 'interest[name]'

      assert_select 'input[name=?]', 'interest[level]'
    end
  end
end
