class AddReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :name
      t.integer :done_jobs, :default => 0
      t.integer :user_id
      t.timestamps
    end
  end
end
