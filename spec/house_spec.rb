require './lib/room'
require './lib/house'

RSpec.describe House do

  describe "Iteration 2" do

    it "exists" do
      house = House.new("$400000", "123 sugar lane")

      expect(house).to be_instance_of(House)
    end

    it 'returns price' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.price).to eq(400000)
    end

    it 'returns address' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.address).to eq("123 sugar lane")
    end

    it 'initializes with no rooms' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.rooms).to eq([])
    end

    it 'can add rooms' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')

      house.add_room(room_1)
      house.add_room(room_2)

      expect(house.rooms).to eq([room_1,room_2])
    end

    it 'returns false if below market average' do
      house = House.new("$400000", "123 sugar lane")

      expect(house.above_market_average?).to be false
    end

    it 'returns true if above market average' do
      house = House.new("$600000", "123 sugar lane")

      expect(house.above_market_average?).to be true
    end

    it 'returns rooms from category' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.rooms_from_category(:bedroom)).to eq([room_1,room_2])
      expect(house.rooms_from_category(:basement)).to eq([room_4])
    end

    it 'returns total area' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.area).to eq(1900)
    end

    it 'returns house details as hash' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_1)
      house.add_room(room_2)
      house.add_room(room_3)
      house.add_room(room_4)

      expect(house.details).to eq({"price" => 400000, "address" => "123 sugar lane"})
    end

    it 'returns price per square foot' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_4)
      house.add_room(room_1)
      house.add_room(room_3)
      house.add_room(room_2)

      expect(house.price_per_square_foot).to eq(210.53)
    end

    it 'returns rooms sorted by area' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_4)
      house.add_room(room_1)
      house.add_room(room_3)
      house.add_room(room_2)

      expect(house.rooms_sorted_by_area).to eq([room_4,room_3,room_2,room_1])
    end

    it 'returns hash of rooms by category' do
      house = House.new("$400000", "123 sugar lane")
      room_1 = Room.new(:bedroom, 10, '13')
      room_2 = Room.new(:bedroom, 11, '15')
      room_3 = Room.new(:living_room, 25, '15')
      room_4 = Room.new(:basement, 30, '41')

      house.add_room(room_4)
      house.add_room(room_1)
      house.add_room(room_3)
      house.add_room(room_2)

      expect(house.rooms_by_category).to eq({
        :bedroom => [room_1,room_2],
        :living_room => [room_3],
        :basement => [room_4]})
    end

  end

end
