require_dependency 'resthook/application_controller'

module Resthook
  class HooksController < ApplicationController
    before_action :set_hook, only: [:show, :edit, :update, :destroy]

    # GET /hooks
    def index
      @hooks = Hook.all
    end

    # GET /hooks/1
    def show
    end

    # GET /hooks/new
    def new
      @hook = Hook.new
    end

    # GET /hooks/1/edit
    def edit
    end

    # POST /hooks
    def create
      @hook = Hook.new(hook_params)

      if @hook.save
        redirect_to @hook, notice: 'Hook was successfully created.'
      else
        render text: @hook.errors.full_messages, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /hooks/1
    def update
      if @hook.update(hook_params)
        redirect_to @hook, notice: 'Hook was successfully updated.'
      else
        render text: @hook.errors.full_messages, status: :unprocessable_entity
      end
    end

    # DELETE /hooks/1
    def destroy
      @hook.destroy
      redirect_to hooks_url, notice: 'Hook was successfully destroyed.'
    end

    private

    def set_hook
      @hook = Hook.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def hook_params
      params.require(:hook).permit(:subscribed_resource, :event, :url, :token)
    end
  end
end
