Given /the following books exist/ do |books_table|
  books_table.hashes.each do |book|
	# each returned element will be a hash whose key is the table header.
	# we should arrange to add that book to the database here.
    Book.create book
  end
end

Then /(.*) seed books should exist/ do | n_seeds |
  expect(Book.count).to eq(n_seeds.to_i)
end

When /I (un)?check the following genres: (.*)/ do |uncheck, genre_list|
  # use String#split to split up the genre_list, then
  # iterate over the genres and reuse the "When I check..." or
  # "When I uncheck..." steps in lines 89-95 of web_steps.rb
  genre_list.split(',').each do |genre|
    field = "genres_#{genre.strip}"
    if uncheck
      uncheck field
    else
      check field
    end
  end
end

Then /I should see all the books/ do
  rows = page.all('#books tr').size - 1
  expect(rows).to eq(Book.count())
end