require 'rails_helper'

RSpec.describe 'resource/show' do
  before(:each) do
    @statements = [ ['subject1', 'predicate1', 'object1'], ['subject2', 'predicate2', 'object2'] ]
    render
  end

  context 'table headings' do
    it 'displays the correct titles' do
      expect(rendered).to match(/Subject/)
      expect(rendered).to match(/Predicate/)
      expect(rendered).to match(/Object/)
    end
  end

  it 'displays the correct text' do
    expect(rendered).to match(/subject1/)
  end
end
