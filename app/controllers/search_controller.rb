class SearchController < ApplicationController
  def create
    binding.pry
    search_params = {
      term: params[:restaurant_name],
      limit: 1,
      category_filter: 'pizza'
    }

    restaurant = Yelp.client.search('New York', search_params).businesses.first
    reviews(restaurant, params[:reviews])
  end
end
