class Public::HomesController < ApplicationController

def top
  @genres = Genre.all
  #閲覧順
  top_hospital_ids = Impression.where(controller_name: "hospitals").group(:impressionable_id).count.sort_by { |_, v| v }.reverse.slice(0,3).to_h.keys
  @hospitals = Hospital.where(id: top_hospital_ids).sort_by{ |o| top_hospital_ids.index(o.id)}
  if params[:genre_id]
    @genre = Genre.find(params[:genre_id])
    @hospitals = @genre.hospitals
  end
end

def about
end

end