class User < ApplicationRecord
  include JwtToken
  # Direct associations

  has_many   :received_messages,
             class_name: "Message",
             foreign_key: "recipient_id",
             dependent: :nullify

  has_many   :sent_messages,
             class_name: "Message",
             foreign_key: "sender_id",
             dependent: :nullify

  has_many   :items,
             foreign_key: "seller_id",
             dependent: :nullify

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
