class Api::V1::StoresController < ApplicationController
  before_action :authorize_access_request!
  before_action :set_store, only: %i[show update destroy]

  def index
    stores = current_user.stores.all
    render json: { stores: stores }
  end

  def show
    render json: { store: @store }
  end

  def create
    store = current_user.stores.build(store_params)
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
    @store = current_user.stores.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :location, :store_type)
  end
end
