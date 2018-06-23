class HomeController < ApplicationController
  def index
    if(params[:tag].nil?)
      @puyo_figs=PuyoFig.all
    elsif
      @puyo_figs=PuyoFig.tagged_with(params[:tag])
    end

  end

  def create
    @puyo_fig = PuyoFig.new
    @puyo_fig.name = params[:name]
    @puyo_fig.iframe = params[:iframe].slice(0..48)+"view.html"+params[:iframe].slice(49..-1)

    if(params[:author].empty?) then
      @puyo_fig.tag_list.add("anonymous")
    elsif
      @puyo_fig.tag_list.add(params[:author])
    end
    @puyo_fig.tag_list.add(params[:Tags].split(" "))
    @puyo_fig.tag_list.add(params[:name])
    @puyo_fig.tag_list.add("all")

    @puyo_fig.description = params[:description]

    @puyo_fig.save
    redirect_to(root_path)

  end

  def destroy
    PuyoFig.find(params[:id]).destroy
    flash[:success] = "PuyoFig deleted"
    redirect_to(root_path)

  end


end
