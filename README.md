# Siefer-DnD4e-fg-class-extension

The continuations of my DnD 4e extensions for Fantasy Grounds that add various capabilities from other rulesets that I want to see in the 4e one. This mostly includes creating other records and making them draggable onto the character sheet.



\#Release Notes  
v.0.1.0 - 10/05/2025 - Initial Release. Basic UI display of classes in sidebar, adds link to record in character sheet, and includes support for armor, weapon, and implement proficiencies, hit points at first level, max healing surges, and trained skills for classes when dragging class onto sheet.\
v.0.2.0 - 11/1/2025 - Adds bonuses to defense. Adds support for shield proficiencies (they are added to the armor proficiencies section). Adds class-specific features. Offers choices for class-specific features that have multiple options for Cleric (Templar), Fighter (Weaponmaster), Paladin, and Ranger. Fixed up the way trained skills are added to accomodate these 4 classes.\
v.0.2.1 - 11/2/2025 - Fixed a bug preventing it from working with my DnD 4e Races Extension.\
v.0.3.0 - 11/6/2025 - Tested the rest of the PHB classes (Cleric, Fighter, Paladin, Ranger, Rogue, 
Warlock, Warlord, Wizard) and made some minor changes to make it work with them.\
v.0.3.1 - 11/10/2025 - Can now update by dragging onto skill sheet, instead of just the main sheet.\
v.0.4.0 - 11/10/2025 - Added filters for the class library for role, power source, book/publishing 
source, and class type (default, essentials, and hybrid). Added choices for Avengers features.\
v.0.5.0 - 11/16/2025 - Tested and fixed issues for class features up to the end of PHB2 (Avenger, Barbarian, Bard, Druid, Invoker, Shaman, Sorcerer, and Warden).\
v.0.6.0 - 11/25/2025 - There is now a UI to add your own custom classes, although automation for them isn't set up (will do this after finishing automation for all the compendium classes). Added filters for the power library for class, keywords, level, publishing source, recharge, and type. Tested and fixed issues for class features for HotFL and HotFK Essentials classes (Druid (Sentinel), Paladin (Cavalier), Ranger (Hunter), Ranger (Scout), Warlock (Hexblade), Cleric (Warpriest), Fighter (Knight), Fighter (Slayer), and Rogue (Thief))
v.0.7.0 - 12/1/2025 - Finished adding the rest of the Essentials classes by testing and fixing class features for HoEC and NCS classes (Wizard (Bladesinger), Sorcerer (Elementalist), Wizard (Sha'ir)). Also added links to the selection dialogues.





What This Extension Does:



* Adds a record type for classes in the sidebar
* Allows you to drag a class record to a character in order to add that class to your character sheet
* Adds a link in the character sheet to your class and its associated record
* When a class record is dragged to your character sheet, it will automatically add armor, weapon, and implement proficiencies, hit points at first level, max healing surges, defense bonuses, and trained skills.
* It adds the text for implements to implements (as of v.0.2.0)
* It adds bonus to defenses (as of v.0.2.0)
* It adds class features (as of v.0.2.0)
* It has a UI to add your own custom classes (as of v.0.6.0)





What This Extension Does Not Do (but it might do one day):



* It does not allow class support beyond first level.
* It does not add powers yet.
* It doesn't support hybrid classes.
* It only supports base classes, not paragon classes or epic destinies.


Notes on Filtering Powers and Classes:
 - Powers should have their source written as (Race/Class/etc.) ("Attack"/"Utility"/"Feature") (Level) without the ()'s in order to have their Class/Race, Power Type, and Level fields all parse correctly for those respective filter fields. The quotes signify that one of those exact words is used
 - Publishing source is located by identifying a "Published in [x]." words somewhere in one of the description fields. Whatever words are located in [x] is used for the publishing source.
















This extension adds a sidebar item for races to D\&D 4th edition, like in other rulesets, and adds a few automation capabilities related to that.

