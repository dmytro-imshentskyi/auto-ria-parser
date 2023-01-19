require "./item.rb"

class Cars
    @@car = []

    # Функція для внесення даних в обʼєкт класу
    def self.setter(item)
        @@car.push(item)
    end

    # Функція для тримання даних з обʼєкту класу
    def self.getter()
        @@car
    end
end