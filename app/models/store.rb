class Store


  def self.find_by_filter(filter_params)
    raw_data = BestBuySerivce.find_by_filter(filter_params)
    raw_data.map {|data| Store.new(filter)}
  end
end
