class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.belongs_to :user
      t.string :filepath

      t.timestamps
    end
  end
end
