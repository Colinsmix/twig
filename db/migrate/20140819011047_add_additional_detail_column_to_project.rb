class AddAdditionalDetailColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :desc_implementation, :text
    add_column :projects, :desc_benefits, :text
    add_column :projects, :desc_significance, :text
    add_column :projects, :desc_resources, :text
    add_column :projects, :short_description, :string, null: true, default: nil
  end
end
