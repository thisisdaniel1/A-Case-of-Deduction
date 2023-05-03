-> room
    
    === room
    
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
    
    
    You smile triumphantly. "And hurling them at his wife, which, you will allow, is not an action likely to occur to the imagination of the average story-teller."
    As you spoke those words, there was a tap at the door.
    
    Watson gets up. "I'll get that!"
    A boy in buttons entered to announce a large woman with a heavy fur boa round her neck and a broad-brimmed hat in the Duchess of Devonshire fashion.
    
    *   [Get up to greet her.]
        You stand up. "Why, if it isn't the Miss Mary Sutherland."
   
        "Oh, Mr. Holmes, I wish you would do as much for me. I'm not rich, but still I have a hundred a year in my own right, and I would give it all to know what has become of Mr. Hosmer Angel."
    
    - (sceneHub)
        * *     (win_option) {win_condition()}
                [Confer to Dr. Watson as to the answer.]
                "Watson, could you give your thoughts as to the current situation?"
        
        * *     (family_questions) [Ask about why she wants to talk to you?]
                "Why did you come away to consult me in such a hurry?"
    
                Again a startled look came over the somewhat vacuous face of Miss Mary. "Yes, I did bang out of the house," she said, "for it made me angry to see the easy way in which Mr. Windibank--that is, my father--took it all."
                
        + +     {family_questions} [Ask about family.]
                "Miss Sutherland, may we discuss your family."
                
                "Why, certainly!"
                -> questionsHub.familyQuestions(-> sceneHub)
    
        * *     (stock_income)[Ask about her "little income".]
                "Your garments would suggest a lofty salary."
                
                "It comes from my uncle Ned in Auckland. It is in New Zealand stock, paying 4 1/2 per cent. Two thousand five hundred pounds was the amount, but I can only touch the interest."
    
                "You interest me extremely. I believe that a single lady can get on very nicely upon an income of about 60 pounds."
    
                "Oh Holmes, you flatter me!
                
        + +     {party_questions && questionsHub.familyQuestions.stepfather} [Ask about the party.]
                "A gasfitters' ball you said?"
                
                "Yes, Mr. Holmes."
                -> questionsHub.partyQuestions(-> sceneHub)
        
        + +     {questionsHub.partyQuestions.windibank_leaving} [Ask about Hosmer.]
                "But how about Mr. Hosmer Angel? Did he he make no attempt to see you?"
                
                "Well let's see..."
                -> questionsHub.hosmerQuestions(-> sceneHub)
        
        * *     (party_questions) [Ask about Mr. Hosmer Angel.]
                "Now kindly tell us now all about your connection with Mr. Hosmer Angel."
    
                A flush stole over Miss Sutherland's face. "I met him first at the gasfitters' ball. Mr. Windibank did not wish us to go. He never did wish us to go anywhere."
    
                She paces to the window. "But this time I was set on going. He said the folk were not fit for us to know, when all father's friends were to be there. At last, when nothing else would do, he went off to France upon the business of the firm. So we went, mother and I, and it was there I met my sweet Hosmer.
        - -     -> sceneHub
    -> DONE

        
    === questionsHub
    
    = familyQuestions(-> return_divert)
    - (familyQuestionsHub)
        * *     (stepfather) [Ask about why her father's name is different from hers.]
                #IMAGE: assets/stepfather.jpg
                "Windibank's your stepfather, surely, since the name is different."
    
                "Yes, my stepfather. I call him father, though it sounds funny, too, for he is only five years and two months older than myself. For you see, my mother had remarried a man fifteen years her junior."
                
        * *     (windibank_business) {windibank_leaving && stepfather}
                [Ask about Windibank's firm.]
                "And your stepfather, for whom does he work for?"
                
                "He is but a humble traveler in wines, and often has business in France with the firm's Bordeaux office."

        * *     (firm_notincome) {room.stock_income && windibank_business}
                [Ask if the firm forms most of her family's income?]
                "This firm of his, does it form the better part of your family's maintenance?"
                
                "Oh why no! You must understand that as long as I live at home I don't wish to be a burden to them."
                
                "And so you make do with your stock."
        
                "Of course, that is only while I am staying with them."
                
                "Hmm...interesting."
        
        
        
        * *     (family) {stepfather}
                [Ask if she has any siblings.]
                "Do you have any other familial relations?"
                
                "I have a brother, Mr. Holmes. He has been distant as of late, but I consider myself close to him."
                
        * *     (brother) {family}
                [Ask about her brother.]
                "You mentioned you considered yourself close to your brother, could you tell me more about him?"
                
                "He's a quiet boy and I his closest confidant, though even some secrets are too closed up in his heart. 
                
        * *     (secret_confidant) {brother}
                [Ask about this secret confidant.]
                "So you consider yourself closely intimated with him, but still suspect he might be harbouring a secret love?"
                
                "Heavens no! He could never have found someone he loves."
                
                "Hmm...perhaps."
                
        * *     (party_dress2) {party_dress && brother}
                [Ask more about the brother's role with the party dress.]
                "I remember you telling me the dress you wore the night of the party was given by your brother. Any idea why?
                
                "After I put it on, he said I reminded him of someone he loved dearly."
                
        * *     (secret_lover) {party_dress2 && secret_confidant}
                [Inquire more to the dress' origins.]
                "Your brother said you reminded him of someone he loved, right?"
                
                "I suppose it's fine to tell you now. A few months ago, a girl my brother had known since childhood had passed away. This dress was hers, she would want me to have it."
                
        + +     [Ask About Something Else.]
                # CLEAR
                "If you would excuse me. I would like to ask about another matter."
        
                "Ask away."
                -> return_divert
                
        - -     -> familyQuestionsHub
    = partyQuestions(-> return_divert)
    - (partyQuestionsHub)
        * *     (windibank_leaving) [Ask why does Windibank not let you out?]
                "Pray tell, why does your stepfather not permit your outing?"
                
                She paces to the window. "He said the folk were not fit for us to know, when all father's friends were to be there. At last, when nothing else would do, he went off to France upon the business of the firm. So we went, mother and I, and it was there I met my sweet Hosmer."
                
        * *     (windibank_abrupt_leaving) {windibank_leaving}
                [Before the ball, did he announce his leaving in advance?]
                "Ah, but had he known beforehand?"
                
                "No, the firm had recalled him on urgent business."
                
                "How intriguing."
                
        * *     (windibank_happy) {windibank_leaving}
                [Ask about Windibank's response when he got back.]
                "I suppose then, he was very annoyed at having discovered your adventure."
                
                "Oh, well, he was very good about it. He laughed, I remember, and shrugged his shoulders."
                
                "I see."
                
        * *     (date_of_party) [Ask when the party was.]
                "And how recent was this ball?"
                
                "It is been but five fortnights."
                
        * *     (party_locale) [Ask what did the party look like.]
                "The chosen venue, could you perhaps describe it for me."
                
                My father's friends are not wealthy you see. The location was the Milligan House Gardens south on Kensington Plaza.
                
                When my party reached it, much on the place was full but we found a corner where we could converse.
                
        * *     (party_dress) [Ask what she was wearing during the party.]
                "What about your dress that evening?"
                
                "I must have worn my usual Kentish garments, you must understand I don't go out much. I believe my brother had given it to me seven fortnights ago."
                
        * *     (attendance) {windibank_leaving}
                [Ask who else was there.]
                "I understand that Mr. Angel would be there. But who else would have been in attendence?"
                
                "I believe I saw both my brother. And of course mother!"
                
        * *     (brother_party) {attendance}
                [Ask what her brother was doing at the party.]
                "Your brother, did you have much contact with him?"
                
                "Oh yes, he left to join someone. I haven't the faintest idea who or why!"
                
        + +     [Ask About Something Else.]
                # CLEAR
                "If you would excuse me. I would like to ask about another matter."
                
                "Ask away."
                -> return_divert
                
        - -     ->partyQuestionsHub
    = hosmerQuestions(-> return_divert)
    - (hosmerQuestionsHub)
        * *     (first_contact) [Ask about her contacts with Hosmer.]
                "And could you describe your first contact with this gentleman?"
                
                "Yes, sir. I met him that night, and he called next day to ask if we had got home all safe."
                
        * *     (walks) {first_contact} [Ask about what she did with Hosmer.]
                "What do you two do together after the party?"
        
                "Not much. After the party, me and Hosmer went for walks in the evening. And by that point we were engaged. But after that father came back again, and Mr. Hosmer Angel could not come to the house any more."
                
        * *     (appearance) {walks} [Ask what Hosmer wore during the walks.]
                "And what did this gentleman wear?"
                
                "He was always well dressed, very neat and plain, and he wore tinted glass against the glare."
                
        * *     (walks_time) {walks} [Ask when at what time these walks happened.]
                "At what time, did you go on these excursions."
        
                "He would rather walk with me in the evening than in the daylight, for he said he hated to be conspicuous."
                
                "How fascinating..."
        
        * *     (letter_writing) {walks} [Ask she did when father was home.]
                "But how about Mr. Hosmer Angel? Did he make no attempt to see you?"
                    
                "Well, father was going off to France again in a week, and Hosmer wrote that it would be safer to not see each other until he had gone. We could write in the meantime, and he used to write every day."
                
        * *     (letters_work) {letter_writing} [Ask where she sent the letters?]
                "I presume this applies to you as well. In that case, where did you address them?"
                
                "Oh, to his place of employment."
                
        * *     (interest) {first_contact} [Ask why she's so interested in Hosmer.]
                "What exactly draws your interest in Mr. Angel?"
                    
                "As I used to say to mother, a woman wants her own circle to begin with, and I had not got mine yet."
                    
                She walks over to the ashtray and draws a cigar. "And he always seemed like such a kind man."
                    
        * *     (no_handouts) {interest} [Ask what she means by "kind"]
                "You mentioned he was "kind", could you elaborate on that?"
                    
                "He was a very shy man, Mr. Holmes. Very retiring and gentlemanly. He was always well dressed, very neat and plain, and he wore tinted glasses against the glare.
            
    
        
        * *     (workplace) [Ask about where Hosmer works.]
                "Where does this fellow find employment?"
                
                "Hosmer was a cashier in an office in Leadenhall Street."
                
        * *     (what_office) {workplace} "What office?"
        
                "That's the worst of it, Hr. Holmes, I don't know."
        
                "Where did he live, then?"
                
                "He slept on the premises."
                
                "And you don't know his address?"
                
                "No, except that it was Leadenhall Street."
                
        * *     (missing_office) {what_office && letters_work} [Ask where she addressed her letters to Hosmer.]
                "Where did you address your letters, then?"
                
                "To the Leadenhall Street Post Office, to be left till called for. He said that he would be chaffed by all the other clerks about having letters from a lady."
                
        * *     (no_letters) {missing_office}
                [Ask why couldn't she have typewritten them.]
                "If he was afraid on seeing your name or hand on the letters, why not typewrite them."
                
                "Well, I did offer to typewrite them, like he did his, but he wouldn't have that, for he said that when I wrote them they seemed to come from me, but when they were typewritten he always felt that the machine had come between us. That will just show you how found he was of me, Mr. Holmes, and the little things that he would think of."
                
                "It was most suggestive."
                
        * *     (windibank_leaves_again) {walks}
                [Ask what happened when Mr. Windibank left again.]
                "Well, and what happened when Mr. Windibank, your stepfather, returned to France?"
                
                "Mr. Hosmer Angel came to the house again and proposed that we should marry before father came back. He was in dreadful earnest and made me swear, hands on the Testament. Mother was all in his favour from the first and strangely even fonder than I was. I began to ask about father, but they both said never to mind about father."
                
                She stared straight at you. "I didn't quite like that, Mr. Holmes. I didn't want to do anything on the sly, so I wrote to father at their French offices.
                
        * *     (wedding) {windibank_leaves_again}
                [Ask about the wedding.]
                "Your wedding was arranged then, for the Friday. Was it to be in church?"
                
                "Yes, sir, but very quietly. It was to be at St. Saviour's, near King's Cross. Hosmer came for us, me and mum, in a hansom, and stepped himself into the four-wheeler behind us. We got to the church first, and when the four-wheeler, drove up we waited for him to step out, but he never did.
                
        * *     (missing_groom) {wedding} [Ask what happened to Hosmer.]
                "And next?"
                
                "The cabman said that he could not imagine what had become of him, for he had seen him get in with his own eyes. That was last Friday, Mr. Holmes, and I have never seen or heard anything since.
                
        * *     (lone_cab) {missing_groom}
                [Ask why didn't someone see him disappear.]
                "Did anyone see your procession?"
                
                "No, we happened to be the only cabs in the street."
                
        * *     (strange_talk) {missing_groom}
                [Question Hosmer's motives.]
                "It seems to me that you have been very shamefully treated."
                
                "Oh, no, sir! He was too good and kind to leave me so. Why, all the morning he was saying to me that, whatever happened, I was to be true; and that I was always to remember that I was pledged to him, and that he would claim his pledge sooner or later."
                
        * *     (father_response) {missing_groom}
                "And your father? What did he say?"
                
                "He seemed to think, with me, that something had happened, and that I should hear of Hosmer again. As he said, what interest could anyone have in bringing me to the doors of the church, and then leaving me? And yet, what could have happened? And why could he not write? Oh, it drives me half-mad to think of it." She pulls a little handkerchief out and began to sob heavily into it.
                
                "Let the whole incident be a sealed book, and do not allow it to affect your life."
                
                "You are very kind, Mr. Holmes, but I cannot do that. I shall be true to Hosmer. He shall find me ready when he comes back."
                
                She made a final bow and went her way, with a promise to come again whenever she might be summoned.
                
        * *     (missed_letter) {windibank_leaves_again}
                [Ask what happened to her letter to "father".]
                "And what happened to this letter of yours?"
                
                "The letter came back to me the very morning of the wedding."
                
                "It missed him, then?"
                
                "Yes, sir; for he had started to England just before it arrived."
                
        + +     [Ask About Something Else.]
                # CLEAR
                "If it suits you, I am now ready to tackle a new topic."
                
                "Please continue."
                -> return_divert
                
        - -     ->hosmerQuestionsHub
    -> DONE
    
    === function win_condition
            ~ temp x = 0
    
            {
                - questionsHub.familyQuestions.secret_lover:
                    ~ x++
                - questionsHub.familyQuestions.firm_notincome:
                    ~ x++
                - questionsHub.partyQuestions.windibank_abrupt_leaving:
                    ~ x++
                - questionsHub.hosmerQuestions.no_handouts:
                    ~ x++
                - questionsHub.hosmerQuestions.walks_time:
                    ~ x++
                - questionsHub.hosmerQuestions.missing_office:
                    ~ x++
                - questionsHub.hosmerQuestions.no_letters:
                    ~ x++
                - questionsHub.hosmerQuestions.missed_letter:
                    ~ x++
                - questionsHub.hosmerQuestions.strange_talk:
                    ~ x++
            }
            
            // need to have seen at least 3 of the "win" choices
            {x > 3:
                ~ return true
            }
            
            
            
            
            
    