# The Jukebox class contains the logic for managing the list of available songs.
#
# Each song has a related name, price, album, genre, artist, year and length.
#
# The Jukebox offers several methods in order to perform operations within
# the playlist:
#
# 1. play(song)
# 2. play_random_song_by_genre(genre)
# 3. play_random_song_by_year(year)
# 4. play_random_song_by_artist(artist)
# 5. play_random_song
# 6. add_money(quantity)
class Jukebox

  def initialize(songs, wallet=nil)
    @playlist = Playlist.new(songs)
    @wallet = wallet || Wallet.new
  end

  attr_reader :playlist

  def add_money(quantity)
    @wallet.add(quantity)
  end

  def credit
    @wallet.money
  end

  def play(song)
    song.tap do |s|
      @wallet.take(s.price)
    end
  end

  def play_selected_song_by_id(song_id)
    selected_song = @playlist.select_song_by_id(song_id)
    play(selected_song)
  end

  def play_random_song
    random_song = @playlist.select_random_song
    play(random_song)
  end

  def play_random_song_by_genre(genre)
    random_song = @playlist.select_random_song_by_genre(genre)
    play(random_song)
  end

  def play_random_song_by_year(year)
    random_song = @playlist.select_random_song_by_year(year)
    play(random_song)
  end

  def play_random_song_by_artist(artist)
    random_song = @playlist.select_random_song_by_artist(artist)
    play(random_song)
  end
end
