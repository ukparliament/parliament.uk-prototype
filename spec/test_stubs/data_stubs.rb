PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.ukpds.org/1\",\"http://id.ukpds.org/schema/dateOfBirth\":{\"@value\":\"1947-06-29\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.ukpds.org/schema/forename\":\"Daenerys\",\"http://id.ukpds.org/schema/middleName\":\"Khaleesi\",\"http://id.ukpds.org/schema/surname\":\"Targaryen\"},{\"@id\":\"http://id.ukpds.org/2\",\"http://id.ukpds.org/schema/dateOfBirth\":{\"@value\":\"1954-01-12\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.ukpds.org/schema/forename\":\"Arya\",\"http://id.ukpds.org/schema/middleName\":\"The Blind Girl\",\"http://id.ukpds.org/schema/surname\":\"Stark\"}]}"

PERSON_ONE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/surname> \"Targaryen\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/middleName> \"Khaleesi\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
PEOPLE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/surname> \"Targaryen\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/middleName> \"Khaleesi\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/forename> \"Arya\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/surname> \"Stark\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/middleName> \"The Blind Girl\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
MEMBERS_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/surname> \"Targaryen\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/middleName> \"Khaleesi\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/forename> \"Arya\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/surname> \"Stark\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/middleName> \"The Blind Girl\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
CONTACT_POINT_TTL = "<http://id.example.com/123> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/123> <http://id.example.com/email> \"daenerys@khaleesi.com\" .\n <http://id.example.com/123> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/123> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/123> <http://id.example.com/telephone> \"020 7555 5555\" .\n"
TWO_CONTACT_POINTS_TTL = "<http://id.example.com/123> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/123> <http://id.example.com/email> \"daenerys@khaleesi.com\" .\n <http://id.example.com/123> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/123> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/123> <http://id.example.com/telephone> \"020 7555 5555\" .\n <http://id.example.com/124> <http://id.example.com/postalCode> \"SW1A 0AA\" .\n <http://id.example.com/124> <http://id.example.com/email> \"arya@stark.com\" .\n <http://id.example.com/124> <http://id.example.com/streetAddress> \"House of Commons\" .\n <http://id.example.com/124> <http://id.example.com/addressLocality> \"London\" .\n <http://id.example.com/124> <http://id.example.com/telephone> \"020 7555 4444\" .\n"
PARTY_TTL = "<http://id.example.com/81> <http://id.example.com/schema/partyName> \"Starks\" .\n"
TWO_PARTIES_TTL = "<http://id.example.com/81> <http://id.example.com/schema/partyName> \"Targaryens\" .\n <http://id.example.com/82> <http://id.example.com/schema/partyName> \"Starks\" .\n"





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
