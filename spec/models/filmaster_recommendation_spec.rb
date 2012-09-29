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

  describe "#build_recommendation" do
    it "should build a new recommendation from the filmaster fecommendation" do
      filmaster_recommendation = FilmasterRecommendation.new(
        title: 'Tucker & Dale vs Evil', description: 'description', resource_uri: "/1.1/film/tucker-dale-vs-evil/")

      recommendation = filmaster_recommendation.build_recommendation
      recommendation.title.should == 'Tucker & Dale vs Evil'
      recommendation.description.should == 'description'
      recommendation.resource_name.should == 'tucker-dale-vs-evil'
    end
  end
end
