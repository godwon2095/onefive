class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_ownership!, only: [:edit, :update, :destroy]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    elsif params[:search_user]
      @posts = User.search(params[:search_user]).find_posts.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    else
      @posts = Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    end
    @musics = Song.all.paginate(:page => params[:page], :per_page => 5)
  end

  def new
    @post = Post.new
  end

  def search
    if params[:search_music]
      @musics = Song.search(params[:search_music]).paginate(:page => params[:page], :per_page => 100)
      @check_params = params[:search_music]
    elsif params[:search_singer]
      @musics = Song.find_songs(Singer.search(params[:search_singer])).paginate(:page => params[:page], :per_page => 100)
    end

    respond_to do |format|
      format.js
    end
  end

  def search_post
    if params[:search_music]
      songs = Song.search(params[:search_music])
      singers = Song.find_songs(Singer.search(params[:search_music]))
      @musics = songs + singers

      respond_to do |format|
        format.js
      end
    end
  end

  def by_song
    post_ids = []
    Post.all.each do |p|
      post_ids << p.id if p.include_song?(params[:id]) == true
    end

    @posts = Post.where(id: post_ids).order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
  end

  def autoinit
    @music = Song.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def cancel
    @music = Song.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def create
    @post = Post.new(set_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        if params[:post][:image].present?
          format.html{ render :crop }
        end
      format.html{ redirect_to post_path(@post),
                  notice: "게시물이 성공적으로 작성되었습니다."}
      else
        format.html{ render :new,
                    notice: "오류가 발생했습니다."}
      end
    end
  end

  def crop
    @post = Post.new
  end

  def show
    @comment = Comment.new
    @subcomment = Subcomment.new
    @post.view_count += 1
    @post.save
    @user = @post.user

    if params[:page]
      @comments = @post.comments.paginate(:page => params[:page], :per_page => 10)
    else
      last_page = @post.comments.paginate(:page => params[:page], :per_page => 10).total_pages
      @comments = @post.comments.paginate(:page => last_page, :per_page => 10)
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(set_params)
        if params[:post][:image].present?
          render :crop
        else
          format.html{redirect_to post_path(@post),
                      notice: "게시물이 성공적으로 저장되었습니다."}
        end
      else
        format.html{render :edit,
                    notice: "오류가 발생했습니다."}
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html{redirect_to root_path, notice: "게시물이 성공적으로 삭제되었습니다."}
    end
  end

  private
  def set_params
    params.require(:post).permit(:title, :subtitle, :content, :image, :crop_x, :crop_y, :crop_w, :crop_h, song_ids: [], post_images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_ownership!
    redirect_to root_path if @post.user.id != current_user.id
  end
end
