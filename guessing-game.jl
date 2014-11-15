
function ask_user_for_a_guess()
    print("Please enter an integer:")
    while true
        x = readline()
        try
            y = int(x)
            return y
        catch
            println("Sorry, that wasn't an integer")
        end
    end
end

function ask_user_to_play_again()
    print("Hey, would like like to play another game? (y/n):")
    answer = readline()
    answer = lowercase(strip(answer))[1]
    if answer == 'y'
        return true
    elseif answer == 'n'
        return false
    end
    while true
        print("Please enter either \"yes\" or \"no\":")
        answer = readline()
        answer = lowercase(strip(answer))[1]
        if answer == 'y'
            return true
        elseif answer == 'n'
            return false
        end
    end
end

play = true
while play
    println("""Welcome to the Guessing Game!
            I have a number in mind between 1 and 10 that I need you to guess.""")
    value = rand(1:10)
    guess = ask_user_for_a_guess()
    while true
        if guess > value
            println("Your guess $guess was too high")
        elseif guess < value
            println("Your guess $guess was too low")
        else
            println("Yay! You won!")
            break
        end
        guess = ask_user_for_a_guess()
    end
    play = ask_user_to_play_again()
end

println("Bye!")
