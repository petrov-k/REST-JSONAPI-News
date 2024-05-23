Given("there is a user with email {string}") do |email|
  User.create!(email: email)
end

When("I send a GET request to {string}") do |path|
  page.driver.browser.get(path)
end

Then("the response should be {int}") do |status|
  expect(page.status_code).to eq(status)
end

Then("the response should include the user's email") do
  json = JSON.parse(page.body)
  expect(json['data']['attributes']['email']).to eq("test@example.com")
end
