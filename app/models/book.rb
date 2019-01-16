class Book < ApplicationRecord
   def self.all_genres ; %w[ ScienceFiction Drama ActionAndAdventure Romance Mystery Horror ] ; end
end
