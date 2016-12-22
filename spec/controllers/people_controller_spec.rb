require 'rails_helper'

RSpec.describe PeopleController do

  describe "GET index" do
    before(:each) do
      get :index
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      assigns(:people).each do |person|
        expect(person).to be_a(Person)
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].forename).to eq("Arya")
      expect(assigns(:people)[1].forename).to eq("Daenerys")
    end

    it 'renders the index template' do
      expect(response).to render_template('index')
    end
  end

  describe "GET show" do
    before(:each) do
      get :show, params: { id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @constituencies' do
      expect(assigns(:person)).to be_a(Person)

      assigns(:sittings).each do |sitting|
        expect(sitting).to be_a(Hash)
      end

      assigns(:constituencies).each do |constituency|
        expect(constituency).to be_a(Constituency)
      end

      assigns(:houses).each do |house|
        expect(house).to be_a(House)
      end

      assigns(:sittings).each do |sitting|
        expect(sitting).to be_a(Hash)
      end
    end

    it 'renders the show template' do
      expect(response).to render_template('show')
    end
  end

  describe "GET members" do
    before(:each) do
      get :members
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      assigns(:people).each do |person|
        expect(person).to be_a(Person)
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].forename).to eq("Arya")
      expect(assigns(:people)[1].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end

  xdescribe "GET current_members" do
    before(:each) do
      get :current_members
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      assigns(:people).each do |person|
        expect(person).to be_a(Person)
      end
    end

    xit 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].forename).to eq("Arya")
      expect(assigns(:people)[1].forename).to eq("Daenerys")
    end

    it 'renders the current_members template' do
      expect(response).to render_template('current_members')
    end
  end

  describe "GET contact_points" do
    before(:each) do
      get :contact_points, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @contact_points' do
      expect(assigns(:person)).to be_a(Person)

      assigns(:contact_points).each do |cp|
        expect(cp).to be_a(ContactPoint)
      end
    end

    it 'renders the contact_points template' do
      expect(response).to render_template('contact_points')
    end
  end

  describe "GET parties" do
    before(:each) do
      get :parties, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @parties' do
      expect(assigns(:person)).to be_a(Person)

      assigns(:parties).each do |party|
        expect(party).to be_a(Party)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:parties)[0].name).to eq("Starks")
      expect(assigns(:parties)[1].name).to eq("Targaryens")
    end

    it 'renders the parties template' do
      expect(response).to render_template('parties')
    end
  end

  describe "GET current_party" do
    before(:each) do
      get :current_party, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @party' do
      expect(assigns(:person)).to be_a(Person)
      expect(assigns(:party)).to be_a(Party)
    end

    it 'renders the current_party template' do
      expect(response).to render_template('current_party')
    end
  end

  describe "GET letters" do
    before(:each) do
      get :letters, params: { letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      assigns(:people).each do |person|
        expect(person).to be_a(Person)
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].forename).to eq("Daenerys")
    end

    it 'renders the index template' do
      expect(response).to render_template('letters')
    end
  end

  describe "GET members_letters" do
    before(:each) do
      get :members_letters, params: { letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      assigns(:people).each do |person|
        expect(person).to be_a(Person)
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members_letters')
    end
  end

  xdescribe "GET current_members_letters" do
    before(:each) do
      get :current_members_letters, params: { letter: "t" }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @people' do
      assigns(:people).each do |person|
        expect(person).to be_a(Person)
      end
    end

    it 'assigns @people in alphabetical order' do
      expect(assigns(:people)[0].forename).to eq("Arya")
    end

    it 'renders the members template' do
      expect(response).to render_template('current_members_letters')
    end
  end

  describe "GET constituencies" do
    before(:each) do
      get :constituencies, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @constituencies' do
      expect(assigns(:person)).to be_a(Person)

      assigns(:constituencies).each do |constituency|
        expect(constituency).to be_a(Constituency)
      end
    end

    it 'assigns @parties in alphabetical order' do
      expect(assigns(:constituencies)[0].name).to eq("Bethnal Green")
      expect(assigns(:constituencies)[1].name).to eq("Westminster")
    end

    it 'renders the parties template' do
      expect(response).to render_template('constituencies')
    end
  end

  describe "GET houses" do
    before(:each) do
      get :houses, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @houses' do
      expect(assigns(:person)).to be_a(Person)

      assigns(:houses).each do |house|
        expect(house).to be_a(House)
      end
    end

    it 'assigns @houses in alphabetical order' do
      expect(assigns(:houses)[0].id).to eq("HouseOne")
      expect(assigns(:houses)[1].id).to eq("HouseTwo")
    end

    it 'renders the parties template' do
      expect(response).to render_template('houses')
    end
  end

  describe "GET current_house" do
    before(:each) do
      get :current_house, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @house' do
      expect(assigns(:person)).to be_a(Person)

      expect(assigns(:house)).to be_a(House)
    end

    it 'renders the parties template' do
      expect(response).to render_template('current_house')
    end
  end

  describe "GET current_constituency" do
    before(:each) do
      get :current_constituency, params: { person_id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @person and @constituency' do
      expect(assigns(:person)).to be_a(Person)

      expect(assigns(:constituency)).to be_a(Constituency)
    end

    it 'renders the parties template' do
      expect(response).to render_template('current_constituency')
    end
  end
end

