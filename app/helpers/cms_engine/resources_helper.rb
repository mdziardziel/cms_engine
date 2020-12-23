module CmsEngine
  module ResourcesHelper
    def render_input(input_type, form, options = {})
      input_path = "cms_engine/resources/inputs/#{input_type}"
      fallback_path = 'cms_engine/resources/inputs/string'

      partial_path = partial_or_fallback_path(input_path, fallback_path)
      render(partial_path, form: form, options: options)
    end

    private
    
    def partial_or_fallback_path(path, fallback_path)
      return path if lookup_context.template_exists?(path, [], true)

      fallback_path
    end
  end
end
