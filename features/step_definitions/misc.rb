# encoding: utf-8

Допустим /^в базе есть компании:$/ do |table|
  table.hashes.each do |t|
    FactoryGirl.create(
      :company,
      :name => t["название"],
      :phone => t["телефон"],
      :address => t["адрес"]
    )
    Rails.logger.info Company.all.inspect
  end
end

Если /^я захожу по адресу "(.*?)"$/ do |path|
  visit path
end

То /^я вижу следующие компании:$/ do |table|
  table.raw.flatten.each do |text|
    page.should have_content text
  end
end

Если /^я нажимаю на ссылку "(.*?)"$/ do |link_text|
  page.click_link link_text
end

То /^я вижу текст "(.*?)"$/ do |text|
  page.should have_content text
end

То /^я вижу следующие поля:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end

То /^я вижу кнопку "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end