class Station
  attr_reader :trains, :name
  
  def initialize (name)
    @name = name
    @trains = []
  end

  def add_train (train)
  @trains << train
  puts "Прибыл поезд #{train}"
  end 

  def train_type (type)
    @trains.select { |train| train.type == type } #непонятно
  end

  def send (train)
    @trains.delete(train)
    puts "Отбыл поезд #{train}"

  end
  
  def train
    @trains.each { |name| print "#{name},"}
  end

end
