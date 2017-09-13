class SearchIndexPresenter
  def initialize(filter_params)
    @filter_params = filter_params
  end

  def total_stores
    BestBuyService.find_by_filter(@filter_params)[:total]
  end

  def stores
    Store.find_by_filter(@filter_params)
  end
end
