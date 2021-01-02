class AddPathLanguageTemplateIndexToCmsEngineResource < ActiveRecord::Migration[5.2]
  def change
    add_index :cms_engine_resources, [:path, :language, :cms_engine_template_id], unique: true, name: 'index_cms_engine_resources_on_path_language_and_template_id'
  end
end
