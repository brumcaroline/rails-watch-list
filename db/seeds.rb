require 'open-uri'
require 'json'

# DELETES EXISTING RECORDS
print 'Deleting existing Bookmarks...'
Bookmark.destroy_all
puts ' ...deleted!'
print 'Deleting existing Movies...'
Movie.destroy_all
puts ' ...deleted!'
print 'Deleting existing Lists...'
List.destroy_all
puts ' ...deleted!'

print 'Get top rated movies from API...'
top_url = 'http://tmdb.lewagon.com/movie/top_rated'
top_serialized = URI.open(top_url).read
top_movies = JSON.parse(top_serialized)
puts '... received!'

print 'Creating top movies...'
top_movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average'].to_f

  Movie.create!(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
puts ' ...created!'


# Movie.create!(
#   title: "Wonder Woman 1984",
#   overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s",
#   poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
#   rating: 6.9
#   )

# Movie.create!(
#   title: "Justice League",
#   overview: "Fuelled by his restored faith in humanity and inspired by Superman's selfless act, Bruce Wayne and Diana Prince assemble a team of metahumans consisting of Barry Allen, Arthur Curry and Victor Stone to face the catastrophic threat of Steppenwolf and the Parademons who are on the hunt for three Mother Boxes on Earth.",
#   poster_url: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/eifGNCSDuxJeS1loAXil5bIGgvC.jpg",
#   rating: 6.2
#   )

# Movie.create!(
#   title: "Batman V Superman: Dawn of Justice",
#   overview: "Fearing the actions of a god-like Super Hero left unchecked, Gotham City’s own formidable, forceful vigilante takes on Metropolis’s most revered, modern-day savior, while the world wrestles with what sort of hero it really needs. And with Batman and Superman at war with one another, a new threat quickly arises, putting mankind in greater danger than it’s ever known before.",
#   poster_url: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/5UsK3grJvtQrtzEgqNlDljJW96w.jpg",
#   rating: 5.9
#   )

# Movie.create!(
#   title: "The Shawshank Redemption",
#   overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
#   rating: 8.7
#   )

# Movie.create!(
#   title: "Titanic",
#   overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg",
#   rating: 7.9
#   )

# Movie.create!(
#   title: "Ocean's Eight",
#   overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg",
#   rating: 7.0
#   )


# puts 'Done!'
