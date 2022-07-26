class DestinationPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefacture_id, :city, :house_number, :building_name, :telephone_number, :purchase_management, :user_id, :product_id

  with_options presence: true do
    validates :prefacture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :user_id
    validates :product_id
    validates :purchase_management_id
  end

  validates :postal_code, presence: true, 
            format: {
              with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)",
              allow_blank: true
              }

  validates :telephone_number, presence: true, 
            format: {
              with: /\A^0[0-9]{10,11}$\z/, message: "is invalid. Input half-width numbers",
              allow_blank: true
              }

  def save
    purchase_management = PurchaseManagement.create(user_id: user_id, product_id: product_id)
    Destination.create(postal_code: postal_code, prefacture_id: prefacture_id, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number, purchase_management_id: purchase_management_id)
  end
end