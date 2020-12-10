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
shop1_shelf1 = Shelf.new(); 
shop1_candy1 = Candy.new(defaultUnshelvedCandy1) #you receive new candy in form of array

#create more objects here for second store

runProgram = true
selectShop = 0

while (selectShop != -1 && runProgram != false) do

    puts "Welcome to the Candy Shop \n\n"
    shop1.selectShop
    selectShop = gets.to_i

    if selectShop == 3
        runProgram = false
    elsif selectShop == 1

        manageShop = 0
        
        while (manageShop != -1 && runProgram != false)
            system "clear"
            puts "Manage Store \n\n"
            shop1.displayShopOptions
            manageShop = shop1.selectShopOptions

            if manageShop == 4
                runProgram = false
            elsif manageShop == 2
     
                manageShelf = 0

                while (manageShelf != -1 && runProgram != false)
                    system "clear"
                    puts "Manage Shelfs \n\n"
                    shop1_shelf1.displayShelfOptions
                    manageShelf = shop1_shelf1.selectShelfOptions

                    if manageShelf == 6
                        runProgram = false
                    elsif manageShelf == 4
        
                        manageCandy = 0

                        while (manageCandy != -1 && runProgram != false)
                            system "clear"
                            puts "Manage Candy \n\n"
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