# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord

  #define a method to show 1-1 Director => Movie
  def director
    d_id = self.director_id

    matching_directors = Director.where({ :id => d_id })

    the_director = matching_directors.at(0)

    return the_director
  end

  def characters
    # Step 1: get the id of the record in question from the Movie table (1-n showing parent to child)
    my_id = self.id

    # Step 2: pull the corresponding record using the Movie id from the Character table
    matching_characters = Character.where({ :movie_id => my_id })

    # Step 3: return the variable as a result
    return matching_characters

    # Step 4: create the same relationship in the Character table
  end

end
