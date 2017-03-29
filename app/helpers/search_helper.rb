module SearchHelper
  def options_for_reviews_select
    options_from_collection_for_select((1...10).to_a.map{|number| [number, number]}, :first, :last)
  end

  def reviews(restaurant, number_of_reviews)
    # Scrape reviews.
  end
end
