class Order < ActiveRecord::Base
  has_many :lineitems
  belongs_to :customer
end
