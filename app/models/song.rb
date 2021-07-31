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

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_content=(content)
    contents.each do |content|
      note = Note.find(content)
      self.notes << note
    end
  end

  def notes_content
    self.notes ? self.notes.content : nil
  end
end
