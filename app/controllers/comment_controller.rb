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
      @comment = Comment.find_by(id: params[:id])
      @comment.destroy
      redirect_to :back
      
  end
    
  def edit
      @comment = Comment.find_by(id: params[:id])
  end
    
  def update
      @comment = Comment.find_by(id: params[:id])
      @comment.content = params[:content]
      @comment.save
      redirect_to :back
  end

end
