require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品の出品ができるとき' do
      it 'image、explanation、category_id、status_id、charge_id、region_id、shipping_day_id、price、user_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができないとき' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it 'explanationが空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'status_idが1だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'charge_idが1だと登録できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Charge can't be blank"
      end
      it 'region_idが1だと登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Region can't be blank"
      end
      it 'shipping_day_idが1だと登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping day can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが299円以下では登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は¥300から¥9,999,999の範囲で設定してください'
      end
      it 'priceが10,000,000円以上では登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は¥300から¥9,999,999の範囲で設定してください'
      end
    end
  end
end
