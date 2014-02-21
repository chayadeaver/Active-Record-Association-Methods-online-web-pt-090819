require_relative '../spec_helper'

describe 'Genre' do
  before do
    @genre = Genre.create(name: "Hip Hop")
  end

  it 'has a name' do
    expect(Genre.where(name: "Hip Hop").first).to eq(@genre)
  end

  it 'belongs to a song' do
    @genre.song = Song.create(name: "Something By That Person Who Sings Stuff")
    @genre.save

    found_song = Song.find(name: "Something By That Person Who Sings Stuff")
    expect(found_song.genres).to include(@genre)
  end

  it 'is also associated with an artist' do
    artist = Artist.create(name: "Fun Person Who Sings")
    song = Song.create(name: "Sweet Tunez", genre: @genre)
    artist.songs << song
    artist.save

    expect(@genre.artists).to include(artist)
  end
end