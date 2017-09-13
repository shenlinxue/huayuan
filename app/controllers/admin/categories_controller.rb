class Admin::CategoriesController < Admin::AdminController

  before_action :find_root_categories, only: [:new, :create, :edit, :update]
  before_action :find_category, only: [:edit, :update, :destroy]
  
  def index
    if params[:id].blank?
      @categories = Category.roots.order("position": "asc")
    else
      @category = Category.find(params[:id])
      @categories = @category.children
    end

    @categories = @categories.page(params[:page] || 1).per_page(params[:per_page] || 10)
      .order(id: "desc")
  end

  def new
    @category = Category.new

    # # 默认权重为最小权重值减10
    # @weight = Category.minimum("weight")
    # @category.weight = @weight - 10
  end

  def create
    @category = Category.new(params.require(:category).permit!)

    if @category.save
      flash[:notice] = "保存成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def edit
    render action: :new
  end

  def update
    @category.attributes = params.require(:category).permit!

    if @category.save
      flash[:notice] = "修改成功"
      redirect_to admin_categories_path
    else
      render action: :new
    end
  end

  def destroy
    if @category.destroy
      flash[:notice] = "删除成功"
      redirect_to admin_categories_path
    else
      flash[:notice] = "删除失败"
      redirect_to :back
    end
  end

  #方法1,一个方法操作4个动作
  def set_order
    @category = Category.find(params[:id])
    case params[:type]
      when 'pre'
        @category.move_higher
        flash[:notice] = "[#{@category.title}]上移成功!"
      when 'next'
        @category.move_lower
        flash[:notice] = "[#{@category.title}]下移成功!"
      when 'first'
        @category.move_to_top
        flash[:notice] = "[#{@category.title}]置顶成功!"
      when 'last'
        @category.move_to_bottom
        flash[:notice] = "[#{@category.title}]置底成功!"
    end
    redirect_to :back
    
  end




  #方法2,每个方法操作一个动作
  # def set_to_top
  # end

  # def set_to_bottom    
  # end

  # def set_up
  #   @category = Category.find(params[:id])
  #   @category.move_higher
  #   redirect_to :back
  #   flash[:notice] = "[#{@category.title}]上移成功!"
  # end

  # def set_down    
  # end

  private
  def find_root_categories
    @root_categories = Category.roots.order(id: "desc")
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
