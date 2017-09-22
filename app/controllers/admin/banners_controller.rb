class Admin::BannersController < Admin::AdminController
  def index
    @banners = Banner.where(status: 1).order("position": "asc")
    @hidden_banners = Banner.where(status: 0)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    if @banner.save
      flash[:notice] = "图片保存成功!"
      redirect_to action: :index
    else
      flash[:notice] = "图片保存失败!"
      render action: :new  
    end
  end

  def edit
    @banner = Banner.find(params[:id])
    render action: :new

  end

  def update
    @banner = Banner.find(params[:id])
    if @banner.update(banner_params)
      flash[:notice] = "修改成功!"
      redirect_to action: :index
    else
      flash[:notice] = "修改失败!"
      render action: :edit
    end    
  end

  def show
  end

  def destroy
    @banner = Banner.find(params[:id])
    @banner.move_to_bottom
    @banner.destroy
    flash[:notice] = "图片已删除!"
    redirect_to action: :index
  end

  def set_show
    @banner = Banner.find(params[:id])
    if @banner.status
      @banner.status = 0
      @banner.move_to_bottom
      @banner.save
      flash[:notice] = "设为隐藏成功!"
    else
      @banner.status = 1
       @banner.move_to_top
      @banner.save
      flash[:notice] = "设为显示成功!"
    end
    
    redirect_to action: :index
  end

  #方法1,一个方法操作4个动作
  def set_order
    @banner = Banner.find(params[:id])
    case params[:type]
      when 'pre'
        @banner.move_higher
        flash[:notice] = "[#{@banner.title}]上移成功!"
      when 'next'
        @banner.move_lower
        flash[:notice] = "[#{@banner.title}]下移成功!"
      when 'first'
        @banner.move_to_top
        flash[:notice] = "[#{@banner.title}]置顶成功!"
      when 'last'
        @banner.move_to_bottom
        flash[:notice] = "[#{@banner.title}]置底成功!"
    end
    redirect_to action: :index
    
  end

  private
  def banner_params
    params.require(:banner).permit!
  end
end
