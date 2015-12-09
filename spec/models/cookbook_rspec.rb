# coding: utf-8
require 'spec_helper'

RSpec.describe Cookbook ,type: :model do

  it { is_expected.to be_stored_in :cb }

  it { is_expected.to have_field(:name).of_type(String) }

  it { is_expected.to have_field(:materials).of_type(Array) }

  it { is_expected.to have_field(:tags).of_type(Array) }

  it { is_expected.to validate_presence_of(:name) }


  it "correct data" do
    cb = build( :cookbook )
    expect(cb).to be_valid
  end

  it "materials presence" do
    cb = build( :cookbook, materials: [] )
    expect(cb).not_to be_valid
    expect(cb.errors[:materials]).to include("请提供材料")
  end


  it "each material should have 3 attributtes" do
    cb = build( :cookbook, materials: [["土豆", "23", "克"], ["鸡头", "2"], ["s"]] )
    expect(cb).not_to be_valid
    expect(cb.errors[:materials]).to include("请检查材料三元组的完整性")
  end

  
  it "material's name should presence" do
    cb= build(:cookbook  ,materials: [ ["  ", "21", "克"] ])
    expect(cb).not_to be_valid
    expect(cb.errors[:materials].size).to eq(1)    
  end

  it "material's quantity should presence" do
    cb= build(:cookbook  ,materials: [ ["盐", "xs", "克"] ])
    expect(cb).not_to be_valid
    expect(cb.errors[:materials].size).to eq(1)    
  end

 it "material's unit should presence" do
    cb= build(:cookbook  ,materials: [ ["盐", "5", " "] ])
    expect(cb).not_to be_valid
    expect(cb.errors[:materials]).to include("请提供材料单位")
 end


 it "tags and material names shouldn't include white-space characters" do
   cb= build(:cookbook  ,materials: [ [" 辣 椒 ", "1", "个"] ], tags: [" 川 菜", "特 辣 " ] )
   cb.save
   cb.reload
   expect(cb.materials).to eq([["辣椒", "1", "个"]])
   expect(cb.tags).to eq(%w{ 川菜 特辣 })
 end


 it "material name should not be duplicated" do
   cb= build(:cookbook, materials: [ [" 辣 椒 ", "1", "个"], ["辣椒", "2", "克"] ], tags: [" 川 菜", "特 辣 " ] )
   expect(cb).not_to be_valid
   expect(cb.errors[:materials]).to include("请合并相同的材料")
 end


 describe :material_dictionray do

   context :new_cookbook do
     it "record new materials" do
       cb = create(:cookbook)
       cb.materials.map(&:first).each do |m|
         expect( MaterialDic.find_by(name: m).rc ).to eq(1)
       end
     end
   end

   context :update_cookbook do

     before(:each) do
       @cb1 = create(:cookbook, materials: [ ["白砂糖", "2", "克"], ["醋", "20", "克"], ["牛肉", "2", "千克"] ])
       @cb2 = create(:cookbook, materials: [ ["白砂糖", "2", "克"], ["醋", "20", "克"], ["猪肉", "2", "斤"] ])
     end

     it "cb2 should using 鸡肉&酱油 instead of 猪肉&醋 " do
       @cb2.reload.update_attributes(materials: [["白砂糖", "2", "克"], ["酱油", "20", "克"], ["鸡肉", "2", "两"]] )
       expect( MaterialDic.find_by(name: "白砂糖").rc ).to eq(2)
       expect( MaterialDic.find_by(name: "醋").rc ).to eq(1)
       expect( MaterialDic.find_by(name: "酱油").rc ).to eq(1)
       expect( MaterialDic.find_by(name: "猪肉").rc ).to eq(0)
       expect( MaterialDic.find_by(name: "鸡肉").rc ).to eq(1)
     end


   end

 end

 


end
