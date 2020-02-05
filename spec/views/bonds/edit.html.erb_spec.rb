# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bonds/edit', type: :view do
  before(:each) do
    @bond = assign(:bond, Bond.create!(
                            person: nil,
                            first_name: 'MyString',
                            last_name: 'MyString',
                            relationship: 'MyString'
                          ))
  end

  it 'renders the edit bond form' do
    render

    assert_select 'form[action=?][method=?]', bond_path(@bond), 'post' do
      assert_select 'input[name=?]', 'bond[person_id]'

      assert_select 'input[name=?]', 'bond[first_name]'

      assert_select 'input[name=?]', 'bond[last_name]'

      assert_select 'input[name=?]', 'bond[relationship]'
    end
  end
end
