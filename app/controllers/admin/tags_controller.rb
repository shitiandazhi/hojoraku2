class Admin::TagsController < ApplicationController
before_action :authenticate_admin!
before_action :load_tags, only: [:index, :create, :update]
  def index
    @tags = Tag.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
       @tags = Tag.all
       render :index
    else
       @tags = Tag.all
        redirect_to admin_tags_path, alert: "登録に失敗しました。"
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to admin_tags_path, notice: "削除しました。"
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def load_tags
    @tags = Tag.all
  end

end