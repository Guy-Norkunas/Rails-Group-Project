class CommentsController < ApplicationController
    def create
        new_comment = current_user.comments.new(comment_params)
        new_comment.post_id = params[:post_id]
        if new_comment.save
            redirect_to new_comment.post
        else
            render new_comment.post
        end
    end

    def show
        @comment = Comment.find(params[:id])
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to post_path(params[:post_id])
    end

    def update
        comment = Comment.find(params[:id])
        if comment.update(comment_params)
          redirect_to comment.post
        else
          render 'show'
        end
    end

    private
        def comment_params
            params.require(:comment).permit(:comment)
        end
end
