require 'rails_helper'

describe "Items API" do
  it "returns all items" do
    items = create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success
    response_items = JSON.parse(response)

    expect(response_items.count).to eq(3)
    expect(response_items.first["id"]).to eq(items.first.id)
    expect(response_items.second["id"]).to eq(items.second.id)
    expect(response_items.third["id"]).to eq(items.third.id)
    expect(response_items.first["name"]).to eq(items.first.name)
    expect(response_items.first["description"]).to eq(items.first.description)
    expect(response_items.first["image_url"]).to eq(items.first.image_url)
    expect(response_items.third["created_at"]).to be_nil
    expect(response_items.third["updated_at"]).to be_nil
  end
end
