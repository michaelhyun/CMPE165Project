class ReservationsController < ApplicationController
  def new

  end

  def show
      
  end

  def index
      @reservations = Reservation.all
      @listingz = get_listing()
      @hotelz = get_hotelnames()
      @pricez = get_price()
      @listhash = Hash.new
      for i in 0..@listingz.count
        if @hotelz.at(i) != nil && @listingz.at(i) != nil
            #@listhash[ @hotelz.at(i) ] = @listingz.at(i)
            @listhash[ @hotelz.at(i) ] = [ @listingz.at(i), @pricez.at(i) ]
        end
      end      
    end
  
    def get_hotelnames
      @hotelnames = []
      @hotelnames << "The Pickwick Hotel San Francisco"
      @hotelnames << "Santa Clara Marriott"
      @hotelnames << "Hotel Nikko San Francisco"
      @hotelnames << "Club Quarters Hotel in San Francisco"
      @hotelnames << "The Orchard Hotel"
      @hotelnames << "Warfield"
      @hotelnames << "Kimpton Sir Francis Drake"
      @hotelnames << "La Luna Inn"
      @hotelnames << "Four Seasons San Francisco"
      @hotelnames << "The Embassy Hotel"
      @hotelnames << "Best Western The Cartwright Hotel - Union Square"
      @hotelnames << "White Swan Inn"
      @hotelnames << "The Club Donatello"
      @hotelnames << "Grant Plaza Hotel"
      @hotelnames << "The Plaza Suites Silicon Valley"
      @hotelnames << "Geary Parkway"
      @hotelnames << "Triton - San Francisco"
      @hotelnames << "The Wharf Inn"
      @hotelnames << "Castle Inn San Francisco"
      @hotelnames << "Hyatt Regency Santa Clara"
      @hotelnames << "Holiday Inn San Francisco-Golden Gateway"
      @hotelnames << "The Park Central San Francisco"
      @hotelnames << "Nob Hill Motor Inn"
      @hotelnames << "JW Marriott San Francisco Union Square"
      @hotelnames << "Hotel G San Francisco"
      @hotelnames << "Fairmont San Francisco"
      @hotelnames << "Via"
      @hotelnames << "Cova Hotel"
      @hotelnames << "Handlery Union Square"
      @hotelnames << "Dwell Club Santa Clara"
      @hotelnames << "Orange Village"
      @hotelnames << "Loews Regency San Francisco"
      @hotelnames << "Courtyard San Francisco Downtown"
      @hotelnames << "Hilton San Francisco Union Square"
      @hotelnames << "Grand Hyatt San Francisco"
      @hotelnames << "Avatar Joie de Vivre"
      @hotelnames << "Tilden Hotel"
      @hotelnames << "Mystic Hotel"
      @hotelnames << "Surf Motel"
      @hotelnames << "Inn on Broadway"  
    end
  
    def get_listing
      @listings = [] 
       @listings << "https://imgio.trivago.com/itemimages/80/68/8068_v8_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/77/21/77219_v2_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/51/8051_v10_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/58/56/58568_v8_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/55/8055_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/67/57/6757338_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/66/84/66843_v14_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/15/36/153682_v3_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/10/14/101476_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/58/07/58077_v4_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/24/8024_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/74/8074_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/79/36/79366_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/41/8041_v5_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/56/17/56171_v2_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/12/60/1260277_v5_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/61/83/61833_v4_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/68/53/68536_v4_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/26/8026_v4_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/44/39/443961_v1_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/61/75/61755_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/85/60/856026_v1_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/53/8053_v2_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/13/54/135419_v2_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/31/53/3153268_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/79/90/7990_v10_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/69/17/6917752_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/15/03/150336_v5_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/64/08/64085_v7_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/64/46/6446104_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/13/54/1354882_v1_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/66/36/66369_v7_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/63/96/63960_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/79/93/7993_v8_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/66/83/66830_v8_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/67/10/67100_v1_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/35/8035_v6_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/66/81/66819_v5_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/70/20/70208_v4_isq@2x.jpeg"
       @listings << "https://imgio.trivago.com/itemimages/80/23/8023_v6_isq@2x.jpeg"
    end
  
    def get_price
      @prices = []
      @prices << 129
      @prices << 135
      @prices << 157
      @prices << 134
      @prices << 208
      @prices << 89
      @prices << 132
      @prices << 179
      @prices << 374
      @prices << 125
      @prices << 219
      @prices << 169
      @prices << 152
      @prices << 148
      @prices << 134
      @prices << 130
      @prices << 127
      @prices << 224
      @prices << 170
      @prices << 173
      @prices << 151
      @prices << 113
      @prices << 202
      @prices << 258
      @prices << 186
      @prices << 220
      @prices << 299
      @prices << 174
      @prices << 129
      @prices << 326
      @prices << 139
      @prices << 368
      @prices << 214
      @prices << 152
      @prices << 169
      @prices << 99
      @prices << 164
      @prices << 124
      @prices << 130
      @prices << 172
    end

    
end