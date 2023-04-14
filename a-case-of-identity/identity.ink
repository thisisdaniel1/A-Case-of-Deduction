    -> room.startingScene
    
    // helper function to pop the top most element from the list
    === function pop(ref list)
        ~ temp x = LIST_MIN(list)
        ~ list -= x
        // ~ return x
    
    /*
        Knowledge chains
    */
    LIST MaryKnowledge = stepfather, income
    LIST HosmerKnowledge = party
    LIST CaseKnowledge = (none)
    
    === function add(knowledge, x)
        ~ knowledge += x
    
    === room
    
    = startingScene
    You sit opposite Dr. Watson on either side of a fire at Baker Street.
    
    "Holmes, the cases which come to light in the papers are, as a rule, bald enough, and it must be confessed, nether fascinating nor artistic."
    
    * [Take a whiff of your pipe and respond to Watson's jab.]
    
    - "A certain selection and discretion must be used in producing a realistic effect. Depend upon it, there is nothing so unnatural as the commonplace."
    
    Watson smiles and shakes his head. "I can quite understand your thinking so." He reaches down and picks up the morning paper. "Let us put it to a practical test."
    
    * [Examine the newspaper.]
    #background: assets/newspaper.jpg
    - Watson motions with his finger. "Here is the first heading upon which I come. 'A husband's cruelty to his wife.' There is, of course, the other woman, the drink, the push, the blow, the bruise, the sympathetic sister or landlady. The crudest of writers could invent nothing more crude."
    "Indeed, your example is an unfortunate one for your argument."
    * [Continue explaining the Dundas case.]
    - "As it happens, I was engaged in clearing up some small points in connection with it. The husband was a teetotaler, there was no other woman, and the conduct complained of was that he had drifted into the habit of winding up every meal by taking out his false teeth."
    * [Throw your pipe against the wall.]
    - "And hurling them at his wife, which, you will allow, is not an action likely to occur to the imagination of the average story-teller."
    * [Offer Watson your pipe, which is on the ground.]
    - "Take a pinch of snuff, Doctor, and acknowledge that I scored over you in your example."
    As you spoke those words, there was a tap at the door.
    
    Watson gets up. "I'll get that!"
    A boy in buttons entered to announce a large woman with a heavy fur boa round her neck and a broad-brimmed hat in the Duchess of Devonshire fashion.
    
    * [Get up to greet her.]
        You stand up. "Why, if it isn't the Miss Mary Sutherland."
   
    "Oh, Mr. Holmes, I wish you would do as much for me. I'm not rich, but still I have a hundred a year in my own right, and I would give it all to know what has become of Mr. Hosmer Angel."
    
    - (sutherlandHub1)
    
        * *     [Ask about why she wants to talk to you?]
                "Why did you come away to consult me in such a hurry?"
    
                Again a startled look came over the somewhat vacuous face of Miss Mary. "Yes, I did bang out of the house," she said, "for it made me angry to see the easy way in which Mr. Windibank--that is, my father--took it all."
                ~ MaryKnowledge = stepfather
                
        * *     {MaryKnowledge == stepfather}
                [Ask about why her father's name is different from hers]
    
                "Your stepfather, surely, since the name is different."
    
                "Yes, my stepfather. I call him father, though it sounds funny, too, for he is only five years and two months older than myself. For you see, my mother had remarried a man fifteen years her junior."
    
        * *     [Ask about her "little income".]
    
                "It comes from my uncle Ned in Auckland. It is in New Zealand stock, paying 4 1/2 per cent. Two thousand five hundred pounds was the amount, but I can only touch the interest."
    
                "You interest me extremely. I believe that a single lady can get on very nicely upon an income of about 60 pounds."
    
                "I could do with much less than that, Mr. Holmes, but you understand that as long as I live at home I don't wish to be a burden to them, and so they have the use of the money. Of course, that is only while I am staying with them."
                
        * *     {TURNS_SINCE(-> startingScene) > 7} [Ask about Mr. Hosmer Angel.]
                "You have made your position very clear to me. Now kindly tell us now all about your connection with Mr. Hosmer Angel."
    
                A flush stole over Miss Sutherland's face. "I met him first at the gasfitters' ball. Mr. Windibank did not wish us to go. He never did wish us to go anywhere."
    
                She paces to the window. "But this time I was set on going. He said the folk were not fit for us to know, when all father's friends were to be there. At last, when nothing else would do, he went off to France upon the business of the firm. So we went, mother and I, and it was there I met my sweet Hosmer.
                -> room.scene2
        - -     -> sutherlandHub1
    -> DONE
    = scene2
    - (sutherlandHub2)
        * *     [Ask about the party.]
                    
        * *     [Ask about Hosmer's general appearance during the party.]
                        
        * *     [Ask about the ]
        
        - -     -> sutherlandHub2
=== investigation
-> DONE
// = eyeCheck
    
// <- 