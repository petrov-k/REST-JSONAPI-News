
user = User.create!(email: 'example@mail.com', password: 'password', password_confirmation: 'password')

categories = 3.times.map { |i| Category.create(name: "Category #{i + 1}") }

articles = 10.times.map do |i|
  article = Article.create!(title: "Article #{i + 1}", content: "Article content #{i + 1}", user: user)
  article.categories << categories.sample(rand(1..3))
  article.save!
  article
end

articles.sample(3).each do |article|
  Comment.create!(content: "Comment for #{article.title}", user: user, article: article)
end
