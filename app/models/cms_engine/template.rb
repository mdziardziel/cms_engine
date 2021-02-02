module CmsEngine
  class Template < ApplicationRecord
    include CmsEngine::HasManyElements

    validates :name, length: 2..255, uniqueness: true
    validates :path, length: 2..255, uniqueness: true, format: { with: /\A[a-zA-Z0-9-_]*\z/ }

    has_many :resources, class_name: 'CmsEngine::Resource', foreign_key: 'cms_engine_template_id'
  end
end
