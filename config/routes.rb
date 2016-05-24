Rails.application.routes.draw do

  namespace :api do
    post '/linters' => 'linters#parse', :as => :parse_content, :defaults => { :format => 'json' }
  end

end
