require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @product = FactoryBot.build(:product)
    @product.save
    @destination_purchase = FactoryBot.build(:destination_purchase, user_id: @user.id, product_id: @product.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されて、tokenが存在すれば商品が購入できる' do
        expect(@destination_purchase).to be_valid
      end

      it 'building_nameが空でも商品が購入できる' do
        @destination_purchase.building_name = ''
        expect(@destination_purchase).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと商品が購入できない' do
        @destination_purchase.token = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと商品が購入できない' do
        @destination_purchase.postal_code = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeは半角のハイフンを含んだ正しい形式でないと商品が購入できない' do
        @destination_purchase.postal_code = '1234567'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefacture_idが選択されていないと商品が購入できない' do
        @destination_purchase.prefacture_id = 1
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("Prefacture can't be blank")
      end

      it 'cityが空だと商品が購入できない' do
        @destination_purchase.city = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空だと商品が購入できない' do
        @destination_purchase.house_number = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが空だと商品が購入できない' do
        @destination_purchase.telephone_number = ''
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberが9文字以下では商品が購入できない' do
        @destination_purchase.telephone_number = '090123456'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include('Telephone number is invalid. Input half-width numbers')
      end

      it 'telephone_numberが12文字以上では商品が購入できない' do
        @destination_purchase.telephone_number = '090123456789'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include('Telephone number is invalid. Input half-width numbers')
      end

      it 'telephone_numberが全角数値では商品が購入できない' do
        @destination_purchase.telephone_number = '０９０１２３４５６７８'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include('Telephone number is invalid. Input half-width numbers')
      end

      it 'userが紐づいていないと商品が購入できない' do
        @destination_purchase.user_id = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐づいていないと商品が購入できない' do
        @destination_purchase.product_id = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
