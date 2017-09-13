class BestBuyService
  def initialize(filter_params)
    @zip = filter_params[:zip]
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_stores
    response = @conn.get('stores?format=json&show=storeId,storeType,name&location=80202&distance=25', default_params)
    JSON.parse(response.body)
  end

  def default_params
    {
      apiKey: ENV["BESTBUY_KEY"]
    }
  end




  def self.find_by_filter(filter_params)
    BestBuyService.new(filter_params).find_stores
  end
end
