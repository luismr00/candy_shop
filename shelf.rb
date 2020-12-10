require_relative 'shop'

class Shelf < Shop

    attr_accessor :candy

    def initialize()
        #might have to delete
    end

    def stockedCandy

        count = 0

        @@shelves.each do |item|
            item.each do |key, value|
                count += value
            end
        end

        return count
    end

    def openShelfSpace

        #max space per shelf is 25 items at a time
        shelfCount = shelfQty
        stockCount = stockedCandy
        return (25 * shelfCount) - stockCount

    end


    def shelvedInventory

        count = shelfQty

        if count == 0
            puts "There are no shelfs available to check the inventory"
            sleep(3)
        else
            puts "which shelf do you wish to check: \n\n"
            
            chocolate = 0
            sour = 0
            sweet = 0

            for i in 1..count
                puts "#{i}. Shelf #{i}"
            end

            input = gets.to_i

            system "clear"
            puts "Shelf #{input} contains the following candy: \n\n"

            @@shelves[input - 1].each do |key, value|

                if (key == "hersheys" || key == "snickers")
                    chocolate += value
                elsif (key == "skittles" || key == "gummybears")
                    sweet += value
                elsif (key == "nerds" || key == "sourpatch")
                    sour += value
                end
            end

        
            puts "Chocolate Candy: #{chocolate}"
            puts "Sweet Candy: #{sweet}"
            puts "Sour Candy: #{sour}"
            sleep(3)
            system "clear"
        end

    end

    def displayShelfOptions
        puts "\t 1. Check shelf inventory"
        puts "\t 2. Add shelf"
        puts "\t 3. Remove shelf"
        puts "\t 4. Manage candy"
        puts "\t 5. Back to the previous menu"
        puts "\t 6. Exit Program"
    end

    def selectShelfOptions

        input = gets.to_i

        if input == 1
            system "clear"
            shelvedInventory

        elsif input == 2
            system "clear"
            requestAddShelf
            return 0
        elsif input == 3
            system "clear"
            requestDeleteShelf
            return 0
        elsif input == 4
            return 4
        elsif input == 5
            return -1
        elsif input == 6
            return 6
        end
    end
        
end

