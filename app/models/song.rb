class Song < ActiveRecord::Base
    belongs_to :artist 
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name = self.name.downcase
        slug = name.gsub(/\s/, "-")
        slug
    end

    def self.find_by_slug(slug)
        
        Song.all.find do |song|
            song.slug == slug
        end
        
        # slug_array = slug.split("-")
        # capitalized = slug_array.map do |ind_name|
        #     ind_name.capitalize
        # end
        # unslugged_name = capitalized.join(" ")
        # song = Song.find_by(name: unslugged_name)
    end
end