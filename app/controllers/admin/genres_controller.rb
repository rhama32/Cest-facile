class Admin::GenresController < ApplicationController

  #管理者でログインしていない場合、ログイン画面へ遷移。
  before_action :authenticate_admin!
  
  #ジャンル一覧
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  #ジャンル作成
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to admin_genres_path
  end
  
  #ジャンル編集
  def edit
    @genre = Genre.find(params[:id])
  end
  
  #ジャンル更新
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end
  
  #ジャンル削除
  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      redirect_to admin_genres_path
    end
  end
  
  private
    def genre_params
      params.require(:genre).permit(:name)
    end
    
end