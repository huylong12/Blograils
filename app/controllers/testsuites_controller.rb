class TestsuitesController < ApplicationController

  def index
  	@testsuites = Testsuite.all
  	# debugger
  end

  def destroy
  	@testsuite = Testsuite.find_by(id: params[:id])
  	redirect_to testsuites_path if @testsuites.blank?
  	@testsuite.destroy
  	# debugger
  	redirect_to testsuites_path
  end

  def new
  	@testsuite = Testsuite.new
  	# debugger
  end

  def create
  	# debugger
  	 # debugger
  	# @testsuite = Testsuite.find_by(id: params[:id])
  	 @testsuite = Testsuite.new(testsuit_params)
  	# @testsuite.user = current_user
  	  	# debugger
  		@testsuite.save
  		redirect_to testsuites_path

  end

  def edit
  	@testsuite = Testsuite.find_by(id: params[:id])
    redirect_to testsuites_path if @testsuite.blank?
  end

  def update
  	@testsuite = Testsuite.find_by(id: params[:id])
  	@testsuite.update testsuit_params
  	
  	redirect_to testsuites_path
  end
  # def create
  # 	debugger
  #   @testsuite = Testsuite.new(testsuit_params)
  #   # @test_suit.user = current_user
  #   if @testsuite.save

  #     flash[:success] = "Added TestSuit successful"
  #     redirect_to testsuites_path
  #   else
  #     flash[:danger] = "Some thing wrong!!!"
  #     render :new
  #   end
  # end
  private
  	def testsuit_params
    	params.require(:testsuite).permit(:name)
  	end	
end
