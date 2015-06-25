class PostsController < ApplicationController
	# BONUS! Learn how to use a before_action to keep your controller DRY

	def index
		# create an instance variable that points to all of our posts
		# there are already some seeded posts, get them to show up in your app
		@posts = Post.all
	end

	def new
		@post = Post.new
		# instantiate an empty (new) Post
	end

	#Create doesn't need a view because it renders "new"
	def create
		# create a Post and save it into the database
		@post = Post.new(post_params)
		# redirect to the new Post
		if @post.save
			redirect_to @post
		else
			render "new"
		end
	end

	def show
		# assign an instance variable to the post with id from params
		@post = Post.find(params[:id])
	end

	def edit
		# assign an instance variable to the post with id from params
		@post = Post.find(params[:id])
	end

	#Update doesn't need a view because it renders "new"
	def update
		# update the instance variable from our edit page
		# redirect to the updated post
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render "edit"
		end
	end

	#destroy doesnt need a view because it redirects to index
	def destroy
		# assign an instance variable to the post with id from params
		# destroy the post
		# redirect to index
		post = Post.find(params[:id])
		post.destroy

		redirect_to posts_path
	end

private
	def post_params
		# fill in with strong parameters
		params.require(:post).permit(:bru_name, :title, :body)
	end
end
