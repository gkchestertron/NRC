class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :name, null: false
      t.text :html
      t.integer :page_id, null: false
      t.integer :template_id

      t.timestamps
    end
    add_index :layouts, :page_id
  end
end
