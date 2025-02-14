# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


####################################
#          Seed the Operators
####################################

Operator.create( name: 'equals',        sql_value: '=',       html_representation: '=')
Operator.create( name: 'like',          sql_value: ' like ',  html_representation: 'has a')
Operator.create( name: 'greaterthan',   sql_value: '>',       html_representation: '&gt;')
Operator.create( name: 'lessthan',      sql_value: '<',       html_representation: '&lt;')
Operator.create( name: 'doesnotequal',  sql_value: '<>',      html_representation: '&ne;')


####################################
#          Seed the Datatypes
####################################

Datatype.create( name: 'text')
Datatype.create( name: 'number')
Datatype.create( name: 'yes/no')
Datatype.create( name: 'date')

####################################
#          Seed the Themes
####################################

Theme.create( name: "none",
              data: "html, body {
              margin:0px;
              padding:0px;
              font-size: 1em;
              font-family: verdana, helvetica, sans-serif;
              }",
              preview_img: "one-preview.jpg" )
              
              
              
Theme.create( name: "Rainforest",
              data: "html, body {
                            	margin:0px;
                            	padding:0px;
                            	color: #000; 
                            	height:100%;
                            	font-size: 1em;
                            	font-family: verdana, helvetica, sans-serif;
                            }

                            body{
                            	background-color: #000;
                            	background-image: url(../assets/pageThemes/two.jpg);
                            	background-repeat:repeat-x;
                            	background-position:top;
                            	background-attachment:fixed;
                            }

                            img{
                            	max-width:650px;
                            }

                            #everything{
                            	padding-top:50px;
                            }

                            #content{
                            	width:700px;
                            	border: 5px solid #000;
                            	border-radius:0.5em;
                            	background-color:#fff;
                            	margin-left:auto;
                            	margin-right:auto;
                            	margin-bottom: 20px;
                            	padding:20px;
                            }

                            table{
                            	border: 2px solid #bbb;
                            }

                            .returnHome{
                            	text-align:center;
                            	position:static;
                            	bottom: 10px;
                            	padding:4px;
                            	background-color:#fff;
                            	border: 5px solid #000;
                            	width: 200px;
                            	margin-left:42%;
                            }

                            a { color: #678; }
                            a:visited { color: #678; }",
              preview_img: "two-preview.jpg" )
              
Theme.create( name: "Savannah",
              data: "html, body {
                            	margin:0px;
                            	padding:0px;
                            	color: #000; 
                            	height:100%;
                            	font-size: 1em;
                            	font-family: verdana, helvetica, sans-serif;
                            }

                            body{
                            	background-color: #3e68b2;
                            	background-image: url(../assets/pageThemes/three.jpg);
                            	background-repeat:repeat-x;
                            	background-attachment:fixed;
                            	background-position:left bottom;

                            }

                            img{
                            	max-width:650px;
                            }

                            #everything{
                            	padding-top:50px;
                            }

                            #content{
                            	width:700px;
                            	border: 5px solid #000;
                            	border-radius:0.5em;
                            	background-color:#fff;
                            	margin-left:auto;
                            	margin-right:auto;
                            	margin-bottom:20px;
                            	padding:20px;
                            }

                            table{
                            	border: 2px solid #bbb;
                            }

                            .returnHome {
                            	text-align:center;
                            	position:static;
                            	bottom: 10px;
                            	padding:4px;
                            	background-color:#fff;
                            	border: 3px solid #000;
                            	width: 200px;
                            	margin-left:42%;
                           }",
              preview_img: "three-preview.jpg" )
              
Theme.create( name: "Arctic",
              data: "html, body {
                            	margin:0px;
                            	padding:0px;
                            	color: #000; 
                            	height:100%;
                            	font-size: 1em;
                            	font-family: verdana, helvetica, sans-serif;
                            }

                            body{
              		            background-color: #fff;
                            	background-image: url(../assets/pageThemes/four.jpg);
                            	background-repeat:repeat-x;
                            	background-attachment:fixed;
              		            background-position: bottom;
                            }

                            img{
                            	max-width:650px;
                            }

                            #everything{
                            	padding-top:50px;
                            }

                            #content{
                            	width:700px;
                            	border: 3px solid #999;
                            	border-radius:0.5em;
                            	background-color:#fff;
                            	margin-left:auto;
                            	margin-right:auto;
                            	margin-bottom:20px;
                            	padding:20px;
                            }

                            table{
                            	border: 2px solid #bbb;
                            }

                            .returnHome{
                            	text-align: center;
                            	position:static;
                            	bottom: 10px;
                            	padding:4px;
                            	background-color:#fff;
                            	border: 3px solid #999;
                            	width: 200px;
                            	margin-left:42%;
                            }

                            a { color: #678; }
                            a:visited { color: #678; }",
              preview_img: "four-preview.jpg" )
              
Theme.create( name: "Desert",
              data: "html, body {
                            	margin:0px;
                            	padding:0px;
                            	font-size: 1em;
                            	font-family: verdana, helvetica, sans-serif;
                            }

                            body{
                            	height:100%;
              		            background-color: #0c2366;
                            	background-image: url(../assets/pageThemes/five.jpg);
                            	background-repeat:repeat-x;
                            	background-attachment:fixed;
                            	background-position:left bottom;
                            }

                            img{
                            	max-width:650px;
                            }

                            #everything{
                            	padding-top:50px;
                            }

                            #content{
                            	width:700px;
                            	border: 3px solid #000;
                            	border-radius:0.5em;
                            	background-color:#fff;
                            	margin-left:auto;
                            	margin-right:auto;
                            	margin-bottom:20px;
                            	padding:20px;
                            }

                            table{
                            	border: 2px solid #bbb;
                            }

                            .returnHome{
                            	text-align:center;
                            	position:static;
                            	bottom: 10px;
                            	padding:4px;
                            	background-color:#fff;
                            	border: 3px solid #000;
                            	width: 200px;
                            	margin-left:42%;
                            }",
              preview_img: "five-preview.jpg" )

Theme.create( name: "Water",
              data: "html, body {
                            	margin:0px;
                            	padding:0px;
                            	color: #000; 
                            	font-size: 1em;
                            	font-family: verdana, helvetica, sans-serif;
                            	height:100%;
                            }

                            body{
                            	background-color: #000;
                            	background-image: url(../assets/pageThemes/six.jpg);
                            	background-repeat:repeat-x;
                            	background-attachment:fixed;
                            	background-position:bottom;
                            }




                            img{
                            	max-width:650px;
                            }

                            #everything{
                            	padding-top:50px;
                            }

                            #content{
                            	width:700px;
                            	border: 5px solid #000;
                            	border-radius:0.5em;
                            	background-color:#eee;
                            	margin-left:auto;
                            	margin-right:auto;
                            	margin-bottom:20px;
                            	padding:20px;
                            }

                            table{
                            	border: 2px solid #bbb;
                            }

                            .returnHome{
                            	text-align:center;
                            	position:static;
                            	bottom: 10px;
                            	padding:4px;
                            	background-color:#fff;
                            	border: 3px solid #000;
                            	width: 200px;
                            	margin-left:42%;
                            }",
              preview_img: "six-preview.jpg" )


####################################
#         Seed example Queries and their Conditions
####################################



####################################
#         Seed an example Page
####################################



####################################
#         Seed the Animals
####################################

Animal.create( name: "Owl",		            habitat: "Forest",	                nocturnal: 1,	 diet: "carnivore",	 weight: "15" )
Animal.create( name: "Siberian Tiger",		habitat: "Conifer Forest",	        nocturnal: 1,	 diet: "carnivore",	 weight: "450" )
Animal.create( name: "Aardvark",		      habitat: "Savannah",	              nocturnal: 1,	 diet: "carnivore",	 weight: "140" )
Animal.create( name: "Alligator",		      habitat: "Swamp",	                  nocturnal: 1,	 diet: "carnivore",	 weight: "500" )
Animal.create( name: "Badger",		        habitat: "Woodlands",	              nocturnal: 1,	 diet: "omnivore",	 weight: "30" )
Animal.create( name: "Mouse",		          habitat: "(anywhere)",	            nocturnal: 1,	 diet: "omnivore",	 weight: "1" )
Animal.create( name: "Raccoon",		        habitat: "Forest",	                nocturnal: 1,	 diet: "omnivore",	 weight: "15" )
Animal.create( name: "Bison",		          habitat: "Grasslands",	            nocturnal: 0,	 diet: "herbivore",	 weight: "2000" )
Animal.create( name: "Chimpanzee",	      habitat: "African Forest",	        nocturnal: 0,	 diet: "omnivore",	 weight: "110" )
Animal.create( name: "Deer",		          habitat: "Forest",	                nocturnal: 0,	 diet: "herbivore",	 weight: "78" )
Animal.create( name: "Fox",		            habitat: "Forest",	                nocturnal: 1,	 diet: "carnivore",	 weight: "14" )
Animal.create( name: "Giraffe",		        habitat: "Savannah",	              nocturnal: 0,	 diet: "herbivore",	 weight: "2100" )
Animal.create( name: "Ferret",		        habitat: "Prairies",	              nocturnal: 1,	 diet: "carnivore",	 weight: "5" )
Animal.create( name: "Gibbon",		        habitat: "Rain Forest",	            nocturnal: 0,	 diet: "omnivore",	 weight: "15" )
Animal.create( name: "Gray Whale",		    habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "32000" )
Animal.create( name: "Horse",		          habitat: "Grasslands",	            nocturnal: 0,	 diet: "herbivore",	 weight: "1100" )
Animal.create( name: "Manatees",	    	  habitat: "Freshwater",	            nocturnal: 0,	 diet: "herbivore",	 weight: "1500" )
Animal.create( name: "Otter",		          habitat: "Coast",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "55" )
Animal.create( name: "Polar Bear",	      habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "1500" )
Animal.create( name: "Porcupine",		      habitat: "Forests",	                nocturnal: 0,	 diet: "herbivore",	 weight: "15" )
Animal.create( name: "Arctic Wolf",		    habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "175" )
Animal.create( name: "Camel",		          habitat: "Desert",	                nocturnal: 0,	 diet: "herbivore",	 weight: "1500" )
Animal.create( name: "Panda",		          habitat: "Bamboo Forest",	          nocturnal: 0,	 diet: "herbivore",	 weight: "250" )
Animal.create( name: "Fruit Bat",		      habitat: "Forest",	                nocturnal: 1,	 diet: "herbivore",	 weight: "3" )
Animal.create( name: "Vampire Bat",	      habitat: "Forest",	                nocturnal: 1,	 diet: "carnivore",	 weight: "3" )
Animal.create( name: "Woodchuck",		      habitat: "Forest",	                nocturnal: 0,	 diet: "herbivore",	 weight: "10" )
Animal.create( name: "Zebra",		          habitat: "Savannah",	              nocturnal: 0,	 diet: "herbivore",	 weight: "600" )
Animal.create( name: "Blue Whale",		    habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "250000" )
Animal.create( name: "Bowhead Whale",		  habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "110000" )
Animal.create( name: "Fin Whale",		      habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "88000" )
Animal.create( name: "Humpback Whale",		habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "90000" )
Animal.create( name: "Hyena",		          habitat: "Savannah",	              nocturnal: 0,	 diet: "carnivore",	 weight: "140" )
Animal.create( name: "Howler Monkey",		  habitat: "Rain Forest",	            nocturnal: 0,	 diet: "herbivore",	 weight: "18" )
Animal.create( name: "Baboon",		        habitat: "Savannah",	              nocturnal: 0,	 diet: "omnivore",	 weight: "75" )
Animal.create( name: "Beaver",		        habitat: "Forest",	                nocturnal: 0,	 diet: "herbivore",	 weight: "50" )
Animal.create( name: "Armadillo",	        habitat: "Grasslands",	            nocturnal: 0,	 diet: "insectivore",	 weight: "8" )
Animal.create( name: "Mole",		          habitat: "Forest",	                nocturnal: 0,	 diet: "insectivore",	 weight: "1" )
Animal.create( name: "Hedgehog",	  	    habitat: "Desert",	                nocturnal: 1,	 diet: "insectivore",	 weight: "1" )
Animal.create( name: "Shrew",		          habitat: "(anywhere)",	            nocturnal: 1,	 diet: "insectivore",	 weight: "1" )
Animal.create( name: "Llama",		          habitat: "Andes Mountains",	        nocturnal: 0,	 diet: "herbivore",	 weight: "300" )
Animal.create( name: "Mandrill",		      habitat: "Rain Forest",	            nocturnal: 0,	 diet: "omnivore",	 weight: "55" )
Animal.create( name: "Antelope",		      habitat: "Grasslands",	            nocturnal: 0,	 diet: "herbivore",	 weight: "1600" )
Animal.create( name: "Arctic Fox",		    habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "7" )
Animal.create( name: "Anteater",		      habitat: "Tropical Forest",	        nocturnal: 0,	 diet: "insectivore",	 weight: "50" )
Animal.create( name: "Koala",		          habitat: "Australian Woodlands",	  nocturnal: 1,	 diet: "herbivore",	 weight: "20" )
Animal.create( name: "Kangaroo",		      habitat: "Australian Woodlands",	  nocturnal: 0,	 diet: "herbivore",	 weight: "140" )
Animal.create( name: "Kangaroo Rat",		  habitat: "Desert",	                nocturnal: 1,	 diet: "herbivore",	 weight: "1" )
Animal.create( name: "Rat",		            habitat: "(anywhere)",	            nocturnal: 1,	 diet: "omnivore",	 weight: "5" )
Animal.create( name: "Green Iguana",		  habitat: "Rainforest",	            nocturnal: 0,	 diet: "omnivore",	 weight: "15" )
Animal.create( name: "Jaguar",		        habitat: "Rainforest",	            nocturnal: 0,	 diet: "carnivore",	 weight: "220" )
Animal.create( name: "Leopard",		        habitat: "Rainforest",	            nocturnal: 0,	 diet: "carnivore",	 weight: "125" )
Animal.create( name: "Leopard",		        habitat: "Rainforest",	            nocturnal: 0,	 diet: "carnivore",	 weight: "125" )
Animal.create( name: "Rainbow Lorikeet",	habitat: "Rainforest",	            nocturnal: 0,	 diet: "insectivore",	 weight: "1" )
Animal.create( name: "Scarlet Macaw",		  habitat: "Rainforest",	            nocturnal: 0,	 diet: "herbivore",	 weight: "2" )
Animal.create( name: "Sloth",		          habitat: "Rainforest",	            nocturnal: 1,	 diet: "herbivore",	 weight: "12" )
Animal.create( name: "Toucan",		        habitat: "Rainforest",	            nocturnal: 0,	 diet: "omnivore",	 weight: "2" )
Animal.create( name: "Tarantula",		      habitat: "Rainforest",	            nocturnal: 0,	 diet: "carnivore",	 weight: "1" )
Animal.create( name: "Snapping Turtle",		habitat: "Freshwater",	            nocturnal: 0,	 diet: "omnivore",	 weight: "175" )
Animal.create( name: "Sea Turtle",		    habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "1900" )
Animal.create( name: "Painted Turtle",		habitat: "Marshes",	                nocturnal: 0,	 diet: "omnivore",	 weight: "1" )
Animal.create( name: "Desert Tortoise",		habitat: "Desert",	                nocturnal: 0,	 diet: "herbivore",	 weight: "11" )
Animal.create( name: "Great Horned Owl",  habitat: "Conifer Forests",	        nocturnal: 1,	 diet: "carnivore",	 weight: "3" )
Animal.create( name: "Spotted Owl",		    habitat: "Conifer Forests",	        nocturnal: 1,	 diet: "carnivore",	 weight: "1" )
Animal.create( name: "Snowy Owl",		      habitat: "Tundra",	                nocturnal: 0,	 diet: "carnivore",	 weight: "1" )
Animal.create( name: "Snow Goose",		    habitat: "(migratory)",	            nocturnal: 0,	 diet: "herbivore",	 weight: "6" )
Animal.create( name: "Emperor Penguin",		habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "70" )
Animal.create( name: "African Penguin",		habitat: "South African Coast",	    nocturnal: 0,	 diet: "carnivore",	 weight: "7" )
Animal.create( name: "Black Swan",		    habitat: "Marshes",	                nocturnal: 0,	 diet: "herbivore",	 weight: "9" )
Animal.create( name: "Cardinal",		      habitat: "Woodlands",	              nocturnal: 0,	 diet: "insectivore",	 weight: "1" )
Animal.create( name: "Flamingo",		      habitat: "Tropical Waters",	        nocturnal: 0,	 diet: "omnivore",	 weight: "7" )
Animal.create( name: "Harpy Eagle",		    habitat: "Rainforest",	            nocturnal: 0,	 diet: "carnivore",	 weight: "15" )
Animal.create( name: "Hummingbird",		    habitat: "(migratory)",	            nocturnal: 0,	 diet: "herbivore",	 weight: "1" )
Animal.create( name: "Mallard Duck",		  habitat: "Marshes",	                nocturnal: 0,	 diet: "omnivore",	 weight: "2" )
Animal.create( name: "Goblin Shark",		  habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "250" )
Animal.create( name: "Great White Shark",	habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "7000" )
Animal.create( name: "Hammerhead Shark",	habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "700" )
Animal.create( name: "Blue Shark",		    habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "860" )
Animal.create( name: "Mako Shark",		    habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "1000" )
Animal.create( name: "Manta Ray",		      habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "2000" )
Animal.create( name: "Stingray",		      habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "210" )
Animal.create( name: "Dolphin",		        habitat: "Ocean",	                  nocturnal: 0,	 diet: "carnivore",	 weight: "900" )
Animal.create( name: "Harp Seal",		      habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "220" )
Animal.create( name: "Killer Whale",		  habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "7500" )
Animal.create( name: "Walrus",		        habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "1600" )
Animal.create( name: "Narwhal",		        habitat: "Arctic",	                nocturnal: 0,	 diet: "carnivore",	 weight: "3900" )
Animal.create( name: "Moose",		          habitat: "Arctic",	                nocturnal: 0,	 diet: "herbivore",	 weight: "500" )
Animal.create( name: "Flying Squirrel",		habitat: "Deciduous Forests",	      nocturnal: 1,	 diet: "omnivore",	 weight: "1" )
Animal.create( name: "Hippopotamus",		  habitat: "African Marshes",	        nocturnal: 1,	 diet: "herbivore",	 weight: "8000" )
Animal.create( name: "Northern Fur Seal",	habitat: "Arctic",	                nocturnal: 1,	 diet: "carnivore",	 weight: "500" )
Animal.create( name: "Opossum",		        habitat: "Woodlands",	              nocturnal: 1,	 diet: "omnivore",	 weight: "8" )
Animal.create( name: "Red Fox",		        habitat: "Forest",	                nocturnal: 1,	 diet: "carnivore",	 weight: "13" )
Animal.create( name: "Pyralis Firefly",	  habitat: "(anywhere)",	            nocturnal: 1,	 diet: "carnivore",	 weight: "1" )
Animal.create( name: "Luna Moth",		      habitat: "Deciduous Forest",	      nocturnal: 1,	 diet: "herbivore",	 weight: "1" )
Animal.create( name: "Lynx",		          habitat: "Coniferous Forests",      nocturnal: 1,	 diet: "carnivore",	 weight: "22" )
Animal.create( name: "Hamster",		        habitat: "Desert",	                nocturnal: 1,	 diet: "omnivore",	 weight: "1" )
Animal.create( name: "Arabian Camel",		  habitat: "Desert",	                nocturnal: 0,	 diet: "herbivore",	 weight: "1600" )
Animal.create( name: "Arctic Hare",		    habitat: "Arctic",	                nocturnal: 0,	 diet: "herbivore",	 weight: "12" )
