class CreateCmsEngineResources < ActiveRecord::Migration[5.2]
  def change
    create_table :cms_engine_resources do |t|
      t.references :cms_engine_template, foreign_key: true
      t.string :name
      t.string :path
      t.boolean :published, default: false
      t.jsonb :elements, null: false, default: '[]'
      t.string :language

      t.timestamps
    end
  end
end
