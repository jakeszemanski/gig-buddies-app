
band_images = ["acoustic.jpg", "acoustic_1.jpg", "acoustic_2.jpg", "rock_1.jpg", "rock_2.jpg", "rock_3.jpg", "xenia_1.jpg", "xenia_2.jpg", "trumpet.jpg"]
venue_images = {"Thalia Hall" => 'thalia_1.jpg', "Schubas" => 'schubas_1.jpg', "Empty Bottle" => 'empty_bottle_1.jpg', "Double Door" => 'double_door_1.jpg', "Lincoln Hall" => 'lincoln_hall_1.jpg', "House of Blues" => 'house_of_blues_1.jpg'}

names = ['Joe', 'Sam', 'Bobby', 'Trevor', 'Jake', 'John', 'Steve']

names.each do |name|
  user = User.new(name: name, email: "#{name}@gmail.com", password: 'password' )
  user.save
end
@users = User.all



bands = ['Twin Peaks', 'Lady Lamb', 'Ode', 'Dawes', 'Meat Wave', 'Bleach Party', 'Dowsing', 'Delta Spirit', 'Speedy Ortiz', 'Modern Baseball', 'Local Natives', 'Arcade Fire', 'Free Throw', 'Diners', 'Cake', 'Built to Spill', 'Ben Folds', 'Andrew WK', 'AJJ', 'Tacocat']

band_description = {'Twin Peaks' => 'As rewarding as it is to discover young artists that bring fresh ideas to new music, it’s still immensely satisfying to hear young rock bands with rich knowledge of the genre’s history, trying their damnedest to capture the energy of old records from a bygone era. Barely out of their teens, Chicago band Twin Peaks burst onto the scene in the early ’10s with garage rock so energetic and earnest that critics carted out obvious comparisons to the Kinks, the Stones, and even the Replacements.',
 'Lady Lamb' => "Lady Lamb the Beekeeper. Aly Spaltro isnt a teenager anymore, but she was when she wrote much of her Lady Lamb the Beekeeper debut, 2013's Ripely Pine. ... Full of nerves and breath and blood, Ripely Pine whipped folk tropes into rock'n'roll rambunctiousness, giving her plenty of space to sound precocious",
 'Ode' => "Ode is a five piece group made out of sticks, strings and memories that stare at them from the past, like sling shots, drawn back, ready to let go any time something goes wrong. But they stick together, bass or no bass, rent or no rent, slowly but surely they are mistaken for a gypsy ensemble that plays rock'n'roll- punk and Bolero ballads, maintaining that yearning and earning just enough so they don't burst in tears when they are exposed to clean cut jib jab joints and late night star dusting. Ode share their dark poems and dreams through an authentic rock vibe, a familiar, yet new wave of melodious tunes that creates a blend of Chicago rock music.",
 'Dawes' => "So far, Dawes has made its name with a sumptuous folk-rock take on classic Americana. You'd barely know it, though, by listening to the band's fifth and latest full-length, We're All Gonna Die. The rolling, pastoral twang that singer-guitarist Taylor Goldsmith has cultivated since Dawes' debut, 2009's North Hills, is evident in bursts and flashes on the new album, but there's something more sprawling here. Through travelogues, story-songs and a literary quality that's been honed to a cutting edge, Goldsmith and his band have crafted their most ambitious record to date.",
 'Meat Wave' => "Meat Wave have snarled their way into hearts and minds across the Chicago punk rock scene in a relatively short period of time, sounding like a more melodic Hot Snakes cross-bred with the amped up vigor of the Marked Men, all while harboring the brooding attitude of Steve Albini-esque noise-punk. On their SideOneDummy debut, Meat Wave live up to the potential they've exhibited to this point, and deliver in Delusion Moon a memorably sinister heaping of punk rock. ",
 'Bleach Party' => "As befits a showcase of frontwomen, every single act boasted a powerful set of lady pipes, but Bleach Party’s Meghan MacDuff stood out even among that impressive crowd, and the band’s sound was as wild and fun as her mini beehive. In an episode of Scooby Doo set at a haunted luau, Bleach Party would be the band onstage. Half the time, I didn’t know whether to mosh or do the twist, but one way or another, this surf-punk act is gonna make you move.",
 'Dowsing' => "During this so-called “emo revival,” few bands have been held up as heroes as often as Chicago, IL’s Dowsing, and perhaps for good reason. After all, their previous LP, 2013’s I Don’t Even Care Anymore, featured the kinds of delicate guitars, plodding drums, and intimate lyrics that defined emo in the ‘90s. Even the record’s hardest hitting parts exhibited a quiet aggression, often the outcome of singer Erik Czaja’s straight, deadpan delivery.",
 'Delta Spirit' => "Nearly a year ago, Delta Spirit told Rolling Stone that they were sick of being pigeonholed in the Americana genre. For the Long Beach, CA rockers’ at the time untitled third album, they planned on incorporating their “love of hip-hop, the ‘90s, progressive production,” finding slow jams “closer to Montell Jordan than Neil Young,” according to multi-instrumentalist Kelly Winrich. His off-the-cuff remark belies how seriously the band takes itself on Delta Spirit. Their new sound augments, with some exceptions, the boisterous twang Delta Spirit established on and has been steadily expanding upon since I Think I’ve Found It in 2006. (Incidentally, the band released its first EP for free when they announced they found the sound they had been looking for on Delta Spirit, further driving home the point.)",
 'Speedy Ortiz' => "Speedy Ortiz’s 2013 debut Major Arcana, Sadie Dupuis crafted her barbed-wire wordplay into wounded callouts of those who had hurt her. Now, she's wielding it like a weapon. Foil Deer, the Massachusetts indie rock traditionalists' sophomore full-length, opens with Dupuis noting on 'Good Neck' that she's good with a knife and she knows when to use it. She takes a lap around the block to cool down—like all good bosses should—before coming back with a world-beating declaration of autonomy on 'Raising the Skate': “I'm chief, not the overthrown/ Captain, not a crony/So if you wanna row, you better have an awfully big boat.'",
 'Modern Baseball' => "Modern Baseball became a popular band writing songs about Facebook and Instagram and emulating the selective communication of those social media platforms: revealing personal minutiae without ever having to be vulnerable. Throughout 2012’s Sports and 2014's You’re Gonna Miss It All, Jake Ewald and Brendan Lukens sang mostly about girls, social insecurity, and punk rock hypocrisy—nothing that the average person in their audience hadn’t experienced themselves.",
 'Local Natives' => "Between their 2010 debut Gorilla Manor and 2013’s Hummingbird, Local Natives garnered a reputation in the indie landscape: dependable, gratifying, though not the most innovative. On Gorilla Manor, their cinematic emotions and soaring harmonies referenced the National’s slow-burning sweep and Fleet Foxes’ wide-eyed, bucolic tumble. With Hummingbird, Local Natives grew up with a more meditative album that dealt with the death of vocalist/keyboardist Kelcey Ayer’s mother. Though the rush of Gorilla Manor was missed, it was hard to knock the maturity and gravity that came with Hummingbird's more gradual revelations.",
 'Arcade Fire' => "It's likely that the first time you heard the Arcade Fire's monstrously anticipated fourth album Reflektor, you were—to borrow a phrase that Win Butler spits out like a bite of bad food during the record's disco-noir title track—staring at a screen. This past Thursday, the band posted to Youtube an 85-minute video which cued up the entirety of the double-album to visuals from Marcel Camus' kaleidoscopic 1959 film Black Orpheus. If something that happens on the internet can be considered An Event, then this certainly was one; in the same moment I saw the band's official tweet announcing it, two people simultaneously instant-messaged me the link. It was late afternoon on the East Coast, lunchtime on the West, and in that moment I did exactly what thousands of other people in those and all other time zones did: Stopped what I was doing, closed some extraneous tabs and programs, and listened. The auto-updating comments became a chronicle of knee-jerk first impressions: fervent gushing (The bassline on 'Joan of Arc' is fucking epic), groan-worthy puns (I can't even reflect how excited this makes me!), and egregious misspellings (I don't understand what all the fuzz is about). This scene would have seemed bizarre—and likely a little sad— to us decades ago, and it's frightening to imagine how quaint it will seem in the future. But this is how a lot of people at this moment in time—the one in which Reflektor was made, and the one it distrustfully interrogates—discover new music: Alone; together.",
 'Free Throw' => "Free Throw is an emo band from Nashville, TN. After releasing two EPs in 2012 and 2013, Those Days Are Gone is their first full-length studio album. Putting the sports-themed band name, frivolous song titles, and Emo Revival typecasting aside, Free Throw has created an album that is as melodically sound as it is emotionally driven. ",
 'Diners' => "Songs about skateboarding are rarely relaxed. Songs like Skate And Destroy, Possessed To Skate, and Skate Or Die make the act of rolling around on four wheels not a leisure activity, but an all-consuming ethos. With Fifteen On A Skateboard, Diners focuses on the light-hearted joy of bombing a hill. The A.V. Club is premiering the song below, which is taken from Three, Diners upcoming album on Asian Man Records due out September 16. On the track Tyler Broderick is found jangling his way through the type of breezy pop song that could be found on a Mac DeMarco record—or, for the old schoolers, something akin to Harry Nilson. 'Fifteen On A Skateboard' paints a vivid picture of youth, where teenagers chase simple pleasures, like the wind in their hair or a two-stair set that’s just begging to be ollied.",
 'Cake' => "When Cake emerged with 1994's Motorcade Of Generosity, the Sacramento band sounded like a fresh-for-the-moment novelty, and certainly not a group likely to be turning out a high-profile fourth album in 2001. After all, the group's sound—the most obvious elements being John McCrea's wry monotone and Vince DiFiore's trumpet—has always been far from versatile. But seven years and several hits later, Cake is following up a million-selling album with Comfort Eagle, which carries on the band's simple but generally winning formula. Cake's past creative low points, like the awkward poetry reading The Distance or the obligatory ironic cover of I Will Survive, have been its biggest hits, so it's nice to hear Comfort Eagle emphasizing poppier, more assured slices of life like Pretty Pink Ribbon, the absurdly catchy Commissioning A Symphony In C, and the vaguely Cars-esque Shadow Stabbing. McCrea still drops the names of consumer products and examines pop-cultural archetypes, following the 90-second Arco Arena (named for Sacramento's corporate sporting facility) with the ambitious title track, a broad and periodically clumsy commentary about brand identity.",
 'Built to Spill' => "Built to Spill albums have themes, but they fit loosely, like the stretched-out tees and flannels Martsch wears onstage. Perfect from Now On was cosmic; Keep It Like a Secret explored miscommunication; There Is No Enemy seemed haunted by personal loss, unspecific but sharply painful. (It doesn’t matter if you’re good or smart/ Goddamn it, things fall apart). Untethered Moon also has a theme, and it’s one he spells out early: I found a place where I know I’ll always be tethered/ And I knew, when I woke up, rock and roll will be here forever, he sings on All Our Songs. On the modest arc traced on Moon’s 10 songs, a diffident soul finds his faith restored and his soul lifted by the music he’s loved his whole life.",
 'Ben Folds' => "Looking through the list of musicians who have acted as judges on singing competition shows, Ben Folds’ name sticks out like a sore thumb. While Pharrell and Nicki Minaj have enjoyed critical acclaim as well as massive commercial success, Folds is more of a quirky nostalgia-bomb. His tenure on NBC’s a cappella show The Sing-Off was unexpected (so is the fact that he’s been replaced by Fall Out Boy’s Patrick Stump, but we’ll save that for another article), but then again, Folds has always had both a strong, charming voice and a pleasant, affable personality. Those two qualities unite every odd choice Folds has made in his career, including his new album, So There. With that voice and that smile, you can swallow (though not necessarily always love) anything Folds releases, even an album recorded in collaboration with a classical ensemble.",
 'Andrew WK' => "It was one of the last great bizarre major label experiments. Coming at a time when the New Rock Revolution was meant to depose nu-metal, it was staunchly anti-intellectual, undeniably a commercial flop, and yet, you've heard it nearly everywhere. A full decade later, Andrew W.K. maintains enough pop culture juice to end up on TV with striking frequency. Musically, I Get Wet started no trends and influenced no one. It's often scoffed at as one of the dumbest records ever made, but I've heard equally compelling and cogent arguments comparing it to Daft Punk's Discovery in how its treats euphoria as an actual musical genre.",
 'AJJ' => "The Phoenix folk-punk outfit formerly known as Andrew Jackson Jihad have spent the last several years turning the page on their past and burying skeletons that no longer resemble the bodies they once wore. This started with 2014’s Christmas Island, an album that frontman Sean Bonnette wrestled into existence after an extended creative drought left him intimately acquainted with his demons. Though not drastically different from the band’s previous material, Christmas Island felt like a new chapter in their long and rocky career. For one, Bonnette’s lyrics had never been stronger, which is to say they had never been quite so personal. A guy who could squeeze heartbreaking poignancy out of a video installation of Linda Ronstadt.",
 'Tacocat' => "The third album by Tacocat starts with a clean garage-rock tribute to discerning X-Files lead Dana Katherine Scully. It's typical for the Seattle four-piece, who mix songs about their love of pop culture—they just did the theme to the Powerpuff Girls reboot—with tirades about periods, pervs, and the patriarchy. Released in 2014, Tacocat's NVM riffed on IM slang for never mind, a reference to the city's most famous sons, and essentially mocked how far we'd veered from Kurt Cobain's future-female ideals. Its vibrant spirit ran on the kind of energy you'd only otherwise get from chugging a giant sports drink before egging someone's house."}

bands.each do |band|
  artist = Band.new(
    name: band,
    description: band_description[band])
  artist.save
end
@bands = Band.all

sites = ['Schubas', 'Lincoln Hall', 'Thalia Hall', 'Empty Bottle', 'Double Door', 'House of Blues']
will_call = ['strict', 'loose']
sites.each do |site|
  venue = Venue.new(
    name: site,
    will_call_policy: will_call.sample.to_s,
    address: 'Chicago',
    image: venue_images[site]
    )
  venue.save
end
@venues = Venue.all

dates = ['2017-01-30', '2017-02-05', '2017-02-04', '2017-01-31', '2017-01-29', '2017-04-20', '2017-06-26', '2017-03-22', '2017-02-01', '2017-02-02', '2017-02-03']
doors = ["5:30pm", "6:00pm", "6:30pm", "7:00pm"]

times = ['7:00pm', "7:30pm", '8:00pm', "8:30pm", '9:00pm']
20.times do
  show = Concert.new(
    doors: doors.sample,
    show: times.sample,
    venue_id: @venues.sample.id,
    date: dates.sample 
    )
  show.save
end
@concerts = Concert.all



compensate = ['a beer', 'free!', 'ticket to another show', 'Venmo me $5', 'A ride to the show', 'future considerations', 'Venmo $30', '$15 or best offer', 'offer something', 'A show poster', 'some merch']
status = ['available', 'unavailable']
compensate.each do |comp|
  tix = Ticket.new(
    status: 'available',
    seller_id: @users.sample.id,
    concert_id: @concerts.sample.id,
    buyer_id: @users.sample.id,
    compensation: comp
    )
  tix.save
end
@tickets = Ticket.all

rev = [
  "Sound was perfect but the sight lines were not great",
  "Horrible sound but at least the drinks were cheap",
  "Blown away, definitely my favorite venue in the city",
  "Love this place! Come here every week!!!",
  "Meh, things are cooler in Brooklyn"
]


rating = [3, 5, 4, 2, 4, 5, 1, 3]
@venues.each do |venue|
  20.times do
    review = Review.new(
      rating: rating.sample,
      description: rev.sample,
      venue_id: venue.id,
      user_id: @users.sample.id
      )
    review.save
  end
end
@reviews = Review.all

@concerts.each do |concert|
  3.times do
    bc = BandConcert.new(
      concert_id: concert.id,
      band_id: @bands.sample.id)
    bc.save
  end
end

10.times do
  uc = UserConcert.new(
    user_id: @users.sample.id,
    concert_id: @concerts.sample.id)
  uc.save
end

puts 'done!'