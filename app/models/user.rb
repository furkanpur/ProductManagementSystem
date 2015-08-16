class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || 'is not an email')
    end
  end
end

class User < ActiveRecord::Base
  validates :username, length: {minimum: 6, maximum: 20}
  validates :email, presence: true, email: true
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 15}
  validates :city, presence: true
  validates :user_id, presence: true

  has_many :products
end

