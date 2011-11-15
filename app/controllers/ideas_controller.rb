class IdeasController < ApplicationController

  before_filter :check_for_auth, :only => [:vote, :devote, :create, :update, :delete]

  # GET /ideas.json
  def index
    @ideas = Idea.includes(:user, :comments).paginate(:page => params[:page]).order('id desc')
    @idea = Idea.new

    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
    @idea = Idea.find(params[:id])
    @comments = @idea.comments.paginate(:page => params[:page]).order('id desc')




    respond_to do |format|
      format.html { render :layout => false }# show.html.erb
    end
  end

  # GET /ideas/new
  # GET /ideas/new.json
  def new
    @idea = Idea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @idea }
    end
  end

  # GET /ideas/1/edit
  def edit
    @idea = Idea.find(params[:id])
  end

  # POST /ideas
  # POST /ideas.json
  def create
    params[:idea][:user_id] = current_user.id if current_user
    @idea = Idea.create(params[:idea])
    @idea.save

    redirect_to root_path
  end

  # PUT /ideas/1
  # PUT /ideas/1.json
  def update
    @idea = Idea.find(params[:id])

    respond_to do |format|
      if @idea.update_attributes(params[:idea])
        format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def vote
    @idea = Idea.find_by_id(params[:id])
    current_user.likes @idea if current_user

    respond_to do |format|
      format.js { @idea }
    end
  end

  def devote
    @idea = Idea.find_by_id(params[:id])
    current_user.dislikes @idea if current_user
    respond_to do |format|
        format.js { @idea }
    end
  end

  def show_votes

  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    respond_to do |format|
      format.html { redirect_to ideas_url }
      format.json { head :ok }
    end
  end

  protected

  def check_for_auth
    if current_user
      true
    else
      respond_to do |format|
        format.js { render 'register'}
      end
    end
  end

end
