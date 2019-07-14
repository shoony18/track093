class CommentController < ApplicationController
  def detail
  end
    
  def create
      @article = Article.find_by(id: params[:id])   
      @comment = Comment.new(
      content: params[:content]
      )
      @comment.comment_id = current_member.id
      @comment.article_id = @article.id
      
      @comment.save
      redirect_to("/article/#{@article.id}")

  end

  def destroy
  end
    
  def edit
  end
    

end
