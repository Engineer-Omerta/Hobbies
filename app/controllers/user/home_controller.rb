class User::HomeController < ApplicationController
  def top
  end

  def index
  	@user = current_user
  	@random = Hobby.order("RANDOM()").limit(5)
  end

  def hobby
  end

  def location
  end
end
