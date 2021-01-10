# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    current_user.follow(@user)
    flash[:notice] = t('controllers.follow.success')
    redirect_to @user
  end

  def destroy
    current_user.unfollow(@user)
    flash[:notice] = t('controllers.unfollow.success')
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:follower_id])
  end
end
