# coding: utf-8
FactoryGirl.define do
  factory :cookbook do

    name "鱼香肉丝"

    materials [ ["白砂糖", "2", "克"], ["醋", "20", "克"] ]

    tags ["川菜", "甜辣"]

    image "ssd.jpg"

  end
end
