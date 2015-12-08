# coding: utf-8
require 'grape'

module Cookbook

  class API < Grape::API

    format :json

    resource :cookbooks do

      before do
        header "Access-Control-Allow-Origin", "*"
      end
      
      desc "list cookbooks"
      get do
        [ { id: "212323",
            name: "鱼香肉丝" ,
            tags: ["川菜", "微辣"],
            description: "第一步鱼香",
            image_url: "http://img01.3dmgame.com/uploads/allimg/150718/271_150718062452_1_lit.jpg" } ]

      end

      route_param :id do
        get do
          { id: params[:id],
            name: "鱼香肉丝" ,
            tags: ["川菜", "微辣"],
            description: "第一步鱼香",
            image_url: "http://img01.3dmgame.com/uploads/allimg/150718/271_150718062452_1_lit.jpg" } 
        end
      end

    end

  end

end
