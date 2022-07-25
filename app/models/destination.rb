class Destination < ApplicationRecord

  belongs_to :purchase_management

  with_options presence: true do
    :prefacture_id, numericality: { other_than: 1, message: "can't be blank" }
    :city
    :house_number
    :building_name
  end

  validates :postal_code, presence: true, 
            format: {
              with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)",
              allow_blank: true
              }

  validates :telephone_number, presence: true, 
            format: {
              with: /^0[0-9]{10,11}$/, message: "is invalid. Input half-width numbers",
              allow_blank: true
              }

end