class Report < ActiveRecord::Base
  has_many :subjects, :dependent => :delete_all

  def to_json
    ready_porcentage = self.subjects.count != 0 ? (100*self.done_jobs/self.subjects.count).to_i : 100
    return {
      id: self.id,
      name: self.name,
      ready_porcentage: ready_porcentage,
      created_at: self.created_at.strftime('%d/%m/%Y')
    }
  end

  def add_subjects(ruts)
    ruts.each do |rut|
      subject = Subject.new(:rut => rut, :report_id => self.id)
      self.subjects << subject
    end
  end

  def increment_done_jobs
    self.increment!(:done_jobs, 1)
  end

end
