

class Api::GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:execute]

  def execute
    respond_to do |format|
      format.json {
        query_variables = params[:variables] || {}
        body = JSON.parse(request.body.read)
        query = body["query"]
        variables = body["variables"] || {}
        render json: Schema.execute(query, variables: variables)
      }
    end
  end
end
