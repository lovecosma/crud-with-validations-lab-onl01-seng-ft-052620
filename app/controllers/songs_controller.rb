class SongsController < ApplicationController


def index
  @songs = Song.all
end

def new
  @song = Song.new
end

def show
  set_song
end

def create
  @song = Song.new(song_params)
  if @song.save
    redirect_to song_path(@song)
  else
    render :new
  end
end

  def edit
    set_song
  end

  def update
    set_song
    @song.update(song_params)
    if @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end



  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def set_song
    @song = Song.find_by_id(params[:id])
  end

  end