class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :charge_id
    validates :prefacture_id
    validates :shipping_day_id
  end

end
