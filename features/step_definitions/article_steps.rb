Given("I have article_params") do
  @article = { title: 'My Article', content: 'My article content.' }
end

When("I create the article") do
  @created_article = Article.create(@article)
end

Then("the article should be saved in the database") do
  expect(Article.find_by(title: @article[:title])).to eq(@created_article)
end
