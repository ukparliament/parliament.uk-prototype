PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.example.com/1\",\"http://id.example.com/schema/dateOfBirth\":{\"@value\":\"1947-06-29\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.example.com/schema/forename\":\"Daenerys\",\"http://id.example.com/schema/middleName\":\"Khaleesi\",\"http://id.example.com/schema/surname\":\"Targaryen\"},{\"@id\":\"http://id.example.com/2\",\"http://id.example.com/schema/dateOfBirth\":{\"@value\":\"1954-01-12\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.example.com/schema/forename\":\"Arya\",\"http://id.example.com/schema/middleName\":\"The Blind Girl\",\"http://id.example.com/schema/surname\":\"Stark\"}]}"

PERSON_ONE_TTL = "<http://id.example.com/1> <http://id.example.com/schema/forename> \"Daenerys\" .\n <http://id.example.com/1> <http://id.example.com/schema/surname> \"Targaryen\" .\n <http://id.example.com/1> <http://id.example.com/schema/middleName> \"Khaleesi\" .\n <http://id.example.com/1> <http://id.example.com/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
PEOPLE_TTL = "<http://id.example.com/1> <http://id.example.com/schema/forename> \"Daenerys\" .\n <http://id.example.com/1> <http://id.example.com/schema/surname> \"Targaryen\" .\n <http://id.example.com/1> <http://id.example.com/schema/middleName> \"Khaleesi\" .\n <http://id.example.com/1> <http://id.example.com/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.example.com/2> <http://id.example.com/schema/forename> \"Arya\" .\n <http://id.example.com/2> <http://id.example.com/schema/surname> \"Stark\" .\n <http://id.example.com/2> <http://id.example.com/schema/middleName> \"The Blind Girl\" .\n <http://id.example.com/2> <http://id.example.com/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
MEMBERS_TTL = "<http://id.example.com/1> <http://id.example.com/schema/forename> \"Daenerys\" .\n <http://id.example.com/1> <http://id.example.com/schema/surname> \"Targaryen\" .\n <http://id.example.com/1> <http://id.example.com/schema/middleName> \"Khaleesi\" .\n <http://id.example.com/1> <http://id.example.com/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.example.com/2> <http://id.example.com/schema/forename> \"Arya\" .\n <http://id.example.com/2> <http://id.example.com/schema/surname> \"Stark\" .\n <http://id.example.com/2> <http://id.example.com/schema/middleName> \"The Blind Girl\" .\n <http://id.example.com/2> <http://id.example.com/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
CONTACT_POINT_TTL = "<http://id.example.com/123> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/123> <http://id.example.com/email> \"daenerys@khaleesi.com\" .\n <http://id.example.com/123> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/123> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/123> <http://id.example.com/telephone> \"020 7555 5555\" .\n"
TWO_CONTACT_POINTS_TTL = "<http://id.example.com/123> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/123> <http://id.example.com/email> \"daenerys@khaleesi.com\" .\n <http://id.example.com/123> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/123> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/123> <http://id.example.com/telephone> \"020 7555 5555\" .\n <http://id.example.com/124> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/124> <http://id.example.com/email> \"arya@stark.com\" .\n <http://id.example.com/124> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/124> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/124> <http://id.example.com/telephone> \"020 7555 4444\" .\n"
PARTY_TTL = "<http://id.example.com/81> <http://id.example.com/schema/partyName> \"Starks\" .\n"
TWO_PARTIES_TTL = "<http://id.example.com/81> <http://id.example.com/schema/partyName> \"Targaryens\" .\n <http://id.example.com/82> <http://id.example.com/schema/partyName> \"Starks\" .\n"
HOUSE_TTL = "<http://id.example.com/HouseOne> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.example.com/schema/House> ."
HOUSES_TTL = "<http://id.example.com/HouseOne> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.example.com/schema/House> .\n <http://id.example.com/HouseTwo> <http://www.w3.org/1999/02/22-rdf-syntax-ns#type> <http://id.example.com/schema/House> ."

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
