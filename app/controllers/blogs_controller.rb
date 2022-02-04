class BlogsController < ApplicationController
  layout 'custom'
  
  def new
    @blog = Blog.new
    @category = Category.all
  end

  def create
    @blog = Blog.new(blog_params)
    #@blog.tag_ids = params[:tag_ids]
    if @blog.save
       redirect_to :action => 'index'
    else
      respond_to do |format|
        format.html{
          render :new,
          status: :unprocessable_entity
        }
      end
    end
  end

  def update
    @blog = Blog.find(params[:id])
     
    if @blog.update(blog_params)
       redirect_to :action => 'index', :id => @blog
    else
       render :action => 'edit'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @category = Category.all
  end

  def destroy
    Blog.find(params[:id]).destroy
     redirect_to :action => 'index'
  end

  def index
    @blogs = Blog.all
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(blog_params) }
    end
  end

  def show
  end

  def blog_params
    params.require(:blog).permit(:title, :description,:attachment, :category_id,{ tag_ids: [] }, :status)
 end


 def get_processed_dataset
  lines = Category.datatable_filter(params['search']['value'], params['columns'])
    lines_filtered = lines.count
    
    render json: { lines: lines,
                  draw: params['draw'].to_i,
                  recordsTotal: Line.count,
                  recordsFiltered: lines_filtered }
  end

  def get_dataset
    respond_to do |format|
      format.json { render json: Category.all }
    end
  end
end
