class Message < ApplicationRecord
  # Direct associations

  belongs_to :item

  belongs_to :recipient,
             class_name: "User"

  belongs_to :sender,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    item.to_s
  end
end
