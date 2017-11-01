class CompaniesController < ApplicationController

  def company_params
    params.require(:company).permit(:address, :default_currency, :email,
                                    :name, :phone_number, :start_date)
  end

  def index
  end

  def create
    @company = Company.create(company_params)
    render json: @company
  end

  def show
  end

  def update
    @company = Company.find params[:id]
    @company.update_attributes(company_params)
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
  end

end
