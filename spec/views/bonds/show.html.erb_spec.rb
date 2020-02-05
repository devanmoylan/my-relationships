# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'bonds/show', type: :view do
  before(:each) do
    @bond = assign(:bond, Bond.create!(
                            person: nil,
                            first_name: 'First Name',
                            last_name: 'Last Name',
                            relationship: 'Relationship'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Relationship/)
  end
end
