class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :comic
  
  validates_inclusion_of :rating, :in => 1..10
  
  after_save :update_comic_statistics
  
  private
  
  def update_comic_statistics
    self.comic.update_statistics!
  end
end
