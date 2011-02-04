class Keyword < ActiveRecord::Base

  validates_uniqueness_of :keyword

end
