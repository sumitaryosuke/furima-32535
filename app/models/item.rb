class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :post_day
  belongs_to :status
  belongs_to :post_fee

  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :area_id,       numericality: { other_than: 0 }
  validates :post_fee_id,   numericality: { other_than: 1 }
  validates :category_id,   numericality: { other_than: 1 }
  validates :post_day_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }

  has_one_attached :image
  validates :image, presence: true
end
