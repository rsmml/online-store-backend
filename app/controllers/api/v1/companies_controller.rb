class Api::V1::CompaniesController < ApplicationController
  before_action :authorize_access_request!
  before_action :set_company, only: %i[show update destroy]

  def index
    companies = current_user.companies.all
    render json: { companies: companies }
  end

  def show
    render json: { company: @company }
  end

  def create
    company = Company.new(company_params)
    if company.save
      render json: { status: :created, company: company }
    else
      render json: { status: 401 }
    end
  end

  def update
    if company.update(company_params)
      render json: { company: company }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    company.destroy
    render json: { company: 'deleted' }
  end

  private

  def set_company
    @company = current_user.companies.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:user_id, :store_id)
  end
end
