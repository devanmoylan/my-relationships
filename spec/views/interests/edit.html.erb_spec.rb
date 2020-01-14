# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interests/edit', type: :view do
  before(:each) do
    @interest = assign(:interest, FactoryBot.create(
                                    :interest,
                                    name: 'Dancing',
                                    level: 1,
                                    person: FactoryBot.create(:person)
                                  ))
  end

  it 'renders the edit interest form' do
    render

    assert_select 'form[action=?][method=?]', user_person_interest_path(@user, @person, @interest), 'post' do
      assert_select 'input[name=?]', 'interest[name]'

      assert_select 'input[name=?]', 'interest[level]'

      assert_select 'input[name=?]', 'interest[person_id]'
    end
  end
end
