class CuriositiesController < ApplicationController
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]
  include CuriositiesHelper

  def index
    @curiosities = Curiosity.all
  end

  def show
    @curiosity = Curiosity.find(params[:id])

    @comment = Comment.new
    @comment.curiosity_id = @curiosity.id
  end

  def new
    @curiosity = Curiosity.new
  end

  def create
    @curiosity = Curiosity.new(curiosity_params)
    @curiosity.save

    flash.notice = "Curiosity '#{@curiosity.title}' Created!"

    redirect_to curiosity_path(@curiosity)
  end

  def destroy
    @curiosity = Curiosity.find(params[:id])
    @curiosity.destroy

    flash.notice = "Curiosity '#{@curiosity.title}' Deleted!"

    redirect_to curiosities_path
  end

  def edit
    @curiosity = Curiosity.find(params[:id])
  end

  def update
    @curiosity = Curiosity.find(params[:id])
    @curiosity.update(curiosity_params)

    flash.notice = "Curiosity '#{@curiosity.title}' Updated!"

    redirect_to curiosity_path(@curiosity)
  end
end
