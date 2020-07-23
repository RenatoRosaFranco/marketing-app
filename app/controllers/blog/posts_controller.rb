# frozen_string_literal: true

module Blog
  class PostsController < ApplicationController
    before_action :set_post, only: [:show]
    
    def index
      @posts = Post.order(created_at: :desc)
    end

    def show
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end
  end
end
