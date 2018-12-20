require "base64"
require "date"
class PostsController < ApplicationController
  # 下記のメソッドが何を示すのかわかっていない
  before_action :verify_authenticity_token, only: []
# require 'logger'
#
#    Logger logger = Logger.new();ify_authenticity
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user_id = @post.user_id
    @user = User.find_by(id: @user_id)
    # 以下2行コメント追加で追加
    # @post = Post.find_by(slug: params[:slug])
    # @comment = @post.comments.build
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

  def new_record
    @user = User.find_by(id: params[:id])
  end

  def new_reply
  end


  def create
    @user = User.find_by(id: params[:id])
    @now = DateTime.now.strftime('%Y%m%d%H%M%S')
    audio = params[:audio]
    details = params[:details]
    @name = ("#{@user.id}" + "_" + @now + ".ogg")
    puts details

    File.binwrite("public/user_audio/" + @name, audio.read)

    @post = Post.new(
      user_id: @current_user.id,
      audio_name: @name,
      details: details
    )
    @post.save
    if @post.save
      flash[:notice] = "投稿が完了しました"
      redirect_to("/posts/index")
    else
      render("posts/new_record")
    end
    #logger.debug(params)#.all_keys
    # name = ("public/user_audio/#{@user.id}" + "_" + @now + ".ogg")
    # puts name
    # puts details
    #
    # File.binwrite(name, audio.read)
    #
    # @post = Post.new(
    #   user_id: @current_user.id,
    #   audio_name: name,
    #   details: details
    # )
    # @post.save
    # if @post.save
    #   flash[:notice] = "投稿が完了しました"
    #   redirect_to("/posts/index")
    # else
    #   render("posts/new_record")
    # end
    # #logger.debug(params)#.all_keys
    # return render json: params
    # binding.pry

    # # @post = Post.new(content: params[:details])
    #File.binwrite("public/user_audio/blob_sample.ogg", Base64.decode64(audio))
    # # @post = Post.new(content: params[:details])
    # @post.save
    # if @post.save
    #   flash[:notice] = "投稿が完了しました"
    #   redirect_to("/posts/index")
    # end
    #redirect_to("/posts/index")
    #head :no_content
  end

  def result
  end
  def search
  end

end
