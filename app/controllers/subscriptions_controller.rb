class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:destroy]
  before_action :set_project

  def create
    @subscription = current_user.subscriptions.build(project_id: params[:project_id])

    respond_to do |format|
      if @subscription.save
        Notifier.subscription_confirmation.deliver
        format.html { redirect_to project_path(@project.id), notice: 'You are now subscribed to this project.' }
      else
        format.html { redirect_to project_path(@project.id), alert: 'Your subscription could not be processed.' }
      end
    end
  end

  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to project_path(@project.id), notice: 'You are now unsubscribed from this project.' }
      format.json { head :no_content }
    end
  end

  private

    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end
end