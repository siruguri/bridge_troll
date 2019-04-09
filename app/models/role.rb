class Role < ActiveHash::Base
  include ActiveHash::Enum
  self.data = [
    {id: 1, name: 'STUDENT', title: "Student"},
    {id: 2, name: 'VOLUNTEER', title: "Volunteer"},
    {id: 3, name: 'ORGANIZER', title: "Organizer"}
  ]
  enum_accessor :name

  def self.organizer_id
    Role.find_by(title: 'Organizer').id
  end

  def self.attendee_role_ids
    [Role.find_by(title: 'Volunteer').id, Role.find_by(title: 'Student').id]
  end

  def self.attendee_role_ids_with_organizers
    [Role.find_by(title: 'Volunteer').id, Role.find_by(title: 'Student').id, Role.find_by(title: 'Organizer').id]
  end

  def self.empty_attendance
    Role.all.each_with_object({}) do |role, hsh|
      hsh[role.id] = 0
    end
  end
end
