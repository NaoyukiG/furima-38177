require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品の出品' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '入力内容に問題ない場合' do

      it '全ての値が正しく入力されていると保存できる' do
        expect(@product).to be_valid
      end

    end

    context '入力内容に問題がある場合' do

      it 'imageが空だと保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空だと保存できない' do
        @product.title = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空だと保存できない' do
        @product.content = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idを選択していないと保存できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idを選択していないと保存できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it 'charge_idを選択していないと保存できない' do
        @product.charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Charge can't be blank")
      end

      it 'prefacture_idを選択していないと保存できない' do
        @product.prefacture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefacture can't be blank")
      end

      it 'shipping_day_idを選択していないと保存できない' do
        @product.shipping_day_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'priceが空だと保存できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300未満だと保存できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが9,999,999より大きいと保存できない' do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it 'priceが半角数値以外だと保存できない' do
        @product.price = "１０００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is invalid")
      end

      it 'userが紐づいていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("User must exist")
      end

    end
  end
end
