class AddSubjectsCases < ActiveRecord::Migration
  create_table :cases_subjects, id: false do |t|
      t.belongs_to :subject, index: true
      t.belongs_to :case, index: true
    end
end
