PEOPLE_HASH = [
    { forename: 'Daenerys',
      surname: 'Targaryen',
      middle_name: 'Khaleesi',
      date_of_birth: '1947-06-29',
      id: '1'
    },
    { forename: 'Arya',
      surname: 'Stark',
      middle_name: 'The Blind Girl',
      date_of_birth: '1954-01-12',
      id: '2'
    }
]

PERSON_ONE_HASH = { people: [
    { id: '1',
      name: 'Member1'
    }
] }


PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.ukpds.org/1\",\"http://id.ukpds.org/schema/dateOfBirth\":{\"@value\":\"1947-06-29\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.ukpds.org/schema/forename\":\"Daenerys\",\"http://id.ukpds.org/schema/middleName\":\"Khaleesi\",\"http://id.ukpds.org/schema/surname\":\"Targaryen\"},{\"@id\":\"http://id.ukpds.org/2\",\"http://id.ukpds.org/schema/dateOfBirth\":{\"@value\":\"1954-01-12\",\"@type\":\"http://www.w3.org/2001/XMLSchema#date\"},\"http://id.ukpds.org/schema/forename\":\"Arya\",\"http://id.ukpds.org/schema/middleName\":\"The Blind Girl\",\"http://id.ukpds.org/schema/surname\":\"Stark\"}]}"

PERSON_ONE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n"
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