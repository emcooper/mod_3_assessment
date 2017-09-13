class Api::V1::ItemsController < ActionController::API
  include ::ActionController::Serialization

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id]).destroy
    render json: {}, status: :no_content
  end

  def create
    item = Item.create(item_params)
    render json: item, status: :created
  end

  private

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
