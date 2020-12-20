module CmsEngine
  class ResourceSerializer < ActiveModel::Serializer
    attributes :path, :elements

    def elements
      object.elements.map { |element| element.attributes.slice(:key, :content, :type) }
    end
  end
end