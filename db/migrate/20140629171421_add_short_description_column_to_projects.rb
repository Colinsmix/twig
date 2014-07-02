class AddShortDescriptionColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :short_description, :string, null: false, default: 'short description'
  end
end
