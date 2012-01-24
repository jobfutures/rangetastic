class Order < ActiveRecord::Base
  acts_as_rangetastic :fields => ["fulfilled_on","ordered_on","shipped_at"]
  
  scope :fulfilled, where("fulfilled_on is not null")
end