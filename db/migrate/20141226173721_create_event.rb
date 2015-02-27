class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :folio
      t.string :file_link
      t.string :stage
      t.string :step
      t.text :step_description
      t.date :date
      t.integer :foja
    end
  end
end
