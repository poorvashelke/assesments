require 'rspec'
require 'movie_sql'

describe "#rain_man_cast" do
  it "1. List 'Rain Man' cast by name" do
    expect(rain_man_cast).to eq([
      {"name"=>"Barry Levinson"},
      {"name"=>"Bonnie Hunt"},
      {"name"=>"Dustin Hoffman"},
      {"name"=>"Jack Murdock"},
      {"name"=>"Jerry Molen"},
      {"name"=>"Lucinda Jenney"},
      {"name"=>"Michael D. Roberts"},
      {"name"=>"Tom Cruise"},
      {"name"=>"Valeria Golino"}
    ])
  end
end

describe "#matt_damon_films" do
  it "2. List Matt Damon films by movie title" do
    expect(matt_damon_films).to eq([
      {"title"=>"All the Pretty Horses"},
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Good Will Hunting"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Rounders"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"Spirit: Stallion of the Cimarron"},
      {"title"=>"Stuck on You"},
      {"title"=>"The Adjustment Bureau"},
      {"title"=>"The Bourne Identity"},
      {"title"=>"The Bourne Ultimatum"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Good Shepherd"},
      {"title"=>"The Informant!"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"The Rainmaker"},
      {"title"=>"The Talented Mr. Ripley"},
      {"title"=>"True Grit"},
      {"title"=>"We Bought a Zoo"}
    ])
  end
end

describe "#matt_damon_supporting_actor_films" do
  it "3. List Matt Damon supporting actor films by title" do
    expect(matt_damon_supporting_actor_films).to eq([
      {"title"=>"Che"},
      {"title"=>"Contagion"},
      {"title"=>"Courage Under Fire"},
      {"title"=>"EuroTrip"},
      {"title"=>"Finding Forrester"},
      {"title"=>"Jersey Girl"},
      {"title"=>"Margaret"},
      {"title"=>"Saving Private Ryan"},
      {"title"=>"The Good Mother"},
      {"title"=>"The Legend of Bagger Vance"},
      {"title"=>"The Majestic"},
      {"title"=>"True Grit"}
    ])
  end
end

describe "#old_films_and_their_star" do
  it "4. List 1906-1908 films and leading stars by movie title" do
    expect(old_films_and_their_star).to eq([
      {"title"=>"After Many Years", "star"=>"Florence Lawrence"},
      {"title"=>"His Wife's Child", "star"=>"Florence Lawrence"},
      {"title"=>"L'Assassinat du Duc de Guise", "star"=>"Henri III"},
      {"title"=>"L'Enfant prodigue", "star"=>"Georges Wague"},
      {"title"=>"Macbeth", "star"=>"William Ranous"},
      {"title"=>"Rescued from an Eagle's Nest", "star"=>"D. W. Griffith"},
      {"title"=>"The Adventures of Dollie", "star"=>"Arthur V. Johnson"},
      {"title"=>"The Fairylogue and Radio-Plays", "star"=>"L. Frank Baum"},
      {"title"=>"The Story of the Kelly Gang", "star"=>"Nicholas Brierley"},
      {"title"=>"The Taming of the Shrew", "star"=>"Florence Lawrence"}
    ])
  end
end

describe "#unknown_actors_2012" do
  it "5. Give the 2012 movie without casting info" do
    expect(unknown_actors_2012).to eq([
      {"id"=>20377, "title"=>"Titanic"}
    ])
  end
end

describe "#biggest_stars" do
  it "6. List actors with >= 26 starring roles (by name)" do
    expect(biggest_stars).to eq([
      {"name"=>"Clint Eastwood", "count"=>26},
      {"name"=>"Robert De Niro", "count"=>26}
    ])
  end
end

describe "#stars_working_with_ben_affleck" do
  it "7. List movies and stars supported by Ben Affleck, by movie title" do
    expect(stars_working_with_ben_affleck).to eq([
      {"title"=>"Armageddon", "name"=>"Bruce Willis"},
      {"title"=>"Boiler Room", "name"=>"Giovanni Ribisi"},
      {"title"=>"Buffy the Vampire Slayer", "name"=>"Kristy Swanson"},
      {"title"=>"Dazed and Confused", "name"=>"Jason London"},
      {"title"=>"Glory Road", "name"=>"Josh Lucas"},
      {"title"=>"Good Will Hunting", "name"=>"Matt Damon"},
      {"title"=>"Hollywoodland", "name"=>"Adrien Brody"}
    ])
  end
end

describe "#busiest_john_travolta_years" do
  it "8. List years in which John Travolta made >2 films" do
    expect(busiest_john_travolta_years).to eq([
      { "yr" => 1998, "count" => 3 }
    ])
  end
end

