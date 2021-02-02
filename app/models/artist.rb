class Artist < ActiveRecord::Base
    has_many :songs 
    has_many :genres, through: :songs

    def slug
        name = self.name.downcase
        slug = name.gsub(/\s/, "-")
        slug
    end

    def self.find_by_slug(slug) # bob-dylan
        
        Artist.all.find do |artist|
            artist.slug == slug
        end

        #returns artist instance  where slug matches input
        
        # slug_array = slug.split("-")
        # capitalized = slug_array.map do |ind_name|
        #     ind_name.capitalize
        # end
        # unslugged_name = capitalized.join(" ")
        # binding.pry
        # artist = Artist.find_by(name: unslugged_name)
    end
end