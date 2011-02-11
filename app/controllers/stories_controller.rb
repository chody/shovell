class StoriesController < ApplicationController
	
  def index
	@story = Story.find(:first, :order => 'RANDOM()')
  @time =  Time.now  
  end
  def new 
    @story = Story.new
  end
end
