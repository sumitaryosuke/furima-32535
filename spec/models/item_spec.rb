require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '全ての値が正しい時に登録できる' do
        expect(@item).to be_valid
      end
    end 
    context '商品の出品ができない場合' do
      it "名前が空では出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品説明が空では出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
        
      end
      it "価格が空では出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "発送元の地域を選択しないと出品できない" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end
      it "カテゴリーを選択しないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "発送までの日数を選択しないと出品できない" do
        @item.post_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Post day must be other than 1")
      end
      it "配送料の負担を選択しないと出品できない" do
        @item.post_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Post fee must be other than 1")
      end
      it "商品の状態を選択しないと出品できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is not a number")
      end
      it "価格が300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格が10000000円以上では出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "画像がなくては出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "ユーザーが紐付いていないと商品は出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
