class AddTextColorAndAccentColorToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :text_color, :string
    add_column :pages, :accent_color, :string
    add_column :pages, :name, :string
  end
end
