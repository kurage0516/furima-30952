require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '#create' do
    before do
      @form_object = FactoryBot.build(:form_object, user_id: :user, item_id: :item)
    end

    context '登録成功時' do
      it '建物名以外のすべての情報を正しく入力すると商品の購入ができる' do
        expect(@form_object).to be_valid
      end

      it '建物名がなくても登録が可能' do
        @form_object.building_name = nil
        expect(@form_object).to be_valid
      end
    end

    context 'エラー発生時' do
      it 'クレジットカードの情報が空だと登録できない' do
        @form_object.token = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号の情報が空だと登録できない' do
        @form_object.postal_code = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Postal code can't be blank")
      end

      it '都道府県の情報が空だと登録できない' do
        @form_object.area_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Area can't be blank")
      end

      it '市区町村の情報が空だと登録できない' do
        @form_object.municipality = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地の情報が空だと登録できない' do
        @form_object.address = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号の情報が空だと登録できない' do
        @form_object.phone_number = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Phone number can't be blank")
      end

      it '郵便番号の情報はハイフンがないと登録できない' do
        @form_object.postal_code = "5420764"
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Postal code is invalid')
      end

      it '電話番号はハイフンがあり、12桁以上だと登録できない' do
        @form_object.phone_number = '0500-3187-3522'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Phone number is invalid')
      end

      it '都道府県の情報で---を選択だと登録できない' do
        @form_object.area_id = 1
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Area must be greater than 1')
      end

      it 'user_idがないと登録できない' do
        @form_object.user_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idがないと登録できない' do
        @form_object.item_id = nil
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include("Item can't be blank")
      end

      it '電話番号は英数混合では登録できない' do
        @form_object.phone_number = '050318735aa'
        @form_object.valid?
        expect(@form_object.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
