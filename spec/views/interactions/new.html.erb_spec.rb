# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interactions/new', type: :view do
  before(:each) do
    assign(:interaction, Interaction.new(
                           person: nil,
                           user: nil,
                           notes: 'MyText',
                           key_take_aways: 'MyText',
                           follow_ups: 'MyText',
                           location: 'MyString',
                           private_interaction: false
                         ))
  end

  it 'renders new interaction form' do
    render

    assert_select 'form[action=?][method=?]', interactions_path, 'post' do
      assert_select 'input[name=?]', 'interaction[person_id]'

      assert_select 'input[name=?]', 'interaction[user_id]'

      assert_select 'textarea[name=?]', 'interaction[notes]'

      assert_select 'textarea[name=?]', 'interaction[key_take_aways]'

      assert_select 'textarea[name=?]', 'interaction[follow_ups]'

      assert_select 'input[name=?]', 'interaction[location]'

      assert_select 'input[name=?]', 'interaction[private_interaction]'
    end
  end
end
