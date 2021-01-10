# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: :destroy
  before_action :contribute_user?, only: :destroy

  # POST /commentable/1/comments
  def create
    permit_params = comment_params
    permit_params['user_id'] = current_user.id
    @comment = @commentable.comments.build(permit_params)

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  # DELETE /commentable/1/comments/1
  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:commentable_id, :commentable_type, :body)
  end

  def contribute_user?
    return if current_user == @comment.user

    redirect_to @commentable, notice: t('controllers.common.notice_denyed')
  end
end
