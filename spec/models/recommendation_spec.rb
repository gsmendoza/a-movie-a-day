require 'spec_helper'

describe Recommendation do
  describe ".latest" do
    it "should get the title and description of the latest filmaster recommendation" do
      VCR.use_cassette 'filmaster', allow_playback_repeats: true do
        filmaster_recommendation = FilmasterRecommendation.latest
        filmaster_recommendation.should_not be_nil

        recommendation = Recommendation.latest
        recommendation.title.should == filmaster_recommendation.title
        recommendation.description.should == filmaster_recommendation.description
      end
    end
  end

  describe "#summary" do
    it "should display the recommendation's describe and a link to the movie" do
      recommendation = Recommendation.new(title: 'title', description: 'description')
      recommendation.summary.should include('description')
      recommendation.summary.should include(recommendation.uri)

    end
  end

  describe "#uri" do
    it "should be the uri of the recommendation's movie" do
      recommendation = Recommendation.new(title: 'title', description: 'description')
      recommendation.uri.should == "http://filmaster.com/film/title"
    end
  end
end