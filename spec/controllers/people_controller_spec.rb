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

  xdescribe "GET show" do
    before(:each) do
      get :show, params: { id: '1' }
    end

    it 'should have a response with http status ok (200)' do
      expect(response).to have_http_status(:ok)
    end

    it 'assigns @peron' do
      expect(assigns(:person)).to be_a(Person)
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

  describe "GET current_members" do
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

    it 'assigns @people in alphabetical order' do
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

  describe "GET current_parties" do
    before(:each) do
      get :current_parties, params: { person_id: '1' }
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
    end

    it 'renders the current_parties template' do
      expect(response).to render_template('current_parties')
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
      expect(response).to render_template('index')
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
      expect(response).to render_template('members')
    end
  end

  describe "GET current_members_letters" do
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
      expect(assigns(:people)[0].forename).to eq("Daenerys")
    end

    it 'renders the members template' do
      expect(response).to render_template('members')
    end
  end
end

