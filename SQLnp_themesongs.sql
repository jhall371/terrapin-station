USE master;
GO

IF DB_ID('NationalParkThemeSongs_GratefulDeadEdition') IS NOT NULL
BEGIN
	ALTER DATABASE NationalParkThemeSongs_GratefulDeadEdition SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE NationalParkThemeSongs_GratefulDeadEdition;
END

CREATE DATABASE NationalParkThemeSongs_GratefulDeadEdition;
GO

USE NationalParkThemeSongs_GratefulDeadEdition;
GO

BEGIN TRANSACTION;
	CREATE TABLE parks
		(
 --column name		data type			constraints					notes	
 park_id			int					identity(1, 1) NOT NULL,
 name				nvarchar(80)		NOT NULL,					-- Name of the park
 location			nvarchar(50)		NOT NULL,					-- State name(s) where park is located
 establish_date		date				NOT NULL,					-- Date park was established
 area				int					NOT NULL,					-- Area in acres
 visitors			int					NOT NULL,					-- Latest recorded number of annual visitors
 description		nvarchar(500)		NOT NULL,					-- Park highlights

  CONSTRAINT pk_park_id PRIMARY KEY (park_id)
		);
	
	CREATE TABLE songs
		(
 --column name		data type			constraints					notes
 song_id			int					identity(1, 1) NOT NULL,
 name				nvarchar(80)		NOT NULL,
 venue				nvarchar(100)		NOT NULL,					--Where the selected song was recorded
 location			nvarchar(100)		NOT NULL,					--Venue location (city, state)
 date_recorded		date				NOT NULL,					--Date the recording took place
 length				time				NOT NULL,					--Length of the song
 description		nvarchar(1500)		NOT NULL,					--Why chosen song/version is the parks unoffical theme song

 CONSTRAINT pk_songs PRIMARY KEY(song_id)
		);

	CREATE TABLE park_song
		(
--column name		data type			constraints					notes
 park_id			int					NOT NULL,
 song_id			int					NOT NULL

 CONSTRAINT pk_park_song PRIMARY KEY(park_id, song_id)
 CONSTRAINT fk_park_song_park FOREIGN KEY(park_id) REFERENCES parks(park_id),
 CONSTRAINT fk_park_song_song FOREIGN KEY(song_id) REFERENCES songs(song_id)
		);

COMMIT;

--adding parks
--visitor data and descriptions gathered from https://www.farandwide.com/s/most-least-popular-national-parks-18cf91b0ab7c4fef
BEGIN TRANSACTION;

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Acadia', 'Maine', '2/26/1919', 198.6, 3437286, 'One of the nation''s most idyllic national parks (and that''s saying something), Acadia spans across 47,000 acres of rugged coastline. Bar Harbor, the Mount Desert Island where the majority of the park is found, is the quintessential New England seaport town, with romance and charm to spare.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('American Samoa', 'American Samoa', '10/31/1988', 33.4, 60006, 'In the South Pacific, even farther afield than the Hawaiian Islands, is the U.S. territory of Samoa. Made up of islands including Tutuila, Ofu and Ta''u, the entire territory is a part of this national park, including the spectacular surrounding coral reefs. Not surprisingly, the snorkeling and diving here can''t be beaten. ')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Arches', 'Utah', '11/12/1971', 310.3, 1659702, 'With their red hue, particularly vibrant during sunrise and sunset, the arches in this appropriately named park wow. You''ll find them scattered across more than 76,000 acres.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Badlands', 'South Dakota', '11/10/1978', 982.4, 970998, 'The rugged landscape known as the Badlands was first named by the Lakota people and adopted by French explorers in the 1700s. The area is not only rough underfoot, but experiences extreme temperature changes and very little water. A scenic byway winds nearly 40 miles around the park.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Big Bend', 'Texas', '6/12/1944', 3242.2, 463832, 'Named for the big bend of the Rio Grande in Texas, this park preserves a large part of the Chihuahuan Desert, one of the most diverse deserts in the Western Hemisphere. Standout features include Langford Hot Springs and its former bathhouse, used generations ago for its healing waters.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Biscayne', 'Florida', '6/28/1980', 700, 708522, 'South Beach may get all the attention in Miami, but the gorgeous waters and swaying palm trees of Biscayne National Park — visible from downtown — shouldn''t be overlooked. Manatees and mangroves make this a superb spot for scuba-diving, while the park''s barrier islands, accessible by boat, provide a sense of Old Florida.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Black Canyon of the Gunnison', 'Colorado', '10/21/1999', 124.6, 432818, 'The sun cannot reach all of this park''s cracks and crevices, earning it the "black" in its name. (Contrary to popular belief, it is not due to the color of the rock, which is black in some places.)How deep are we talking? The greatest depth is 2,722 feet. ')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Bryce Canyon', 'Utah', '2/25/1928', 145, 2594904, 'When Ebenezer Bryce moved to Utah, he discovered a crazy labyrinth of geological formations. The area, he memorably noted, would be "a hell of a place to lose a cow." Created when water froze and thawed, eroding away at the rock, these magnificent pillars today comprise a national park bearing Bryce''s name.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Canyonlands', 'Utah', '9/12/1964', 1366.2, 733996, 'Less crowded than the Grand Canyon, Canyonlands offers a similarly stunning desert landscape ideal for hiking and exploring. You may recognize it as the backdrop for the final scene of "Thelma & Louise."')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Capitol Reef', 'Utah', '12/18/1971', 979, 1226519, 'Yet another of Utah''s stunning desert landscapes can be found within Capitol Reef, dating back 65 million years. Sandstone formations are only on view by traveling deep into the desert — you''ll have to drive 78 miles to find the nearest traffic light!')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Carlsbad Caverns', 'New Mexico', '5/14/1930', 189.3, 440691, 'One of the nation''s most renowned cave systems showcases dramatic formations that were once part of an ancient reef. Still today, you can find marine fossils in the remaining rock. A word of caution for the easily spooked: It''s estimated as many as 300,000 bats live in these caverns.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Channel Islands', 'California', '3/5/1980', 1009.9, 409630, 'Getting to the Channel Islands is part of the fun as most visitors arrive by boat from Ventura, California, along the central coast. Made up of eight islands, the national park encompasses five isles that offer hiking trails and sea caves along the Santa Barbara Channel (hence the name). The islands are vacant save for campsites and the native Chumash people who have inhabited the area for thousands of years.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Congaree', 'South Carolina','11/10/2003', 107.1, 159445, 'Named for the Native American tribe that resided along the river of the same name in central South Carolina, this park is home to the Southeast''s largest collection of old-growth bottomland hardwood forest. The area floods with the river, but wooden planked trails provide access to more remote spots that are well worth exploring. (Chances are there will be very few if any others exploring with you!)')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Crater Lake', 'Oregon','5/22/1902', 741.5, 704512, 'When the dome of a volcano was blown away after an eruption, the 1,943-foot deep crater, over the course of thousands of years, became a pristine lake. Today, the area receives an average 43 feet of snow annually, melting further into the lake and providing a host of winter activities for visitors.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Cuyahoga Valley', 'Ohio', '10/11/2000', 131.8, 2237997, 'Follow the Cuyahoga River between Cleveland and Akron and you''ll see remnants of the Ohio and Erie Canal Towpath, restored to maintain the history of the waterway. Today, the area is protected by this national park. Don''t skip out on the Cuyahoga Valley Scenic Railroad, which offers scenic rides on diesel-electric and steam-powered trains. You won''t find anything like it at any other U.S. park.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Death Valley', 'California', '10/31/1994', 13793.3, 1740945, 'Despite its ominous name, many travelers explore Death Valley National Park, the driest, hottest and lowest of the national parks. When pioneers were lost in this valley in the mid-1800s, they named it Death Valley once they made their way out. During the day, temperatures often extend beyond 100 degrees Fahrenheit; in 1913, the hottest temperature ever was recorded here, a scorching 134 degrees.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Denali', 'Alaska', '2/26/1917', 19185.8, 601152, 'The 20,310-foot Denali peak — which still often goes by its former name of Mount McKinley — towers over this Alaskan national park spanning 6 million acres. There is only one road leading into the park, requiring visitors to enter by bus.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Dry Tortugas', 'Florida', '10/26/1992', 261.8, 79200, 'You have to take a ferry from Key West to get to the Dry Tortugas, which is made up mostly of the Caribbean Sea. Fort Jefferson, built in the 19th century, rests on one of seven small islands that make up this park that beckons divers, boaters and snorkelers. There are no accommodations here, but it''s an excellent place to pitch a tent for some seaside camping.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Everglades', 'Florida', '5/30/1934', 6106.5, 1118300, 'Protecting Florida''s 1.5 million-acre wetlands, the Everglades is a unique ecosystem that also happens to be the largest in North America. The park protects 16 endangered species within nine different habitats. Visitors exploring these wetlands may do so aboard airboats that are iconic for a reason.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Gates of the Arctic', 'Alaska', '12/2/1980', 30448.1, 110518, 'Gates of the Arctic is the least visited park in the state, and one of the least visited in the entire country. It hosts only .01% of total national park visitors. The park''s apt name comes from its location above the Arctic Circle, which ensures it enjoys nearly 24 hours of sunlight during summer days and Aurora Borealis-filled winter nights. There are no hiking or driving trails, hence its minimal visitation. If you can make it to the park, you''re guaranteed spectacular natural beauty.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Gateway Arch', 'Missouri', '2/22/2018', 0.8, 2055309, 'Bridging the American East and West, the Gateway Arch is a 630-foot-tall arch monument opened to the public in 1967. Its accompanying museum took another 10 years to open, and the entire area was expanded and renovated in 2018.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Glacier', 'Montana','5/11/1910', 4100, 3049839, 'Glacier National Park is found amid the grand Rocky Mountains along the border with Canada, and provides visitors with more than 700 miles of trails to enjoy. Home to 26 different glaciers, it definitely lives up to its name.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Glacier Bay', 'Alaska', '12/2/1980', 13044.6, 672087, 'Alaska''s northernmost position lends itself to an environment covered in snow and ice. Glacier Bay is exactly what its name implies: the home of glaciers and fjords. There are more than 1,000 glaciers in the bay, some as tall as mountains. The park is often visited via cruise ships sailing within the Inner Passage, where glaciers reach to the sea.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Grand Canyon', 'Arizona', '2/26/1919', 4862.9, 5974411, 'One of the most recognized parks the world over, and it''s no wonder why. The 277-mile long canyon carved by the Colorado River showcases millions of years of rock layers exposed by erosion. At this park, visitors can enjoy abundant wildlife, a range of activities, from helicopter rides to white-water-rafting at the bottom of the canyon, slow-moving donkey tours descending into the depths, and steep ascending climbs on numerous hiking trails.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Grand Teton', 'Wyoming', '2/26/1929', 1254.7, 3405614, 'This park''s star feature is the Teton mountain range. Also connected to Yellowstone National Park, the range''s highest peak reaches 13,775 feet, with the lowest mountain peaking at 6,400 feet in a jagged collection of hills. As a bonus, Grand Teton is situated near one of America''s most beautiful national-park gateway towns, Jackson.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Great Basin', 'Nevada', '10/27/1986', 312.3, 131802, 'Great Basin National Park is filled with a variety of landscapes and parks within the park. From the tips of Wheeler Peak''s 13,065-foot mountain to the depths of Lehman Caves and the rock glacier that looks petrified in time, this basin between the Sierra Nevada and Wasatch mountains promises surprises at every turn. ')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Great Sand Dunes', 'Colorado', '9/13/2004', 434.4, 527546, 'At this one-of-a-kind park, you can travel down the highest sand dunes in North America via sandboard or bike. Also of note? When lighting strikes the sand during storms, spectacular tubes of glass, called fulgurites, are formed. ')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Great Smoky Mountains', 'Tennessee', '6/15/1934', 2114.2, 12547743, 'The most visited national park is in the southeast’s tree-covered and ages-old forests of the Appalachian Mountains. Part of the allure of this national park is its charming, attraction-filled towns — Gatlinburg and Pigeon Forge, Tennessee, and Asheville, North Carolina — all nestled into the heart of the Smokies. The areas feature Dollywood, an aquarium, water parks, and moonshine distilleries making this park ideal for an all-around vacation.')								  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Guadalupe Mountains', 'Texas', '10/15/1966', 349.5, 188833, 'Four of Texas'' highest peaks can be seen in Guadalupe Mountains National Park, including Guadalupe Mountain itself, which reaches 8,750 feet. Within the stone of the park is the most extensive Permian fossil reef in the world — these mountains were once underwater reefs!')									  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Haleakala', 'Hawaii', '7/1/1961', 134.6, 994394, 'Maui island in Hawaii is home to the dormant and presiding shield volcano of Haleakala. The park encompassing the volcano welcomes more than a million visitors a year to catch the sunrise over the islands and the Pacific from the top of the world.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Hawaii Volcanoes', 'Hawaii', '8/1/1916', 1317.7, 1368376, 'On the Big Island of Hawaii is a national park dedicated to its active volcanoes. Kilauea and Mauna Loa provide a rare glimpse at the world''s inner core, as lava pours from the land and into the sea. This is the only national park of its kind in the U.S.From the top of the largest volcano in the world, visitors can follow a scenic drive through a unique landscape down to the sea, where the original road has been obstructed by hardened lava from previous lava flows.')									  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Hot Springs', 'Arkansas', '3/4/1921', 22.5, 1467153, 'Originally designated as a protected reservation in 1832 and made into a national park in 1921, Hot Springs lives up to its name by featuring 47 springs, including a thermal waterfall. Presidents Franklin Roosevelt, Harry Truman, George H.W. Bush and Arkansas native Bill Clinton have all stayed in Hot Springs, one of the only towns actually located within the boundaries of a national park.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Indiana Dunes', 'Indiana', '2/15/2019', 62.1, 2134285, 'If you think of Indiana as Midwestern farmland, you may have forgotten that its northern tip borders Lake Michigan. Here, 15,000 acres of dunes, marshes, swamps, rivers and bogs make up Indiana''s lakeshore, which originally became protected as such in 1966.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Isle Royale', 'Michigan', '4/3/1940', 2314, 26410, 'Don''t be deceived by the name; Isle Royale is actually just one of 450 islands that make up this quiet Great Lakes national park.The only way to visit the park''s islands is by boat or seaplane, which makes it difficult for travelers to visit. But this also ensures it remains a pristine playground for water-lovers.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Joshua Tree', 'California', '10/31/1994', 3217.9, 2988547, 'This park is named for the oddly shaped trees dotting its landscape, no two of which are the same. The park is located at the convergence of the Mojave and Colorado deserts and their unique landscapes. One is rocky; the other sandy. Both make for excellent hiking.')										  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Katmai', 'Alaska', '12/2/1980', 14870.3, 84167, 'You know those wildlife documentaries featuring bears, perched at the top of a waterfall, that catch leaping salmon in their mouths during spawning season? Well, this is the place where that magic happens. Katmai is not only a national park, it''s a national preserve designed to protect the salmon and the bears to keep nature''s delicate balance intact.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Kenai Fjords', 'Alaska', '12/2/1980', 2710, 356601, 'Whether you hike or boat to witness the awe-inspiring ice fields in this national park, you will get to experience one of the world''s rarest environments. There are nearly 40 glaciers still here from the Ice Age, although they are shrinking as the earth''s temperature heats up.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Kings Canyon', 'California', '3/4/1940', 1869.2, 632110, 'One of two adjacent parks (the other is Sequoia), Kings Canyon is as abundant with giant Sequoia trees as its neighbor. The park got its name for the creek that once passed through the canyon, which is actually 2,000 feet deeper than the Grand Canyon. The park was originally named for General Ulysses S. Grant when it was first established in 1890, receiving its current name in 1940.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Kobuk Valley', 'Alaska', '12/2/1980', 7084.9, 15766, 'Another Arctic Circle park, Kobuk Valley surprises visitors with its desert-like sand dunes. It''s unique and dazzling, but like much of Alaska''s protected lands, just so darn difficult to get to.')										  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Lake Clark', 'Alaska', '12/2/1980', 10602, 17157, 'First established as a national monument in 1978, Lake Clark was dedicated as a national park and preserve in 1980 under the Alaska National Interest Lands Conservations Act, under which most of Alaska''s national parks were established. The park features glaciers, rugged coastline and forests, all in one. Like Gates of the Arctic, it''s hard to reach, but richly rewards the lucky few who make the journey.')															  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Lassen Volcanic', 'California', '8/9/1916', 431.4, 517039, 'Home to four different types of volcanos — cinder cone, plug dome, stratovolcano and shield — this park discovered during the California Gold Rush is truly like no other. At 10,457 feet, the namesake Lassen Peak volcano is the park''s tallest, providing awe-inspiring views of the Cascade Mountain range.')										  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Mammoth Cave', 'Kentucky', '7/1/1941', 218.6, 551590, 'Kentucky''s national park is home to the world''s largest known cave system — and amazingly, the 52,830-acre park encompasses only a fraction of that system''s total land. In addition to its national-park status, Mammoth Cave is a World Heritage Site and one of the U.S.'' Natural Wonders.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Mesa Verde', 'Colorado', '6/29/1906', 212.4, 556203, 'The ancient Pueblo people built their homes into the cliffs of Mesa Verde at the end of the 12th century, long before the colonists arrived in America. The largest of the dwellings here is Cliff Palace, which has more than 150 rooms.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Mount Rainier', 'Washington', '3/2/1899', 956.6, 1501621, 'Mount Rainier, actually a volcano, is 500,000 years old and stands 14,410 feet tall. Less than an hour from Seattle, the volcano is active, although its last eruption was nearly 1,000 years ago. Visitors can drive 6,400 feet up to take in fabulous views, as well as hike along 260 miles of trails.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('New River Gorge', 'West Virginia', '12/27/2020', 28.4, 1195721, 'This gorgeous haven of rock climbing, hiking and whitewater rafting is the newest national park in the U.S., having only earned the status in January 2021. Before the promotion, it had enjoyed protection as a national river since 1978. New River Gorge attracted millions of visitors even before it was named a national park with its deep canyons and the beauty of one of the oldest rivers in the entire world.')										  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('North Cascades', 'Washington', '10/2/1968', 2042.8, 38208, 'The Cascade Mountains'' jagged peaks set the scene at this gorgeous alpine park. The tallest mountains here are Goode Mountain in the south (9,199 feet) and Mount Shuksan in the north (9,131 feet), while Eldorado Peak (8,868 feet) serves as the "Queen of the Cascade River" due to its central location in the range. Though this park isn''t visited much, it''s not all that hard to access; it''s less than three hours from Seattle.')										  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Olympic', 'Washington', '6/29/1938', 3733.8, 3245806, 'Home to the majestic Mt. Olympus, which affords views of Washington State''s rainforests and coastline, Olympic National Park is a four-season destination. The park is home to more than 60 glaciers and 3,000 miles of rivers, offering abundant things to see and do.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Petrified Forest', 'Arizona', '12/9/1962', 895.9, 643588, 'The remains of an ancient river bed and forest are scattered about this distinctive national park. Tree rings, dating back millions of years, are crystalized and colorful, giving meaning to the term “the painted desert.”')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Pinnacles', 'California', '1/10/2013', 108, 177224, 'With its fantastic rock formations, Pinnacles is known for rock climbing along its 32 miles of trails. The "pinnacles" are the remains of a former volcanic field, and visitors will find caves to explore more of the park''s geological wonders. Pro tip: Combine a visit here with a trip to nearby Big Sur along the coast, marveling at California''s astounding diversity of landscapes in close proximity.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Redwood', 'California', '10/2/1968', 562.5, 504722, 'In the song "This Land is Your Land," taught to schoolchildren across America, some of the best sights in the nation are documented. And one of those sights is the country''s spectacular redwood forests. Northern California''s Redwood National Park is among the best places you can go to see the country''s seminal giant trees (not sequoias, but related). Follow the Avenue of Giants highway, where you can actually drive through a redwood, proving just how massive the trees can be.')

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Rocky Mountain', 'Colorado', '1/26/1915', 1075.7, 4670053, 'Covered in aspen trees, Rocky Mountain is the most popular among Colorado''s four superb national parks. Driving the length of the park would take 2 hours, if you didn''t stop to take so many photos of the amazing scenery and views. But most visitors prefer to delve into the park to climb rock faces, hike up mountains, swim in crisp lakes and camp along the Great Divide of America.')										  																	  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Saguaro', 'Arizona', '10/14/1994', 375.8, 1020226, 'Named for the cacti that seemingly wave hello from the desert around Tucson, this national park is the perfect vision of the great American West. Surrounding the city, one portion of the park features ancient petroglyphs drawn by the Hohokam natives, found when you follow the Signal Hill Trail. The other portion provides a drive-through tour along Cactus Forest Drive''s looped road.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Sequoia', 'California', '9/25/1890', 1635.2, 1246053, 'Adjacent to Kings Canyon National Park, the nation’s tallest trees can be found within this park''s borders. The main attraction is General Sherman, the park''s signature sequoia, but hiking anywhere within the towering forest reminds us of Mother Nature''s astonishing accomplishments.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Shenandoah', 'Virginia', '12/26/1935', 806.2, 1425507, 'Many experience Shenandoah simply by driving along its Skyline Drive, running the full length of the Blue Ridge Mountains stretching across Virginia. But the park is also an excellent locale for hiking, offering more than 100 miles of trekking along the famed Appalachian Trail alone.')											  																	  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Theodore Roosevelt', 'North Dakota', '11/10/1978', 285.1, 691658, 'It''s no secret that President Theodore Roosevelt loved the nation''s wildlife. An avid hunter, he recognized the need to preserve our natural lands and its animals, leading him to establish the U.S. Forest Service in 1905. The land where he once lived in North Dakota honors his legacy and is the only national park in the state.')									  																	  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Virgin Islands', 'U.S. Virgin Islands', '8/2/1956', 60.9, 133398, 'The U.S.''s claim on the islands collectively occupied by America and the British includes the isle of St. John. The Rockefeller family once owned a large chunk of this rainforested island, bequeathing it to be made into a national park. Practically the entire island is now part of Virgin Islands National Park, including its surrounding coral reefs and bays.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Voyageurs', 'Minnesota', '4/8/1975', 883.1, 232974, 'Minnesota''s only national park is made up of lakes, swamps, bogs, islands, rock formations and rolling hills covered in forest. Stargazing is popular here, and when the northern lights are dancing, the clear, dark skies make it perfect for catching the show.')												  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('White Sands', 'New Mexico', '12/20/2019', 592.2, 608785, 'Originally designated as a national monument in 1933, White Sands was re-designated a national park on Dec. 20, 2019, making it the 62nd national park. It''s named, as you might guess, for its miles upon miles of white sand dunes composed of gypsum crystals. And it''s the largest of its kind on the planet.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Wind Cave', 'South Dakota', '1/9/1903', 137.5, 615350, 'From the entrance, Wind Cave appears to be nothing but prairie. But, underground, this park is home to an expansive cave. There are more than 140 miles of cave passages, while above ground, more than 28,000 acres of prairie await.')												  																			  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Wrangell-St. Elias', 'Alaska', '12/2/1980', 33682.6, 74518, 'You''ll find no national park in the U.S. as expansive as this one — at 13.2 million acres, Wrangell-St. Elias National Park & Preserve is the largest in America. With this size comes a range of landscapes, including rainforest and frozen tundra.')									  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Yellowstone', 'Wyoming', '3/1/1872', 8983.2, 4020288, 'Though it''s mostly found in Wyoming, Yellowstone spreads into Montana and Idaho as well, and is most famous for being the home of Old Faithful. The geyser earned its name for its predictable eruptions and is certainly captivating, but make sure not to limit yourself to just this star attraction; Yellowstone is home to many incredible geysers.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Yosemite', 'California', '10/1/1890', 3082.7, 4422861, 'Flanked by California''s towering Sierra Nevada mountains and covered in equally impressive sequoia trees, it''s easy to see why Yosemite is one of the country''s most popular parks. Photographer Ansel Adams famously captured Yosemite in a series of black-and-white images, with a focus on its imposing El Capitan and Half Dome granite cliffs.')											  

INSERT INTO [parks] (name, location, establish_date, area, visitors, description) 
VALUES ('Zion', 'Utah', '11/19/1919', 595.9, 4488268, 'Zion National Park is so large and popular that visitors must park and take a shuttle to access it, so as not to create traffic. At its highest point, Zion is 8,726 feet (Kolob Canyon) while at its lowest, it is 3,666 feet (Coal Pits Wash), with an underground spring emerging through the rock surfaces.')

COMMIT;
--SELECT * FROM parks;