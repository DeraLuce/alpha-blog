class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		puts "Hello"
		@article = Article.new 
	end

	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was successfully created"
			redirect_to article_path(@article)
		else
			render :new
	end
end

def show
	@article = Article.find(params[:id])
end

def destroy
	@article = Article.find(params[:id])
	@article.destroy
	flash[:notice] = "Article was successfully deleted"
	redirect_to articles_path
end

def edit
	@article = Article.find(params[:id])
end

#def update defines what to do with a request to update an article 
def update 
	@article = Article.find(params[:id])
#@article.update updates the model
	if @article.update(article_params) 

		flash[:notice] = "Article was successfully updated"
		redirect_to article_path(@article)
	else
		render 'edit'
	end
end


	private
		def article_params
			params.require(:article).permit(:title, :description)
		end

end