module ApplicationHelper
  
  def meta_title
    @meta_title || I18n.t('layout.head.title') 
  end
  
  def meta_description
    @meta_description || "#{I18n.t('home.tagline')} | #{I18n.t('layout.head.description')}"
  end
end
