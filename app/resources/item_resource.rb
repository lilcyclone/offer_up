class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :price, :float
  attribute :description, :string
  attribute :location, :string
  attribute :image, :string
  attribute :category_id, :integer
  attribute :seller_id, :integer
  attribute :buyer_id, :integer

  # Direct associations

  belongs_to :category

  has_many   :messages

  belongs_to :buyer,
             resource: UserResource

  belongs_to :seller,
             resource: UserResource

  # Indirect associations
end
