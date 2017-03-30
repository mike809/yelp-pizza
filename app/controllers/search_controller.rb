class SearchController < ApplicationController
  def create
    search_params = {
      term: params[:restaurant_name],
      limit: 1,
      category_filter: 'pizza'
    }

    @restaurant = Yelp.client.search('New York', search_params).businesses.first
    @reviews = reviews(@restaurant, params[:reviews]) if @restaurant.present?

    render :new
  end

  private def reviews(restaurant, number_of_reviews)
    mechanize = Mechanize.new
    page = mechanize.get("https://www.yelp.com/biz/#{restaurant.id}")
    reviews = page.css('ul.reviews li .review-content').first(number_of_reviews.to_i)
  end
end
