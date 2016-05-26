
ContentAnalysisType = GraphQL::ObjectType.define do
  name "ContentAnalysis"
  description "Analyses textual content"

  field :substitutions do
    description "Returns recommended word subsitutions"
    type types[WordSubstitutionType]
    resolve -> (obj, args, ctx) {
      obj.parse.each_pair.map do |(word, sub)|
        WordSubstitution.new(word, sub)
      end
    }
  end

  field :substitution_count do
    description "Returns the total number of recommended word substitutions"
    type types.Int
    resolve -> (obj, args, ctx) {
      obj.parse.each_pair.count
    }
  end
end
