class Subject < ActiveRecord::Base
  has_and_belongs_to_many :cases
  belongs_to :report
  after_create :update_information

  def to_json
    return {
      id: self.id,
      name: 'Pedro Perez',
      rut: self.rut
    }
  end

  def update_information
    puts 'funciona'
    # response = HTTParty.get('http://localhost:8081/user/' + self.rut)
    # # manejo de la informacion
    # response.each do | r |
    #   print r['rol']
    #   caso = Case.find_or_create(r['rol'])
    #   caso.add_subject(self)
    #   cases << caso
    # end
    
    self.report.with_lock do
      self.report.increment_done_jobs
    end
  end
  handle_asynchronously :update_information

end