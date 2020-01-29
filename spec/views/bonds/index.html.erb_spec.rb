require 'rails_helper'

RSpec.describe "bonds/index", type: :view do
  before(:each) do
    assign(:bonds, [
      Bond.create!(
        person: nil,
        first_name: "First Name",
        last_name: "Last Name",
        relationship: "Relationship"
      ),
      Bond.create!(
        person: nil,
        first_name: "First Name",
        last_name: "Last Name",
        relationship: "Relationship"
      )
    ])
  end

  it "renders a list of bonds" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Relationship".to_s, count: 2
  end
end
