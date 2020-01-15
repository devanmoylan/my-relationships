# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interactions/index', type: :view do
  before(:each) do
    assign(:interactions, [
             Interaction.create!(
               person: nil,
               user: nil,
               notes: 'MyText',
               key_take_aways: 'MyText',
               follow_ups: 'MyText',
               location: 'Location',
               private_interaction: false
             ),
             Interaction.create!(
               person: nil,
               user: nil,
               notes: 'MyText',
               key_take_aways: 'MyText',
               follow_ups: 'MyText',
               location: 'Location',
               private_interaction: false
             )
           ])
  end

  it 'renders a list of interactions' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'MyText'.to_s, count: 2
    assert_select 'tr>td', text: 'Location'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
