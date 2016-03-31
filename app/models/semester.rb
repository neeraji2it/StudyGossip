class Semester < ActiveRecord::Base
  attr_accessible :name
  has_many :clss, :dependent => :destroy
end
