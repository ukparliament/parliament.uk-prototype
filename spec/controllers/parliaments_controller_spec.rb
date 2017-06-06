require 'rails_helper'

RSpec.describe ParliamentsController, vcr: true do
  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parliaments' do
      assigns(:parliaments).each do |parliament|
        expect(parliament).to be_a(Grom::Node)
        expect(parliament.type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    it 'assigns @parliaments in numeric order' do
      expect(assigns(:parliaments)[0].number).to eq(57)
      expect(assigns(:parliaments)[1].number).to eq(56)
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe 'GET current' do
    context '@parliament is nil' do
      # updated VCR cassette in order to set @parliament to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :current}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@parliament is not nil' do
      before(:each) do
        get :current
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end

      it 'redirects to parliaments/:parliament_id' do
        expect(response).to redirect_to(parliament_path(assigns(:parliament).graph_id))
      end
    end
  end

  describe 'GET next' do
    context '@parliament is nil' do
      # updated VCR cassette in order to set @parliament to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :next}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@pariament is not nil' do
      before(:each) do
        get :next
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end

      it 'redirects to parliaments/:parliament_id' do
        expect(response).to redirect_to(parliament_path(assigns(:parliament).graph_id))
      end
    end
  end

  describe 'GET previous' do
    context '@parliament is nil' do
      # updated VCR cassette in order to set @parliament to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :previous}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@parliament is not nil' do
      before(:each) do
        get :previous
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end

      it 'redirects to parliaments/:parliament_id' do
        expect(response).to redirect_to(parliament_path(assigns(:parliament).graph_id))
      end
    end
  end

  describe 'GET lookup' do
    it 'is a pending example'
  end

  describe 'GET show' do
    before(:each) do
      get :show, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parliament' do
      expect(assigns(:parliament)).to be_a(Grom::Node)
      expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe 'GET next_parliament' do
    context '@parliament is nil' do
      # updated VCR cassette in order to set @parliament to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :next_parliament, params: { parliament_id: '0FxbTVtr' }}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@parliament is not nil' do
      before(:each) do
        get :next_parliament, params: { parliament_id: '0FxbTVtr' }
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end

      it 'redirects to parliaments/:parliament_id' do
        expect(response).to redirect_to(parliament_path(assigns(:parliament).graph_id))
      end
    end
  end

  describe 'GET previous_parliament' do
    context '@parliament is nil' do
      # updated VCR cassette in order to set @parliament to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :previous_parliament, params: { parliament_id: '0FxbTVtr' }}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@parliament is not nil' do
      before(:each) do
        get :previous_parliament, params: { parliament_id: '0FxbTVtr' }
      end

      it 'should have a response with http status redirect (302)' do
        expect(response).to have_http_status(302)
      end

      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end

      it 'redirects to parliaments/:parliament_id' do
        expect(response).to redirect_to(parliament_path(assigns(:parliament).graph_id))
      end
    end
  end

  describe 'GET members' do
    before(:each) do
      get :members, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parliament, @people and @letters' do
      expect(assigns(:parliament)).to be_a(Grom::Node)
      expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')

      assigns(:people).each do |person|
        expect(person).to be_a(Grom::Node)
        expect(person.type).to eq('http://id.ukpds.org/schema/Person')
      end

      expect(assigns(:letters)).to be_a(Array)
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
      expect(assigns(:people)[1].given_name).to eq('personGivenName - 1673')
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end

  describe 'GET members_letters' do
    before(:each) do
      get :members_letters, params: { parliament_id: '0FxbTVtr', letter: 'a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parliament, @people and @letters' do
      expect(assigns(:parliament)).to be_a(Grom::Node)
      expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')

      assigns(:people).each do |person|
        expect(person).to be_a(Grom::Node)
        expect(person.type).to eq('http://id.ukpds.org/schema/Person')
      end

      expect(assigns(:letters)).to be_a(Array)
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
      expect(assigns(:people)[1].given_name).to eq('personGivenName - 10')
    end
  end

  describe 'GET a_to_z_members' do
    before(:each) do
      get :a_to_z_members, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @parliament and @letters' do
      expect(assigns(:parliament)).to be_a(Grom::Node)
      expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')

      expect(assigns(:letters)).to be_a(Array)
    end

    it 'renders the members a-z template' do
      expect(response).to render_template('a_to_z_members')
    end
  end

  describe 'GET houses' do
    before(:each) do
      get :houses, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)'do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @houses' do
        assigns(:houses).each do |house|
          expect(house).to be_a(Grom::Node)
          expect(house.type).to eq('http://id.ukpds.org/schema/House')
        end
      end
    end

    it 'renders the houses template' do
      expect(response).to render_template('houses')
    end
  end

  describe 'GET house' do
    context '@house is nil' do
      # updated VCR cassette in order to set @house to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :house, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@house is not nil' do
      before(:each) do
        get :house, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }
      end

      context '@parliament' do
        it 'assigns @parliament' do
          expect(assigns(:parliament)).to be_a(Grom::Node)
          expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
        end
      end

      context '@house' do
        it 'assigns @house' do
          expect(assigns(:house)).to be_a(Grom::Node)
          expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
        end
      end

      it 'renders the house template' do
        expect(response).to render_template('house')
      end
    end
  end

  describe 'GET house_members' do
    before(:each) do
      get :house_members, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@people' do
      it 'assigns @people' do
        assigns(:people).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Person')
        end
      end

      it 'assigns @people in alphabetical order' do
        expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
        expect(assigns(:people)[1].given_name).to eq('personGivenName - 2')
      end
    end

    it 'renders the house template' do
      expect(response).to render_template('house_members')
    end
  end

  describe 'GET a_to_z_house_members' do
    before(:each) do
      get :a_to_z_house_members, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@letters' do
      it 'assigns @letters' do
        expect(assigns(:letters)).to be_a(Array)
      end
    end

    it 'renders the house a-z template' do
      expect(response).to render_template('a_to_z_house_members')
    end
  end

  describe 'GET house_members_letters' do
    before(:each) do
      get :house_members_letters, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK', letter: 'a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@people' do
      it 'assigns @people' do
        assigns(:people).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Person')
        end
      end

      it 'assigns @people in alphabetical order' do
        expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
        expect(assigns(:people)[1].given_name).to eq('personGivenName - 2')
      end
    end

    context '@letters' do
      it 'assigns @letters' do
        expect(assigns(:letters)).to be_a(Array)
      end
    end

    it 'renders the house template' do
      expect(response).to render_template('house_members_letters')
    end
  end

  describe 'GET house_parties' do
    before(:each) do
      get :house_parties, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@parties' do
      it 'assigns @parties' do
        assigns(:parties).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Party')
        end
      end

      it 'assigns @parties in alphabetical order' do
        expect(assigns(:parties)[0].name).to eq('partyName - 1')
        expect(assigns(:parties)[1].name).to eq('partyName - 10')
      end
    end

    it 'renders the house template' do
      expect(response).to render_template('house_parties')
    end
  end

  describe 'GET house_party' do
    context '@party is nil' do
      # updated VCR cassette in order to set @party to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :house_party, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK', party_id: 'P6LNyUn4' }}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@party is not nil' do
      before(:each) do
        get :house_party, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK', party_id: 'P6LNyUn4' }
      end

      it 'should have a response with http status ok (200)' do
        expect(response).to have_http_status(:ok)
      end

      context '@parliament' do
        it 'assigns @parliament' do
          expect(assigns(:parliament)).to be_a(Grom::Node)
          expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
        end
      end

      context '@house' do
        it 'assigns @house' do
          expect(assigns(:house)).to be_a(Grom::Node)
          expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
        end
      end

      context '@party' do
        it 'assigns @party' do
          expect(assigns(:party)).to be_a(Grom::Node)
          expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
        end
      end

      it 'renders the house template' do
        expect(response).to render_template('house_party')
      end
    end
  end

  describe 'GET house_party_members' do
    before(:each) do
      get :house_party_members, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK', party_id: 'P6LNyUn4' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@party' do
      it 'assigns @party' do
        expect(assigns(:party)).to be_a(Grom::Node)
        expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      end
    end

    context '@people' do
      it 'assigns @people' do
        assigns(:people).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Person')
        end
      end

      it 'assigns @people in alphabetical order' do
        expect(assigns(:people)[0].given_name).to eq('personGivenName - 101')
        expect(assigns(:people)[1].given_name).to eq('personGivenName - 105')
      end
    end

    it 'renders the house template' do
      expect(response).to render_template('house_party_members')
    end
  end

  describe 'GET a_to_z_house_party_members' do
    before(:each) do
      get :a_to_z_house_party_members, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK', party_id: 'P6LNyUn4' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@party' do
      it 'assigns @party' do
        expect(assigns(:party)).to be_a(Grom::Node)
        expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      end
    end

    context '@letters' do
      it 'assigns @letters' do
        expect(assigns(:letters)).to be_a(Array)
      end
    end

    it 'renders the house template' do
      expect(response).to render_template('a_to_z_house_party_members')
    end
  end

  describe 'GET house_party_members_letters' do
    before(:each) do
      get :house_party_members_letters, params: { parliament_id: '0FxbTVtr', house_id: 'cqIATgUK', party_id: 'P6LNyUn4', letter: 'a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@house' do
      it 'assigns @house' do
        expect(assigns(:house)).to be_a(Grom::Node)
        expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context '@party' do
      it 'assigns @party' do
        expect(assigns(:party)).to be_a(Grom::Node)
        expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      end
    end

    context '@people' do
      it 'assigns @people' do
        assigns(:people).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Person')
        end
      end

      it 'assigns @people in alphabetical order' do
        expect(assigns(:people)[0].given_name).to eq('personGivenName - 101')
        expect(assigns(:people)[1].given_name).to eq('personGivenName - 105')
      end
    end

    context '@letters' do
      it 'assigns @letters' do
        expect(assigns(:letters)).to be_a(Array)
      end
    end

    it 'renders the house template' do
      expect(response).to render_template('house_party_members_letters')
    end
  end

  describe 'GET parties' do
    before(:each) do
      get :parties, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@parties' do
      it 'assigns @parties' do
        assigns(:parties).each do |party|
          expect(party).to be_a(Grom::Node)
          expect(party.type).to eq('http://id.ukpds.org/schema/Party')
        end
      end

      it 'assigns @parties in name order' do
        expect(assigns(:parties)[0].name).to eq('partyName - 1')
        expect(assigns(:parties)[1].name).to eq('partyName - 2')
      end
    end

    it 'renders the parties template' do
      expect(response).to render_template('parties')
    end
  end

  describe 'GET party' do
    context '@party is nil' do
      # updated VCR cassette in order to set @party to nil
      it 'should raise ActionController::RoutingError' do
        expect{get :party, params: { parliament_id: '0FxbTVtr', party_id: 'P6LNyUn4' }}.to raise_error(ActionController::RoutingError)
      end
    end

    context '@party is not nil' do
      before(:each) do
        get :party, params: { parliament_id: '0FxbTVtr', party_id: 'P6LNyUn4' }
      end

      it 'should have a response with http status ok (200)' do
        expect(response).to have_http_status(:ok)
      end

      context '@parliament' do
        it 'assigns @parliament' do
          expect(assigns(:parliament)).to be_a(Grom::Node)
          expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
        end
      end

      context '@party' do
        it 'assigns @party' do
          expect(assigns(:party)).to be_a(Grom::Node)
          expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
        end
      end

      it 'renders the party template' do
        expect(response).to render_template('party')
      end
    end
  end

  describe 'GET party_members' do
    before(:each) do
      get :party_members, params: { parliament_id: '0FxbTVtr', party_id: 'P6LNyUn4' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@party' do
      it 'assigns @party' do
        expect(assigns(:party)).to be_a(Grom::Node)
        expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      end
    end

    context '@people' do
      it 'assigns @people' do
        assigns(:people).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Person')
        end
      end

      it 'assigns @people in alphabetical order' do
        expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
        expect(assigns(:people)[1].given_name).to eq('personGivenName - 2')
      end
    end

    it 'renders the party_members template' do
      expect(response).to render_template('party_members')
    end
  end

  describe 'GET a_to_z_party_members' do
    before(:each) do
      get :a_to_z_party_members, params: { parliament_id: '0FxbTVtr', party_id: 'P6LNyUn4' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@party' do
      it 'assigns @party' do
        expect(assigns(:party)).to be_a(Grom::Node)
        expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      end
    end

    context '@letters' do
      it 'assigns @letters' do
        expect(assigns(:letters)).to be_a(Array)
      end
    end

    it 'renders the a_to_z_party_members template' do
      expect(response).to render_template('a_to_z_party_members')
    end
  end

  describe 'GET party_members_letters' do
    before(:each) do
      get :party_members_letters, params: { parliament_id: '0FxbTVtr', party_id: 'P6LNyUn4', letter: 'a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@party' do
      it 'assigns @party' do
        expect(assigns(:party)).to be_a(Grom::Node)
        expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      end
    end

    context '@people' do
      it 'assigns @people' do
        assigns(:people).each do |person|
          expect(person).to be_a(Grom::Node)
          expect(person.type).to eq('http://id.ukpds.org/schema/Person')
        end
      end
    end
  end

  describe 'GET constituencies' do
    before(:each) do
      get :constituencies, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@parliament' do
      it 'assigns @parliament' do
        expect(assigns(:parliament)).to be_a(Grom::Node)
        expect(assigns(:parliament).type).to eq('http://id.ukpds.org/schema/ParliamentPeriod')
      end
    end

    context '@constituencies' do
      it 'assigns @constituencies' do
        assigns(:constituencies).each do |constituency|
          expect(constituency).to be_a(Grom::Node)
          expect(constituency.type).to eq('http://id.ukpds.org/schema/ConstituencyGroup')
        end
      end
    end

    it 'renders the constituencies template' do
      expect(response).to render_template('constituencies')
    end
  end

  describe 'GET a_to_z_constituencies' do
    before(:each) do
      get :a_to_z_constituencies, params: { parliament_id: '0FxbTVtr' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @letters' do
      expect(assigns(:letters)).to be_a(Array)
    end

    it 'renders the a_to_z_constituencies template' do
      expect(response).to render_template('a_to_z_constituencies')
    end
  end

  describe 'GET constituencies_letters' do
    before(:each) do
      get :constituencies_letters, params: { parliament_id: '0FxbTVtr', letter: 'a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    context '@constituencies' do
      it 'assigns @constituencies' do
        assigns(:constituencies).each do |constituency|
          expect(constituency).to be_a(Grom::Node)
          expect(constituency.type).to eq('http://id.ukpds.org/schema/ConstituencyGroup')
        end
      end
    end

    context '@letters' do
      it 'assigns @letters' do
        expect(assigns(:letters)).to be_a(Array)
      end
    end
  end
end
