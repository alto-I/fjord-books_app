# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = t('controllers.follow.success')
    else
      flash.now[:notice] = t('controllers.follow.false')
    end
    redirect_to @user
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = t('controllers.unfollow.success')
    else
      flash.now[:notice] = t('controllers.unfollow.false')
    end
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:follower_id])
  end
end
