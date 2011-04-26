namespace :comics do
  desc "Recalculate all the comic average score and total rating count."
  task :update_statistics => :environment do
    Comic.all.each do |comic|
      comic.update_statistics!
    end
  end
end