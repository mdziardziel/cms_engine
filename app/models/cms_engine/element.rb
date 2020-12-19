module CmsEngine
  class Element
    include ActiveRecord::Validations

    TYPES = %i[html string text int float]
    attr_accessor :key, :type, :content

    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
end
