require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '商品の出品' do
    before do
      @product = FactoryBot.build(:product)
    end

    context '入力内容に問題ない場合' do

      it '全ての値が正しく入力されていると保存できる' do
      end

    end

    context '入力内容に問題がある場合' do

      it 'imageが空だと保存できない' do
      end

      it 'titleが空だと保存できない' do
      end

      it 'contentが空だと保存できない' do
      end

      it 'category_idが1だと保存できない' do
      end

      it 'status_idが1だと保存できない' do
      end

      it 'charge_idが1だと保存できない' do
      end

      it 'prefacture_idが1だと保存できない' do
      end

      it 'shipping_day_idが1だと保存できない' do
      end

      it 'priceが空だと保存できない' do
      end

      it 'priceが300未満だと保存できない' do
      end

      it 'priceが9,999,999より大きいと保存できない' do
      end

      it 'priceが半角数値以外だと保存できない' do
      end

    end
  end
end
