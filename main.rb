require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagon'

MENU = [
{index: 1, title: "Создать новую стануию", action: :new_station },
{index: 2, title: "Создать новый поезд", action: :new_train },
{index: 3, title: "Задать маршрут", action: :new_route },
{index: 4, title: "Задать маршрут поезду", action: :set_route_train },
{index: 5, title: "Добавить вагон", action: :add_wagon_train },
{index: 6, title: "Удалить вагон", action: :del_wagon },
{index: 7, title: "Менять станцию", action: :change_station },
{index: 8, title: "Показать станции", action: :trains_list },
{index: 9, title: "Поазать поезда на станции", action: :stations_list}
].freeze

def new_station
  puts "Введите новую станцию:"
  station_name = gets.chomp

  puts "Введите название нового класса:"
  class_station_name = gets.chomp

  class_station_name = Station.new(station_name)
  puts class_station_name
end

def new_train
  puts "Введите назване поезда:"
  train_name = gets.chomp.to_sym

  puts "Введите название нового класса:"
  class_train_name = gets.chomp

  puts "Введите тип поезда:"
  type_train = gets.chomp.to_sym
  
  if type_train == :passenger 
    class_train_name = PassengerTrain.new(train_name)

  elsif type_train == :cargo 
    class_train_name = CargoTrain.new(train_name)

  else puts "Ошибка"
  end
end

def new_route
  puts "Введите маршрут:"
  route_name = gets.chomp.to_sym

  puts "Введите название нового класса:"
  class_route_name = gets.chomp

  class_route_name = Route.new(route_name)
  puts route_name

  puts "Добавить станцию"
  add_station = gets.chomp
  class_route_name.stations << add_station

  puts "Удалить станцию"
  del_station = gets.chomp
  class_route_name.stations.delete(del_station)

  puts class_station_name.stations

end

def set_route_train
  puts "Введите название класса маршрута:"
  name_class_route = gets.chomp

  puts "Введите название класса поезда"
  name_class_train = gets.chomp
  name_class_train.set_route(name_class_train)
end
 
def add_wagon_train
  puts "Введите тип вагона:"
  wagon_type = gets.chomp.to_sym
  puts "Введите тип поезда:"
  train_type = gets.chomp.to_sym
  train_type.add_wagon(wagon_type)
end

def del_wagon
  puts "Введите тип вагона для удаления:"
  wagon_type = gets.chomp.to_sym
  puts "Введите тип поезда:"
  train_type = gets.chomp.to_sym
  train_type.del_wagon(wagon_type)
end

def change_station
  puts "Введите 'next' для перехода на следующую станцию".
  puts "Введите 'back' для перехода на предыдущию станцию."
  user_choose = gets.chomp.to_sym
  if user_choose == :next
    puts "Введите тип поезда:"
    train_type = gets.chomp.to_sym
    train_type.mave_forward

  elsif user_choose == :back
    puts "Введите тип поезда:"
    train_type = gets.chomp.to_sym
    train_type.move_back

  else puts "Ошибка"
  end
end

def trains_list
  @trains.each { |train| print "#{train} ," }
end

def stations_list
  @stations.each { |station| print "#{station} ," }
end
