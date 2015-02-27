class AddReport < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.integer :state
      t.integer :done_jobs
    end
  end
end
