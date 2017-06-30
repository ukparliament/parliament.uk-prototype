require 'rails_helper'

RSpec.describe 'houses/parties/members/a_to_z_current', vcr: true do
  before do
    assign(:house_id, 'KL2k1BGP')
    assign(:party_id, 'pPvA9vKP')
    assign(:letters, 'A')
    render
  end

  it 'will render pugin/components/_navigation-letter' do
    expect(response).to render_template(
      partial: 'pugin/components/_navigation-letter',
      locals:  { route_args: ['KL2k1BGP', 'pPvA9vKP'] }
    )
  end
end
