ActiveRecord::Base.transaction do
  puts 'Beginning to seed'

  Ideology.destroy_all
  Party.destroy_all
  Senator.destroy_all
  Committee.destroy_all
  CommitteeMembership.destroy_all
  Desk.destroy_all
  Bill.destroy_all
  BillEndorsement.destroy_all

  # ideologies
  Ideology.new(
    name: 'Conservatism',
    direction: 'Right',
    goal: 'retain traditional social institutions').save!(validate: false)
  conservatism = Ideology.last

  Ideology.new(
    name: 'Liberalism',
    direction: 'Left',
    goal: 'balance individual liberty and social justice').save!(validate: false)
  liberalism = Ideology.last

  # parties
  Party.new(
    name: 'Democratic Party',
    color: 'Blue',
    ideology_id: liberalism.id).save!(validate: false)
  democrats = Party.last

  Party.new(
    name: 'Republican Party',
    color: 'Red',
    ideology_id: conservatism.id).save!(validate: false)
  republicans = Party.last

  # senators
  Senator.new(
    fname: 'John',
    lname: 'McCain',
    state: 'AZ',
    party_id: republicans.id).save!(validate: false)
  john = Senator.last

  Senator.new(
    fname: 'Marco',
    lname: 'Rubio',
    state: 'FL',
    party_id: republicans.id).save!(validate: false)
  marco = Senator.last

  Senator.new(
    fname: 'Mitch',
    lname: 'McConnell',
    state: 'KY',
    party_id: republicans.id).save!(validate: false)
  mitch = Senator.last

  Senator.new(
    fname: 'Barbara',
    lname: 'Boxer',
    state: 'CA',
    party_id: democrats.id).save!(validate: false)
  barbara = Senator.last

  Senator.new(
    fname: 'Dianne',
    lname: 'Feinstein',
    state: 'CA',
    party_id: democrats.id).save!(validate: false)
  dianne = Senator.last

  Senator.new(
    fname: 'Elizabeth',
    lname: 'Warren',
    state: 'MA',
    party_id: democrats.id).save!(validate: false)
  elizabeth = Senator.last

  Senator.new(
    fname: 'Harry',
    lname: 'Reid',
    state: 'NV',
    party_id: democrats.id).save!(validate: false)
  harry = Senator.last

  # add party leaders to parties
  republicans.update!(party_leader_id: mitch.id)
  democrats.update!(party_leader_id: harry.id)

  # committees
  Committee.new(
    chairperson_id: elizabeth.id,
    name: 'Finance',
    mandate: 'attend to taxation, debt, and other financial matters').save!(validate: false)
  finance = Committee.last

  Committee.new(
    chairperson_id: marco.id,
    name: 'Foreign Relations',
    mandate: 'lead foreign-policy legislation and debate').save!(validate: false)
  foreign_relations = Committee.last

  # memberships
  CommitteeMembership.new(
    committee_id: finance.id, senator_id: barbara.id).save!(validate: false)
  CommitteeMembership.new(
    committee_id: finance.id, senator_id: dianne.id).save!(validate: false)
  CommitteeMembership.new(
    committee_id: finance.id, senator_id: elizabeth.id).save!(validate: false)
  CommitteeMembership.new(
    committee_id: finance.id, senator_id: john.id).save!(validate: false)

  CommitteeMembership.new(
    committee_id: foreign_relations.id, senator_id: harry.id).save!(validate: false)
  CommitteeMembership.new(
    committee_id: foreign_relations.id, senator_id: john.id).save!(validate: false)
  CommitteeMembership.new(
    committee_id: foreign_relations.id, senator_id: marco.id).save!(validate: false)

  # desks
  Desk.new(model: 'IKEA Office (Oak)', owner_id: john.id).save!(validate: false)
  Desk.new(model: 'Mainstays L-Shaped (Maple)', owner_id: elizabeth.id).save!(validate: false)

  # bills
  Bill.new(title: 'Ban plastic bags.', author_id: dianne.id).save!(validate: false)
  bag_ban = Bill.last

  BillEndorsement.new(bill_id: bag_ban.id, senator_id: barbara.id).save!(validate: false)
  BillEndorsement.new(bill_id: bag_ban.id, senator_id: harry.id).save!(validate: false)
  BillEndorsement.new(bill_id: bag_ban.id, senator_id: mitch.id).save!(validate: false)

  puts 'Finished seeding'
end
