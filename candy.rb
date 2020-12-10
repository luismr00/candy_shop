require_relative "shelf"

class Candy < Shelf

    # attr_accessor :candy

    def initialize(newItems)
        @newItems = newItems
    end

    def newItems 
        return @newItems
    end

    def candyInventory

        #stocked
        hersheys = 0
        snickers = 0
        skittles = 0
        gummybears = 0
        nerds = 0
        sourpatch = 0

        #unstocked
        hersheysU = 0
        snickersU = 0
        skittlesU = 0
        gummybearsU = 0
        nerdsU = 0
        sourpatchU = 0

        @@shelves.each do |item|
            item.each do |key, value|
                if (key == "hersheys")
                    hersheys += value
                elsif (key == "snickers")
                    snickers += value
                elsif (key == "skittles")
                    skittles += value
                elsif (key == "gummybears")
                    gummybears += value
                elsif (key == "nerds")
                    nerds += value
                elsif (key == "sourpatch")
                    sourpatch += value
                end
            end
        end

        @newItems.each do |item|
            if (item == "hersheys")
                hersheysU += 1
            elsif (item == "snickers")
                snickersU += 1
            elsif (item == "skittles")
                skittlesU += 1
            elsif (item == "gummybears")
                gummybearsU += 1
            elsif (item == "nerds")
                nerdsU += 1
            elsif (item == "sourpatch")
                sourpatchU += 1
            end
        end

        candyNames = ["hersheys", "snickers","skittles","gummybears","nerds","sourpatch"]
        lineSeperate = "-" * 18
        puts lineSeperate
        puts "Brand \t\t\t Stocked \t Unstocked"
        puts lineSeperate

        puts "Hershey's \t\t    #{hersheys} \t\t    #{hersheysU}"
        puts "Snickers \t\t    #{snickers} \t\t    #{snickersU}"
        puts "Skittles \t\t    #{skittles} \t\t    #{skittlesU}"
        puts "Gummy Bears\t\t    #{gummybears} \t\t    #{gummybearsU}"
        puts "Nerds \t\t\t    #{nerds} \t\t    #{nerdsU}"
        puts "Sour Patch\t\t    #{sourpatch} \t\t    #{sourpatchU}"
        puts lineSeperate
        
    end

    def order 

        orderedCandy = ""

        puts "select which type of candy you want to order: "

        puts "1. Hershey's"
        puts "2. Snickers"
        puts "3. Skittles"
        puts "4. Gummy Bears"
        puts "5. Nerds"
        puts "6. Sour Patch \n"

        type = gets.to_i

        if (type == 1)
            orderedCandy = "hersheys" 
        elsif (type == 2)
            orderedCandy = "snickers"
        elsif (type == 3)
            orderedCandy = "skittles"
        elsif (type == 4)
            orderedCandy = "gummybears"
        elsif (type == 5)
            orderedCandy = "nerds"
        elsif (type == 6)
            orderedCandy = "sourpatch"
        end

        puts "how much candy do you want to order?"
        amount = gets.to_i

        for i in 1..amount
            @newItems.push(orderedCandy)
        end

        puts "Sucess!"
        sleep(2)

    end
    

    def displayCandyOptions
        puts "\t 1. Check candy inventory"
        puts "\t 2. Order Candy"
        puts "\t 3. Stock unshelved candy"
        puts "\t 4. Remove candy from shelfs"
        puts "\t 5. Back to the previous menu"
        puts "\t 6. Exit Program"
    end

    def addSpace(storeItems)
        shelfs = shelfQty
        space = openShelfSpace 
        #totalCandy = stockedCandy #NOT THIS
        unshelvedItems = storeItems.length 
        addQty = (unshelvedItems - space) / 25.00

        puts "unshelved items is #{unshelvedItems}"
        puts "space availabe is #{space}"
        puts "addQty came at #{addQty}"
        puts "adding #{addQty.ceil()} shelfs now..."
        sleep(4)

        for i in 1..addQty.ceil()
            requestAddShelf
        end

    end

    def stockCandy(storeItems)

        unAvailableSpace = 0
        availableSpace = 0
        count = 0

        #checks each hash inside the array at a time
        @@shelves.each do |item|

            unAvailableSpace = 0
            availableSpace = 0
            appendCandy = []

            #step to calculate the available space to determine how many unshelved items to stock within the current shelf
            item.each do |key, value|
                unAvailableSpace += value
            end

            availableSpace = 25 - unAvailableSpace
            appendCandy = storeItems.shift(availableSpace)
            
            #deleting the first items from unshelved candy depending upon availabe space in the current shelf
            #This iteration will also increase the number of a candy brand by 1 in stock
            for i in 0..availableSpace - 1
                candyName = appendCandy[i]
                
                if (candyName == "hersheys")
                    @@shelves[count]["hersheys"] += 1
                elsif (candyName == "snickers")
                    @@shelves[count]["snickers"] += 1
                elsif (candyName == "skittles")
                    @@shelves[count]["skittles"] += 1
                elsif (candyName == "gummybears")
                    @@shelves[count]["gummybears"] += 1
                elsif (candyName == "nerds")
                    @@shelves[count]["nerds"] += 1
                elsif (candyName == "sourpatch")
                    @@shelves[count]["sourpatch"] += 1
                end
            end

            count += 1
            
        end


    end

    def pullStockedCandy(type,amount)

        pulledCandy = []
        #pullAmount = 0
        pulledAmountleft = amount
        count = 0

        @@shelves.each do |item|
            item.each do |key, value|

                if key == type

                    puts "found some items in the shelf"
                    sleep(3)

                    if pulledAmountleft > value

                        for i in 1..value
                            pulledCandy.push(type)
                            puts "We pulled the following candy: #{pulledCandy}"
                        end

                        pulledAmountleft -= value
                        @@shelves[count][type] = 0

                    elsif pulledAmountleft <= value
                        
                        for i in 1..pulledAmountleft
                            pulledCandy.push(type)
                            puts "We pulled the following candy: #{pulledCandy}"
                        end

                        @@shelves[count][type] -= pulledAmountleft
                        pulledAmountleft = 0

                    end
                    
                elsif pulledAmountleft == 0
                    return pulledCandy
                end

            end

            count += 1
        end

        return pulledCandy
    end

    def unshelvedBrandQty(type)

        count = 0

        @newItems.each do |item|
            
            if item == type
                count += 1
            end

        end

        return count

    end

    def individualStockedCandy(type)
        
        count = 0
        
        @@shelves.each do |item|
            item.each do |key, value|
                if key == type
                    count += value
                end
            end
        end

        return count
    end

    def selectNewItems(type, amount) 

        selectedElements = []
        count = 0

        @newItems.each do |i|
            
            if count == amount
                break
            elsif i == type
                selectedElements.push(type)
                @newItems.delete_at(count)
            end

            count += 1
        end

        return selectedElements


    end

    def stockCandyOptions

        #will use stockCandy(arg), addSpace(arg), openShelfSpace
    
        #openShelfSpace return a value for you to determine to stock right away or not

        #check if unshelved items are empty first before continuing
    
        selectedItems = []
        space = openShelfSpace
        candyAmount = 0

        puts "you currently have #{@newItems.length} unshelved items"
        puts "open shelf space available is #{space}"

        if @newItems.length == 0

            puts "There are no unshelved items at this time. Please order more items before trying again."
            sleep(3)
        else
    
            puts "Do you wish to stock all items?"
            puts "\n1. Yes"
            puts "2. No"
        
            input = gets.to_i
        
            if input == 1
        
                if space < @newItems.length
                    puts "You do not have enough space to store all items. You need to add more shelfs first. Would you like to add necessary shelfs?"
                    puts "\n1. Yes"
                    puts "2. No"
        
                    input = gets.to_i
        
                    if input == 1
                        addSpace(@newItems)
                        stockCandy(@newItems)
                        puts "Success!"
                        sleep(2)
                    else
                        puts "Ok then. Another time."
                        input = 1 #due to the last prompt so it doesnt jump to the next
                    end
                
                else
                    stockCandy(@newItems)
                    puts "Success!"
                    sleep(2)
                end
            elsif input == 2
                puts "Ok. Do you wish to select candy instead you wish to stock?"
                puts "\n1. Yes"
                puts "2. No"
        
                input = gets.to_i
        
                if input == 1
                    puts "\nSelect from the following list you wish to select"
                    puts "\n1. Hershey's"
                    puts "2. Snickers"
                    puts "3. Skittles"
                    puts "4. Gummy Bears"
                    puts "5. Nerds"
                    puts "6. Sour Patch"
        
                    candySelect = gets.to_i
                    candyOptions = ["hersheys","snickers","skittles","gummybears","nerds","sourpatch"]
                    candyType = candyOptions[candySelect - 1]
                    brandQty = unshelvedBrandQty(candyType)

                    if brandQty == 0
                        puts "you have to items for the selected brand over with the unshelved items. Check inventory and try again."
                        sleep(3)
                    else 
                            #START TAB HERE-----------------------
                        puts "\nThere are a total of #{brandQty} number of #{candyType} available to restock."
                        puts "How many #{candyType} items do you wish to stock? Choose only available number of candy."

                        while validate == false
                            candyAmount = gets.to_i
                                
                            if candyAmount > brandQty
                                puts "Try again. You have to select an amount less or equal to the amount available of unshelved items."
                                #puts "If amount for the item was 0, type 0 and try another item next time."

                            else 
                                puts "exiting validation loop. Delete this line later!"
                                sleep(3)
                                validate = true
                            end

                        end
            
                        # for i in 1..candyAmount
                        #     selectedItems.push(candyType)
                        # end

                        selectedItems = selectNewItems(candyType,candyAmount)
            
                        if candyAmount > space
                            puts "You do not have enough space to store all items. You need to add more shelfs first. Would you like to add necessary shelfs?"
                            puts "\n1. Yes"
                            puts "2. No"
                    
                            input = gets.to_i
                    
                            if input == 1
                                addSpace(selectedItems)                        
                                stockCandy(selectedItems)
                            else
                                puts "Ok then. Another time."
                                input = 1 #due to the last prompt so it doesnt jump to the next
                            end
                        else                        
                            stockCandy(selectedItems)
                            puts "Added selected amount of candy successfully!"
                            sleep(2)
                        end
                            #STOP TAB HERE ------------------
                    end
                else
                    puts "Sounds good. Cya!"
                end
        
            end
        end
    end 

    def removeCandyOptions

        
        removedItems = []
        validate = false
        shelfs = shelfQty
        
        if shelfs == 0
            puts "There are no shelfs available to remove candy from them"
            sleep(3)
        else
            puts "Select from the following candy brands:"
            puts "\n1. Hershey's"
            puts "2. Snickers"
            puts "3. Skittles"
            puts "4. Gummy Bears"
            puts "5. Nerds"
            puts "6. Sour Patch"        

            candySelect = gets.to_i
            candyOptions = ["hersheys","snickers","skittles","gummybears","nerds","sourpatch"]
            candyType = candyOptions[candySelect - 1]
            brandQty = individualStockedCandy(candyType)

            if brandQty == 0 
                puts "The selected item is empty within the shelved inventory. Check the inventory and come back again."
                sleep(3)
            else

                puts "There are a total of #{brandQty} items in stock for #{candyType}"
                puts "How many would you like to remove?"

                while (validate == false)
                    candyAmount = gets.to_i
                        
                    if candyAmount > brandQty
                        puts "Try again. You have to select an amount less or equal to the amount available of unshelved items."
                        #puts "If amount for the item was 0, type 0 and try another item next time."

                    else 
                        puts "exiting validation loop. Delete this line later!"
                        sleep(3)
                        validate = true
                    end

                end

                #skip if brandQty = 0

                removedItems = pullStockedCandy(candyType,candyAmount)

                puts "Put items back with other unshelved items or remove completely out of the store?"
                puts "1. Back to unshelved"
                puts "2. Remove completely"

                action = gets.to_i

                if action == 1
                    #puts "the returned pull candy is: #{removedItems}"
                    puts "You currently have: #{@newItems}"

                    for i in 0..removedItems.length - 1

                        @newItems.push(removedItems[i])

                    end
                    
                    puts "After the change: #{@newItems}"
                    puts "Successfully moved selected items back with unshelved items"
                    sleep(7)
                elsif action == 2
                    #no need to do any other action anymore since items where already removed from shelf withp pullStockedCandy method
                    puts "Successfully removed selected items out of the store"
                    sleep(3)
                end
            end
        end
    end
     

    def selectCandyOptions

        input = gets.to_i

        if input == 1
            system "clear"
            candyInventory
            sleep(7)
            system "clear"
        elsif input == 2
            system "clear"
            order
            system "clear"
        elsif input == 3
            system "clear"
            stockCandyOptions
            system "clear"
        elsif input == 4
            system "clear"
            removeCandyOptions
            system "clear"
        elsif input == 5
            return -1
        elsif input == 6
            return 6
        end
    end

  
end