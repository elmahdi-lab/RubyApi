class Bank < ActiveRecord::Base
  has_many :transactions
  validates :name, presence: true
end