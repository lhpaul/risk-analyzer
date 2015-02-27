class Case < ActiveRecord::Base
  has_many :events, dependent: :destroy
  has_and_belongs_to_many :subjects

  def self.find_or_create(rol)
    caso = Case.find_by_rol(rol)
    if caso.nil?
      caso = Case.new(:rol => rol)
      caso.save
    end
    return caso
  end

  def add_subject(subject)
    unless subjects.find(subject)
      subjects << subject
    end
  end
end