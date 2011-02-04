class TwitterResult < ActiveRecord::Base

  validates_uniqueness_of :tweet, :scope => [:screen_name, :tweet_created]

end
