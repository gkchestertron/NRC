class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :layout_id, null: false
      t.string :parent_selector, null: false
      t.text :text

      t.timestamps
    end
    add_index :contents, :layout_id
  end
end
