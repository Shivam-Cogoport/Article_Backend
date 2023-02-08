class ArticleController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        a = Article.create(title: params[:title], author: params[:author], body: params[:body], category: params[:category], date: params[:date])
        render json: a
    end

    def readAll 
        articles = Article.all
        render json: articles
    end

    def readPage 
        pages = (params[:pageNo]).to_i
        pages = pages - 1;
        lim = 2
        a = 0
        for i in 1..pages
            a += lim
        end
        a = Article.offset(a).limit(lim)
        render json: a 
    end

    def readByTitle
        a = Article.where("title LIKE ?", "%#{params[:title]}%")
        render json: a
    end
    
    def readByAuthor
        a = Article.where(author: params[:author])
        render json: a
    end

    def readByCategory
        a = Article.where(category: params[:category])
        render json: a
    end

    def readByRange
        a = Article.where(date: (params[:start]..params[:end]))
        render json: a
    end


    def updateById
        a = Article.update(params[:id], title: params[:title], author: params[:author], body: params[:body], category: params[:category], date: params[:date])
        render json: a
    end

    def updateByTitle
        a = Article.where(title: params[:title]).update(title: params[:title], author: params[:author], body: params[:body], category: params[:category], date: params[:date])
        render json: a
    end

    def partialUpdate
        a = Article.find(params[:id])
        a.title = params[:title] || a.title
        a.author = params[:author] || a.author
        a.body = params[:body] || a.body
        a.category = params[:category] || a.category
        a.date = params[:date] || a.date
        a.save
        render json: a
    end


    def delete
        a = Article.where(category: params[:category]).destroy_all
        render json: a
    end

    def deleteAll
        a = Article.destroy_all
    end
    
end
