class Comic < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  # acts_as_commentable
  # acts_as_taggable
  # acts_as_rateable
  
  has_many :ratings
  
  def update_statistics!
    self.rating_count = self.number_of_ratings
    self.average_score = self.average_rating
    self.save!
  end
  
  protected 
  
  def average_rating
    if self.number_of_ratings > 0
      self.ratings.sum(:rating) / self.number_of_ratings.to_f
    else
      0
    end
  end
  memoize :average_rating
  
  def number_of_ratings
    self.ratings.size
  end
  memoize :number_of_ratings
  
  # @post.rate_it( 4, current_user.id )
  # 
  # @post.average_rating #=> 4.0
  # 
  # @post.average_rating_round #=> 4
  # 
  # @post.average_rating_percent #=> 80
  # 
  # @post.rated_by?( current_user ) #=> rating || false
  # 
  # Post.find_average_of( 4 ) #=> array of posts  


  
  # commentable = Post.create
  # commentable.comments.create(:title => "First comment.", :comment => "This is the first comment.")


  
  # @user = User.new(:name => "Bobby")
  #    @user.tag_list = "awesome, slick, hefty"      # this should be familiar
  #    @user.save  
  
  # class User < ActiveRecord::Base
  #   acts_as_taggable_on :tags
  #   named_scope :by_join_date, :order => "created_at DESC"
  # end
  # 
  # User.tagged_with("awesome").by_date
  # User.tagged_with("awesome").by_date.paginate(:page => params[:page], :per_page => 20)
  # 
  # # Find a user with matching all tags, not just one
  # User.tagged_with(["awesome", "cool"], :match_all => :true)
  # 
  # # Find a user with any of the tags:
  # User.tagged_with(["awesome", "cool"], :any => true)  
  
  # @frankie = User.find_by_name("Frankie")
  #   @frankie.skill_list # => ["hacking"]
  # 
  #   @tom = User.find_by_name("Tom")
  #   @tom.skill_list # => ["hacking", "jogging", "diving"]
  # 
  #   @tom.find_related_skills # => [<User name="Bobby">,<User name="Frankie">]
  #   @bobby.find_related_skills # => [<User name="Tom">]
  #   @frankie.find_related_skills # => [<User name="Tom">]  
  
  
  # @user = User.new(:name => "Bobby")
  #    @user.set_tag_list_on(:customs, "same, as, tag, list")
  #    @user.tag_list_on(:customs) # => ["same","as","tag","list"]
  #    @user.save
  #    @user.tags_on(:customs) # => [<Tag name='same'>,...]
  #    @user.tag_counts_on(:customs)
  #    User.tagged_with("same", :on => :customs) # => [@user]
  
  # <% tag_cloud(@tags, %w(css1 css2 css3 css4)) do |tag, css_class| %>
  #   <%= link_to tag.name, { :action => :tag, :id => tag.name }, :class => css_class %>
  # <% end %>  
end
