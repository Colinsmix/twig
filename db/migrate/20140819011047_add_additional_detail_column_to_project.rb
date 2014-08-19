class AddAdditionalDetailColumnToProject < ActiveRecord::Migration
  def change
    add_column :projects, :desc_implementation, :text, null: false, default: "Your answer here"
    add_column :projects, :desc_benefits, :text, null: false, default: "Your answer here"
    add_column :projects, :desc_significance, :text, null: false, default: "Your answer here"
    add_column :projects, :desc_resources, :text, null: false, default: "Your answer here"
  end
end
