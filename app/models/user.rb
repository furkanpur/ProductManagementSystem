class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || 'is not an email')
    end
  end
end

class User < ActiveRecord::Base
  has_many :products

  validates :username, length: {minimum: 6, maximum: 20}
  validates :email, presence: true, email: true
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 15}
  validates :city, presence: true

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.welcome(self).deliver_now!
  end
end

