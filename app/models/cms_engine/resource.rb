module CmsEngine
  class Resource < ApplicationRecord
    include CmsEngine::HasManyElements
    
    validates :name, length: 2..255, uniqueness: true
    validates :path, length: 2..255, uniqueness: true

    belongs_to :template, class_name: 'CmsEngine::Template', foreign_key: 'cms_engine_template_id'
  end
end
