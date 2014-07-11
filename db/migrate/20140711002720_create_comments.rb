class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :project, index: true, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
