# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interactions/edit', type: :view do
  before(:each) do
    @interaction = assign(:interaction, Interaction.create!(
                                          person: nil,
                                          user: nil,
                                          notes: 'MyText',
                                          key_take_aways: 'MyText',
                                          follow_ups: 'MyText',
                                          location: 'MyString',
                                          private_interaction: false
                                        ))
  end

  it 'renders the edit interaction form' do
    render

    assert_select 'form[action=?][method=?]', interaction_path(@interaction), 'post' do
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
