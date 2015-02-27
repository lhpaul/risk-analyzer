class Report < ActiveRecord::Base
  has_many :subjects
  before_save :default_values

  def default_values
    self.state = 2
    self.done_jobs = 0
  end

  def add_subjects(ruts)
    ruts.each do |rut|
      self.subjects << Subject.new(:rut => rut, :report_id => self.id)
    end
  end

  def increment_done_jobs
    self.done_jobs += 1;
  end
end
