class CreateCmsEngineResources < ActiveRecord::Migration[5.2]
  def change
    create_table :cms_engine_resources do |t|
      t.references :template, foreign_key: true
      t.string :name
      t.string :path
      t.boolean :published
      t.jsonb :elements
      t.string :language

      t.timestamps
    end
  end
end
