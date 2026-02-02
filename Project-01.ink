/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/


VAR hunger_meter = 7
VAR searching_ability = 0
VAR KEYS = 0
VAR carrying = ""
VAR player_name = ""
VAR trap_time = 0
VAR something_from_door_2 = ""
VAR Monster = "True"

-> choose_character


== choose_character ==
Before you begin your adventure in the maze, choose one as your character.
* [John. Have plenty of stamina/power to explore the maze.] 
    ~ player_name = "John"
    ~ hunger_meter = 18
    -> opening_remarks

* [Robert. Have extensive experience in exploring mazes.] 
    ~ player_name = "Robert" 
    ~ searching_ability = 5
    -> opening_remarks

* [Mary. Make some preparation before exploring the maze.] 
    ~ player_name = "Mary"
    ~ carrying = "food"
    -> opening_remarks

== opening_remarks==
Ok, {player_name}. When you enter this unknown maze, the exit is blocked, and you want to escape this maze. {player_name == "Mary": You prepared food can eat (+5 HP) or might help you cope with other creatures.} 
Now, -> start_place

== start_place ==
~ hunger_meter = hunger_meter - 1
~ searching_ability = searching_ability + 1
{ hunger_level() }

    + {hunger_meter > 0} [You decide to go to left door 1] -> door_1
    + {hunger_meter > 0} [You decide to go to middle door 2] -> door_2
    + {hunger_meter > 0} [You decide to go to right door 3] -> door_3


    + {hunger_meter > 0} [Check what you already go] -> record -> start_place
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> start_place
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> start_place
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> start_place
    + {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> start_place
    * {hunger_meter > 0}{something_from_door_2 == "key"} [Exit] -> successfully_exit
    * {hunger_meter > 0}{KEYS != 0} [Exit] -> successfully_exit
    * {hunger_meter <= 0} -> hungry_end
-> END


== door_1 ==
~ hunger_meter = hunger_meter + 3
~ searching_ability = searching_ability + 1
    This room 1 would heal you (+3 HP). 
    { hunger_level() }
    
    + {hunger_meter > 0} [Go front, which is door 4] -> door_4
    + {hunger_meter > 0} [Go right, which is door 2] -> door_2
    + {hunger_meter > 0} [Go back, which is start palce] -> start_place


    
    + {hunger_meter > 0} [Check what you already go] -> record -> door_1
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> door_1
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> door_1
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> door_1
    * {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> door_1
    * {hunger_meter <= 0} -> hungry_end
-> END


== door_2 ==
~ hunger_meter = hunger_meter - 1
~ searching_ability = searching_ability + 1
{something_from_door_2 == "": In this strange room 2, you can only choose one thing to take with you. When your abilities change, the available items might change as well.}
{something_from_door_2 != "": In this room 2, nothing is left behind.}
    { hunger_level() }
    
    + {hunger_meter > 0}{something_from_door_2 == ""} [Let's just see what's there.] -> selecting -> door_2
    + {hunger_meter > 0} [Go left, which is door 1] -> door_1
    + {hunger_meter > 0} [Go right, which is door 3] -> door_3
    + {hunger_meter > 0} [Go back, which is start palce] -> start_place


    + {hunger_meter > 0} [Check what you already go] -> record -> door_2
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> door_2
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> door_2
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> door_2
    * {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> door_2
    * {hunger_meter <= 0} -> hungry_end
-> END


== door_3 ==
~ hunger_meter = hunger_meter - 1
~ searching_ability = searching_ability + 1
There is a strange device in this room 3. You can check your abilities.
    { hunger_level() }
    
    + {hunger_meter > 0} [Check ability] -> check_ability
    + {hunger_meter > 0} [Go front, which is door 5] -> door_5
    + {hunger_meter > 0} [Go left, which is door 2] -> door_2
    + {hunger_meter > 0} [Go back, which is start palce] -> start_place
    
    
    + {hunger_meter > 0} [Check what you already go] -> record -> door_3
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> door_3
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> door_3
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> door_3
    * {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> door_3
    * {hunger_meter <= 0} -> hungry_end
-> END


== door_4 ==
~ trap_time = trap_time + 1
~ hunger_meter = hunger_meter - 8
~ searching_ability = searching_ability + 1
This is a trap room, you are hurt (-8 HP) { Trap_Room() }.
    { hunger_level() }
    
    * {hunger_meter <= 0} -> hungry_end
    * {trap_time == 1} -> door_1
    * {trap_time == 2} -> start_place
    * {trap_time == 3} -> successfully_exit
-> END


== door_5 ==
~ hunger_meter = hunger_meter - 1
~ searching_ability = searching_ability + 1
There is nothing in this room 5.
    { hunger_level() }
    
    + {hunger_meter > 0} [Go front, which is door 6] -> door_6
    + {hunger_meter > 0} [Go back, which is door 3] -> door_3
    * {hunger_meter > 0}{searching_ability >= 10} [You find a hidden passage. Enter] -> door_7
    
    
    + {hunger_meter > 0} [Check what you already go] -> record -> door_5
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> door_5
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> door_5
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> door_5
    * {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> door_5
    * {hunger_meter <= 0} -> hungry_end
-> END


== door_6 ==
~ hunger_meter = hunger_meter - 1
~ searching_ability = searching_ability + 1
    {Monster == "True": There is a monster in the room 6.}
    {Monster == "False": There is no monster in the room 6.}
    { hunger_level() }

    + {Monster == "True"}[Fight] -> Fighting
    + {Monster == "False"}[Go front, which is door 7] -> door_7
    + [Go back] -> door_5
    
    
    + {hunger_meter > 0} [Check what you already go] -> record -> door_6
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> door_6
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> door_6
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> door_6
    * {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> door_6
    * {hunger_meter <= 0} -> hungry_end
-> END


== door_7 ==
~ hunger_meter = hunger_meter - 1
~ searching_ability = searching_ability + 1
~ KEYS = 1
{ hunger_level() }
You get the treasure and the key which can opens the exit in the start place.
    * {hunger_meter > 0}{searching_ability >= 10} [Go back with hidden passage.] -> door_5
    + {hunger_meter > 0} [Go Back, which is door 6] -> door_6
    

    + {hunger_meter > 0} [Check what you already go] -> record -> door_7
    * {hunger_meter > 0}{carrying == "food"} [Eat the food which you prepared (+5 HP)] -> eat_food -> door_7
    + {hunger_meter > 0}{something_from_door_2 == "map"} [Watch the map] -> MAP -> door_7
    + {hunger_meter > 0}{something_from_door_2 == "book"} [Read the book] -> BOOK -> door_7
    * {hunger_meter > 0}{something_from_door_2 == "can"} [Eat the can (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)] -> CAN -> door_7
    * {hunger_meter <= 0} -> hungry_end
-> END





== record ==
~ searching_ability -= 1
~ hunger_meter += 1
Visited rooms -------------------------------------------------------------
There are totally 7 doors/rooms (not including start place)
- Start (Nothing) ----- Door 1 / Door 2 / Door 3
{door_1: - Door 1 (Heal, + 3 HP) ----- Door 1 / Door 2 / Door 3}
{door_2: - Door 2 (Pick only one times) ----- Door 1 / Door 3}
{door_3: - Door 3 (Check) ----- Door 5 / Door 2 / Start}
{door_4: - Door 4 (Trap and a gimmick, -8 HP) ----- Door 5 / Door 2 / Start}
{door_5: - Door 5 (Nothing, but ...)----- Door 6 / Door 3}
{door_6: - Door 6 (Monster)  ----- Door 7 / Door 5}
{door_7: - Door 7 (Target) --- Door 6}
Split line------------------------------------------------------------------
->->

== MAP ==
~ searching_ability -= 1
~ hunger_meter += 1
Map:
You can find one key in Door 7 and exit the maze in the start.
- Start (Nothing) ----- Door 1 / Door 2 / Door 3
- Door 1 (Heal, + 3 HP) ----- Door 4 / Door 2 / Start
- DOor 2 (Pick only one times) ----- Door 1 / Door 3
- Door 3 (Check) ----- Door 5 / Door 2 / Start
- Door 4 (Trap and a gimmick, -8 HP) ----- Automatic transmission
- Door 5 (Nothing, but something hidden) ----- Door 6 / ? / Door 3
- Door 6 (Monster) ----- Door 7 / Door 5
- Door 7 (Target) --- Door 6 / ?
->->

== eat_food ==
    ~ searching_ability -= 1
    {carrying == "food":
        You eat the food.
        ~ hunger_meter = hunger_meter + 6
        ~ carrying = ""
    }
->->

== BOOK ==
~ searching_ability -= 1
~ hunger_meter += 1
To open the hidden passage, you need a search ability of 10 or higher.
Also, Door 4 is Trap room. However, after entering three times, it will send you back outside.
->->

== CAN ==
~ hunger_meter = 10
~ searching_ability = searching_ability - 1
{can_result()}
->->
== function can_result ==
{hunger_meter >= 9:
    ~ return "This smells awful, you've already thrown up. (HP becomes 9/10)"
- else:
    ~ return "It smells a bit unpleasant, but it tastes good. (HP becomes 9/10)"
}

== selecting == 
~ hunger_meter = hunger_meter + 1
~ searching_ability = searching_ability - 1
    * [Map (You can know the whole route)]
        ~ something_from_door_2 = "map"
        -> door_2
    * [Book (You may know some secret)]
        ~ something_from_door_2 = "book"
        -> door_2
    * [Can of Surströmming (The hungrier you are, the better it tastes; the fuller you are, the worse it tastes.)]
        ~ something_from_door_2 = "can"
        -> door_2
    * {searching_ability >= 12} [Key (You can exit the maze)]
        ~ something_from_door_2 = "key"
        -> door_2
    * {searching_ability <= 6} [Waepon (Can convert your searching ability to power)]
        ~ something_from_door_2 = "weapon"
        -> door_2
    + [leaving] -> door_2

== check_ability ==
~ searching_ability = searching_ability - 1
~ hunger_meter = hunger_meter + 1
Your searching ability is {searching_ability}.
Each time you enter a room, you can improve your searching ability (+1). If your ability is greater than 10, you might discover something hidden.
-> door_3

== function Trap_Room == 
    {
        - trap_time == 1:
        ~ return "and teleport back to the *door 1*. But you feel there's something strange about this room"
        
        - trap_time == 2:
        ~ return "and teleport back to the *start place*. But you have a feeling that this room 4 might let you out"
        
        - trap_time == 3:
        ~ return "and teleport back to the *outside*. You find the trick of maze, and successfully leave it"
    }

    ~ return ""

== Fighting ==
* {carrying == "food"}[Use food to attract the enemy's attention, then attack.] -> win
* {something_from_door_2 == "weapon"}{hunger_meter + searching_ability >= 15} [You can use weapon to win] -> win
* {something_from_door_2 == "weapon"}{hunger_meter + searching_ability < 15} [Seems you cannot win with the weapon, leave] -> leave
* {something_from_door_2 == "can"}{hunger_meter >= 15} [You can win by throwing the can of Surströmming] -> win
* {something_from_door_2 == "can"}{hunger_meter <= 2} [You can win by opening the can of Surströmming] -> win
* {hunger_meter >= 20}[You feel very very very very good (HP >= 20)] -> win
+ [You feel you cannot win, leave] -> leave
-> END

== win ==
~ hunger_meter = hunger_meter + 1
~ searching_ability = searching_ability - 1
    ~ Monster = "False"
-> door_6

== leave ==
~ hunger_meter = hunger_meter - 2
~ searching_ability = searching_ability - 2
-> door_5

== successfully_exit ==
Congratulations on successfully leaving this maze!
-> END

== hungry_end ==
You are very hungry and unable to leave the maze.
-> END

== function hunger_level ==
    {    
        - hunger_meter == 0:
            ~ return "You died, such as your HP is 0/10."
        
        - hunger_meter == 1:
            ~ return "You feel extrmelly hungry, such as your HP is 1/10."
        
        - hunger_meter == 2:
            ~ return "You feel very hungry, such as your HP is 2/10."
            
        - hunger_meter == 3:
            ~ return "You feel hungry, such as your HP is 3/10."
        
        - hunger_meter == 4:
            ~ return "You feel a little hungry, such as your HP is 4/10."
            
        - hunger_meter == 5:
            ~ return "You feel tired, such as your HP is 5/10."
            
        - hunger_meter == 6:
            ~ return "You feel a little tired, such as your HP is 6/10."
            
        - hunger_meter == 7:
            ~ return "You are normal, such as your HP is 7/10."
            
        - hunger_meter == 8:
            ~ return "You feel good, such as your HP is 8/10."
            
        - hunger_meter == 9:
            ~ return "You feel very good, such as your HP is 9/10."
            
        - hunger_meter >= 10:
            ~ return "You fell perfect, such as your HP is {hunger_meter}/10."
    
    }

    ~ return hunger_meter

    