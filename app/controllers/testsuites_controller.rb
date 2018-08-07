class TestsuitesController < ApplicationController
	before_action :read_testsuites

  def index
	end

	def new
		@testsuites = Testsuite.new
		# debugger
	end

	def create
		# if params[:testsuites][:name].present?
			create_test = {}

	 	 	create_test["id"] = (@big_id + 1).to_s
	 		create_test["name"] = params[:testsuite][:name]

	 		@testsuites << create_test
	 		write_xml

	 		# debugger
	 		# debugger
	 	  redirect_to testsuites_path
      # flash[:success] = " Added Successfully!!"
    # else
    # 	flash[:danger] = "failure"
    		
	end


 # puts action.xpath("//TestCase//Actions//Action//Name")
	#  #   objaction = {}
	#  #   objaction["name"] = action.at_xpath("Name").content
	#  #   actions << objaction
	#  # end

	# actions.each do |action|
	#   puts action["name"]
	# end

	# # puts "this is action"
	# # puts actions
	# # person = doc.at_xpath('//person')

	# # puts "Person name: " + person.at_xpath('//name')


 #  	#@tests = Testsuite.all 

#  	xml = Nokogiri::XML::Builder.new { |xml|
#  		xml.body do
#  			xml.node1 "message"
#  			xml.node2 "message"
#  			xml.node3 do
#  				xml.node3_1 "email"
#  			end
#  	end
# }.to_xml

# puts xml
  end

  def read_testsuites
  	@big_id = 1

  	doc = File.open("lib/xml/testsuites.xml") { |f| Nokogiri::XML(f)}
	 	@testsuites = []
	 	doc.xpath('//action').each do |action|
	 	object = {}
	 	@big_id = @big_id > object["id"].to_i ? @big_id : object["id"].to_i
	 	object["id"] = action.at_xpath("id").text
	 	object["name"] = action.at_xpath("name").text
	 	@testsuites << object
  end

  def destroy
    @user = User.find(params[:id])
  end
   def write_xml 
    builder = Nokogiri::XML::Builder.new(encoding: "UTF-8") do |xml|
      xml.testsuites{
        @testsuites.each do |ts|
          xml.action{
            xml.id ts["id"]
            xml.name ts["name"]
          }
        end
      }
    end
    File.open("lib/xml/testsuites.xml", "w+") do |file|
      file << builder.to_xml
    end
  end
end