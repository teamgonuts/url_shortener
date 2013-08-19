class Url < ActiveRecord::Base
  attr_accessible :url, :codename
  validates_uniqueness_of :codename
end
