class AccountsController < ApplicationController

  def account_params
    params.require(:account).permit(:id, :company_id, :name, :currency, :node_id)
  end

  def index
  end

  def create
    @account = Account.create(account_params)
    if @account.valid?
      render json: @account
    else
      render json: {message: @account.errors.full_messages}, :status => 400
    end
  end

  def show
  end

  def update
    @account = Account.find params[:id, :company_id]
    @account.update_attributes(account_params)
  end

  def destroy
    @account = Company.find(params[:id, :company_id])
    @account.destroy
  end
end
