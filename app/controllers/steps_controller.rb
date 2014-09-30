class StepsController < ApplicationController
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  def create
    @list = List.find(params[:list_id])
    @step = @list.steps.build(step_params)
    if @step.save
      redirect_to list_url(@list), notice: 'Step added'
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:list_id])
  end

  def update
    if @step.update_attributes(step_params)
      redirect_to list_path(@step.list), notice: 'Step updated'
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to list_path(@step.list), notice: 'Step removed'
  end

  private

  def step_params
    params.require(:step).permit(:description)
  end

  def set_step
    @step = Step.find(params[:id])
  end
end
