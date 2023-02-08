Rails.application.routes.draw do
  get "/article", to: "article#readAll"
  get "/article/page/:pageNo", to: "article#readPage"
  get "/article/title/:title", to: "article#readByTitle"
  get "/article/author/:author", to: "article#readByAuthor"
  get "/article/category/:category", to: "article#readByCategory"
  get "/article/range", to: "article#readByRange"
  put "/article/update/:id", to: "article#updateById"
  put "/article/partialupdate/:id", to: "article#partialUpdate"
  put "/article/updatebytitle/:title", to: "article#updateByTitle"
  post "/article/post", to: "article#create"
  delete "/article/delete/:category", to: "article#delete"
  delete "/article/delete_all", to: "article#deleteAll"
end
