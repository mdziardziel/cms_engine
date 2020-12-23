module CmsEngine
  module ResourcesHelper
    def render_input(input_type, default_value, form)
      input_path = "cms_engine/resources/inputs/#{input_type}"
      fallback_path = 'cms_engine/resources/inputs/string'

      partial_path = partial_or_fallback_path(input_path, fallback_path)
      render(partial_path, default_value: default_value, form: form)
    end

    private
    
    def partial_or_fallback_path(path, fallback_path)
      return path if lookup_context.template_exists?(path, [], true)

      fallback_path
    end
  end
end
