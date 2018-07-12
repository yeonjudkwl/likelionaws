class PostController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] #제외시킬 때
                                    # only > 원하는 것만 선택할 때
  
  def index
    @post = Post.all.reverse
  end

  def new
  end

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])

    
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.user_id = current_user.id
    @post.image = uploader.url
    @post.thumb = uploader.thumb.url
    @post.middle = uploader.middle.url
    @post.save
    
    redirect_to "/post/index"
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    
    redirect_to "/post/show/"+params[:id]
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id
     @post.delete
      redirect_to "/post/index"
   else
      redirect_to "/post/index"
   end
    
   
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def search
   # Post.where(:title => "asdsad") #asdsad만 찾음
    if params[:cate] == "1"
      @post = Post.where("title LIKE ?", "%#{params[:q]}%").reverse # %때문에 앞뒤에 어떤 거 있어도 찾을 수 있음
    elsif params[:cate] == "2"
      @post = Post.where("content LIKE ?", "%#{params[:q]}%").reverse
    elsif params[:cate] == "3"
      @post = Post.where("title LIKE ? or content LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%").reverse
    elsif params[:cate] == "4"
      @post = User.where("username LIKE ?", "%#{params[:q]}%").take.posts #하나만 가져옴
    end
  end
end
