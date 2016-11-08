PEOPLE_HASH = { people: [
    { id: '1',
      forename: 'Daenerys',
      middle_name: 'Khaleesi',
      surname: 'Targaryen',
      date_of_birth: '1947-06-29'
    },
    { id: '2',
      forename: 'Arya',
      middle_name: 'The Blind Girl',
      surname: 'Stark',
      date_of_birth: '1954-01-12'
    }
] }

PERSON_ONE_HASH = { people: [
    { id: '1',
      name: 'Member1'
    }
] }

PEOPLE_GRAPH = RDF::Graph.new
RDF::NTriples::Reader.new(ttl_data) do |reader|
    reader.each_statement do |statement|
        PEOPLE_GRAPH << statement
    end
end

PERSON_ONE_GRAPH = RDF::Graph.new
PERSON_ONE_GRAPH << PEOPLE_GRAPH.first

PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.ukpds.org/1\",\"http://schema.org/schema/forename\":\"Daenerys\"},{\"@id\":\"http://id.ukpds.org/member/2\",\"http://schema.org/name\":\"Member2\"},{\"@id\":\"http://id.ukpds.org/member/3\",\"http://schema.org/name\":\"Member3\"},{\"@id\":\"http://id.ukpds.org/member/4\",\"http://schema.org/name\":\"Member4\"},{\"@id\":\"http://id.ukpds.org/member/5\",\"http://schema.org/name\":\"Member5\"}]}"

PERSON_ONE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n"
PEOPLE_TTL = "<http://id.ukpds.org/1> <http://id.ukpds.org/schema/forename> \"Daenerys\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/surname> \"Targaryen\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/middleName> \"Khaleesi\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1947-06-29\"^^<http://www.w3.org/2001/XMLSchema#date> .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/forename> \"Arya\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/surname> \"Stark\" .\n <http://id.ukpds.org/2> <http://id.ukpds.org/schema/middleName> \"The Blind Girl\" .\n <http://id.ukpds.org/1> <http://id.ukpds.org/schema/dateOfBirth> \"1954-01-12\"^^<http://www.w3.org/2001/XMLSchema#date> .\n"
