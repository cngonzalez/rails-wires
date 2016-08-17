class AddBodyColorToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :body_color, :string
  end
end
