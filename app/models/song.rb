class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :genre
  belongs_to :artist

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def create
    Song.create(artist_name_params)
  end

  private

  def artist_name_params
    params.require(:song).permit(:artist_name, :artist_name)
  end  

end
