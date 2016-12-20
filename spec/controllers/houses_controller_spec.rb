require 'rails_helper'

RSpec.describe HousesController do

  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @houses' do
      assigns(:houses).each do |house|
        expect(house).to be_a(House)
      end
    end

    it 'assigns @houses in alphabetical order' do
      expect(assigns(:houses)[0].id).to eq("HouseOne")
      expect(assigns(:houses)[1].id).to eq("HouseTwo")
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { id: "HouseOne" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house' do
      expect(assigns(:house)).to be_a(House)
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe "GET members" do
    before(:each) do
      get :members, params: { house_id: "HouseOne" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house and @members' do
      expect(assigns(:house)).to be_a(House)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Arya")
      expect(assigns(:members)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end

  describe "GET current_members" do
    before(:each) do
      get :current_members, params: { house_id: "HouseOne" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house and @members' do
      expect(assigns(:house)).to be_a(House)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Arya")
      expect(assigns(:members)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('current_members')
    end
  end

  describe "GET parties" do
    before(:each) do
      get :parties, params: { house_id: "HouseOne" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house and @parties' do
      expect(assigns(:house)).to be_a(House)

      assigns(:parties).each do |party|
        expect(party).to be_a(Party)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:parties)[0].name).to eq("Starks")
      expect(assigns(:parties)[1].name).to eq("Targaryens")
    end

    it 'renders the members template' do
      expect(response).to render_template('parties')
    end
  end

  describe "GET current_parties" do
    before(:each) do
      get :current_parties, params: { house_id: "HouseOne" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house and @members' do
      expect(assigns(:house)).to be_a(House)

      assigns(:parties).each do |party|
        expect(party).to be_a(Party)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:parties)[0].name).to eq("Starks")
      expect(assigns(:parties)[1].name).to eq("Targaryens")
    end

    it 'renders the members template' do
      expect(response).to render_template('current_parties')
    end
  end

  describe "GET members_letters" do
    before(:each) do
      get :members_letters, params: { house_id: "HouseOne", letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house and @members' do
      expect(assigns(:house)).to be_a(House)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members_letters')
    end
  end

  describe "GET current_members_letters" do
    before(:each) do
      get :current_members_letters, params: { house_id: "HouseOne", letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @house and @members' do
      expect(assigns(:house)).to be_a(House)

      assigns(:members).each do |member|
        expect(member).to be_a(Member)
      end
    end

    it 'assigns @members in alphabetical order' do
      expect(assigns(:members)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('current_members_letters')
    end
  end

end

