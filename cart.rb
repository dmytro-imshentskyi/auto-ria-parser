require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require './car.rb'
require './item.rb'

class Cart

    # Функція для збереження масиву даних у CSV формат
    def parsed_data_to_csv()
        path_for_csv = './cars.csv' # Задаємо шлях та назву файлу в якому будемо зберігати дані
        car = Cars.getter() # Отримуєм дані
        begin  
            File.new(path_for_csv, "w") # Стврюємо файл для запису даних
            CSV.open(path_for_csv, "w", headers: ['Id', 'Name', 'Price', 'UAH-Price', 'Car-Mileage', 'Fuel', 'Location', 'Akp'], write_headers: true) do |csv| # Вибираємо файл для запису та вказуємо заголовки по яких буде формуватись файл
                # Цикл для запису даних
                car.each do |car|
                    csv << [car.id, car.name, car.price, car.uah_price, car.car_mileage, car.fuel, car.location, car.akp]
                end
            end
        end
    end

    # Функція для збереження масиву даних у JSON формат
    def parsed_data_to_json()
        path_for_json = './cars.json' # Задаєм шлях та назву файлу в якому будемо зберігати дані
        car = Cars.getter() # Отримуєм дані
        temp_hash = [] # Допоміжний масив, який буде використовуватись як хеш-масив
        begin 
            File.new(path_for_json, "w") # Створюємо файл для запису даних
            car.each do |car| # Цикл для запису даних
                    temp_hash.push({ # Безпосередньо в циклі задаємо структуру json-елемента
                        Id: car.id,
                        Name: car.name,
                        Price: car.price,
                        UAH_Price: car.uah_price,
                        Car_Mileage: car.car_mileage,
                        Fuel: car.fuel,
                        Location: car.location,
                        Akp: car.akp
                    })

                File.open(path_for_json, "w") do |json| # Відкриваємо файл та переносимо туди наш хеш-масив
                    json.write(JSON.pretty_generate(temp_hash))
                end
            end
        end
    end
end