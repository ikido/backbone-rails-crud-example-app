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

Если /^я захожу по адресу "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

То /^я вижу следующие компании:$/ do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end