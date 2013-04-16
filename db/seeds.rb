#encoding=utf-8

Category.delete_all
Page.delete_all
PagePart.delete_all

home = Page.create!(title: 'Accueil', home: true)

def create_category(fr, en)
  I18n.locale = :fr
  category = Category.create!(title: fr)
  I18n.locale = :en
  category.update_attribute('title', en)
  category
end

def create_page(category, fr, en)
  I18n.locale = :fr
  page = category.pages.create!(title: fr)
  I18n.locale = :en
  page.update_attribute('title', en)
end

category = create_category('Ruby', 'Ruby')
create_page(category, 'Qu\'est ce que Ruby?', 'What is Ruby?')
create_page(category, 'Pourquoi Ruby?', 'Why Ruby?')
create_page(category, 'Où apprendre?', 'Where to learn?')
create_page(category, 'Où trouver la communauté?', 'Where to find the community?')

category = create_category('Rails', 'Rails')
create_page(category, 'Qu\'est ce que Ruby on Rails?', 'What is Ruby on Rails?')
create_page(category, 'Pourquoi Ruby on Rails?', 'Why Ruby on Rails?')

category = create_category('Autres frameworks', 'Other frameworks')
create_page(category, 'Sinatra', 'Sinatra')
create_page(category, 'Padrino', 'Padrino')

category = create_category('Autre', 'Other')
create_page(category, 'Applications Mobile', 'Mobile Applications')
create_page(category, 'Applications de Bureau', 'Desktop Applications')

Page.all.each do |page|
  I18n.locale = :fr
  part = page.parts.create!(title: 'body', body: 'test')
  I18n.locale = :en
  part.update_attribute('body', 'test')
end
