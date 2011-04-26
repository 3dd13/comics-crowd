module RatingsHelper
  def comics_option_for_select(selected)
    options_from_collection_for_select(Comic.all, "id", "name", selected)
  end
  
  def ratings_option_for_select(selected)
    options_for_select((1..10).map{|num| [num, num]}, selected)
  end
end
