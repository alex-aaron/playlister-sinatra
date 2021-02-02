class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        name = self.name.downcase
        slug = name.gsub(/\s/, "-")
        slug
    end

    def self.find_by_slug(slug)
        
        Genre.all.find do |genre|
            genre.slug == slug
        end
        
        # slug_array = slug.split("-")
        # capitalized = slug_array.map do |ind_name|
        #     ind_name.capitalize
        # end
        # unslugged_name = capitalized.join(" ")
        # genre = Genre.find_by(name: unslugged_name)
    end
end