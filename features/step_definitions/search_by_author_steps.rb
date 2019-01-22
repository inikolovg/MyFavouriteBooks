Then(/^the author of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  Book.find_by_title(arg1).author == arg2
end