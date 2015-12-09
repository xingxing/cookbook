# coding: utf-8
require 'spec_helper'

RSpec.describe MaterialDic, type: :model do

  it { is_expected.to be_stored_in :m }
  
  it { is_expected.to have_field(:name).of_type(String) }

  it { is_expected.to have_field(:rc).of_type(Integer).with_alias(:reference_count).with_default_value_of(0) }


  describe :record_dic do

    it "if the material has been recorded, should inc its reference count" do
      create(:material_dic, name: '驴肉', rc: 1)
      MaterialDic.record_dic('驴肉')
      expect( MaterialDic.where(name: "驴肉").first.reference_count ).to eq(2)
    end

    it "if the materal is new shuold create a dic iterm and its reference count will be 1" do
      MaterialDic.record_dic('牛肉')      
      expect( MaterialDic.where(name: "牛肉").first.reference_count ).to eq(1)
    end

  end
  
end
