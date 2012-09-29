require 'recursive_open_struct'

class FilmasterRecommendation < RecursiveOpenStruct
  def self.latest
    self.new(HTTParty.get("http://api.filmaster.com/1.1/user/gsmendoza/recommendations")['objects'][0])
  end

  def build_recommendation
    Recommendation.new(
      title: self.title,
      description: self.description,
      resource_name: self.resource_uri.match(%r{/film/(.*)/})[1])
  end
end