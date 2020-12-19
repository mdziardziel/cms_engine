module CmsEngine
  class Element
    include ActiveModel::Model

    TYPES = %i[html string text int float]
    TYPES_STRING = TYPES.map(&:to_s)

    attr_accessor :key, :type, :content, :template

    validates :key, length: 2..255
    validates :type, inclusion: { in: TYPES_STRING }
    validate :keys_uniqueness


    def initialize(attributes = {})
      attributes.each do |name, value|
        send("#{name}=", value)
      end
    end

    def keys_uniqueness
      return if template.elements.size == template.elements.map(&:key).uniq.size

      errors.add(:key, I18n.t('activerecord.errors.models.cms_engine.template.uniqueness'))
    end
  end
end
