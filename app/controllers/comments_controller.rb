class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
#  after_action :create, [:push_create]
#  after_action :update, [:push_update]
 
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all.last(5)
 
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.length = 100
 
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.create!(comment_params)
    @comment.length = 100
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comments_url }
        format.json { render action: 'show', status: :created, location: @comment }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes!(params[:comment])
    respond_to do |format|
        format.html { redirect_to comments_url }
        format.js
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:text, :length, :email)
    end
    
#    def push_create
#      push_event('create')
#    end

#    def push_update
#      push_event(event_type)

#       Pusher['test_channel'].trigger(event_type, {
#          message: 'hello world'
#        })
#    end
end
