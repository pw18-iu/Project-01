# Project-01

# Your Name
Peiwen Wang

# Your Github username
pw18-iu

# List the things you added for points
<!--
The maze design is:
                                                                                             Door 7 (Get key to leave)
                                                                                                    ↑                   ↖
                                                                                              Door 6 (monster)          hiddent room 
                                                                                                    ↑                    ↗ (searching ability >= 10)
---------------Door 4 (Trap += 1， -8 HP)                                                     Door 5 (noting)
| Trap = 1              ↑                                                                           ↑
|-----------*> Door 1 (Heal, +3 HP)                   Door 2 (Pick 1 tool)              Door 3 (check searching_ability)
| Trap = 2                          ↖                      ↑                            ↗
|------------------------------------------------*>  start (Nothing)
| Trap = 3                                              ↓ (need key)
|------------------------------------------------*>    outside (win)
-->
I hope to get the full score, but I create quite lots of options, I am not able to test all of them completely, so there might be a few bugs.

The short story is set in a maze, and the player is currently trying to find an exit. There are eight rooms in total, including seven doors and one starting room. And there are more than 8 knot structures.
After entering each door, an option called “Check what you already go and have” is appearing, allowing the player to check the map and view the items they currently have.
The player is basically having three attributes: Hunger Meter (= HP), searching ability, and the items they currently have, I will describe the specific impacts later.
Every time you choose to enter one door, it will automatically show your hungry_meter / HP (== function hunger_level == in line 352)

Beyond the requirements listed above, I am now explaining the modifications and improvements I am making to the project. (The corresponding line numbers may be changing after the modifications the inky, so they may not be matching my original text exactly.)

Basic rule: 
Each passage is bidirectional.
Each passage will: HP -1  &  searching_ability +1
When HP(hungry_meter) = 0, dead end.

Player difference:
== choose_character == in line 33
John, has higher basic HP/hunger meter 17/10
Robert, has higher basic searching ability = 5
Mary, has basic tool "food", which can eat directly for + 5 HP (== eat_food == in line 253) and win the monster in door 6 (in line 324 in == Fighting ==)


There are 2 ways to win:
1. Get the key and come back to start place to leave. (in line 70 in == start_place ==)
2. Go the Door 4 three times, and it will send the player to leave. (== door_4 == in line 139). And hint of Door 4 is in: == function hunger_level == line 309.
if you are John, you have enough HP to directly enter Door 4 (each time -8 HP) three times.

There are 2 ways to get key:
1. Go to the Door 7 to get key. (in line 197 in == door_7 ==)
2. When your searching_ability >= 12, you can select "key" in Door 2.(in line 294 in == selecting ==)

There are 2 ways to go to the Door 7:
1. Fight and Win the monster in Door 6, when the monster == "false", you can go to Door 7. (line 181, == door_6 ==)
Mary has "food" which can help her to defeat the monster directly, if player don't eat "food".

2. When searching_ability >= 10, you can find the hidden passage in Door 5, and go to Door 7 without fighting with monster in door 6 (line 161 == door_5 ==)
when you walk to different room, seaching_ability can +1, and Robert has higher basic searching ability, so he can find hidden passage quickly.

There are several ways to win the monster in Door 6:
detail is in knot == Fighting == line 323, and most is related to the things you selecting in Door 2.

Next, I will introduce different room/door
1. == start_place == (line 54): Nothing special
2. == door_1 ==(line 75): every time you choose enter door 1, your HP +3 (line 76)
3. == door_2 ==(line 96): you can pick one item (== selecting == in 282).
    a. map(== map == in line 238): you can directly get the whole routes.<br>
    b. book(== BOOK == in line 262): you can directly know the requirement of hidden passage to go to door 7 and the secret of using door 4 to leave.<br>
    c. Can of Surströmming (== CAN == and == function can_result == in line 269): let you HP become 9/10; In door 6 fighting, when your HP>=15 or HP<=5, you can defeat the monster(line 327 in == Fighting).<br>
    d. weapon(line 297): only when you searching_ability <= 6, you can choose it, it use to defeat the monster when you HP + searching_ability >= 15 (line 325 in == Fighting ==)<br>
4. == door_3 == (line 118): you can only check your seaching_ability here (line 302 == check_ability ==)
5. == door_4 == (line 139): Go the Door 4 three times, and it will send the player to leave.
6. == door_5 == (line 153): just checking whether your searching_ability >= 10 to open the hidden passage.
7. == door_6 == (line 173): monster room, the rule of defeat the monster in == Fighting == (line 325)
8. == door_7 == (line 194): get KEY, but you need to take care of your HP to make sure you have enough HP to go back to the start_place.