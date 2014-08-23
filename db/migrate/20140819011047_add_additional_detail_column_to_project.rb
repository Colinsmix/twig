class AddAdditionalDetailColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :desc_implementation, :text
    add_column :projects, :desc_benefits, :text
    add_column :projects, :desc_significance, :text
    add_column :projects, :desc_resources, :text
    remove_column :projects, :short_description, :string
  end
end
