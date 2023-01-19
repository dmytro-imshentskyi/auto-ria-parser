require 'open-uri'
require 'byebug'
require 'nokogiri'
require './car.rb'
require './item.rb'

class Parser

    # Ініціалізація змінної
    def initialize(url)
        @url = url
    end

    # Парсер
    def parse()
        begin
            html = URI.open(@url) { |result| result.read} # Відкриття файлу за посиланням
            doc = Nokogiri::HTML(html)
            i = 0
            doc.css('.content-bar').each do |element| # Вибираємо зручний для нас елемент який ми будемо парсити та запускаємо цикл
                car = Item.new() # Створення обʼєкту класу
                # В циклі вибираємо потрібні нам елементи за допомогою CSS класів та HTML тегів
                car.name = element.css('a.address').children[1].text.strip 
                car.price = element.css('span.bold').children[1].text.strip + ' $'
                car.uah_price = element.css('span.i-block').children[1].text.strip + ' UAH'
                car.car_mileage = element.css('li.js-race').text.strip
                car.fuel = element.css('li.item-char').children[8].text.strip
                car.location = element.css('li.js-location').children[2].text.strip
                car.akp = element.css('li.item-char').children[10].text.strip
                car.id = i+1
                i= i+1
                Cars.setter(car) # Додаємо кожен елемент в екземпляр (обєʼєкт) класу
            end
        end
    end
end