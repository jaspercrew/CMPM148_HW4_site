VAR Strength = ""
~ Strength = "{~Low|Low|Low|High}"
VAR Charm = ""
~ Charm = "{~Low|Low|Low|High}"
VAR Intellect = ""
~ Intellect = "{~Low|Low|Low|High}"
VAR Primary = ""
VAR Secondary = ""
VAR cash = 3
VAR ikea = false
VAR scav = false
VAR empty = false
VAR scam = false
VAR ignore = false



Rolled Traits: 
Strength: {Strength}
Charm: {Charm}
Intellect: {Intellect}
>>>>

//SCENE 1 START

You are a chef with a dream. You wish to create a new themed 
restaurant that will change the world. A world of flavor, a magical 
utopia of food. You know that in order to realize this goal, you will need 
to make difficult choices. The first step is to choose the primay 
flavor profile of your establishment. 
->primary  

==primary== 
 * Sweet
    ->sweet
 * Savory
    ->savory


==sweet==
    You've always had a preference for sweet foods. Now you wish to share that love the world through your new restaurant. 
    You pick the sweet option. You can already feel your blood sugar levels rising.
    ~ Primary = "Sweet"
    ->secondary

==savory==
    You've always had a preference for sweet foods. Now you wish to share that love the world through your new restaurant. 
    You pick the savory option. You can already feel your sodium levels rising.
    ~ Primary = "Savory"
    ->secondary

    
==secondary==
You now need to decide your secondary flavor profile. You can pick either spicy or sour.
    * Spicy 
        ->spicy
    * Sour
        ->sour
    
==spicy==
    You pick the spicy option. Hope your customers can handle the heat.
    ~ Secondary = "Spicy"
    ->store

==sour==
    You pick the sour option. Prepare for acid reflux. 
    ~ Secondary = "Sour"
    ->store


==store==
    Picked Traits:
    Primary: {Primary}
    Secondary: {Secondary}
    With your chosen flavor profiles, you begin to order ingredients to start up your business.
    {sweet: You order bags and bags of sugar for your dishes. After all, what's greater than potato chips and sandwiches? }
    {savory: You order bags and bags of salt for your dishes.}
    {spicy: You also order plenty of chili peppers and hot sauce in order to give some heat to your food.}
    {sour: You also order plenty of lemon and lime juice to give some acidity to your food.}
    These foods will move your restaurant to the front pages. You can already imagine the lines of customers outside your business.
    ->transport

==transport==
    After ordering the ingredients, you realize that you need some way to transport the ingredients from the store warehouses to your business location. For some reason, the warehouses don't have their own designated delivery service. If you do not find a way to move the goods to your location, they will go rotten and become useless. What will you do?
    +  STRENGTH: Move the goods yourself.
        {Strength == "Low": You don't have the strength. ->transport }
        You use your superior strength to lift up all the pallets of food by yourself. You carry them to your restaurant and get the job done.
    + CHARM: Scam a moving company.
        {Charm == "Low": You don't have the social skills. ->transport }
        You manage to convince the moving company that you're a prince in another country and you will pay them back later. Their trucks efficiently move the ingredients to your restaurant.
        ~ scam = true
    * Hire a moving company.
        You decide to hire a moving company to transport the supplies. You lose a decent amount of funding, but it gets the job done.
        ~ cash -= 1
    - 
        *  Next Scene
            -> setup

//SCENE 2 START

==setup== 
    You have moved the ingredients to your restaurant, but you encounter yet another issue. The place you rented has no furniture at all. You talk to the land owner, but they refuse to help you. You look around for spare furniture in the closets but you only find cobwebs and empty cardboard boxes. With no chairs or table to host customers, your revenue (and feng shui) will surely plummet. You need to find a solution, and quick.
    *  Purchase a set of furniture from IKEA
        You head to IKEA and purchase chairs and tables. A valuable investment to be sure. You spend a few hours putting them together and eventually get the job done. 
        ~ikea = true
        ~ cash -= 1
        
    *  Scavenge for furniture
        You run to the nearby junkyard to look for furniture.
         **  Go to the abandoned warehouses
                You find some assorted old furniture in the warehouses.
                ~ scav = true
         ** Go to the abandoned car
                There is nothing in the car. You are forced to purchase furniture.
                ~ cash -= 1
        
    *  Don't buy furniture
        You decide to go for the minimalist approach for decoration. Your restaurant will just be a floor with no tables or chairs. I doubt people will eat at your restaurant, but we'll see.
        ~ empty = true
        ~ cash -= 1
    - -> cook   
    
==cook==
    Your restaurant is now ready to open to customers! You fill out the required paperwork and start setting up advertisements to spread the word of your upcoming opening.
    {sweet: Your sweet ingredients will surely bring in plenty of revenue.}
    {savory: Your savory ingredients will surely bring in plenty of revenue.}
    {sour: Your sour dishes should help as well.}
    {spicy: Your spicy dishes should help as well.}
    With these combinations of ingredients and the furniture that you have acquired (or not), you open up your restaurant to the public. Time will tell how well it does...
    * Next scene
        -> opened
    
==opened==
    It's been a few years since your restaurant has opened. You have built up a great menu over these times, expanding to many new options. You now serve dozens of different items to your customer base. 
    {cash == 3: Due to you saving money in the building/planning phase, you were able to invest heavily into staff and talent. This has caused your revenue to be very high during these trying times.}
    {cash == 2: You had to spend a moderate amount of funds during the building/planning phase. Therefore, you were able to spend a decent amount on staff and talent. Your revenue has been okay for the past few years.}
    {cash == 1: You had to spend most of your funds during the building/planning phase. Therefore, you could not spend very much money on staff and talent. Due to this problem, your revenue has been relatively low for the past few years. }
    *  Move on 
        -> problem
    
==problem==
    You have run into another major problem for your food establishment. There has been a flurry of negative reviews for your restaurant and it's been a disaster for your revenue. You need to come up with a quick solution before you have to close down. 
    {empty == true: With your lack of furniture, you really shouldn't be surprised.}
    {scav == true: With your dirty and scavenged furniture, you really shouldn't be surprised.}
    +  FUNDS: Pay off reviewers and critics.
        {cash == 1: You don't have the funds. ->problem }
        You use your saved funds to pay off harsh critics and reviewers. Some people bring up dissent against your corrupt actions, but you know it's worth it for the good of the business.
        ->problem2
    *  Accept the reviews and change nothing
        {cash == 1: You accept the reviews and your dwindling customer count. ->end2 }
        
        {cash == 2 or cash == 3: You accept the reviews and your dwindling customer count. You lose some revenue but you manage to stay afloat. ->problem2}
        
        
==problem2==
    You have run into one final issue before your restaurant can takeoff into greatness. There has been a scandal about your dishes causing salmonella and other diseases. As far as you can tell, these allegations have truth to them. How do you handle the response?
    *  Put out a public statement addressing the allegations
        You admit that there were certain cases of salmonella in your food but you announce plans to increase safety throughout your establishment. This seems to get rid of most of the worries.
            ->end
    *  Deny the allegations
        You put out a statement vehemently denying the salmonella allegations. This seems to get rid of most of the worries.
        ->end
    *  Ignore the allegations
        You decide that the allegations are not worth addressing. However, this comes back to haunt you, as you instantly see a revenue drop due to scared customers.
        ~ ignore = true
        -> end2
    

==end==
    Your legendary restaurant will live on forever. You have the resources to expand more locations as a chain business. Your dishes will be remembered by every customer who has had the privilege to indulge in your delicacies.
    {scam == true: Hopefully they don't discover that scam on the moving company...}
    ->END
    
==end2==
    Your company has gone out of business due to lack of funds. 
    {ignore == true: The salmonella scandal was too much.}
    You are forced to close down and sell the property to some other establishment. 
    {scav == true: You sell off your scavenged furniture in an attempt to salvage losses.}
    {ikea == true: You sell off your IKEA furniture in an attempt to salvage losses.}
    
    ->END
    
    

->END

