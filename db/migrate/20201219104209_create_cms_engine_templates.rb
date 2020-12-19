class CreateCmsEngineTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :cms_engine_templates do |t|
      t.string :name
      t.string :path
      t.jsonb :elements

      t.timestamps
    end
  end
end
