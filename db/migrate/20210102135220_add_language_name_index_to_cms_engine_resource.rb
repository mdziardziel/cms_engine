class AddLanguageNameIndexToCmsEngineResource < ActiveRecord::Migration[5.2]
  def change
    add_index :cms_engine_resources, [:name, :language], unique: true
  end
end
