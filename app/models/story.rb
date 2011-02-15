class Story < ActiveRecord::Base
  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
  validates_presence_of :name, :link
  has_many :votes
end
