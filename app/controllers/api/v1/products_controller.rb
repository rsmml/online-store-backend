class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy]

  def index
    products = Product.all
    products_with_pictures = []
    products.each do |product|
      products_with_pictures << { 'product' => product, 'photos' => product.photos.map { |p| p.key } }
    end
    render json: { products: products_with_pictures }
  end

  def show
    images = []
    @product.photos.each do |photo|
      images << photo.key
    end
    render json: { product: @product, images: images }
  end

  def create
    product = Product.new(product_params)
    if @product.save
      render json: { status: :created, product: product }
    else
      render json: { status: 401 }
    end
  end

  def update
    if @product.update(product_params)
      render json: { product: @product }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    @product.destroy
    render json: { product: 'deleted' }
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :price, :description, :stock, :store_id, photos: [])
  end
end
