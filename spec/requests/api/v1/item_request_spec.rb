require 'rails_helper'

describe "Items API" do
  it "returns all items" do
    items = create_list(:item, 3)

    get "/api/v1/items"

    expect(response).to be_success
    response_items = JSON.parse(response.body)["items"]

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

  it "returns one item" do
    items = create_list(:item, 3)

    get "/api/v1/items/1"

    expect(response).to be_success
    response_items = JSON.parse(response.body)["item"]

    expect(response_items["id"]).to eq(items.first.id)
    expect(response_items["name"]).to eq(items.first.name)
    expect(response_items["description"]).to eq(items.first.description)
    expect(response_items["image_url"]).to eq(items.first.image_url)
    expect(response_items["created_at"]).to be_nil
    expect(response_items["updated_at"]).to be_nil
  end

  it "deletes an item" do
    items = create_list(:item, 3)
    expect(Item.count).to eq(3)

    delete "/api/v1/items/1"

    expect(response).to be_success

    expect(response.status).to eq(204)

    expect(Item.count).to eq(2)
    expect(Item.find_by(name: items.first.name)).to be_nil
  end

  it "creates an item" do
    items = create_list(:item, 3)
    expect(Item.count).to eq(3)
    image = "https://i5.walmartimages.com/asr/7da9c6a7-6922-43af-ab43-9ebe44b1776d_1.048c4e1e96c28ff9afcb4c9860b1e3df.jpeg"

    post "/api/v1/items?name=bike&description=used%20bike&image_url=#{image}"

    expect(response).to be_success

    response_item = JSON.parse(response.body)["item"]

    expect(response.status).to eq(201)

    expect(Item.count).to eq(4)
    expect(response_item["name"]).to eq("bike")
    expect(response_item["description"]).to eq("used bike")
    expect(response_item["image_url"]).to eq(image)
    expect(response_item["created_at"]).to be_nil
    expect(response_item["updated_at"]).to be_nil
  end
end
