# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  movie_id   :integer
#
class Character < ApplicationRecord
  def movie
    # Step 1: define the record of the character in question to a variable (1-n showing child to parent)
    my_movie_id = self.id

    # Step 2: search through the movie table for record with the same character id, this give you all the details
    matching_movies = Movie.where({ :id => my_movie_id })

    # Step 3: since the above returns a relation, use .at(0) method to return the first record
    the_movie = matching_movies.at(0)

    # Step 4: return the movie as a result
    return the_movie
  end

  def actor
    my_actor_id = self.id

    matching_actors = Actor.where({ :id => my_actor_id })

    the_actor = matching_actors.at(0)

    return the_actor
  end
end
