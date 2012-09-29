require 'spec_helper'
require 'rspec/example_steps'

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

      filmaster_recommendation = FilmasterRecommendation.latest
      @recommendation = filmaster_recommendation.build_recommendation
    end

    When "I view the recommendation feed" do
      page.visit recommendations_path(format: 'atom')
    end

    Then "I should see the recommendation" do
      page.should have_content @recommendation.title
      page.should have_content @recommendation.description
      page.should have_content @recommendation.uri
    end
  end
end
