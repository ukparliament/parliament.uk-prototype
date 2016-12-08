FactoryGirl.define do
  factory :person do
    forename 'Arya'
    surname 'Stark'
    id '123'
    graph RDF::Graph.new
    gender 'female'
    dateOfBirth '1982-09-01'
  end
end

