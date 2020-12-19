module CmsEngine
  class Resource < ApplicationRecord
    belongs_to :template
  end
end
