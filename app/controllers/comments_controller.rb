class CommentsController < ApplicationController
    before_action :find_post
    skip_before_action :authenticate_user!, only: :index

    def index
        @@count = params[:count].to_i
        render json: { html: render_to_string(partial: @post.comments.order('id DESC').limit(4 + @@count).drop(2 + @@count)) }
        #render json: { html: params[:count] }
    end

    def show
    end

    def create
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user

        respond_to do |format|
            if @comment.save
                format.html { redirect_to request.referrer, notice: "Comment was successfully created." }
                #format.json { render :show, status: :created, location: post_path(@post) }
            else
                format.html { redirect_to request.referrer, status: :unprocessable_entity }
                #format.html { render :new, status: :unprocessable_entity }
                #format.json { render json: @comment.errors, status: :unprocessable_entity }
            end
        end
    end
  
    def destroy
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)

        #respond_to do |format|
        #    format.html { redirect_to post_path(@post), notice: "Comment was successfully destroyed." }
        #    format.json { head :no_content }
        #end
    end

    private

    def find_post
        @post = Post.find(params[:post_id])
    end

    def comment_params
        params.require(:comment).permit(:content)
    end

end
