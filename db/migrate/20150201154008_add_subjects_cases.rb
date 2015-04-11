class AddSubjectsCases < ActiveRecord::Migration
  def change
    create_table :cases_subjects, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :case, index: true
    end
  end
end
