class Company < ActiveRecord::Base
  has_many :nodes
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX }
  validates :start_date, presence: true
  validates :default_currency, presence: true, length: { maximum: 3, minimum: 3 }
  def self.create_default_nodes(company_params)
    company = Company.create!(company_params)
    if company.valid?
      # create  a default tree
      fileName = File.join(Rails.root, 'app', 'models', 'data', 'ifrs_tree.json')
      file = File.read(fileName)
      roots = JSON.parse(file)
      roots.each do |root|
        create_nodes_recursively company,root, nil
      end
    end
    company
  end

  def self.create_nodes_recursively company, json_node, parent_id
    node = company.nodes.create!(name: json_node['name'], is_editable: false, node_id: parent_id)
    json_node['children'].each do |n|
      create_nodes_recursively company, n, node.id
    end
  end
end
