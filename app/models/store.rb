class Store
  attr_reader :name,
              :city,
              :distance,
              :phone_number,
              :type

  def initialize(data)
    @name = data[:longName]
    @city = data[:city]
    @distance = data[:distance]
    @phone_number = data[:phone]
    @type = data[:storeType]
  end

  def self.find_by_filter(filter_params)
    raw_data = BestBuyService.find_by_filter(filter_params)
    raw_data[:stores].map {|data| Store.new(data)}
  end
end
