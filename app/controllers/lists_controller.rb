class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path, notice: 'List was successfully created'
    else
      render :new
    end
  end

  def show
    @step = @list.steps.build
  end

  def edit
  end

  def update
    if @list.update_attributes(list_params)
      redirect_to list_url(@list), notice: 'List was successfully updated'
    else
      rener :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List was destroyed'
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
