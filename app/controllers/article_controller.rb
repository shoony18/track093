class ArticleController < ApplicationController
  before_action :authenticate_user
  # before_action :ensure_correct_user, {only:[:edit,:update,:destroy]}

  def new
    @article = Article.new
    
  end

  def create

  	@article = Article.new(
      title: params[:title],
      lead: params[:lead],
      topic1: params[:topic1],
      content1: params[:content1],
      topic2: params[:topic2],
      content2: params[:content2],
      topic3: params[:topic3],
      content3: params[:content3]
    )   

    @article.save

    if params[:titleimg]
      @article.titleimg = "#{@article.id}_0.jpg"
      image = params[:titleimg]
      File.binwrite("public/article_images/#{@article.titleimg}", image.read)
    else
    end

    if params[:img1]
      @article.img1 = "#{@article.id}_1.jpg"
      image = params[:img1]
      File.binwrite("public/article_images/#{@article.img1}", image.read)
    else
    end

    if params[:img2]
      @article.img2 = "#{@article.id}_2.jpg"
      image = params[:img2]
      File.binwrite("public/article_images/#{@article.img2}", image.read)
    else
    end

    if params[:img3]
      @article.img3 = "#{@article.id}_3.jpg"
      image = params[:img3]
      File.binwrite("public/article_images/#{@article.img3}", image.read)
    else
    end

    @article.save

    redirect_to("/article/index")
    
  end

  def index
    @articles = Article.all
  end

  def show
  	@article = Article.find_by(id: params[:id])
    
  end

  def edit
    @article = Article.find_by(id: params[:id])    
  end

  def update
    @article = Article.find_by(id: params[:id])
   

    @article.title = params[:title]
    @article.lead = params[:lead]
    @article.topic1 = params[:topic1]
    @article.content1 = params[:content1]
    @article.topic2 = params[:topic2]
    @article.content2 = params[:content2]
    @article.topic3 = params[:topic3]
    @article.content3 = params[:content3]
    
    if params[:titleimg]
      @article.titleimg = "#{@article.id}_0.jpg"
      image = params[:titleimg]
      File.binwrite("public/article_images/#{@article.titleimg}", image.read)
    else
    end

    if params[:img1]
      @article.img1 = "#{@article.id}_1.jpg"
      image = params[:img1]
      File.binwrite("public/article_images/#{@article.img1}", image.read)
    else
    end

    if params[:img2]
      @article.img2 = "#{@article.id}_2.jpg"
      image = params[:img2]
      File.binwrite("public/article_images/#{@article.img2}", image.read)
    else
    end

    if params[:img3]
      @article.img3 = "#{@article.id}_3.jpg"
      image = params[:img3]
      File.binwrite("public/article_images/#{@article.img3}", image.read)
    else
    end

    @article.save

    redirect_to("/article/#{@article.id}")
  end

  def destroy
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect_to("/article/index")
  end

  

end
