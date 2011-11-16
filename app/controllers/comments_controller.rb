class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  before_filter :check_for_auth, :only => [:create, :update, :delete]
  #TODO: Comments like in habrahabr

  #TODO: Three steps registrations
  #TODO: 2. fake form like in alpha

  def index
    @commentable = find_commentable
    @comments    = @commentable.comments.includes(:user).paginate(:page => params[:page]).order('id desc')
    @idea        = Idea.new

    respond_to do |format|
      format.js
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
      format.js { render find_commentable }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @commentable = find_commentable
    @comment     = Comment.new
    @comments    = @commentable.comments

    respond_to do |format|
      format.html redirect_to @commentable
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @commentable = find_commentable
    @comment     = @commentable.comments.build params[:comment]
    @comment.user_id = current_user.id



    respond_to do |format|
      if @comment.save
        @comments = @commentable.comments.includes(:user).paginate(:page => params[:page]).order('id desc')
        format.html { redirect_to idea_comments_path(@commentable) }
        format.js
      end
    end

  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :ok }
    end
  end

  def vote
    current_user.likes Comment.find_by_id(params[:id])
    redirect_to ideas_path
  end

  def devote
    current_user.dislikes Comment.find_by_id(params[:id])
    redirect_to ideas_path
  end


  private

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end

  protected

  def check_for_auth
    if current_user
      true
    else
      respond_to do |format|
        format.js { render 'ideas/register'}
      end
    end
  end

  nil
end
