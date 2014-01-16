class GoalsController < ApplicationController
  def index
    @goals = Goal.all.map(&Form::ViewGoal.wrap)
  end

  def new
    @goal = Form::NewGoal.new
  end

  def create
    @goal = Form::NewGoal.new(params.require(:goal))

    if @goal.save
      redirect_to goals_path
    else
      render action: 'new'
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy

    redirect_to action: 'index'
  end
end
