class CreateSubject < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :rut
      t.string :person_type
      t.string :social_reason
      t.integer :report_id ## Esto es para que se le pueda avisar al reporte que esta acutaizada la informacion del sujeto
    end
    add_index :subjects, :rut
  end
end
