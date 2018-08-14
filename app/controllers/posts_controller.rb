class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
    elsif params[:search_user]
      @posts = User.search(params[:search_user]).find_posts.paginate(:page => params[:page], :per_page => 3)
    else
      @posts = Post.order(created_at: :desc).paginate(:page => params[:page], :per_page => 3)
    end
    # 
    # @result = Wombat.crawl do
    #   # byebug
    #   # base_url "https://www.melon.com/"
    #   base_url "https://music.naver.com/"
    #   # path "/chart/index.htm"
    #   path "/artist/track.nhn?artistId=270284&sorting=popular" #아티스트
    #   music_titles({ css: ".track"  }, :list)
    #   #music_titles({ css: "._title > .ellipsis"  }, :list) #top100
    #   music_singers({ css: ".tb_artist"  }, :list)
    #   music_albums({ css: ".album"  }, :list)
    #   music_images({ xpath: ".//td//a[1]//img/@src" }, :list)
    #
    #
    #   # links do
    #   #   explore xpath: '/html/body/header/div/div/nav[1]/a[4]' do |e|
    #   #     e.gsub(/Explore/, "Love")
    #   #   end
    #
    #     features css: '.nav-item-opensource'
    #     business css: '.nav-item-business'
    # end
  end

  def new
    @post = Post.new
  end

  def search
    if params[:search_music]
      @musics = Song.search(params[:search_music])
    end

    respond_to do |format|
      format.js
    end
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
        format.html{ redirect_to post_path(@post),
                    notice: "게시물이 성공적으로 작성되었습니다."}
      else
        format.html{ render :new,
                    notice: "오류가 발생했습니다."}
      end
    end
  end

  def show
    @comment = Comment.new
    @post.view_count += 1
    @post.save
    @user = @post.user
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(set_params)
        format.html{redirect_to post_path(@post),
                    notice: "게시물이 성공적으로 수정되었습니다."}
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


  # def search
  #   if params[:search].present?
  #     @post = Post.search(params[:search])
  #   else
  #     @post = Post.all
  #   end
  # end

  private
  def set_params
    params.require(:post).permit(:title, :subtitle, :content, :image, song_ids: [], post_images: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_ownership!
    redirect_to root_path if @post.user.id != current_user.id
  end
end
