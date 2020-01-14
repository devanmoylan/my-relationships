# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'interests/index', type: :view do
  before(:each) do
    assign(:interests, [
             Interest.create!(
               name: 'Name',
               level: 2,
               person: nil
             ),
             Interest.create!(
               name: 'Name',
               level: 2,
               person: nil
             )
           ])
  end

  it 'renders a list of interests' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
