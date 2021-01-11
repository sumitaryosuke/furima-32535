require 'rails_helper'

RSpec.describe OrderAddress, type: :model do  
  before do
    # seller = FactoryBot.create(:user)
    user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order_address, item_id: @item.id, user_id: user.id)
  end
  context '商品の購入ができるとき' do
    it '全ての値が正しく保存される' do
      expect(@order).to be_valid
    end
    it '建物名がなくても購入できる' do
      @order.building = ''
      expect(@order).to be_valid
    end
  end

  context '商品の購入ができないとき' do
    it '郵便番号が空だと購入できない' do
      @order.postal_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が数字以外だと購入できない' do
      @order.postal_code = 'aaaaaaa'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '郵便番号にハイフンがないと購入できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it '都道府県が選択されていないと購入できない' do
      @order.area_id = '0'
      @order.valid?
      expect(@order.errors.full_messages).to include('Area must be other than 0')
    end
    it '市区町村が空だと購入できない' do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '電話番号が空だと購入できない' do
      @order.phone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空だと購入できない' do
      @order.token = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空では購入できない' do
      @order.user_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空では購入できない' do
      @order.item_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it '電話番号が12桁以上では購入できない' do
      @order.phone_number = '090123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が10桁未満では登録できない' do
      @order.phone_number = '090123456'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    it '電話番号が英数字混合では購入できない' do
      @order.phone_number = '0901234abcd'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
