class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :area
  belongs_to :category
  belongs_to :post_day
  belongs_to :status

  validates :name,          presence: true
  validates :explanation,   presence: true
  validates :area_id,       numericality: { other_than: 1 }
  validates :post_fee_id,   numericality: { other_than: 1 }
  validates :category_id,   numericality: { other_than: 1 }
  validates :post_day_id,   numericality: { other_than: 1 }
  validates :status_id,     numericality: { other_than: 1 }

  validates :price,         presence: true, format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } do
  end

  has_one_attached :image
end
