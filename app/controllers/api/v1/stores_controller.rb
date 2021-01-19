class Api::V1::StoresController < ApplicationController
  before_action :set_store, only: %i[show update destroy]

  def index
    stores = Store.where(:user_id == @current_user.id)
    render json: { stores: stores }
  end

  def show
    render json: { store: @store }
  end

  def create
    store = Store.new(store_params)
    if store.save
      render json: { status: :created, store: store }
    else
      render json: { status: 401 }
    end
  end

  def update
    if store.update(store_params)
      render json: { store: store }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    store.destroy
    render json: { store: 'deleted' }
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :location, :store_type)
  end
end
