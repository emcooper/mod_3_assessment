require 'rails_helper'

describe BestBuyService do
  describe "class methods" do
    it ".find_by_filter returns store data within 25 miles of zip" do
      VCR.use_cassette("services/best_buy/find_by_filter") do
        stores = BestBuyService.find_by_filter({zip: 80202})[:stores]
        expect(stores.count).to eq(10)
        expect(stores.first[:longName]).to be_a(String)
        expect(stores.first[:city]).to be_a(String)
        expect(stores.first[:distance]).to be_a(Float)
        expect(stores.first[:phone]).to be_a(String)
        expect(stores.first[:storeType]).to be_a(String)
      end
    end
  end
end
