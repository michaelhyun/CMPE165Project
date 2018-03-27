hotel_names = [
	"The Pickwick Hotel San Francisco",
	"Santa Clara Marriott",
	"Hotel Nikko San Francisco",
	"Club Quarters Hotel in San Francisco",
	"The Orchard Hotel",
	"Warfield",
	"Kimpton Sir Francis Drake",
	"La Luna Inn",
	"Four Seasons San Francisco",
	"The Embassy Hotel",
	"Best Western The Cartwright Hotel - Union Square",
	"White Swan Inn",
	"The Club Donatello",
	"Grant Plaza Hotel",
	"The Plaza Suites Silicon Valley",
	"Geary Parkway",
	"Triton - San Francisco",
	"The Wharf Inn",
	"Castle Inn San Francisco",
	"Hyatt Regency Santa Clara",
	"Holiday Inn San Francisco-Golden Gateway",
	"The Park Central San Francisco",
	"Nob Hill Motor Inn",
	"JW Marriott San Francisco Union Square",
	"Hotel G San Francisco",
	"Fairmont San Francisco",
	"Via",
	"Cova Hotel",
	"Handlery Union Square",
	"Dwell Club Santa Clara",
	"Orange Village",
	"Loews Regency San Francisco",
	"Courtyard San Francisco Downtown",
	"Hilton San Francisco Union Square",
	"Grand Hyatt San Francisco",
	"Avatar Joie de Vivre",
	"Tilden Hotel",
	"Mystic Hotel",
	"Surf Motel",
	"Inn on Broadway"
 ]

 img_urls = [
	"https://imgio.trivago.com/itemimages/80/68/8068_v8_isq@2x.jpeg","https://imgio.trivago.com/itemimages/77/21/77219_v2_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/51/8051_v10_isq@2x.jpeg","https://imgio.trivago.com/itemimages/58/56/58568_v8_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/55/8055_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/67/57/6757338_isq@2x.jpeg","https://imgio.trivago.com/itemimages/66/84/66843_v14_isq@2x.jpeg","https://imgio.trivago.com/itemimages/15/36/153682_v3_isq@2x.jpeg","https://imgio.trivago.com/itemimages/10/14/101476_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/58/07/58077_v4_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/24/8024_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/74/8074_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/79/36/79366_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/41/8041_v5_isq@2x.jpeg","https://imgio.trivago.com/itemimages/56/17/56171_v2_isq@2x.jpeg","https://imgio.trivago.com/itemimages/12/60/1260277_v5_isq@2x.jpeg","https://imgio.trivago.com/itemimages/61/83/61833_v4_isq@2x.jpeg","https://imgio.trivago.com/itemimages/68/53/68536_v4_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/26/8026_v4_isq@2x.jpeg","https://imgio.trivago.com/itemimages/44/39/443961_v1_isq@2x.jpeg","https://imgio.trivago.com/itemimages/61/75/61755_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/85/60/856026_v1_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/53/8053_v2_isq@2x.jpeg","https://imgio.trivago.com/itemimages/13/54/135419_v2_isq@2x.jpeg","https://imgio.trivago.com/itemimages/31/53/3153268_isq@2x.jpeg","https://imgio.trivago.com/itemimages/79/90/7990_v10_isq@2x.jpeg","https://imgio.trivago.com/itemimages/69/17/6917752_isq@2x.jpeg","https://imgio.trivago.com/itemimages/15/03/150336_v5_isq@2x.jpeg","https://imgio.trivago.com/itemimages/64/08/64085_v7_isq@2x.jpeg","https://imgio.trivago.com/itemimages/64/46/6446104_isq@2x.jpeg","https://imgio.trivago.com/itemimages/13/54/1354882_v1_isq@2x.jpeg","https://imgio.trivago.com/itemimages/66/36/66369_v7_isq@2x.jpeg","https://imgio.trivago.com/itemimages/63/96/63960_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/79/93/7993_v8_isq@2x.jpeg","https://imgio.trivago.com/itemimages/66/83/66830_v8_isq@2x.jpeg","https://imgio.trivago.com/itemimages/67/10/67100_v1_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/35/8035_v6_isq@2x.jpeg","https://imgio.trivago.com/itemimages/66/81/66819_v5_isq@2x.jpeg","https://imgio.trivago.com/itemimages/70/20/70208_v4_isq@2x.jpeg","https://imgio.trivago.com/itemimages/80/23/8023_v6_isq@2x.jpeg"
 ]

 hotel_prices = [
	129 ,
	135 ,
	157 ,
	134 ,
	208 ,
	89 ,
	132 ,
	179 ,
	374 ,
	125 ,
	219 ,
	169 ,
	152 ,
	148 ,
	134 ,
	130 ,
	127 ,
	224 ,
	170 ,
	173 ,
	151 ,
	113 ,
	202 ,
	258 ,
	186 ,
	220 ,
	299 ,
	174 ,
	129 ,
	326 ,
	139 ,
	368 ,
	214 ,
	152 ,
	169 ,
	99 ,
	164 ,
	124 ,
	130 ,
	172
 ]

for i in 0..hotel_names.count()
	hname = hotel_names.at(i)
	iurl = img_urls.at(i)
	hprice = hotel_prices.at(i)
	if hname != nil && iurl != nil && hprice != nil 
		Reservation.create(hotelname: hname, imgurl: iurl, price: hprice)
	end	
end