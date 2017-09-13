class SearchController < ApplicationController
  def index
    # @stores = Store.find_by_filter({zip: params[:q]})
    @search_presenter = SearchIndexPresenter.new({zip: params[:q]})
  end
end
