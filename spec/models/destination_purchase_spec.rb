require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  before do
  end

  describe '商品購入' do

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されて、tokenが存在すれば商品が購入できる' do
      end

      it 'building_nameが空でも商品が購入できる' do
      end
      
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと商品が購入できない' do
      end

      it 'postal_codeが空だと商品が購入できない' do
      end

      it 'postal_codeは半角のハイフンを含んだ正しい形式でないと商品が購入できない' do
      end

      it 'prefacture_idが選択されていないと商品が購入できない' do
      end
      
      it 'cityが空だと商品が購入できない' do
      end
      
      it 'house_numberが空だと商品が購入できない' do
      end
      
      it 'telephone_numberが空だと商品が購入できない' do
      end
      
      it 'telephone_numberが10桁以上11桁以内の半角数値でないと商品が購入できない' do
      end
      
      it 'userが紐づいていないと商品が購入できない' do
      end

      it 'productが紐づいていないと商品が購入できない' do
      end

    end


  end
end
