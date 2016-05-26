Rails.application.routes.draw do

  namespace :api do
    post '/linters' => 'linters#parse', :as => :parse_content, :defaults => { :format => 'json' }
    post '/graphql' => 'graphql#execute', :as => :execute, :defaults => { :format => 'json' }
  end

end
