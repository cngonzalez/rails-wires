class CreateElements < ActiveRecord::Migration[5.0]
  def change
    create_table :elements do |t|
      t.string :position
      t.string :color
      t.integer :size
      t.integer :type
      t.belongs_to :page 

      t.timestamps
    end
  end
end
