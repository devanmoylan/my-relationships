# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interests/show', type: :view do
  before(:each) do
    @interest = assign(:interest, FactoryBot.create(
                                    :interest,
                                    name: 'Dancing',
                                    level: 2,
                                    person: FactoryBot.create(:person)
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
