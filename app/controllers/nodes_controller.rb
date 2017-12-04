class NodesController < ApplicationController

  def node_params
    params.require(:node).permit(:company_id, :name)
  end

  def index
    @nodes = Node.where(company_id: params[:company_id])
    render json: @nodes
  end

  def create
    @node = Node.create(node_params)
    if @node.valid?
      render json: @node
    else
      render json: {message: @node.errors.full_messages}, :status => 400
    end
  end

  def show
  end

  def update
    @node = Node.find params[:id, :company_id]
    @node.update_attributes(node_params)
  end

  def destroy
    @node = Company.find(params[:id, :company_id])
    @node.destroy
  end
end
