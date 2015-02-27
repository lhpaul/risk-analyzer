class AddReportIdToSubject < ActiveRecord::Migration
  def change
    change_table :subjects do |t|
      t.integer :report_id
    end
  end
end
