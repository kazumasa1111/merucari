class ProductsController < ApplicationController
  before_action :set_parents, only: [:index,:new, :create, :edit, :update, :show]
  before_action :set_finds, only: [:destroy, :edit, :update, :show]
  # test
  before_action :category_parent_array, only: [:edit]
  before_action :show_all_instance, only: [:edit]

  def index
    @parents = Category.where(ancestry: nil)
    @products = Product.all
    @images = Image.all
  end

  def new
    @product = Product.new
    @product.images.new
    @product.build_category
    @product.build_brand
  end


  def create
      @product = Product.new(product_params)
      @product.user_id = current_user.id
    if @product.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path,notice: '削除できました'
    else
      redirect_to root_path,notice: '削除できませんでした'
    end
  end

  def edit
    @product.images
    # @product.build_category
    # @product.build_brand

    # test 
  
    # test
  end

  def update
    if @product.update(product_params)
      redirect_to root_path, notice: '更新されました'
    else
      render action: :edit
    end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:child_id]
          @grandchildren = Category.find("#{params[:child_id]}").children
        end
      end
    end
  end


  def show
    @image = Image.find(params[:id])

    @category_id = @product.category_id                            
    @category_parent = Category.find(@category_id).parent.parent                    
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end


  def set_parents
    @parents = Category.where(ancestry: nil)
  #   @children = Category.where(ancestry:  @category_parent.id)
  #   @grandchildren = Category.where(ancestry: @category_parent.id/@category_child.id)
  end

  def set_finds
    @product = Product.find(params[:id])
  end
  
  def set_builds
    @product.build_category
    @product.build_brand
  end

private

  def product_params
    params.require(:product).permit(:name, :description_of_item, :price,:category_id ,:commodity_condition , :shipping_charges, :days_until_shipping , :prefecture_id,
    brand_attributes: [:id, :name],images_attributes: [:id,:image])
  end

  # test
  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil).each do |parent|
    end
  end

 

  def show_all_instance
    # @user = User.find(@item.user_id)
    # @images = Image.where(item_id: params[:id])
    # @images_first = Image.where(item_id: params[:id]).first

    @category_id = @product.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

   #test

end
