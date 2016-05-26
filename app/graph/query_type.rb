
QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :content_analysis do
    description "Returns the result of the analysis of textual content"
    type ContentAnalysisType 
    argument :content, !types.String
    resolve -> (obj, args, ctx) {
      ContentLinter.new(args["content"])
    }
  end
end
