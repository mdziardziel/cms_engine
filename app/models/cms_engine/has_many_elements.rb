module CmsEngine
  module HasManyElements
    extend ActiveSupport::Concern

    included do
      validate :elements_validity
    end

    def elements
      memorized_elements = super
      elements = memorized_elements.is_a?(String) ? JSON.parse(memorized_elements) : memorized_elements
      elements.map { |element| Element.new(element.merge(source: self))}
    end

    private

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
