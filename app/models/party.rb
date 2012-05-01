class Party < ActiveRecord::Base


attr_accessible :id, :host_id, :name, :location, :date, :start_time , :end_time , :desc , :rsvp_date

belongs_to :host
validates :desc, :presence => true, :length => { :maximum => 140 }
validates :host_id, :presence => true
validates :name, :presence =>true
has_many :guests

default_scope :order => 'parties.created_at DESC'

end
