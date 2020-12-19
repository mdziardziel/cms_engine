module CmsEngine
  class Template < ApplicationRecord
    validates :name, length: 2..255, uniqueness: true
    validates :path, length: 2..255, uniqueness: true
    validate :elements_validity

    def elements
      (super || []).map { |element| Element.new(element.merge(template: self))}
    end

    def elements_validity
      memorized_elements = elements
      return unless memorized_elements.select(&:invalid?).any?
      
      uniq_error_messages(memorized_elements).each do |key, messages|
        messages.each { |message| errors.add(key, message) }
      end
    end

    def uniq_error_messages(elements)
      acc = {}
      messages = elements.map { |el| el.errors.messages }
      messages.each do |message|
        message.keys.each { |key| acc[key] = (acc[key] || []) + (message[key] || []) }
      end
      acc.transform_values { |value| value.uniq }
    end
  end
end
