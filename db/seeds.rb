# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
GameUser.destroy_all

Avatar.destroy_all
GameUser.destroy_all
Round.destroy_all
Vote.destroy_all
Proposal.destroy_all
Game.destroy_all
User.destroy_all
Question.destroy_all


puts "creating users..."
user_1 = User.create!(
  email: "howard.carter@proton.me",
  password: "password"
)
user_1.save!

user_2 = User.create!(
  email: "godefroy.demontmirail@proton.me",
  password: "password"
)
user_2.save!

user_3 = User.create!(
  email: "maximilien.robespierre@proton.me",
  password: "password"
)
user_3.save!

user_4 = User.create!(
  email: "luke.skywalker@proton.me",
  password: "password"
)
user_4.save!

user_5 = User.create!(
  email: "steven.spielberg@proton.me",
  password: "password"
)
user_5.save!

user_6 = User.create!(
  email: "jules.cesar@proton.me",
  password: "password"
)
user_6.save!

#avatar
puts 'Creating avatars...'

avatar_1 = Avatar.create!(
  name: "nickname_1",
  url: "avatar1",
  user_id: user_1.id
)
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar1.png"))
# avatar_1.photo.attach(io: file, filename: "avatar1.png", content_type: "image/png")
# avatar_1.save!

avatar_2 = Avatar.create!(
  name: "nickname_2",
  url: "avatar2",
  user_id: user_2.id
)
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar2.png"))
# avatar_2.photo.attach(io: file, filename: "avatar2.png", content_type: "image/png")
# avatar_2.save!

avatar_3 = Avatar.create!(
  name: "nickname_3",
  url: "avatar3",
  user_id: user_3.id
)
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar3.png"))
# avatar_3.photo.attach(io: file, filename: "avatar3.png", content_type: "image/png")
# avatar_3.save!

avatar_4 = Avatar.create!(
  name: "nickname_4",
  url: "avatar4",
  user_id: user_4.id
)
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar4.png"))
# avatar_4.photo.attach(io: file, filename: "avatar4.png", content_type: "image/png")
# avatar_4.save!

avatar_5 = Avatar.create!(
  name: "nickname_5",
  url: "avatar5",
  user_id: user_5.id
)
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar5.png"))
# avatar_5.photo.attach(io: file, filename: "avatar5.png", content_type: "image/png")
# avatar_5.save!

avatar_6 = Avatar.create!(
  name: "nickname_6",
  url: "avatar6",
  user_id: user_6.id
)
# file = File.open(Rails.root.join("app/assets/images/avatars/avatar6.png"))
# avatar_6.photo.attach(io: file, filename: "avatar6.png", content_type: "image/png")
# avatar_6.save!

# questions
puts 'Creating questions...'

questions =[
	{"question":"En 1517, lorsque François 1er achète la Joconde, qu'en fait-il?", "answer":"Il la met dans sa salle de bain" },
	{"question":"Qui est l'inventeur de la rustine ?", "answer":"Louis Rustin en 1903"},
	{"question":"En Ethiopie, quelle partie du poulet l'époux réserve-t-il à son épouse ?", "answer":"La peau"},
	{"question":"Le grand écrivain italien Curzio Malaparte avait une manie nocturne. Laquelle ?", "answer":"Il aboyait"},
	{"question":"Pour quelle raison la nomination de Luis Antonio de Borbon au rang de cardinal en 1735 fut-elle remarquable ?", "answer":"Il avait 8 ans"},
	{"question":"Quelle était la particularité de l'avion inventé par l'Américain Mc cready rn 1977 et qui dit la traversée de la Manche ?", "answer":"C'était un avion à pédales"},
	{"question":"Quel animal commun n'est jamais mentionné dans la Bible", "answer":"Le chat"},
	{"question":"En Pologne, que se jette-t-on au visage le jour de Pâques selon la tradition", "answer":"Des verres d'eau"},
	{"question":"Quel est le titre français du célèvre film américain 'High Noon'?", "answer":"Le Train sifflera trois fois"},
	{"question":"Dans la chanson 'Je suis snob' de Boris Vian, à quoi le snob se chauffe-t-il ?", "answer":"Au diamant"},
	{"question":"Dans quelle tenue extravagante Dali fit-il une conférence sur le surréalisme à Londres", "answer":"En scaphandrier"},
	{"question":"Dans 'l'Ecume des jours' de Boris Vian, qu'est ce que le cuisiner attrape dans le lavabo? ", "answer":"Une anguille"},
	{"question":"Quel était l'emblème du roi Louis XII ?", "answer":"Le porc-épic"},
	{"question":"Dans quel pays se trouve la ville de Te Whakatakanga-o-te-ngarehu-o-te-ahi-a-Tamatea ?", "answer":"En Nouvelle-Zélande"},
	{"question":"Dans l'Antiquité romaine, quel ingrédient mélangeait-on avec du miel et du vinaigre pour faire du dentifrice ?", "answer":"Du verre pilé"},
	{"question":"Qu'est-il arrivé de particulier à Luciano Pavarotti lors d'une représentation à l'Opéra de Berlin en 1988 ?", "answer":"Il a été applaudi pendant plus d'une heure"},
	{"question":"Comment s'appelle le nombre 10 puissance 100 ?", "answer":"Googol"},
	{"question":"En 1759, Mr Prunemoyer fait fortune. Que vient-il d'inventer ?", "answer":"Le savon de Marseille"},
	{"question":"Harry Spert, un Américain excentrique a transformé sa Harley-Davidson. A quoi ressemble-t-elle aujourd'hui ?", "answer":"Un hamburger"},
	{"question":"Ce nom d'animal désigne aussi un petit bouton près de la lèvre. De quel mot s'agit-il ?", "answer":"Un babouin"},
	{"question":"Quelle est la capitale de l'État du Dakota du Sud aux États-Unis ?", "answer":"Pierre"},
	{"question":"Quel souvenir d'Égypte Napoléon emportait-il toujours au cours de ses campagnes ?", "answer":"Un scarabée"},
	{"question":"Que représente la toile de Dali intitulée 'Le Sang est plus doux que le miel'?", "answer":"Un âne en décomposition"},
	{"question":"Quels ingrédients étonannts l'humoriste Alfred Jarry versait-il dans son absinthe pour épater ses amis ?", "answer":"De l'encre et du vinaigre"},
	{"question":"Que signifie Mao Tsé-toung en chinois ?", "answer":"Le pinceau des marais du Sud"},
	{"question":"L'Américaine Ellen Church a été la première femme à exercer ce métier. De quelle profession s'agit-il ?", "answer":"Hôtesse de l'air"},
	{"question":"Quel concours folklorique a été remporté avec un lancer de plus de 40 mètres ?", "answer":"Le lancer de camembert"},
	{"question":"Qu'est ce que deux Américains, Stewart et Leder, ont breveté en 1984 ?", "answer":"Une nouvelle race de souris"},
	{"question":"Quel est le nom de l'inventeur du rétroviseur qui date de 1906 ?", "answer":"Le Français Alfred Faucher"},
	{"question":"Quelle partie de notre corps comprend 17 muscles ?", "answer":"La langue"},
	{"question":"Complétez ce proverbe chinois : 'Qui veut devenir dragon doit manger beaucoup de... ?", "answer":"Moquette"},
	{"question":"Quels furent les derniers mots de l'écrivain Paul Valéry ?", "answer":"Quelle connerie !"},
	{"question":"Quel personnage connu est représenté dans le fameux tableau de Dali, 'L'Énigme de Guillaume Tell' ?", "answer":"Lénine"},
	{"question":"Quel mot peut-on lire dans le journal personnel de Louis XVI le 14 juillet 1789 ?", "answer":"le mot 'Rien'"},
	{"question":"Au Vietnam, quel animal les Américains voulaient-ils larguer par avion à leurs troupes pour l'utiliser contre les communistes ?", "answer":"Des éléphants"},
	{"question":"Dans Tintin, la Castafiore se plait à déformer le nom du capitaine Haddock. Comment l'appelle-t-elle dans 'L'affaire Tournesol'? ", "answer":"Paddock"},
	{"question":"Le 2 mars 1982, qu'est ce que les fans de Claude François s'arrachaient aux enchères de Drouot ?", "answer":"Les bouteilles de sa cave"},
	{"question":"En espagnol, l'expression 'Quand les poules auront des dents' se traduit par une expression différente : 'Quand les grenouilles .....'. Complétez ", "answer":"auront des poils"},
	{"question":"En 1993, le gouvernement chinois a officiellement demandé d'en consommer plus. De quoi s'agissait-il ?", "answer":"Des rats"},
	{"question":"Dans quel endroit précis les Américains ont-ils expérimenté la première réaction nucléaire en 1942 ?", "answer":"Dans un stade de football"},
	{"question":"Quel est le nom de l'inventeur du tire-bouchon ?", "answer":"On ne le connaît pas"},
	{"question":"Quelle était la particularité de la pièce suédoise de 10 dalers datant du milieu du XVIIe siècle ? ?", "answer":"Elle pesait plus de 20 kilos"},
	{"question":"Où est situé l'aqueduc de Sylvius ?", "answer":"Dans le cerveau"},
	{"question":"Quels animaux et quel fruit trouve-t-on sur le drapeau des Iles Fidji du Pacifique ?", "answer":"Des bananes, un lion et une colombe"},
	{"question":"Lors de ses mariages, qu'est ce que Charlemagne avait oublié ?", "answer":"Le nom de sa femme"},
	{"question":"Pour guérir la tuberculose de l'Aiglon, qu'est ce que les médecins prescrivaient de mettre dans son bain ?", "answer":"Des tripes"},
	{"question":"Qu'est-ce qui a été créé aux États-Unis en 1792 ?", "answer":"Le dollar"},
	{"question":"Complétez ce vers de Baudelaire : 'Ta gorge qui s'avance et qui pousse la moire / ta gorge qui s'avance est....' ?", "answer":"Une belle armoire"},
	{"question":"Qu'est-ce que Thomas Edison ne supportait pas de voir ?", "answer":"Les montres"},
	{"question":"Comment est mort accidentellement Anacréon, grand poète grec de l'Antiquité ?", "answer":"Il s'est étranglé avec un pépin"},
]
questions.each do |item|
  Question.create(question: item[:question], reponse: item[:answer])
end




# games
puts 'Creating games...'

game_1 = Game.create!(
  name: "La partie X",
  status: "pending",
  user_id: user_1.id
)
game_1.save!

game_2 = Game.create!(
  name: "La partie Y",
  status: "running",
  user_id: user_1.id
)
game_2.save!

game_3 = Game.create!(
  name: "La partie Z",
  status: "finished",
  user_id: user_1.id
)
game_3.save!




# rounds

# puts 'Creating rounds...'

# round_1 = Round.create!(
#   question_id: Question.first.id,
#   game_id: game_2.id
# )
# round_1.save!

# round_2 = Round.create!(
#   question_id: Question.first.id + 1,
#   game_id: game_2.id
# )
# round_2.save!

# round_3 = Round.create!(
#   question_id: Question.first.id + 2,
#   game_id: game_2.id
# )
# round_3.save!

# round_4 = Round.create!(
#   question_id: Question.first.id + 3,
#   game_id: game_2.id
# )
# round_4.save!

# round_5 = Round.create!(
#   question_id: Question.first.id + 4,
#   game_id: game_2.id
# )
# round_5.save!

# round_6 = Round.create!(
#   question_id: Question.first.id + 5,
#   game_id: game_2.id
# )
# round_6.save!

# round_7 = Round.create!(
#   question_id: Question.first.id + 6,
#   game_id: game_2.id
# )
# round_7.save!

# round_8 = Round.create!(
#   question_id: Question.first.id + 7,
#   game_id: game_2.id
# )
# round_8.save!

# round_9 = Round.create!(
#   question_id: Question.first.id + 8,
#   game_id: game_2.id
# )
# round_9.save!

# round_10 = Round.create!(
#   question_id: Question.first.id + 9,
#   game_id: game_2.id
# )
# round_10.save!

# round_11 = Round.create!(
#   question_id: Question.first.id,
#   game_id: game_1.id
# )
# round_11.save!

# round_12 = Round.create!(
#   question_id: Question.first.id + 1,
#   game_id: game_1.id
# )
# round_12.save!

# round_13 = Round.create!(
#   question_id: Question.first.id + 2,
#   game_id: game_1.id
# )
# round_13.save!

# round_14 = Round.create!(
#   question_id: Question.first.id + 3,
#   game_id: game_1.id
# )
# round_14.save!

# round_15 = Round.create!(
#   question_id: Question.first.id + 4,
#   game_id: game_1.id
# )
# round_15.save!

# round_16 = Round.create!(
#   question_id: Question.first.id + 5,
#   game_id: game_1.id
# )
# round_16.save!

# round_17 = Round.create!(
#   question_id: Question.first.id + 6,
#   game_id: game_1.id
# )
# round_17.save!

# round_18 = Round.create!(
#   question_id: Question.first.id + 7,
#   game_id: game_1.id
# )
# round_18.save!

# round_19 = Round.create!(
#   question_id: Question.first.id + 8,
#   game_id: game_1.id
# )
# round_19.save!

# round_20 = Round.create!(
#   question_id: Question.first.id + 9,
#   game_id: game_1.id
# )
# round_20.save!


#game user
game_users_1= GameUser.create!(
  user_id: user_2.id,
  game_id: game_2.id
)

game_users_1= GameUser.create!(
  user_id: user_3.id,
  game_id: game_2.id
)
game_users_1= GameUser.create!(
  user_id: user_4.id,
  game_id: game_2.id
)

game_users_1= GameUser.create!(
  user_id: user_5.id,
  game_id: game_2.id
)

game_users_1= GameUser.create!(
  user_id: user_2.id,
  game_id: game_1.id
)

game_users_1= GameUser.create!(
  user_id: user_3.id,
  game_id: game_1.id
)
game_users_1= GameUser.create!(
  user_id: user_4.id,
  game_id: game_1.id
)

game_users_1= GameUser.create!(
  user_id: user_5.id,
  game_id: game_1.id
)

# puts 'Creating proposals...'

# proposal_1= Proposal.create!(
#   proposal: "blablabla",
#   user_id: user_5.id,
#   question_id: Question.first.id,
#   game_id: game_2.id,
# )

# proposal_2= Proposal.create!(
#   proposal: "blibliblou",
#   user_id: user_4.id,
#   question_id: Question.first.id,
#   game_id: game_2.id,
# )

# proposal_3= Proposal.create!(
#   proposal: "bliblublé",
#   user_id: user_3.id,
#   question_id: Question.first.id,
#   game_id: game_2.id,
# )

# puts 'Creating votes...'

# vote_1= Vote.create!(
#   user_id: user_5.id,
#   proposal_id: proposal_3.id,
# )

# vote_2= Vote.create!(
#   user_id: user_3.id,
#   proposal_id: proposal_2.id,
# )

# vote_3= Vote.create!(
#   user_id: user_4.id,
#   proposal_id: proposal_1.id,
# )
