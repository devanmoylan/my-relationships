# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interactions/show', type: :view do
  before(:each) do
    @interaction = assign(:interaction, Interaction.create!(
                                          person: nil,
                                          user: nil,
                                          notes: 'MyText',
                                          key_take_aways: 'MyText',
                                          follow_ups: 'MyText',
                                          location: 'Location',
                                          private_interaction: false
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(/false/)
  end
end
