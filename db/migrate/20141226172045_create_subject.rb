class CreateSubject < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :rut
      t.string :person_type
      t.string :social_reason
    end
    add_index :subjects, :rut
  end
end
