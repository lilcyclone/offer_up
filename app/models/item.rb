class Item < ApplicationRecord
  # Direct associations

  belongs_to :category

  has_many   :messages,
             :dependent => :destroy

  belongs_to :seller,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end