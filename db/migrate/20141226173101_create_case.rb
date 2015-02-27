class CreateCase < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.string :rol
      t.string :court
      t.string :admn_state
      t.string :stage
      t.string :proc
      t.string :proc_state
      t.date :entry_date
      t.string :file_link
    end
    add_index :cases, :rol
  end
end
