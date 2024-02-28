.386



.model flat, stdcall



option casemap :none



include \masm32\include\windows.inc



include \masm32\include\kernel32.inc



include \masm32\include\masm32.inc



includelib \masm32\lib\kernel32.lib



includelib \masm32\lib\masm32.lib

.data
    Y1S1 db 10,10,8,32,"1st Year/1st Sem",0 
    C11 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0    
    S111 db 10,8,32,"[1]GE1             3.0             UNDERSTANDING THE SELF",0,51
    S112 db 10,8,32,"[2]GE2             6.0             PURPOSIVE COMMUNITY W/ INTERACTIVE LEARNING",0,51
    S113 db 10,8,32,"[3]PSY 111         3.0             INTRODUCTION TO PSYCHOLOGY",0,51
    S114 db 10,8,32,"[4]BIO 204/L       5.0             BIOLOGICAL SCIENCE",0,51
    S115 db 10,8,32,"[5]PSY112/L        5.0             PSYCHOLOGICAL STATISTICS",0,51
    S116 db 10,8,32,"[6]GPE 1           2.0             MOVEMENT ENHANCEMENT",0,51
        
    Y1S2 db 10,10,8,32,"1st Year/2nd Sem ",0
    C12 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S121 db 10,8,32,"[1]UGE 1           6.0             READING COMPREHENSION                                         GE 2",0
    S122 db 10,8,32,"[2]GE 4            3.0             MATHEMATICS IN THE MODERN WORLD",0
    S123 db 10,8,32,"[3]PSY 121         3.0             DEVELOPMENTAL PSYCHOLOGY                                      PSY 111",0
    S124 db 10,8,32,"[4]BIO 202/L       5.0             GENETICS, EVOLUTION AND DIVERSITY                             BIO 204/L",0
    S125 db 10,8,32,"[5]PSY 123         6.0             THEORIES OF PERSONALITY                                       PSY 111",0
    S126 db 10,8,32,"[6]GPE 2           2.0             FITNESS EXERCISES                                             GPE 1",0

    Y1S db 10,10,8,32,"1st Year/SUMMER ",0
    C1S db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S1S1 db 10,8,32,"[1]GE 3            3.0             THE CONTEMPORARY WORLD",0
    S1S2 db 10,8,32,"[2]PSY 122         3.0             CULTURE AND PSYCHOLOGY                                        PSY 111",0
    S1S3 db 10,8,32,"[1]PSY 212         3.0             GROUP DYNAMICS                                                PSY123",0

    Y2S1 db 10,10,8,32,"2nd Year/1st Sem ",0
    C21 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S211 db 10,8,32,"[1]PSY 211         3.0             PHYSIOLOGICAL/BIOLOGICAL PSYCHOLOGY                           PSY 123",0
    S212 db 10,8,32,"[2]PSY 213/L       5.0             EXPERIMENTAL PSYCHOLOGY                                       PSY 112/L",0
    S213 db 10,8,32,"[3]PSY 214         3.0             COGNITIVE PSYCHOLOGY                                          PSY 121 ,PSY 123",0
    S214 db 10,8,32,"[4]PSY 222         6.0             ABNORMAL PSYCHOLOGY                                           PSY123",0
    S215 db 10,8,32,"[5]CHEM 201/L      5.0             GENERAL INORGANIC CHEMISTRY 1                                 BIO 202/L",0
    S216 db 10,8,32,"[6]GPE 3           2.0             PHYSICAL ACTIVITIES TOWARDS HEALTH & FITNESS                  GPE 2",0

    Y2S2 db 10,10,8,32,"2nd Year/2nd Sem ",0
    C22 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S221 db 10,8,32,"[1]GE 15           3.0             ENVIRONMENTAL SCIENCE",0
    S222 db 10,8,32,"[2]CN 112/L        5.0             BIOCHEMISTRY                                                  CHEM 201/L",0
    S223 db 10,8,32,"[3]PSY 225         6.0             INDUSTRIAL/ORGANIZATIONAL PSYCHOLOGY                          PSY 212",0
    S224 db 10,8,32,"[4]PSY 221/L       5.0             FIELD METHODS IN PSYCHOLOGY                                   PSY 213/L",0
    S225 db 10,8,32,"[5]PSY 224         3.0             SOCIAL PSYCHOLOGY                                             PSY 213/L",0
    S226 db 10,8,32,"[6]GPE 4           2.0             PHYSICAL ACTIVITIES TOWARDS HEALTH & FITNESS                  GPE 3",0

    Y3S1 db 10,10,8,32,"3rd Year/1st Sem ",0
    C31 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S311 db 10,8,32,"[1]GE 20           3.0             READING VISUAL ARTS",0
    S312 db 10,8,32,"[2]GE 8            3.0             READINGS IN PHILIPPINE HISTORY",0
    S313 db 10,8,32,"[3]UGE 2           3.0             TECHNICAL WRITING AND DISCIPLINE",0
    S314 db 10,8,32,"[4]GE 5            3.0             SCIENCE, TECHNOLOGY AND SOCIETY",0
    S315 db 10,8,32,"[5]PSY 311         3.0             INTRODUCTION TO COUNSELING                                    PSY 222",0
    S316 db 10,8,32,"[6]PSY 312/L       5.0             PSYCHOLOGICAL ASSESSMENT                                      PSY 222",0
    S317 db 10,8,32,"[5]PSY 313         3.0             RESEARCH IN PSYCHOLOGY 1                                      PSY 221/L",0
    S318 db 10,8,32,"[6]NSTP 1          3.0             NATIONAL SERVICE TRAINING PROGRAM 1",0

    Y3S2 db 10,10,8,32,"3rd Year/2nd Sem ",0
    C32 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S321 db 10,8,32,"[1]PSY 321         6.0             RESEARCH IN PSYCHOLOGY 2                                      PSY 313",0
    S322 db 10,8,32,"[2]PSY 322         3.0             COMMUNITY HEALTH PSYCHOLOGY                                   PSY 224",0
    S323 db 10,8,32,"[3]PSY 323         3.0             INTRODUCTION TO CLINICAL PSYCHOLOGY                           PSY 311",0
    S324 db 10,8,32,"[4]PSY 324         3.0             EDUCATIONAL PSYCHOLOGY                                        PSY 224",0
    S325 db 10,8,32,"[5]GE 6            3.0             RIZAL'S LIFE AND WORKS",0
    S326 db 10,8,32,"[6]NSTP 2          3.0             NATIONAL SERVICE TRAINING PROGRAM 2                           NSTP 1",0

    Y4S1 db 10,10,8,32,"4th Year/1st Sem ",0
    C41 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S411 db 10,8,32,"[1]GE 11           3.0             THE ENTREPRENEURIAL MIND",0
    S412 db 10,8,32,"[2]GE 7            3.0             ART APPRECIATION",0
    S413 db 10,8,32,"[3]GE 9            3.0             ETHICS (Disciplinal)",0
    S414 db 10,8,32,"[4]CAED 500C       3.0             CAREER AND PERSONALITY DEVELOPMENT                            4th Year Standing",0
    S415 db 10,8,32,"[5]PSY 326         3.0             PRACTICUM IN PSYCHOLOGY                                       PSY 321 ,PSY 323 ,PSY 312/L ,PSY 322 ,PSY 324",0

    Y4S2 db 10,10,8,32,"4th Year/2nd Sem ",0
    C42 db 10,8,32,"   Title           Unit            Description                                                   PRE-REQUISITES",0
    S421 db 10,8,32,"[1]PSY 500         3.0             PSYCHOLOGICAL TESTING/ASSESSMENT                              Graduating PSY 326",0
    S422 db 10,8,32,"[2]PSY 501         3.0             ABNORMAL PSYCHOLOGY                                           Graduating PSY 326",0
    S423 db 10,8,32,"[3]PSY 502         3.0             THEORIES OF PERSONALITY                                       Graduating PSY 326",0
    S424 db 10,8,32,"[4]PSY 503         3.0             INDUSTRIAL/ORGANIZATIONAL PSYCHOLOGY                          Graduating PSY 326",0

.data?

.code

    start:

          invoke ClearScreen

          invoke ExitProcess,0

end start
