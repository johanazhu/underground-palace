class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_article!, only: %i[create destroy]

    def create
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end

    def destroy
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private

    def set_article!
        @article = Article.find(params[:article_id])
    end

    def comment_params
        params.require(:comment).permit(:body).merge(user: current_user)
    end

end
