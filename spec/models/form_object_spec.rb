require 'rails_helper'

RSpec.describe FormObject, type: :model do
  describe '#create' do
    before do
      @form_object = FactoryBot.build(:form_object)
    end

    it '建物名以外のすべての情報を正しく入力すると商品の購入ができる' do
      expect(@form_object).to be_valid
    end

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
      @form_object.postal_code = 5_420_764
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include('Postal code is invalid')
    end

    it '電話番号はハイフンがあり、12桁以上だと登録できない' do
      @form_object.phone_number = '050031873522'
      @form_object.valid?
      expect(@form_object.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
