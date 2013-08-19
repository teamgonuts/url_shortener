class Url < ActiveRecord::Base
  attr_accessible :url, :codename
  validates_uniqueness_of :codename


  #generates a codename from the given array of naughty words
  #NOTE: Does not generate codenames uniqueness. Uniqueness is checked when object is saved
  def generate_codename
    #put code to generate codename here
  end

 end
