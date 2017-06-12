require 'rails_helper'

RSpec.describe Houses::Parties::MembersController, vcr: true do

  describe "GET index" do
    before(:each) do
      get :index, params: { house_id: 'cqIATgUK', party_id: 'YuP8Vh7a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house, @party, @letters and @people' do
      expect(assigns(:house)).to be_a(Grom::Node)
      expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      expect(assigns(:party)).to be_a(Grom::Node)
      expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      expect(assigns(:letters)).to be_a(Array)

      assigns(:people).each do |person|
        expect(person).to be_a(Grom::Node)
        expect(person.type).to eq('http://id.ukpds.org/schema/Person')
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
      expect(assigns(:people)[1].given_name).to eq('personGivenName - 10')
    end

    it 'renders the party_members template' do
      expect(response).to render_template('index')
    end
  end

  describe "GET letters" do
    before(:each) do
      get :letters, params: { house_id: 'cqIATgUK', party_id: 'YuP8Vh7a', letter: 't' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house, @party, @letters and @people' do
      expect(assigns(:house)).to be_a(Grom::Node)
      expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      expect(assigns(:party)).to be_a(Grom::Node)
      expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      expect(assigns(:letters)).to be_a(Array)

      assigns(:people).each do |person|
        expect(person).to be_a(Grom::Node)
        expect(person.type).to eq('http://id.ukpds.org/schema/Person')
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].sort_name).to eq('A5EE13ABE03C4D3A8F1A274F57097B6C - 1')
      expect(assigns(:people)[1].sort_name).to eq('A5EE13ABE03C4D3A8F1A274F57097B6C - 2')
    end

    it 'renders the party_members_letters template' do
      expect(response).to render_template('letters')
    end
  end

  describe "GET current" do
    before(:each) do
      get :current, params: { house_id: 'mG2ur5TF', party_id: 'YuP8Vh7a' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house, @party, @letters and @people' do
      expect(assigns(:house)).to be_a(Grom::Node)
      expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      expect(assigns(:party)).to be_a(Grom::Node)
      expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      expect(assigns(:letters)).to be_a(Array)

      assigns(:people).each do |person|
        expect(person).to be_a(Grom::Node)
        expect(person.type).to eq('http://id.ukpds.org/schema/Person')
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].given_name).to eq('personGivenName - 1')
      expect(assigns(:people)[1].given_name).to eq('personGivenName - 10')
    end

    it 'renders the current_party_members template' do
      expect(response).to render_template('current')
    end
  end

  describe "GET current_letters" do
    before(:each) do
      get :current_letters, params: { house_id: 'mG2ur5TF', party_id: 'YuP8Vh7a', letter: 't' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house, @party, @letters and @people' do
      expect(assigns(:house)).to be_a(Grom::Node)
      expect(assigns(:house).type).to eq('http://id.ukpds.org/schema/House')
      expect(assigns(:party)).to be_a(Grom::Node)
      expect(assigns(:party).type).to eq('http://id.ukpds.org/schema/Party')
      expect(assigns(:letters)).to be_a(Array)

      assigns(:people).each do |person|
        expect(person).to be_a(Grom::Node)
        expect(person.type).to eq('http://id.ukpds.org/schema/Person')
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].sort_name).to eq('A5EE13ABE03C4D3A8F1A274F57097B6C - 1')
      expect(assigns(:people)[1].sort_name).to eq('A5EE13ABE03C4D3A8F1A274F57097B6C - 10')
    end

    it 'renders the current_party_members_letters template' do
      expect(response).to render_template('current_letters')
    end
  end

  describe "GET a_to_z" do
    before(:each) do
      get :a_to_z, params: { house_id: 'KL2k1BGP', party_id: 'P6LNyUn4' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @letters' do
      expect(assigns(:letters)).to be_a(Array)
    end

    it 'renders the a_to_z_party_members template' do
      expect(response).to render_template('a_to_z')
    end
  end

  describe "GET a_to_z_current" do
    before(:each) do
      get :a_to_z_current, params: { house_id: 'KL2k1BGP', party_id: 'P6LNyUn4' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @letters' do
      expect(assigns(:letters)).to be_a(Array)
    end

    it 'renders the a_to_z_current_party_members template' do
      expect(response).to render_template('a_to_z_current')
    end
  end


end
