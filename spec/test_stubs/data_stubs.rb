PEOPLE_HASH = [
    { forename: 'Daenerys',
      surname: 'Targaryen',
      middleName: 'Khaleesi',
      dateOfBirth: '1947-06-29',
      id: '1'
    },
    { forename: 'Arya',
      surname: 'Stark',
      middleName: 'The Blind Girl',
      dateOfBirth: '1954-01-12',
      id: '2'
    }
]

PERSON_ONE_HASH = { people: [
    { id: '1',
      name: 'Member1'
    }
] }


PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.ukpds.org/1\",\"http://id.ukpds.org/schema/dateOfBirth\":{\"@value\":\"1947-06-29\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.ukpds.org/schema/forename\":\"Daenerys\",\"http://id.ukpds.org/schema/middleName\":\"Khaleesi\",\"http://id.ukpds.org/schema/surname\":\"Targaryen\"},{\"@id\":\"http://id.ukpds.org/2\",\"http://id.ukpds.org/schema/dateOfBirth\":{\"@value\":\"1954-01-12\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.ukpds.org/schema/forename\":\"Arya\",\"http://id.ukpds.org/schema/middleName\":\"The Blind Girl\",\"http://id.ukpds.org/schema/surname\":\"Stark\"}]}"

PERSON_ONE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/surname> \"Targaryen\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/middleName> \"Khaleesi\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
PEOPLE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/surname> \"Targaryen\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/middleName> \"Khaleesi\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/forename> \"Arya\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/surname> \"Stark\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/middleName> \"The Blind Girl\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"

PEOPLE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PEOPLE_TTL) do |reader|
    reader.each_statement do |statement|
        PEOPLE_GRAPH << statement
    end
end

PERSON_ONE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PERSON_ONE_TTL) do |reader|
    reader.each_statement do |statement|
        PERSON_ONE_GRAPH << statement
    end
end

ONE_STATEMENT_STUB = RDF::Statement.new(RDF::URI.new("http://id.ukpds.org/1"), RDF::URI.new("http://id.ukpds.org/schema/forename"), 'Daenerys')

PARTY_ONE_TTL = "<http://id.ukpds.org/ff0e8e9f-6c5d-4fd4-928c-3252b49a2e65> <http://id.ukpds.org/schema/partyName> \"Liberal Democrat\" ."
PARTY_ONE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PARTY_ONE_TTL) do |reader|
    reader.each_statement do |statement|
        PARTY_ONE_GRAPH << statement
    end
end

PARTY_AND_PARTY_MEMBERSHIP_ONE_TTL = "<http://id.ukpds.org/23> <http://id.ukpds.org/schema/partyName> \"Targaryens\" .\n <http://id.ukpds.org/23> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.ukpds.org/schema/DummyParty> .\n <http://id.ukpds.org/25> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.ukpds.org/schema/DummyPartyMembership> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipHasParty> <http://id.ukpds.org/23> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipEndDate> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipStartDate> \"1953-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
PARTY_AND_PARTY_MEMBERSHIP_ONE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PARTY_AND_PARTY_MEMBERSHIP_ONE_TTL) do |reader|
    reader.each_statement do |statement|
        PARTY_AND_PARTY_MEMBERSHIP_ONE_GRAPH << statement
    end
end

CONTACT_POINT_TTL = "<http://id.ukpds/org/123> <http://id.ukpds.org/postalCode> \"SW1A 0AA\" .\n <http://id.ukpds/org/123> <http://id.ukpds.org/email> \"daenerys@khaleesi.com\" .\n <http://id.ukpds/org/123> <http://id.ukpds.org/streetAddress> \"House of Commons\" .\n <http://id.ukpds/org/123> <http://id.ukpds.org/addressLocality> \"London\" .\n <http://id.ukpds/org/123> <http://id.ukpds.org/telephone> \"020 7555 5555\" .\n"

PARTY_MEMBERSHIP_TTL = "<http://id.ukpds.org/25> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.ukpds.org/schema/DummyPartyMembership> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipHasParty> <http://id.ukpds.org/23> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipEndDate> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipStartDate> \"1953-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"

PARTY_MEMBERSHIP_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(PARTY_MEMBERSHIP_TTL) do |reader|
    reader.each_statement do |statement|
        PARTY_MEMBERSHIP_GRAPH << statement
    end
end

NO_TYPE_PARTY_MEMBERSHIP_TTL = "<http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipEndDate> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/25> <http://id.ukpds.org/schema/partyMembershipStartDate> \"1953-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"

NO_TYPE_PARTY_MEMBERSHIP_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(NO_TYPE_PARTY_MEMBERSHIP_TTL) do |reader|
    reader.each_statement do |statement|
        NO_TYPE_PARTY_MEMBERSHIP_GRAPH << statement
    end
end