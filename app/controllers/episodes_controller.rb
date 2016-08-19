class EpisodesController < ApplicationController
  before_action :find_podcast
  before_action :find_episode, only: [:show]

  def new
    @episode = @podcast.episodes.new
  end

  def create
    @episode = @podcast.episodes.new episode_params

    if @episode.save
      redirect_to podcast_episode_path(@podcast, @episode), notice: "Episode successfully saved."
    else
      render 'new', notice: "Failed to save new episode."
    end
  end

  def show
    #@episodes = @podcast.episodes.order("created_at DESC")
    @episodes = Episode.where(podcast_id: @podcast).order("created_at DESC").reject { |e| e.id == @episode.id }
  end

  private
  def find_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.require(:episode).permit(:title,:description)
  end
end
