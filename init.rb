require_relative 'shop'
require_relative 'shelf'
require_relative 'candy'

defaultShelves1 = [
    {"hersheys"=>5, "snickers"=>3, "skittles"=>4, "gummybears"=>2, "nerds"=>3, "sourpatch"=>1},
    {"hersheys"=>5, "snickers"=>3, "skittles"=>4, "gummybears"=>2, "nerds"=>3, "sourpatch"=>1}
    #{"hersheys"=>0, "snickers"=>0, "skittles"=>0, "gummybears"=>0, "nerds"=>0, "sourpatch"=>0}
] 

defaultUnshelvedCandy1 = ["hersheys","hersheys","hersheys","hersheys","hersheys","hersheys","snickers","snickers","snickers"]

shop1 = Shop.new("50 Cent's Candy Shop", defaultShelves1)
shop1_shelf1 = Shelf.new(); #you tell type of candies you have
shop1_candy1 = Candy.new(defaultUnshelvedCandy1) #you receive new candy in form of array
counter = 1

#get shelfqty from shop1_shelf1
puts "#{shop1.shelfQty}"
# puts "#{shop1_shelf1.requestAddShelf}"
shop1_shelf1.requestAddShelf
puts "#{shop1.shelfQty}"


#TEST THAT ALL THE METHODS GO THROUGH THE INHERETED CLASSES
# puts shop1_shelf1.stockedCandy  
# puts shop1_candy1.newItems
# puts shop1_candy1.shelvedInventory
# puts shop1_candy1.shelfQty

# manageShop = 0
# puts manageShop
# manageShop = shop1_candy1.shelvedInventory
# puts manageShop
# manageShop = shop1_candy1.unshelvedInventory
# puts manageShop

#manageShop = shop"#{counter}"_candy1.unshelvedInventory

#display select shop menu

#do loop until you break
#if shop 1
    #display shop1 options
    #call select shop1 options
        #object should register each option accordingly 

# x = 0

# puts "Loop count till 10"

# while (x < 10)
#     x += 1
#     puts x

#     if (x == 3 || x == 9)
#         puts "almost there"
#     end
# end

puts "START OF PROGRAM"

runProgram = true
selectShop = 0

while (selectShop != -1 && runProgram != false) do

    shop1.selectShop
    selectShop = gets.to_i

    puts selectShop

    if selectShop == 3
        runProgram = false
        puts runProgram
    elsif selectShop == 1
        puts "works good so far"
        manageShop = 0
        
        while (manageShop != -1 && runProgram != false)

            shop1.displayShopOptions
            manageShop = shop1.selectShopOptions

            if manageShop == 4
                runProgram = false
            elsif manageShop == 2
                system "clear"
                puts "managing shelves now!"
                manageShelf = 0

                while (manageShelf != -1 && runProgram != false)
                    shop1_shelf1.displayShelfOptions
                    manageShelf = shop1_shelf1.selectShelfOptions

                    if manageShelf == 6
                        runProgram = false
                    elsif manageShelf == 4
                        system "clear"
                        puts "managing candy now!"
                        manageCandy = 0

                        while (manageCandy != -1 && runProgram != false)
                            shop1_candy1.displayCandyOptions
                            manageCandy = shop1_candy1.selectCandyOptions

                            if manageCandy == 6
                                runProgram = false
                            end
                        end
                    end
                end
            end
        end
    #here second shop option select can continue
    elsif selectShop == 2
        puts "This store is still under development. Check another store in the meantime."
    end
end

puts "Good-Bye!"