class AddShortDescriptionColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :short_description, :string
  end
end
