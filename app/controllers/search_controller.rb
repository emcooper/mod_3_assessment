class SearchController < ApplicationController
  def index
    @stores = Store.find_by_filter({zip: params[:q]})[0..9]
  end
end
