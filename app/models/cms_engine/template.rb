module CmsEngine
  class Template < ApplicationRecord
    include CmsEngine::HasManyElements

    validates :name, length: 2..255, uniqueness: true
    validates :path, length: 2..255, uniqueness: true

    has_many :resources, class_name: 'CmsEngine::Resource', foreign_key: 'cms_engine_template_id'
  end
end
