class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :prefacture
  belongs_to :shipping_day

  belongs_to :user
  has_one_attached :image
  has_one :purchase_management

  with_options presence: true do
    validates :title
    validates :content
    validates :image
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'is invalid' }
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefacture_id
    validates :shipping_day_id
  end
end
