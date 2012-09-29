class Recommendation < ActiveRecord::Base
  attr_accessible :title, :description

  def self.latest
    filmaster_recommendation = FilmasterRecommendation.latest
    Recommendation.new(title: filmaster_recommendation.title, description: filmaster_recommendation.description)
  end

  def summary
    "<p>#{description} <a href='#{uri}'>View movie</a>.</p>"
  end

  def uri
    "http://filmaster.com/film/#{title}"
  end
end