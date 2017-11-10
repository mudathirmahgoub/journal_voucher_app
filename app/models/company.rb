class Company < ActiveRecord::Base
  validates :name, :presence => true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
            format: {with: VALID_EMAIL_REGEX}
  validates :start_date, :presence => true
  validates :default_currency, :presence => true, length: {maximum: 3, minimum: 3}
end