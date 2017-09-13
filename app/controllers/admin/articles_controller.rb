class Admin::ArticlesController < Admin::AdminController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
    @root_categories = Category.roots
  end

  def create
    @article = Article.new(params.require(:article).permit!)
    if @article.save
      flash[:notice] = "新建文章成功!"
      redirect_to action: :index
    else
      flash[:notice] = "新建文章失败!"
      render :back
    end
  end

  def edit
    @article = Article.find(params[:id])
    @root_categories = Category.roots
    render :new
  end

  def update
    @article = Article.find(params[:id])
    
    if @article.update(params.require(:article).permit!)
      flash[:notice] = "修改文章成功!"
      redirect_to action: :index
    else
      flash[:notice] = "修改文章失败!"
      render :back
    end
  end

  def delete
  end
end
