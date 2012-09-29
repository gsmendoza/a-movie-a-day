require 'spec_helper'

feature "Recommendations" do
  before do
    VCR.insert_cassette 'filmaster', allow_playback_repeats: true
  end

  after do
    VCR.eject_cassette
  end

  Steps "New recommendation" do
    Given "today's top recommendation from filmaster was never recommended before by a-movie-a-day" do
      Recommendation.count.should == 0

      @filmaster_recommendation = FilmasterRecommendation.latest
      @filmaster_recommendation.should_not be_nil
    end

    When "I view the recommendation feed" do
      page.visit recommendation_path(format: 'atom')
    end

    Then "I should see the recommendation", pending: true do
      pending
    end
  end
end
