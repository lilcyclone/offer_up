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
  attribute :is_sold, :boolean

  # Direct associations

  # Indirect associations

end
