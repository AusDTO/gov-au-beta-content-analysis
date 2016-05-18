class Api::LintersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:parse]


  def parse
    if @content = params['content']
      @results = ContentLinter.new(@content).parse

      respond_to do |format|
        format.json
        format.html { render layout: false }
      end

    else
      render :nothing => true, :status => 400
    end

  end
end