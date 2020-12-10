# require_relative 'shelf'

class Shop

    attr_reader :shopName
    attr_accessor :shelves

    def initialize(shopName,shelves)
        @shopName = shopName
        @@shelves = shelves
        #@shelfQty = shelfQty
    end

    def shelfQty
        #puts "="

        count = 0
        @@shelves.each do |item|
            count += 1
        end

        return count
    end

    def requestAddShelf
        # @@shelves += 1
        addShelf = Hash.new
        addShelf = {"hersheys"=>0, "snickers"=>0, "skittles"=>0, "gummybears"=>0, "nerds"=>0, "sourpatch"=>0}
        @@shelves.push(addShelf)
    end

    def requestDeleteShelf
        # @@shelves -= 1
        
        count = shelfQty

        if count == 0
            puts "The are already no shelves available"
        else
            @@shelves.pop()
        end
    end

    def selectShop
        puts "\t 1. 50 Cent's Candy Shop"
        puts "\t 2. Willy Wonkas Candy Shop"
        puts "\t 3. Exit Program"
    end

    def displayShopOptions
        puts "\t 1. Check shelf quantity"
        puts "\t 2. Manage shelves"
        puts "\t 3. Back to the previous menu"
        puts "\t 4. Exit Program"
    end

    def selectShopOptions

        input = gets.to_i

        if input == 1

            count = shelfQty

            system "clear"
            puts "The amount of shelfs in the store are: #{count}"
            sleep(3)
            system "clear"
            return 0
        elsif input == 2
            return 2
        elsif input == 3
            return -1 
        elsif input == 4
            return 4
        end
    end


end
