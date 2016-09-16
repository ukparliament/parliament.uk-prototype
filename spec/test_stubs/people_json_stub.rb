PEOPLE_HASH = { people: [
    { id: '1',
      name: 'Member1'
    },
    { id: '2',
      name: 'Member2'
    },
    { id: '3',
      name: 'Member3'
    },
    { id: '4',
      name: 'Member4'
    },
    { id: '5',
      name: 'Member5'
    }
] }

PERSON_ONE_HASH = { people: [
    { id: '1',
      name: 'Member1'
    }
] }

PEOPLE_STATEMENTS = [
    RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/member/1'), RDF::URI.new('http://schema.org/name'), 'Member1'),
    RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/member/2'), RDF::URI.new('http://schema.org/name'), 'Member2'),
    RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/member/3'), RDF::URI.new('http://schema.org/name'), 'Member3'),
    RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/member/4'), RDF::URI.new('http://schema.org/name'), 'Member4'),
    RDF::Statement.new(RDF::URI.new('http://id.ukpds.org/member/5'), RDF::URI.new('http://schema.org/name'), 'Member5'),
]

PEOPLE_GRAPH = RDF::Graph.new
PEOPLE_STATEMENTS.each do |statement|
  PEOPLE_GRAPH << statement
end

PEOPLE_JSON_LD = "{\"@graph\":[{\"@id\":\"http://id.ukpds.org/member/1\",\"http://schema.org/name\":\"Member1\"},{\"@id\":\"http://id.ukpds.org/member/2\",\"http://schema.org/name\":\"Member2\"},{\"@id\":\"http://id.ukpds.org/member/3\",\"http://schema.org/name\":\"Member3\"},{\"@id\":\"http://id.ukpds.org/member/4\",\"http://schema.org/name\":\"Member4\"},{\"@id\":\"http://id.ukpds.org/member/5\",\"http://schema.org/name\":\"Member5\"}]}"
