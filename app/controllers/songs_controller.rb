class SongsController < ApplicationController

def index
  @songs = Song.all
end

def new
  @song = Song.new
end

def show
  @song = Song.find(params[:id])
end

def create
  @song = Song.create(songs_params)
  if @song.valid?
    redirect_to @song
  else
    flash[:errors] = @song.errors.full_messages
    render :new
  end
end

def edit
  @song = Song.find(params[:id])
end

def update
  @song = Song.find(params[:id])
  @song.update(songs_params)
   if @song.valid?
     redirect_to @song
   else
     flash[:errors] = @song.errors.full_messages
     render :edit
   end
end

def destroy
  @song = Song.find(params[:id])
  @song.delete
  redirect_to songs_path
end

private

def songs_params
  params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
end

end
