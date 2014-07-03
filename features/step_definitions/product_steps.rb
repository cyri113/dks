Given(/^I have a product named "(.*?)" with the code "(.*?)"$/) do |arg1, arg2|
  @product = Product.create!(name: arg1, code: arg2)
end

Given(/^there are no products$/) do
  Product.delete_all
end

When(/^I go to the homepage for code "(.*?)"$/) do |arg1|
  visit "/#{arg1}"
end

When(/^I update the product:$/) do |table|
  table.hashes.each do |item|
  	@product.update(item)
  end
end

When(/^I search for "(.*?)"$/) do |arg1|
 	fill_in "q", with: arg1
end