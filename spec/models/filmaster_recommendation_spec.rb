require 'spec_helper'

describe FilmasterRecommendation do
  describe ".latest" do
    it "should be the first recommendation from gsmendoza's recommendations" do
      VCR.use_cassette 'filmaster', allow_playback_repeats: true do
        response = HTTParty.get("http://api.filmaster.com/1.1/user/gsmendoza/recommendations")
        title = response['objects'][0]['title']
        title.should_not be_nil

        FilmasterRecommendation.latest.title.should == title
      end
    end
  end
end
