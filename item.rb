class Item
    attr_accessor :id, :name, :price, :uah_price, :car_mileage, :fuel, :location, :akp

    # Ініціалізація змінних
    def initialize(id = 0, name ='', price = '', uah_price = '', car_mileage='', fuel='', location='', akp='')
        @id = id
        @name = name
        @price = price
        @uah_price = uah_price
        @car_mileage = car_mileage
        @fuel = fuel
        @location = location
        @akp = akp
    end

    def to_s()
        "id=#@id, name=#@name, price=#@price, uah_price=#@uah_price, car_mileage=#@car_mileage, fuel=#@fuel, location=#@location, akp=#@akp"
    end

    def to_h()
        {'id' => @id, 'name'=> @name, 'price' => @price, 'uah_price' => @uah_price, 'car_mileage' => @car_mileage, 'fuel' => @fuel, 'location' => @location, 'akp' => @akp}
    end

end