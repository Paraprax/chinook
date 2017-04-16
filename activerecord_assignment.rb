### Active Record Query Interface Assignment

### Provide one or more Active Record queries that retrieve the requested data
### below each of the following questions:


# 1a) Find the genre with the name "Hip Hop/Rap".
genre = Genre.find_by(name: "Hip Hop/Rap")


# 1b) Count how many tracks belong to the "Hip Hop/Rap" genre

track = Track.where("genre_id = ?", '17').count

# 2) Find the total amount of time required to listen to all the tracks in the database.

Track.sum(:milliseconds) #answer = 1378575827ms = 22976 minutes

# 3a) Find the highest price of any track that has the media type "MPEG audio file".

Track.where(media_type_id: MediaType.find_by(name: 'MPEG audio file')).order(unit_price: :desc).limit(1).first.unit_price

#answer = 0.99e0 .... but that's the price of like every track so....

# 3b) Find the name of the most expensive track that has the media type "MPEG audio file".

Track.where(media_type_id: MediaType.find_by(name: 'MPEG audio file')).order(unit_price: :desc).limit(1).first.name

#answer "Put The Finger On You"

# 4) Find the 2 oldest artists.

Artist.order(created_at: :asc).limit(2)

#answer = "Les Arts Florissants & William Christie" and "Baby Consuelo", in terms of how long ago their entries were created

### Stretch Exercise (Active Record Query Interface)


# 1) Find all the albums whose titles start with B.

Album.where('title ilike ?', 'B%')
