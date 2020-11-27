class Item < ApplicationRecord
  belongs_to :user
  has_one    :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_price
  belongs_to :shipment_source
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :condition_id
    validates :price
    validates :category_id
    validates :delivery_price_id
    validates :shipment_source_id
    validates :information
    validates :days_to_ship_id
  end

  with_options format: { with: /\A[0-9]+\z/ } do
    validates :price
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_price_id
    validates :shipment_source_id
    validates :days_to_ship_id
  end
end
