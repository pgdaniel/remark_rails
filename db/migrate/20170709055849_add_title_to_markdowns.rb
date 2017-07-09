class AddTitleToMarkdowns < ActiveRecord::Migration[5.1]
  def change
    add_column :markdowns, :title, :string
  end
end
