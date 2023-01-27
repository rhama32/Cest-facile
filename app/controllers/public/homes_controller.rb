class Public::HomesController < ApplicationController
  before_action :authenticate_customer!

def top
  @genres = Genre.all
  @hospitals = Hospital.all
  if params[:genre_id]
    @genre = Genre.find(params[:genre_id])
    @hospitals = @genre.hospitals
  #elsif @search_hospitals
    #@hospitals = @search_hospitals.page(params[:page])
    #@hospitals_count = @search_hospitals.all.count
  end
end

def about
end

end
