class Node < ActiveRecord::Base
  belongs_to :company
  belongs_to :node, optional: true # roots don't belong to any node
  validates :name, :presence => true, length: {minimum: 1, maximum: 300}
end