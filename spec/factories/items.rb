FactoryGirl.define do
  factory :item do
    sequence :name  do |n|
      "Item #{n}"
    end
    sequence :description do
      |n| "Description #{n}"
    end
    sequence :image_url do
      |n| "image_url"
    end
  end
end
