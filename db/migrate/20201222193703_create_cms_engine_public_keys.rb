class CreateCmsEnginePublicKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :cms_engine_public_keys do |t|
      t.text :body
      t.string :algorithm

      t.timestamps
    end
  end
end
