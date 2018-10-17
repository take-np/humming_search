class PostsController < ApplicationController
# require 'logger'
#
#    Logger logger = Logger.new();
#
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    # @post = Post.find_by(id: params[:id])
  end
  def sample

  end

  def edit
  end

  def new

  end
  def update
    image = params[:image]
    File.binwrite("public/user_audio/sample.wav", image.read)
  end

  def new_check
  end

  def new_details
  end

  def create
    audio = params[:audio]
    # binding.pry
    File.binwrite("public/user_audio/sample.ogg", audio.read)
    # @post = Post.new(content: params[:details])
    # @post.save
    # if @post.save
    #   flash[:notice] = "投稿が完了しました"
    #   redirect_to("/posts/index")
    # end

  end

  def new_record
    @user = User.find_by(id: params[:id])
    # -
  end

  def new_reply
  end
  def result
  end
  def search
  end

end
