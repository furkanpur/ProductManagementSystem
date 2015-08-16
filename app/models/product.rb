class Product < ActiveRecord::Base
  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :description, presence: true, length: {maximum: 300}
  validates :price, numericality: {greater_than_or_equal_to: 0}

  belongs_to :user
end
