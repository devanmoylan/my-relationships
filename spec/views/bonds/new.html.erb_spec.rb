require 'rails_helper'

RSpec.describe "bonds/new", type: :view do
  before(:each) do
    assign(:bond, Bond.new(
      person: nil,
      first_name: "MyString",
      last_name: "MyString",
      relationship: "MyString"
    ))
  end

  it "renders new bond form" do
    render

    assert_select "form[action=?][method=?]", bonds_path, "post" do

      assert_select "input[name=?]", "bond[person_id]"

      assert_select "input[name=?]", "bond[first_name]"

      assert_select "input[name=?]", "bond[last_name]"

      assert_select "input[name=?]", "bond[relationship]"
    end
  end
end
