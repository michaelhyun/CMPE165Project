module HotelHelper
    def helper_get_google_img(jsonitem)
    photo_node = jsonitem['photos']
    ref =  photo_node.first['photo_reference']
    api_key = "&key=AIzaSyAw_tCp8oVeFxIyk7Nb5ZZqKxKnTpiE6yI"
    img = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{ref}#{api_key}"
    end
end
