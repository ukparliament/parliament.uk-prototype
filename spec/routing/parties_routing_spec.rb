require 'rails_helper'

RSpec.describe 'parties', type: :routing do
  describe 'PartiesController' do
    include_examples 'index route', 'parties'

    # parties#current
    include_examples 'top level routes', 'parties', 'current'

    # parties#lookup
    include_examples 'top level routes', 'parties', 'lookup'

    # parties#a_to_z
    include_examples 'nested collection routes', 'parties', ['a-z'], 'a_to_z'

    # parties#letters
    include_examples 'collection a_to_z route with a letter', 'parties', ['a-z'], 'letters', 'a'

    context 'party' do
      # parties#show
      include_examples 'nested routes with an id', 'parties', 'jF43Jxoc', [], 'show'

      # parties/members#index
      it 'GET parties/members#index' do
        expect(get: '/parties/jF43Jxoc/members').to route_to(
          controller: 'parties/members',
          action:     'index',
          party_id:   'jF43Jxoc'
        )
      end

      it 'GET parties/members#a_to_z' do
        expect(get: '/parties/jF43Jxoc/members/a-z').to route_to(
          controller: 'parties/members',
          action:     'a_to_z',
          party_id:   'jF43Jxoc'
        )
      end

      it 'GET parties/members#current' do
        expect(get: '/parties/jF43Jxoc/members/current').to route_to(
          controller: 'parties/members',
          action:     'current',
          party_id:   'jF43Jxoc'
        )
      end

      it 'GET parties/members#a_to_z_current' do
        expect(get: '/parties/jF43Jxoc/members/current/a-z').to route_to(
          controller: 'parties/members',
          action:     'a_to_z_current',
          party_id:   'jF43Jxoc'
        )
      end

      it 'GET parties/members#letters' do
        expect(get: '/parties/jF43Jxoc/members/a-z/a').to route_to(
          controller: 'parties/members',
          action:     'letters',
          party_id:   'jF43Jxoc',
          letter:    'a',
        )
      end

      it 'GET parties/members#current_letters' do
        expect(get: '/parties/jF43Jxoc/members/current/a-z/a').to route_to(
          controller: 'parties/members',
          action:     'current_letters',
          party_id:   'jF43Jxoc',
          letter:    'a',
        )
      end
    end

    it 'GET parties#lookup_by_letters' do
      expect(get: '/parties/a').to route_to(
        controller: 'parties',
        action:     'lookup_by_letters',
        letters:    'a'
      )
    end
  end
end
