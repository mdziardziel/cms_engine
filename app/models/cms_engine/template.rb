module CmsEngine
  class Template < ApplicationRecord
    def elements
      (super || []).map { |element| Element.new(element)}
    end
  end
end
