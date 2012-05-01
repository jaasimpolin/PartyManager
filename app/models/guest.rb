class Guest < ActiveRecord::Base
attr_accessible :host_id, :name, :email, :expected_attendees, :invite_code
before_create :add_invite_code
belongs_to :host
has_many :parties
default_scope :order => 'guests.created_at DESC'

validates_numericality_of :expected_attendees, :only_integer => true, :greater_than => 0
validates :name, :presence => true
validates :email, :presence => true, :format => {:with => /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/ , :message => "is not a valid format" }

protected
    def add_invite_code
      self.invite_code = SecureRandom.hex(5)
    end
  
  def self.do_invite(code, guests)
    invitation = find_by_invite_code(code)
    self.actual_attendees = guests
    return invitation
  end

end
