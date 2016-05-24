require 'rails_helper'

RSpec.describe 'linting', type: :request do

  context 'type inference' do
    it 'should default to JSON' do
      post '/api/linters', params: {content: 'words'}
      expect(response).to be_success
      expect { JSON.load(response.body) }.not_to raise_error
    end

    it 'should default to JSON if */* header' do
      post '/api/linters', params: {content: 'words'}, headers: {'HTTP_ACCEPT' => '*/*'}
      expect(response).to be_success
      expect { JSON.load(response.body) }.not_to raise_error
    end

    it 'should return JSON if JSON header' do
      post '/api/linters', params: {content: 'words'}, headers: {'HTTP_ACCEPT' => 'application/json'}
      expect(response).to be_success
      expect { JSON.load(response.body) }.not_to raise_error
    end

    it 'should return HTML if HTML header' do
      pending('respecting JSON default and Accept headers')
      post '/api/linters', params: {content: 'words'}, headers: {'HTTP_ACCEPT' => 'text/html'}
      expect(response).to be_success
      expect { JSON.load(response.body) }.to raise_error
    end

    it 'should return JSON if ends in .json' do
      post '/api/linters.json', params: {content: 'words'}
      expect(response).to be_success
      expect { JSON.load(response.body) }.not_to raise_error
    end

    it 'should return HTML if ends in .html' do
      post '/api/linters.html', params: {content: 'words'}
      expect(response).to be_success
      expect { JSON.load(response.body) }.to raise_error
    end
  end

end