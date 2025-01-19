class PrototypesController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user) # コメントとそのユーザーを事前に読み込む
    @comment.save
  end

  def new
    @prototype = Prototype.new
  end

  def create
      # 新しい Prototype オブジェクトを作成し、フォームデータを渡す
      @prototype = Prototype.new(prototype_params)
      
      # 保存に成功した場合
      if @prototype.save
        # 成功したらホームページにリダイレクト
        redirect_to root_path, notice: '新規登録が完了しました。'
      else
        # 保存に失敗した場合、新規作成フォームを再表示
        render :new
      end
  end
  

  def edit
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to root_path, notice: 'プロトタイプが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'プロトタイプが削除されました。'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def check_owner
    unless @prototype.user == current_user
      redirect_to root_path, alert: '他のユーザーのプロトタイプを編集することはできません。'
    end
  end

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end


