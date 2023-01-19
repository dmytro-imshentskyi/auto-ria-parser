require './parser.rb'
require './cart.rb'

# Посилання длля парсингу
parser = Parser.new('https://auto.ria.com/uk/search/?categories.main.id=1&indexName=auto,order_auto,newauto_search&brand.id[0]=48&model.id[0]=428&year[0].gte=2000&year[0].lte=2010&size=20')

# Стврення обʼєкту де будуть зберігатись всі дані
cart = Cart.new()

parser.parse() # Функції для початку парсингу
cart.parsed_data_to_csv() # Збереження в CSV
cart.parsed_data_to_json() # Збереження в JSON