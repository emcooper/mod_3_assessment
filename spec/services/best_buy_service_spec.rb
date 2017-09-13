require 'rails_helper'

describe BestBuyService do
  describe "class methods" do
    it ".find_by_filter returns store data within 25 miles of zip" do
      VCR.use_cassette("services/best_buy/find_by_filter") do
        data = BestBuyService.find_by_filter({zip: 80202})

        expect(data.count).to eq(10)
      end
    end
  end
end
