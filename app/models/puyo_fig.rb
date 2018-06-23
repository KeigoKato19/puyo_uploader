class PuyoFig < ActiveRecord::Base
  validates :name, :length => {:in => 2..10 }
  validates :iframe, presence: true
  validates :iframe, :format => URI::regexp(%w(http https))
  validates :name, :length => {:in => 0..39 }
  acts_as_taggable
end
