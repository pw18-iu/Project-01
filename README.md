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
|-----------*>                                   start (Nothing)
| Trap = 3                                              ↓ (need key)
|-----------*> outside
-->
I hope to get the full score, but I create quite lots of options, I am not able to test all of them completely, so there might be a few bugs.

The short story is set in a maze, and the player is currently trying to find an exit. There are eight rooms in total, including seven doors and one starting room. And there are more than 8 knot structures.


Each passage/arrow is bidirectional.
Each passage/arror will: HP -1  &  searching_ability +1
When HP(hungry_meter) = 0, dead end.