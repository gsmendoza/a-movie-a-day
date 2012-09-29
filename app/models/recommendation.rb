class Recommendation < ActiveRecord::Base
  attr_accessible :title, :description, :resource_name

  def self.latest
    filmaster_recommendation = FilmasterRecommendation.latest
    filmaster_recommendation.build_recommendation
  end

  def summary
    "<p>#{description} <a href='#{uri}'>View movie</a>.</p>"
  end

  def uri
    "http://filmaster.com/film/#{resource_name}"
  end
end