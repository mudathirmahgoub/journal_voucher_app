class NodesController < ApplicationController

  def node_params
    params.require(:node).permit(:company_id, :name)
  end

  def index
    nodes = Node.where(company_id: params[:company_id])
    accounts = Account.where(company_id: params[:company_id])
    #convert nodes to array of hashes
    nodes = nodes.collect {|node| node.as_json}
    accounts = accounts.collect {|account| account.as_json}
    #construct the tree
    roots = nodes.select { |hash| hash['node_id'] == nil }
    roots.each do |root|
      build_tree nodes, root, accounts
    end
    render json: roots
  end

  def build_tree (nodes, node, accounts)
    children = nodes.select { |hash| hash['node_id'] != nil && hash['node_id'] == node['id'] }
    node[:children] = children
    node[:is_account_node] = false
    # recursively build the tree
    children.each do |n|
      build_tree nodes, n, accounts
    end

    if children.length == 0
      #load accounts
      childAccounts = accounts.select { |hash| hash['node_id'] == node['id'] }
      childAccounts.each do |account|
        account[:is_account_node] = true
      end
      node[:children] = childAccounts
    end
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
