module CmsEngine
  class Element
    include ActiveModel::Model

    TYPES = %i[html string text int float]
    TYPES_STRING = TYPES.map(&:to_s)

    attr_accessor :key, :type, :content

    validates :key, length: 2..255
    validates :type, inclusion: { in: TYPES_STRING }


    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end
  end
end
