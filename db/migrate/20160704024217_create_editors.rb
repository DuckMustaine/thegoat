class CreateEditors < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.string :title
      t.text :post
      t.string :tags
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
