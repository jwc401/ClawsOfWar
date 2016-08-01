#Clash of Claws: README


##VIEWS: (the rest will be added in later, these are the main features for the lite version)

###Loading view: Loading the game!
-Displays image while the game is setting up the main view (campyard), does not leave this view until setup is done


###Main view: The campsite!
-


###Menu view: Options!
-


###Cats view: All the cats!
-


###Shop view: Buy food and decorations!
-


###Decorate view: Decorate your camp!
-


###Logbook view: Info and stuff on the cats you have met/befriended
-


###Cat view: Individual cat info
-



###OBJECT CLASSES

Cat:

struct cat


Food:

struct food


Decorative item:

struc items


###Using the sprite kit (and then the game kit):

-Create the scene, then setup the background image in the scene

-Displaying the objects:
	The cat objects will hold their own properties. Display the cats by creating SKNode objects (based off said properties) and adding them to the scene.
	Place the cat objects onto the screen (and display sprite), have various actions be possible/happen regarding the cats (e.g. touch cat --> see cat info screen)
	

-Pulling up the menu/inventory/shop/etc screens without losing data in the main screen

-Having the game being able to close or run in the background without losing data. 
	Possible use of a .txt file (read/write to) that acts as the game's savedata. 
	Running in background: https://developer.apple.com/library/ios/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/BackgroundExecution/BackgroundExecution.html

