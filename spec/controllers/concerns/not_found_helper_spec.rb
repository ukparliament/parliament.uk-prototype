require 'rails_helper'

describe NotFoundHelper do
  let(:extended_class) { Class.new { extend NotFoundHelper } }

  describe '#not_found' do
    it 'raises a routing error with the message "Not Found"' do
      expect{ extended_class.not_found }.to raise_error('Not Found')
    end
  end
end