class TestsController < ApplicationController

  def index
  	@post = Test.all
  end

  def show
    @post = Test.find(params[:id])
    flash.now[:info] = "We are in show page."
  end

  def new
		@post = Test.new
		#@category = Category.all
  end

  def create
		@post = Test.new(test_params)
      
		if @post.save
			#render :action => :index
			redirect_to tests_path, :notice => "The post is saved"

		else
			render "new"
		end
  end

  def edit
    @post = Test.find(params[:id])
  end

  def update
    @post = Test.find(params[:id])

    if @post.update_attributes(test_params)
      redirect_to tests_path, :notice => "The Post is updated"

    else
      render "edit"
    end
  end


def destroy
    @post = Test.find(params[:id])
    @post.destroy
    redirect_to tests_path, :notice => "The Post is deleted"

end
  def calc
    @var = params[:id]
  end
 
 private
  def test_params
      params.require(:test).permit(:id,:title,:body,:category_id )
   end
end
