class RecommendationsController < ApplicationController
  def index
    @recommendation = Recommendation.latest
  end
end