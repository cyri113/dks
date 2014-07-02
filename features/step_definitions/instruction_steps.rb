Given(/^the product has the following instructions:$/) do |table|
	table.hashes.each do |item|
		language = Language.create!(name: item[:language])
		published = item[:published]
		@product.instructions.create!(language: language, published: published)
	end
end