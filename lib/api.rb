# coding: utf-8
require 'grape'
require 'mongoid'
require 'will_paginate_mongoid'

$cbe = (ENV["CBE"] || "development")

puts $cbe


lib_dir = File.expand_path('../', __FILE__)

Dir[ File.join(lib_dir, "models/**/*.rb") ].each { |f| require f }

Mongoid.load!(File.expand_path('config/mongoid.yml', __dir__), $cbe )

module Cookbooks

  class API < Grape::API

    format :json

    resource :cookbooks do

      before do
        header "Access-Control-Allow-Origin", "*"
      end
      
      desc "list cookbooks"
      get do
        cbs = Cookbook.order_by(c_at: 'desc').paginate(page: params[:page])
        {
          data: cbs.to_json,
          paginate: { page:     cbs.current_page,
                      per_page: cbs.per_page,
                      total_pages: cbs.total_pages }
        }
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


    resource :materials do

      desc "get all materials"
      get do
        ["猪肉", "牛肉", "白糖", "盐"]
      end

    end

  end

end
