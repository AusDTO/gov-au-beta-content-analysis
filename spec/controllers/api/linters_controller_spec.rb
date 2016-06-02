require 'rails_helper'

RSpec.describe Api::LintersController do
  render_views
  describe "POST #parse to JSON URL" do

    context "given a sentence with bad words in it" do
      it "returns JSON of bad words and their suggested good words" do
        expect(
          post :parse, :params => {:content => "Federal Government"}, :format => 'json'
        ).to be_success

        expect(JSON.load(response.body).size).to eq(1)
      end

      it "returns HTML with bad words highlighted and suggestions" do
        expect(
            post :parse, :params => {:content => "Federal Government"}, :format => 'html'
        ).to be_success

        expect(response.body).to match /title="Australian Government"/
      end

    end

    context "given a sentence with no bad words in it" do
      it "returns an empty json list" do
        expect(
            post :parse, :params => {:content => "No bad words here"}, :format => 'json'
        ).to be_success

        expect(JSON.load(response.body).size).to eq(0)
      end

      it "returns blank HTML" do
        expect(
          post :parse, :params => {:content => "No bad words here"}, :format => 'html'
        ).to be_success

        expect(response.body).to_not match /title="/
      end
    end

    context "given no parameters are supplied" do
      it "returns an unsuccessful header" do
        expect(
            post :parse, :format => 'json'
        ).to_not be_success
      end
    end

    context "given content with script tags" do
      it "no script tags are returned" do
        expect(
            post :parse, params: {content: 'Stuff<script>doStuff();</script>'}, :format => 'html'
        ).to be_success
        expect(response.body).to_not match /script/
        expect(response.body).to match 'Stuff'
      end
    end
  end

end