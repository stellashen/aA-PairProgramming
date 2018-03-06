def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
  .select(:title, :id)
  .joins(:actors)
  .where(actors: {name: those_actors})
  .group(:id)
  .having('COUNT(actors.id) >= ?', those_actors.length)
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie
    .select('______ AS decade')

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  movies_with_name = Movie.joins(:actors).where(actors: {name: name}).pluck(:id)

  Actor
    .joins(:movies)
    .where(movies: { id: movies_with_name })
    .where('actors.name != ?', name)
    .distinct
    .pluck(:name)
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .select('COUNT(*)')
    .joins('LEFT OUTER JOIN castings ON actors.id = castings.actor_id')
    .where(castings: {id: nil })
    .pluck('COUNT(*)').first
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"
  letters = whazzername.chars
  letters_without_space = []
  letters.each do |ch|
    letters_without_space << ch unless ch == " "
  end

  # matched_actors = Actor.distinct.pluck(:name)
  #
  # matched_actors.select! { |name| match_names(letters, name) }
  #
  # Movie
  #   .joins(:actors)
  #   .where(actors: { name: matched_actors })

  str = "%"+letters_without_space.join("%")+"%"

end

# def match_names(letters, name)
#   letters.each { |ch| return false unless name.include?(ch)}
#   true
# end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
