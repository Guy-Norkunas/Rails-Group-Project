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

    def edit
        @comment
    end

    def destroy
        
    end

    private
        def comment_params
            params.require(:comment).permit(:comment)
        end
end
