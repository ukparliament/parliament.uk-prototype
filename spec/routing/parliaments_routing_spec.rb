require 'rails_helper'

RSpec.describe 'parliaments', type: :routing do
  describe 'ParliamentsController' do
    context 'parliaments' do
      # parliaments#index
      include_examples 'index route', 'parliaments'

      # parliaments#current
      include_examples 'top level routes', 'parliaments', 'current'

      # parliaments#lookup
      include_examples 'top level routes', 'parliaments', 'lookup'

      # parliaments#next
      include_examples 'top level routes', 'parliaments', 'next'

      # parliaments#previous
      include_examples 'top level routes', 'parliaments', 'previous'

      context 'parliament' do
        context 'show' do
          # parliaments#show
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', [], 'show'
        end

        context 'next parliament' do
          # parliaments#next_parliament
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', ['next'], 'next_parliament'
        end

        context 'previous parliament' do
          # parliaments#previous_parliament
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', ['previous'], 'previous_parliament'
        end

        context 'members' do
          # parliaments#members
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', ['members'], 'members'

          # parliaments#a_to_z_members
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', %w(members a-z), 'a_to_z_members'

          # parliaments#members_letters
          include_examples 'a_to_z route with an id and letter', 'parliaments', 'KL2k1BGP', %w(members a-z), 'members_letters', 'a'
        end

        context 'parties' do
          # parliaments#parties
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', ['parties'], 'parties'

          context 'party' do
            # parliaments#party
            include_examples 'nested routes with multiple ids', 'parliaments', 'KL2k1BGP', ['parties'], 'party', '12341234', ['']
          end

          context 'members' do
            # parliaments#party_members
            it "GET parliaments#party_members" do
              expect(get: '/parliaments/KL2k1BGP/parties/12341234/members').to route_to(
                controller:    'parliaments',
                action:        'party_members',
                parliament_id: 'KL2k1BGP',
                party_id:      '12341234'
              )
            end

            # parliaments#a_to_z_party_members
            it "GET parliaments#a_to_z_party_members" do
              expect(get: '/parliaments/KL2k1BGP/parties/12341234/members/a-z').to route_to(
                controller:    'parliaments',
                action:        'a_to_z_party_members',
                parliament_id: 'KL2k1BGP',
                party_id:      '12341234',
              )
            end

            # parliaments#party_members_letters
            it "GET parliaments#party_members_letters" do
              expect(get: '/parliaments/KL2k1BGP/parties/12341234/members/a-z/a').to route_to(
                controller:    'parliaments',
                action:        'party_members_letters',
                parliament_id: 'KL2k1BGP',
                party_id:      '12341234',
                letter:        'a'
              )
            end
          end
        end

        context 'houses' do
          # parliaments#houses
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', ['houses'], 'houses'

          context 'house' do
            # parliaments#house
            include_examples 'nested routes with multiple ids', 'parliaments', 'KL2k1BGP', ['houses'], 'house', '12341234', ['']
          end

          context 'members' do
            # parliaments#house_members
            include_examples 'nested routes with multiple ids', 'parliaments', 'KL2k1BGP', ['houses'], 'house_members', '12341234', %w(members)

            # parliaments#a_to_z_house_members
            include_examples 'nested routes with multiple ids', 'parliaments', 'KL2k1BGP', ['houses'], 'a_to_z_house_members', '12341234', %w(members a-z)

            #parliaments#house_members_letters
            include_examples 'nested routes with multiple ids and letter', 'parliaments', 'KL2k1BGP', ['houses'], 'house_members_letters', '12341234', %w(members a-z a)
          end

          context 'parties' do
            # parliaments#house_parties
            include_examples 'nested routes with multiple ids', 'parliaments', 'KL2k1BGP', ['houses'], 'house_parties', '12341234', ['parties']

            context 'party' do
              # parliaments#house_party
              include_examples 'nested routes with multiple ids', 'parliaments', 'KL2k1BGP', ['parties'], 'party', '12341234', ['']
            end

            context 'members' do
              # parliaments#house_party_members
              it 'GET parliaments#house_party_members' do
                expect(get: '/parliaments/12341234/houses/12345678/parties/87654321/members').to route_to(
                  controller:    'parliaments',
                  action:        'house_party_members',
                  parliament_id: '12341234',
                  house_id:      '12345678',
                  party_id:      '87654321'
                )
              end

              # parliaments#a_to_z_house_party_members
              it 'GET parliaments#a_to_z_house_party_members' do
                expect(get: '/parliaments/12341234/houses/12345678/parties/87654321/members/a-z').to route_to(
                  controller:    'parliaments',
                  action:        'a_to_z_house_party_members',
                  parliament_id: '12341234',
                  house_id:      '12345678',
                  party_id:      '87654321'
                )
              end

              #parliaments#house_party_members_letters
              it 'GET parliaments#house_party_members_letters' do
                expect(get: '/parliaments/12341234/houses/12345678/parties/87654321/members/a-z/a').to route_to(
                  controller:    'parliaments',
                  action:        'house_party_members_letters',
                  parliament_id: '12341234',
                  house_id:      '12345678',
                  party_id:      '87654321',
                  letter:        'a'
                )
              end
            end
          end
        end

        context 'constituencies' do
          # parliaments#constituencies
          include_examples 'nested routes with an id', 'parliaments', 'KL2k1BGP', ['constituencies'], 'constituencies'

          # parliaments#a_to_z_constituencies
          it 'GET parliaments#a_to_z_constituencies' do
            expect(get: '/parliaments/12345678/constituencies/a-z').to route_to(
              controller:    'parliaments',
              action:        'a_to_z_constituencies',
              parliament_id: '12345678'
            )
          end

          # parliaments#constituencies_letters
          include_examples 'a_to_z route with an id and letter', 'parliaments', 'KL2k1BGP', %w(constituencies a-z), 'constituencies_letters', 'a'
        end
      end
    end
  end
end
