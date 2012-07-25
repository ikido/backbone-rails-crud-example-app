# encoding: utf-8

Допустим /^в базе есть компании:$/ do |table|
  table.hashes.each do |t|
    FactoryGirl.create(
      :company,
      name: t["название"],
      phone: t["телефон"],
      address: t["адрес"]
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