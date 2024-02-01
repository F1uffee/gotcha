Gotcha ! (an adaptation of the board game Bluffer)

Overview

Gotcha ! is an engaging mobile game developed on the Ruby on Rails framework by a team of four individuals. The game is designed for those who love bluffing and laughter, with a gameplay concept similar to the classic board game Bluffer. Test your wit, creativity, and ability to deceive friends with cleverly crafted false answers.

Gameplay

Gotcha! challenges players to outsmart their opponents by inventing fake answers that are more convincing than the truth. No prior knowledge is needed; just unleash your imagination. The game features original questions and unbelievable answers, encouraging players to think outside the box. Bluff, have a blast, and enjoy the lively atmosphere of this friendly game.

The objective is to trap other participants by creating a fabricated response to each question asked during the five rounds of the game. Each player must vote for the answer they find most accurate. If someone votes for the answer you invented, you earn 2 points. Additionally, if you vote for the correct answer, you gain an extra point. The player with the most points at the end of the game wins.


Application Flow

    Account Creation/Log In
        Users create an account or log in.
        Choose a pseudonym and avatar from the six available options.
        Launch a private game after filling out the necessary information.
        ![Player creation screenshot](https://drive.google.com/file/d/1zj_JSfo61R88WqG4UCMVhfB9MXWSnUd0/view?usp=sharing)

    Lobby
        Invite other players using the "copy to clipboard" button.
        Share the copied link with friends to join the game.
        Participants arrive in the lobby, choosing their pseudonym and avatar.
        A color is automatically assigned to all players.
        No page reloads (thanks to Redis) as players join.
        Click "Start Game" when all participants are present.
        ![Lobby screenshot](https://drive.google.com/file/d/1Ehf2-RxjlRTCIxsTgQ5jz3czHQ23Y9vg/view?usp=sharing)

    Question & player answer
        Display the question.
        Each player invents a response and clicks "Submit My Answer."
        The screen shows "Waiting for other players" until everyone submits.
        Display the voting screen; each player selects the answer they believe is correct.
        The next screen appears only when all players have voted.
        ![Question screenshot](https://drive.google.com/file/d/1wFfEA8PsGYmWIVoQmPIDlyp3-0eIWxQo/view?usp=sharing)

    Results Screen
        Display each player's responses, highlight the correct answer in green, and show each player's vote using colored indicators.
        A timer (represented by a loading bar) counts down before proceeding to the next screen.
        ![Results screenshot](https://drive.google.com/file/d/1jyOuRAb603JQtZTPI6uuQk2eGTzgbTkT/view?usp=sharing)

    Scoreboard
        Display the score of each player.
        Show player cards in descending order of points.
        Award gold, silver, and bronze medals to the top three players.
        ![Scoreboard screenshot](https://drive.google.com/file/d/1Bot8FRH3bEhKVDWi47jiFkSKbdXfBZ64/view?usp=sharing)

    End of Game
        After five rounds, display the final scores with fireworks.
        Include a "Return to Home" button.
        ![End of the game screenshot](https://drive.google.com/file/d/1jC_qN6OFwqZi-QN65Sexga5jZY2x4OTt/view)

Technologies Used

    Ruby
    JavaScript (Stimulus)
    HTML
    SCSS

How to Run Locally

    Clone the repository.
    Install dependencies using bundle.
    Set up the database with rails db:create, rails db:migrate and rails db:seed.
    Start the server with rails s.
    Open the app in your browser at http://localhost:3000.

Contributors

    Antoine Le Floch
    Alice Laurin
    Cécile Adam
    François Lerosier

Acknowledgments

We thank Le Wagon and the board game Bluffer.
