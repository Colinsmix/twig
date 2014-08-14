class ChangeOrganizerOnProject < ActiveRecord::Migration
  def up
    add_column :projects, :organizer_id, :integer
    remove_column :projects, :organizer
  end

  def down
    remove_column :projects, :organizer_id
    add_column :projects, :organizer, :string
  end
end
