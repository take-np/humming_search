# class CommentsController < ApplicationController
#   def reply
#     @reply = @post.comments.build(parent: @comment)
#   end
#
#   def new
#   end
#
#   def create
#     @post = Post.find_by(slug:params[:post_slug])
#     @comment = @post.comments.build(comment_params)
#     @comment.user = current_user
#
#     if @comment.save
#       change_parentcomment if params[:comment][:parent_id].present?
#       respond_to do |format|
#         format.html { redirect_to @post, notice: "Comment was successfully created."}
#         format.json { render json: @comment }
#         format.js
#       end
#     else
#       respond_to do |format|
#         format.html { render :back, notice: "Comment was not created." }
#         format.json { render json: @comment.errors }
#         format.js
#       end
#     end
#    end
#
# def edit
#  end
#
# def update
#  respond_to do |format|
#  if @comment.update(comment_params)
#  format.html { redirect_to @post, notice: "Comment was successfully updated."}
#  format.json { render json: @comment }
#  format.js
#  else
#  format.html { render :back, notice: "Comment was not updated." }
#  format.json { render json: @comment.errors }
#  format.js
#  end
#  end
#  end
#
# def destroy
#  @comment.destroy if @comment.errors.empty?
#  delete_commenthave @comment if @comment.parent_id.present?
#  respond_to do |format|
#  format.html { redirect_to @group, notice: "Comments was successfully destroyed."}
#  format.json { head :no_content }
#  format.js
#  end
#  end
#
# private
#
# def set_comment
#   begin
#    @post = Post.find_by(slug:params[:post_slug])
#    @comment = @post.comments.find(params[:id])
#    rescue => e
#    logger.error "#{e.class.name} : #{e.message}"
#    @comment = @post.comments.build
#    @comment.errors.add(:base, :recordnotfound, message: "That record doesn't exist. Maybe, it is already destroyed.")
#    end
#  end
#
#   def change_parentcomment
#     changecomment = Comment.find(params[:comment][:parent_id])
#     changecomment.update(replies_count:changecomment.replies_count + 1)
#    end
#
#  def delete_commenthave(comment)
#      parent = comment.parent
#      parent.update(replies_count:parent.replies_count - 1)
#   end
#
#  def comment_params
#    params.require(:comment).permit(:content, :parent_id,:image)
#  end
# end
