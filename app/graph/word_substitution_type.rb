
WordSubstitutionType = GraphQL::ObjectType.define do
  name "WordSubstitution"
  description "A suggestion to subsitute one word with another"
  field :word, !types.String, "The word to be substituted"
  field :substitution, !types.String, "The subsitute word"
end
