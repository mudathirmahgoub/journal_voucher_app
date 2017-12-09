class Account < ActiveRecord::Base
  belongs_to :company
  belongs_to :node
  validates :name, :presence => true, length: {minimum: 1, maximum: 300}
  validates :currency, :presence => true, length: {minimum: 3, maximum: 3}
end