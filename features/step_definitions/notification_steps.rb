Given(/^the product has the following notifications:$/) do |table|
	table.hashes.each do |item|
		@product.notifications.create!(item)
	end
end

Given(/^the instructions have the following notifications:$/) do |table|
  table.hashes.each do |item|
  	language = Language.where(name: item[:language]).first
  	instruction = @product.instructions.where(language: language).first
  	instruction.notifications.create!(content: item[:content], published: item[:published], category: item[:category], expiry: item[:expiry])
	end
end

Then(/^I should have the following buttons:$/) do |table|
  table.hashes.each do |item|
  	btn_class = '"btn btn-'+item[:category]+' btn-xs has-tooltip"'
  	btn_title = '"'+item[:content]+'"'
  	page.should have_xpath("//button[@class="+btn_class+" and @title="+btn_title+"]")
	end
end

Then(/^I should not have the following buttons:$/) do |table|
  table.hashes.each do |item|
  	btn_class = '"btn btn-'+item[:category]+' btn-xs has-tooltip"'
  	btn_title = '"'+item[:content]+'"'
  	page.should_not have_xpath("//button[@class="+btn_class+" and @title="+btn_title+"]")
	end
end

Then(/^I should see the following product notifications:$/) do |table|
  table.hashes.each do |item|
  	_class = '"alert alert-dismissable alert-'+item[:category]+'"'
  	_content = '"'+item[:title]+' '+item[:content]+'"'
  	page.should have_xpath("//div[@class="+_class+" and contains(.,"+_content+")]")
	end
end

Then(/^I should not see the following product notfications:$/) do |table|
  table.hashes.each do |item|
  	_class = '"alert alert-dismissable alert-'+item[:category]+'"'
  	_content = '"'+item[:title]+' '+item[:content]+'"'
  	page.should_not have_xpath("//div[@class="+_class+" and contains(.,"+_content+")]")
	end
end

Then(/^I should see a table with the following:$/) do |table|
	rows = find('#notification-table').all('tr')
	actual = rows.map { |r| r.all('th,td').map { |c| c.text } }
	table.diff! actual
end