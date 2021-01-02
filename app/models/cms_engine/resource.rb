require 'paper_trail'

module CmsEngine
  class Resource < ApplicationRecord
    include CmsEngine::HasManyElements

    has_paper_trail versions: { class_name: 'CmsEngine::Version' }, on: [:update]

    AVAILABLE_LANGUAGES = %w[pl en de ru]
    
    validates :name, length: 2..255, uniqueness: { scope: :language }
    validates :path, length: 2..255, uniqueness: { scope: [:language, :cms_engine_template_id] }

    belongs_to :template, class_name: 'CmsEngine::Template', foreign_key: 'cms_engine_template_id'

    def full_path
      "/#{language}/#{template.path}/#{path}".gsub("//", "/")
    end
  end
end
