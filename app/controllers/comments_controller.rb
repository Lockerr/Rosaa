class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.json
  before_filter :authenticate_user!, :only => [:create, :update, :delete]
  #TODO: Comments like in habrahabr

  #TODO: Three steps registrations
  #TODO: 1. email, pass, pass
  #TODO: 2. fake form like in alpha

  def index
    @commentable = find_commentable
    @comments = @commentable.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @commentable =  find_commentable
    @comment = Comment.new
    @comments = @commentable.comments

    respond_to do |format|
      format.html # new.html.erb
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
    @commentable =  find_commentable
    @comment = @commentable.comments.build params[:comment]
    @comment.user_id = current_user.id if current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to :id => nil, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
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
  nil
end
