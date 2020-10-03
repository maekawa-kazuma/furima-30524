require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
   @item = FactoryBot.build(:item)
   @item.category_id = 2
   @item.state_id = 2
   @item.burden_id = 2
   @item.area_id = 2
   @item.day_id = 2
 end

 describe '商品の保存' do
   context '商品が保存できる場合' do
     it 'nameとtextとcategory_idとstate_idとburden_idとarea_idとday_idとpriceとimageがあれば保存される' do
       
     end
   end
   context '商品が保存できない場合' do
     it 'nameが空だと保存できない' do
       
     end
     it 'textが空だと保存できない' do
       
     end
     it 'category_idが空だと保存できない' do
       
     end
     it 'state_idが空だと保存できない' do
       
     end
     it 'burden_idが空だと保存できない' do
       
     end
     it 'area_idが空だと保存できない' do
       
     end
     it 'day_idが空だと保存できない' do
       
     end
     it 'priceが空だと保存できない' do
       
     end
     it 'userが紐づいていない場合は保存できない' do
       
     end
     it 'imageが空だと保存できない' do
       
     end
     it '価格が300より小さいと保存できない' do
       
     end
     it '価格が9999999より大きいと保存できない' do
       
     end
     it '価格が半角数字でない場合は保存できない' do
       
     end
     it 'category_idが初期のまま(1)だと保存できない' do
       
     end
     it 'state_idが初期のまま(1)だと保存できない' do
       
     end
     it 'burden_idが初期のまま(1)だと保存できない' do
       
     end
     it 'area_idが初期のまま(1)だと保存できない' do
       
     end
     it 'day_idが初期のまま(1)だと保存できない' do
       
     end
   end
 end
end
