# class CommentsController < ApplicationController
#
#   def create
#     @song = Song.find_by(params[:post_id])
#     comment = Comment.new(comment_params)
#     # raise comment_params.inspect
#     comment.save
#     respond_to do |format|
#       format.html {redirect_to @song}
#     end
#   end
#
#   def index
#     @comments = Comment.all
#   end
#
#   private
#
#   def comment_params
#     params.require(:comment).permit(:content, :song_id, :user_id, :username)
#   end
#
#
#
# end
