require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  render_views

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'post #create' do
    let(:restaurant_name) { 'Foobar Pizzeria' }
    let(:reviews) { 1 }
    let(:search_params) {{ restaurant_name: restaurant_name, reviews: reviews }}

    subject do
      post :create, params: search_params
    end

    context 'when there is no restaurant found' do
      let(:no_restaurant_found_message) { I18n.t('.search.new.no_restaurants_found') }
      let(:restaurant_name) { 'Unknown Restaurant' }
      let(:empty_response) do
        Hashie::Mash.new({
          businesses: []
        })
      end

      before do
        allow(Yelp.client).to receive(:search).and_return(empty_response)
      end

      it 'renders the correct message' do
        expect(subject.body).to include no_restaurant_found_message
      end
    end

    context 'when the restaurant does not have any reviews' do
      let(:reviews) { [] }
      let(:no_reviews_message) { I18n.t('.search.reviews.no_reviews') }
      let(:no_reviews_response) do
        Hashie::Mash.new({
          businesses: [{
            name: restaurant_name
          }]
        })
      end

      before do
        allow(Yelp.client).to receive(:search).and_return(no_reviews_response)
        allow_any_instance_of(Mechanize).to receive(:get).and_return(Mechanize::Page.new)
        allow_any_instance_of(Mechanize::Page).to receive(:css).and_return(reviews)
      end

      it 'renders the correct message' do
        expect(subject.body).to include no_reviews_message
      end
    end
  end

end
