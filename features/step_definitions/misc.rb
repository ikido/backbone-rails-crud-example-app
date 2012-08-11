# encoding: utf-8

Допустим /^в базе есть компании:$/ do |table|
  table.hashes.each do |t|
    FactoryGirl.create(
      :company,
      :name => t["название"],
      :phone => t["телефон"],
      :address => t["адрес"]
    )
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

Если /^я нажимаю на ссылку "(.*?)" после текста "(.*?)"$/ do |link_text, text|
  page.click_link link_text
end

То /^я вижу текст "(.*?)"$/ do |text|
  page.should have_content text
end

То /^я вижу следующие поля:$/ do |table|
  table.raw.flatten.each do |field_name|
    page.should have_field field_name
  end
end

То /^я вижу следующие поля и значения:$/ do |table|
  table.hashes.each do |t|
    page.should have_field(t["Поле"], :with => t["Значение"])
  end
end

То /^я вижу ссылку "(.*?)"$/ do |button_text|
  page.should have_link button_text
end

Если /^я заполняю следующие поля:$/ do |table|
  table.hashes.each do |t|
    page.fill_in t["Поле"], with: t["Значение"]
  end
end

То /^я вижу компанию "(.*?)" в списке$/ do |company_name|
  page.should have_content company_name
end

Если /^я заполняю поле "(.*?)" как "(.*?)"$/ do |field_name, field_value|
  page.fill_in field_name, with: field_value
end

То /^я не вижу текст "(.*?)"$/ do |text|
  page.should_not have_content text
end