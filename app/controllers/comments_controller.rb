class CommentsController < ApplicationController
  before_action :set_post_id, only: [:show, :edit, :update, :destroy, :new, :create]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show]
  respond_to :json
  # GET /comments
  def index
    render_404
    # @comments = Comment.all
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = @post.comments.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = @post.comments.new(comment_params)
    if current_user.present?
      @comment.user_id = current_user.id 
      if @comment.save
        redirect_to @post, notice: 'Comment was successfully created.'
      else
        redirect_to @post, notice: 'Comment cannot be blank '
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    redirect_to @post, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_post_id
      @post = Post.find(params[:post_id])
    end
    
    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
