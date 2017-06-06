RSpec.shared_examples 'index route' do |controller|
  context 'index' do
    it "GET #{controller}#index" do
      expect(get: "/#{controller}").to route_to(
        controller: controller,
        action:     'index'
      )
    end
  end
end

# e.g. people#parties - /people/parties
RSpec.shared_examples 'top level routes' do |controller, action|
  it "GET #{controller}##{action}" do
    expect(get: "/#{controller}/#{action}").to route_to(
      controller: controller,
      action:     action
    )
  end
end

# e.g. people#postcode_lookup - POST /people/postcode_lookup
RSpec.shared_examples 'top level POST routes' do |controller, action|
  it "GET #{controller}##{action}" do
    expect(post: "/#{controller}/#{action}").to route_to(
                                                 controller: controller,
                                                 action:     action
                                               )
  end
end

# e.g. people#show - people/12341234
RSpec.shared_examples 'nested routes with an id' do |controller, id, routes, action|
  it "GET #{controller}##{action}" do
    expect(get: "/#{controller}/#{id}/#{routes.join('/')}").to route_to(
      controller:                     controller,
      action:                         action,
      "#{controller.singularize}_id": id
    )
  end
end

# e.g. parliaments#members_house - parliaments/12341234/members/houses/43214321
RSpec.shared_examples 'nested routes with multiple ids' do |controller, first_id, first_routes_set, action, second_id, second_routes_set|
  it "GET #{controller}/#{action}" do
    expect(get: "/#{controller}/#{first_id}/#{first_routes_set.join('/')}/#{second_id}/#{second_routes_set.join('/')}").to route_to(
      controller:                                controller,
      action:                                    action,
      "#{controller.singularize}_id":            first_id,
      "#{first_routes_set.last.singularize}_id": second_id
    )
  end
end

RSpec.shared_examples 'nested routes with multiple ids and letter' do |controller, first_id, first_routes_set, action, second_id, second_routes_set|
  it "GET #{controller}/#{action}" do
    expect(get: "/#{controller}/#{first_id}/#{first_routes_set.join('/')}/#{second_id}/#{second_routes_set.join('/')}").to route_to(
      controller:                                controller,
      action:                                    action,
      "#{controller.singularize}_id":            first_id,
      "#{first_routes_set.last.singularize}_id": second_id,
      letter:                                    second_routes_set.last
    )
  end
end

# e.g. people#a_to_z_members - people/members/a-z
RSpec.shared_examples 'nested collection routes' do |controller, routes, action|
  it "GET #{controller}##{action}" do
    expect(get: "/#{controller}/#{routes.join('/')}").to route_to(
      controller: controller,
      action:     action
    )
  end
end

# e.g. people#members_letters - people/members/a-z/a
RSpec.shared_examples 'collection a_to_z route with a letter' do |controller, routes, action, letter|
  it "GET #{controller}##{action}" do
    expect(get: "/#{controller}/#{routes.join('/')}/#{letter}").to route_to(
      controller: controller,
      action:     action,
      letter:     letter
    )
  end
end

# e.g. parties#members_letters - parties/12341234/members/a-z/a
RSpec.shared_examples 'a_to_z route with an id and letter' do |controller, id, routes, action, letter|
  it "GET #{controller}##{action}" do
    expect(get: "/#{controller}/#{id}/#{routes.join('/')}/#{letter}").to route_to(
      controller:                     controller,
      action:                         action,
      letter:                         letter,
      "#{controller.singularize}_id": id
    )
  end
end

# e.g. postcodes#show - postcodes/SW1A-2AA
RSpec.shared_examples 'nested routes with a postcode' do |controller, postcode, routes, action|
  it "GET #{controller}##{action}" do
    expect(get: "/#{controller}/#{postcode}/#{routes.join('/')}").to route_to(
       controller:                     controller,
       action:                         action,
       "#{controller.singularize}":    postcode
     )
  end
end
