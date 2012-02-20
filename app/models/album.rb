class Album < ActiveRecord::Base

    has_and_belongs_to_many :features
    has_many :lineitems

    belongs_to :artist

  
  validates_presence_of :tittle ,:message => "Tittle can't be empty" ,:on => :create
#  validates_presence_of :artist ,:message => "artist name be empty"
#  validates_presence_of :release_date ,:message => "Release_date can't be empty"
#  validates_presence_of :genere ,:message => "genere can't be empty"
#  validates_presence_of :feature ,:message => " feature can't be empty"
#  validates_numericality_of :feature, :only_integer => true, :message => "can only be whole number."

  named_scope :order_by, :order =>  "artist_id"

end
