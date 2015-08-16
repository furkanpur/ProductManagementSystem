class Product < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5, maximum: 30}
  validates :description, presence: true, length: {maximum: 300}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :user_id, presence: true

  after_create :send_create_mail

  def send_create_mail
    UserMailer.product_created(self.user, self).deliver_now!
  end
end
