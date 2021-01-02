module CmsEngine
  module ResourcesHelper
    def render_input(input_type, form, key, options = {})
      # TODO fix html
      input_path = "cms_engine/resources/inputs/#{input_type.to_s == 'html' ? 'text' : input_type}_input"
      fallback_path = 'cms_engine/resources/inputs/string_input'

      partial_path = partial_or_fallback_path(input_path, fallback_path)
      render(partial_path, form: form, options: options, key: key)
    end

    private
    
    def partial_or_fallback_path(path, fallback_path)
      return path if lookup_context.template_exists?(path, [], true)

      fallback_path
    end
  end
end
