class CreateProject < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :status, null: false
      t.string :organizer, null: false
      t.string :link, null: false

      t.timestamps
    end
  end
end
