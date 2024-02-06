require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_residence = FactoryBot.build(:order_residence, user_id: @user.id, item_id: @item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_residence).to be_valid
      end
      it 'は空でも保存できること' do
        @order_residence.building_name = ''
        expect(@order_residence).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_residence.postal_code = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code can't be blank","Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_residence.postal_code = '0000000'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'region_idを選択していないと保存できないこと' do
        @order_residence.region_id = 1
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Region can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_residence.city = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @order_residence.house_number = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @order_residence.telephone = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Telephone can't be blank", "Telephone must be 10 to 11 digits long")
      end
      it 'telephoneは9桁以下だと保存できないこと' do
        @order_residence.telephone = '00000000'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Telephone must be 10 to 11 digits long")
      end
      it 'telephoneは12桁以上だと保存できないこと' do
        @order_residence.telephone = '000000000000'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Telephone must be 10 to 11 digits long")
      end
      it 'telephoneは半角数値以外は保存できないこと' do
        @order_residence.telephone = '電話番号'
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Telephone must be 10 to 11 digits long")
      end
      it 'userが紐づいていないと登録できない' do
        @order_residence.user_id = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと登録できない' do
        @order_residence.item_id = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end