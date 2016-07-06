class CommentsController < ApplicationController
  def create
    @editor = Editor.find(params[:editor_id])
    @comment = @editor.comments.create(params[:comment].permit(:name, :body))

    redirect_to editor_path(@editor)
  end

  def destroy
    @editor = Editor.find(params[:editor_id])
    @comment = @editor.comments.find(params[:id])
    @comment.destroy

    redirect_to editor_path(@editor)
  end
end