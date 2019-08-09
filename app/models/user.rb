class User < ApplicationRecord
  belongs_to :city, optional: true 
  accepts_nested_attributes_for :city
  has_many :gossips
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "JoinTableMessageRecipient"
  has_many :comments
  has_many :likes
  validates :email,
  presence: true,
  uniqueness: true
  has_secure_password
  validates :password,
  presence: true,
  length: { minimum: 6 }
end
