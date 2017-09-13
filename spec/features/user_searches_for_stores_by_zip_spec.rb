RSpec.feature "User searches for stores" do
  scenario "they see number of total stores and store details" do
    VCR.use_cassette("features/user_sees_store_details") do

      visit '/'
      fill_in "q", with: "80202"
      click_on "Search"
      expect(current_path).to eq("/search")

      expect(page).to have_content("17 Total Stores")

      within(".store-1") do
        expect(page).to have_css(".name")
        expect(page).to have_css(".city")
        expect(page).to have_css(".distance")
        expect(page).to have_css(".phone-number")
        expect(page).to have_css(".store-type")
      end

      expect(page).to have_css(".store", count: 10)
    end
  end
end
