# coding: utf-8
class Cookbook

  include Mongoid::Document
  include Mongoid::Timestamps::Short

  store_in collection: :cb

  # e.g. 鱼香肉丝
  field :name, type: String

  # 每个 material 是一个三元组 (name, quantity, unit)
  field :materials, type: Array

  # 标签 每个都是字符串
  field :tags, type: Array

  # 一张图片
  field :image, type: String

  field :description, type: String

  validates_presence_of :name, :description

  validate :materials_presence
  validate :material_names_uniq
  validate :each_material_should_have_3_attrs
  validate :each_material_should_have_name
  validate :each_material_should_have_quantity
  validate :each_material_should_have_unit

  before_validation :data_cleansing
  after_save  :record_material_dic

  Unit = %w{ 克 千克 斤 两 个 条 支 }
  
  private

  def record_material_dic
    if materials_changed?
      original_material_names = materials_was.to_a.map(&:first)
      current_material_names  = materials.map(&:first)
      (current_material_names - original_material_names).each { |m| MaterialDic.record_dic( m ) }
      (original_material_names - current_material_names).each { |m| MaterialDic.discount_dic( m ) }
    end
  end

  def data_cleansing
    materials.each { |material| material[0].gsub!(/\s/, '') }
    tags.each  { |tag| tag.gsub!(/\s/, '') }
  end

  def materials_presence
    if materials.empty?
      errors.add :materials, "请提供材料"
    end
  end

  def each_material_should_have_3_attrs
    if materials.any?{ |material| material.size != 3  }
      errors.add :materials, "请检查材料三元组的完整性"
    end
  end

  def material_names_uniq
    names = materials.map(&:first)
    errors.add :materials, "请合并相同的材料" unless names.uniq.size == names.size
  end

  def each_material_should_have_name
    if materials.any?{ |material| material[0]== ""  }    
      errors.add :materials, "请提供材料名称"      
    end
  end

  def each_material_should_have_quantity
    unless materials.all?{ |material| material[1].to_i > 0 }
      errors.add :materials, "请提供材料数量"        
    end
  end

  def each_material_should_have_unit
    unless materials.all?{ |material| Unit.include? material[2] }
      errors.add :materials, "请提供材料单位"      
    end
  end

end
