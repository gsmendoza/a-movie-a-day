atom_feed do |feed|
  feed.title "Movie A Day"
  feed.updated Date.today

  #if @recommendation.present?
    feed.entry @recommendation, published: Date.today do |entry|
      entry.title   @recommendation.title
      entry.summary @recommendation.summary, type: 'html'
    end
  #else
    #feed.entry do |entry|
      #entry.title   "No recommendation found today"
      #entry.summary "Sorry, we didn't find a recommendation today. Please try again tomorrow."
    #end
  #end
end
