class DogsController < ApplicationController
before_action :get_dog, only: [:show]


  def index
    @dogs = Dog.all
  end

  def show
  end

  private

  def get_dog
    @dog = Dog.find(params[:id])
  end

end
