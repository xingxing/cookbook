class MaterialDic

  include Mongoid::Document

  store_in collection: :m

  field :name, type: String
  field :rc, as: :reference_count, type: Integer, default: 0


  class << self

    def record_dic material_name
      iterm = find_or_create_by( name: material_name )
      iterm.inc( rc: 1 )
    end

    def discount_dic material_name
      iterm = find_or_create_by( name: material_name )
      iterm.inc( rc: -1 )
    end

  end


end
