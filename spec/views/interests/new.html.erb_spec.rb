# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interests/new', type: :view do
  before(:each) do
    assign(:interest, Interest.new(
                        name: 'MyString',
                        level: 1,
                        person: nil
                      ))
  end

  it 'renders new interest form' do
    render

    assert_select 'form[action=?][method=?]', interests_path, 'post' do
      assert_select 'input[name=?]', 'interest[name]'

      assert_select 'input[name=?]', 'interest[level]'

      assert_select 'input[name=?]', 'interest[person_id]'
    end
  end
end
