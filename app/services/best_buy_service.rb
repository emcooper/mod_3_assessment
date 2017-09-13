class BestBuyService
  def initialize(filter_params)
    @zip = filter_params[:zip]
    @conn = Faraday.new(:url => 'https://api.bestbuy.com/v1') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def find_stores
    response = @conn.get("stores(area(#{@zip},25))?format=json&show=storeId,storeType,city,longName,phone,distance", default_params)
    JSON.parse(response.body, symbolize_names: :true)
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
