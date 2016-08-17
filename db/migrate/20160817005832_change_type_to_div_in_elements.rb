class ChangeTypeToDivInElements < ActiveRecord::Migration[5.0]
  def change
    rename_column :elements, :type, :div
  end
end
