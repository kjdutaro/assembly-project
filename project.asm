.386



.model flat, stdcall



option casemap :none

include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\masm32.inc

includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\masm32.lib


.data
    ;Header
    mh1 db 10,"|                                        University of Mindanao                                       |",0
    mh2 db 10,"|                                College of Arts and Sciences Education                               |",0
    mh3 db 10,"|                                          BS in Psychology                                           |",10,0

    ;Menu
    mp1 db 10,"[1] View all subject",0
    mp2 db 10,"[2] View subjects by year and sem",0
    mp3 db 10,"[3] Enroll",0
    mp4 db 10,"[4] Exit",10,0
    choiceprompt db "Your choice:",10,0
    cursor db 10,"=> ",0
    menuseparator db 10,"______________________________________________________________________________________________________",10,0

    ;Enroll Prompts
    semesterprompt db 10,"Enter semester: ",9,0
    yearprompt db 10,"Enter year: ",9,0
    subjectprompt db 10,"Enter title # to enlist (Type 'X' if done): ",9,0
    enlistedsubjects db 10,10,"Enlisted Subjects:",9,10,0

    ;Student Info Prompt
    nameprompt db 10,"Student Name: ",9,0
    idprompt db 10,"ID Number: ",9,0
    displayname db "Name: ",9,0
    displayid db 10,"ID: ",9,0

    invalidInput db 10,"Invalid Input",9,0


    ;Navigation Prompt
    backprompt db 10,10,"Go back? [Y] ",9,0
    confirmprompt db 10,10,"Do you confirm? [Y/N] ",9,0
    continueprompt db 10,10,"Do you wish to proceed to the enrollment? [Y/N] ",9,0
    finalprompt db 10,10,"Submit final? [Y/N] ",9,0
    
    separator db 10,"======================================================================================================",0
    Y1S1 db 10,10,8,32,"1st Year/1st Sem",0 
    C11 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0    
    S111 db 10,8,32,"[1]GE 4            3.0",9,9,"MATHEMATICS IN THE MODERN WORLD",51,0
    S112 db 10,8,32,"[2]GE 1            3.0",9,9,"UNDERSTANDING THE SELF",51,13,0
    S113 db 10,8,32,"[3]GE 2            6.0",9,9,"PURPOSIVE COMMO W/ INTERACTIVE LEARNING",51,0
    S114 db 10,8,32,"[4]PSY 111         3.0",9,9,"INTRODUCTION TO PSYCHOLOGY",51,0
    S115 db 10,8,32,"[5]BIO 204/L       5.0",9,9,"BIOLOGICAL SCIENCE",51,0
    S116 db 10,8,32,"[6]PSY 112/L       5.0",9,9,"PSYCHOLOGICAL STATISTICS",51,0
    S117 db 10,8,32,"[7]PAHF 1          2.0",9,9,"MOVEMENT COMPETENCY TRAINING",51,0

        
    Y1S2 db 10,10,8,32,"1st Year/2nd Sem ",0
    C12 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S121 db 10,8,32,"[1]UGE 1           6.0",9,9,"READING COMPREHENSION                                 GE 2",51,0
    S122 db 10,8,32,"[2]GE 3            3.0",9,9,"THE CONTEMPORARY WORLD",0
    S123 db 10,8,32,"[3]PSY 124         6.0",9,9,"DEVELOPMENTAL PSYCHOLOGY                              PSY 111",51,0
    S124 db 10,8,32,"[4]BIO 202/L       5.0",9,9,"GENETICS, EVOLUTION AND DIVERSITY                     BIO 204/L",51,0
    S125 db 10,8,32,"[5]GE 15           3.0",9,9,"ENVIRONMENTAL SCIENCE",0
    S126 db 10,8,32,"[6]PAHF 2          2.0",9,9,"EXERCISE-BASED FITNESS ACTIVITIES                     PAHF 2",51,0

    Y1S db 10,10,8,32,"1st Year/SUMMER ",0
    C1S db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S1S1 db 10,8,32,"[1]GE 8            3.0",9,9,"READINGS IN PHILIPPINE HISTORY",0
    S1S2 db 10,8,32,"[2]PSY 125         3.0",9,9,"THEORIES OF PERSONALITY                               PSY 111",0
    S1S3 db 10,8,32,"[3]PSY 212         3.0",9,9,"GROUP DYNAMICS                                        PSY 123",0,13

    Y2S1 db 10,10,8,32,"2nd Year/1st Sem ",0
    C21 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S211 db 10,8,32,"[1]GE 5            3.0",9,9,"SCIENCE, TECHNOLOGY, AND SOCIETY",0
    S212 db 10,8,32,"[2]UGE 2           3.0",9,9,"TECHNICAL WRITING IN THE DISCIPLINE",0
    S213 db 10,8,32,"[3]PSY 213/L       5.0",9,9,"EXPERIMENTAL PSYCHOLOGY                               PSY 112/L",0
    S214 db 10,8,32,"[4]GE 6            3.0",9,9,"RIZAL'S LIFE AND WORKS",0
    S215 db 10,8,32,"[5]PSY 222         6.0",9,9,"ABNORMAL PSYCHOLOGY                                   PSY 123",0
    S216 db 10,8,32,"[6]CHEM 201/L      5.0",9,9,"GENERAL INORGANIC CHEMISTRY 1                         BIO 202/L",0
    S217 db 10,8,32,"[7]PAHF 3          2.0",9,9,"DANCE AND SPORTS 1                                    PAHF 2",0

    Y2S2 db 10,10,8,32,"2nd Year/2nd Sem ",0
    C22 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S221 db 10,8,32,"[1]GE 7            3.0",9,9,"ART APPRECIATION",0
    S222 db 10,8,32,"[2]CN 112/L        3.0",9,9,"BIOCHEMISTRY                                          CHEM 201/L",0
    S223 db 10,8,32,"[3]PSY 221/L       3.0",9,9,"FIELD METHODS IN PSYCHOLOGY                           PSY 213/L",0
    S224 db 10,8,32,"[4]PSY 225         6.0",9,9,"INDUSTRIAL/ORGANIZATIONAL PSYCHOLOGY                  PSY 212",0
    S225 db 10,8,32,"[5]PSY 224         3.0",9,9,"SOCIAL PSYCHOLOGY                                     PSY 213/L",0
    S226 db 10,8,32,"[6]PAHF 4          2.0",9,9,"DANCE AND SPORTS 2                                    PAHF 3",0

    Y1SS db 10,10,8,32,"2nd Year/SUMMER ",0
    C1SS db 10,8,32,"   Title          Unit",9,9,"Description                                   PRE-REQUISITES",0
    S1SS1 db 10,8,32,"[1]PSY 122        3.0",9,9,"CULTURE AND PSYCHOLOGY                                PSY 111",0
    S1SS2 db 10,8,32,"[2]PSY 324        3.0",9,9,"EDUCATIONAL PSYCHOLOGY                                PSY 224",0
    S1SS3 db 10,8,32,"[3]PSY 211        3.0",9,9,"PHYSIOLOGICAL/BIOLOGICAL PSYCHOLOGY                   PSY 125",0,13

    Y3S1 db 10,10,8,32,"3rd Year/1st Sem ",0
    C31 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S311 db 10,8,32,"[1]GE 11           3.0",9,9,"THE ENTREPRENEURIAL MIND",0
    S312 db 10,8,32,"[2]PSY 214         3.0",9,9,"COGNITIVE PSYCHOLOGY                                  PSY 121, PSY 123",0
    S313 db 10,8,32,"[3]GE 9            3.0",9,9,"ETHICS (DISCIPLINAL)",0
    S314 db 10,8,32,"[4]PSY 311         3.0",9,9,"INTRODUCTION TO COUNSELING                            PSY 222",0
    S315 db 10,8,32,"[5]PSY 312/L       5.0",9,9,"PSYCHOLOGICAL ASSESSMENT                              PSY 222",0
    S316 db 10,8,32,"[6]PSY 313         3.0",9,9,"RESEARCH IN PSYCHOLOGY 1                              PSY 221/L",0
    S317 db 10,8,32,"[7]NSTP 1          3.0",9,9,"NATIONAL SERVICE TRAINING PROGRAM 1",0

    Y3S2 db 10,10,8,32,"3rd Year/2nd Sem ",0
    C32 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S321 db 10,8,32,"[1]GE 20           3.0",9,9,"READING VISUAL ARTS",0
    S322 db 10,8,32,"[2]PSY 321         6.0",9,9,"RESEARCH IN PSYCHOLOGY 2                              PSY 313",0
    S323 db 10,8,32,"[3]PSY 322         3.0",9,9,"COMMUNITY HEALTH PSYCHOLOGY                           PSY 224",0
    S324 db 10,8,32,"[4]PSY 323         3.0",9,9,"INTRODUCTION TO CLINICAL PSYCHOLOGY                   PSY 311",0
    S325 db 10,8,32,"[5]NSTP 2          3.0",9,9,"NATIONAL SERVICE TRAINING PROGRAM 2                   NSTP 1",0
    
    Y4S1 db 10,10,8,32,"4th Year/1st Sem ",0
    C41 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S411 db 10,8,32,"[1]CAED 500C       3.0",9,9,"CAREER AND PERSONALITY DEVELOPMENT                    4TH YR STANDING",0
    S412 db 10,8,32,"[2]PSY 326         6.0",9,9,"PRACTICE IN PSYCHOLOGY                                PSY 321, PSY 323, PSY 312/L, PSY 322, PSY 324",0

    Y4S2 db 10,10,8,32,"4th Year/2nd Sem ",0
    C42 db 10,8,32,"   Title           Unit",9,9,"Description                                   PRE-REQUISITES",0
    S421 db 10,8,32,"[1]PSY 500         3.0",9,9,"PSYCHOLOGICAL TESTING/ASSESSMENT                      Graduating PSY 326",0
    S422 db 10,8,32,"[2]PSY 501         3.0",9,9,"ABNORMAL PSYCHOLOGY                                   Graduating PSY 326",0
    S423 db 10,8,32,"[3]PSY 502A        3.0",9,9,"DEVELOPMENTAL PSYCHOLOGY                              Graduating PSY 326",0
    S424 db 10,8,32,"[4]PSY 503         3.0",9,9,"INDUSTRIAL/ORGANIZATIONAL PSYCHOLOGY                  Graduating PSY 326",10,0

    totalprompt db 10,8,32,"   Total      |    ",0

    clearscreen db 80 dup(' '),0


.data?
    input db 1 dup(?)
    studname db 50 dup(?)
    studid db 50 dup(?)
    yearinp db 1 dup(?)
    seminp db 1 dup(?)
    subjectinput db 50 dup(?)
    confirm db 1 dup(?)
    totalsubtotake DD ?
    substaken DD ?
    totalunits DD ?
    backinput db 1 dup(?)

    buffer DB 11 DUP (?)
    
    subjectchoice1 db 1 dup(?)
    subjectchoice2 db 1 dup(?)
    subjectchoice3 db 1 dup(?)
    subjectchoice4 db 1 dup(?)
    subjectchoice5 db 1 dup(?)
    subjectchoice6 db 1 dup(?)
    subjectchoice7 db 1 dup(?)
    subjectchoice8 db 1 dup(?)

    subject1 db 100 dup(?)
    subject2 db 100 dup(?)
    subject3 db 100 dup(?)
    subject4 db 100 dup(?)
    subject5 db 100 dup(?)
    subject6 db 100 dup(?)
    subject7 db 100 dup(?)
    subject8 db 100 dup(?)

    unit1 DD ?
    unit2 DD ?
    unit3 DD ?
    unit4 DD ?
    unit5 DD ?
    unit6 DD ?
    unit7 DD ?
    unit8 DD ?
   
.code

start:

    display:
     invoke ClearScreen
    invoke StdOut, addr mh1 ;headers
    invoke StdOut, addr mh2
    invoke StdOut, addr mh3

    invoke StdOut, addr mp1 ;menu
    invoke StdOut, addr mp2
    invoke StdOut, addr mp3
    invoke StdOut, addr mp4

    invoke StdOut, addr cursor
    invoke StdIn, addr input, 3

    .if input == "1"
    ;first year/ 1st sem  
        invoke StdOut, addr Y1S1   
        invoke StdOut, addr C11 
        invoke StdOut, addr S111 
        invoke StdOut, addr S112 
        invoke StdOut, addr S113 
        invoke StdOut, addr S114 
        invoke StdOut, addr S115 
        invoke StdOut, addr S116
        invoke StdOut, addr S117 
    ;first year/ 2nd sem  
        invoke StdOut, addr Y1S2 
        invoke StdOut, addr C12 
        invoke StdOut, addr S121 
        invoke StdOut, addr S122
        invoke StdOut, addr S123 
        invoke StdOut, addr S124 
        invoke StdOut, addr S125 
        invoke StdOut, addr S126
    ;first year/ SUMMER  
        invoke StdOut, addr Y1S 
        invoke StdOut, addr C1S 
        invoke StdOut, addr S1S1 
        invoke StdOut, addr S1S2
        invoke StdOut, addr S1S3 
    ;2nd year/ 1st sem
        invoke StdOut, addr Y2S1 
        invoke StdOut, addr C21 
        invoke StdOut, addr S211 
        invoke StdOut, addr S212 
        invoke StdOut, addr S213 
        invoke StdOut, addr S214
        invoke StdOut, addr S215
        invoke StdOut, addr S216
        invoke StdOut, addr S217
    ;2nd year/ 2nd sem    
        invoke StdOut, addr Y2S2 
        invoke StdOut, addr C22 
        invoke StdOut, addr S221 
        invoke StdOut, addr S222 
        invoke StdOut, addr S223 
        invoke StdOut, addr S224 
        invoke StdOut, addr S225
        invoke StdOut, addr S226
    ;2nd year/ SUMMER  
        invoke StdOut, addr Y1SS 
        invoke StdOut, addr C1SS 
        invoke StdOut, addr S1SS1 
        invoke StdOut, addr S1SS2
        invoke StdOut, addr S1SS3
    ;3rd year/1st sem
        invoke StdOut, addr Y3S1 
        invoke StdOut, addr C31 
        invoke StdOut, addr S311 
        invoke StdOut, addr S312 
        invoke StdOut, addr S313    
        invoke StdOut, addr S314 
        invoke StdOut, addr S315 
        invoke StdOut, addr S316
        invoke StdOut, addr S317
    ;3rd year/2nd sem    
        invoke StdOut, addr Y3S2 
        invoke StdOut, addr C32 
        invoke StdOut, addr S321 
        invoke StdOut, addr S322 
        invoke StdOut, addr S323 
        invoke StdOut, addr S324 
        invoke StdOut, addr S325 
    ;4th year/1st sem
        invoke StdOut, addr Y4S1 
        invoke StdOut, addr C41 
        invoke StdOut, addr S411 
        invoke StdOut, addr S412  
    ;4th year/2nd sem
        invoke StdOut, addr Y4S2 
        invoke StdOut, addr C42 
        invoke StdOut, addr S421 
        invoke StdOut, addr S422
        invoke StdOut, addr S423 
        invoke StdOut, addr S424 
        invoke StdOut, addr separator
            
            
    .elseif input == "2"
        invoke ClearScreen
        invoke StdOut, addr mh1
        invoke StdOut, addr mh2
        invoke StdOut, addr mh3

        invoke StdOut, addr yearprompt
        
        invoke StdIn, addr yearinp,50
        
        invoke StdOut, addr semesterprompt

        
        invoke StdIn, addr seminp,50
        
        .if yearinp == "1"
            .if seminp == "1"
                ;first year/ 1st sem  
                invoke StdOut, addr Y1S1   
                invoke StdOut, addr C11 
                invoke StdOut, addr S111 
                invoke StdOut, addr S112 
                invoke StdOut, addr S113 
                invoke StdOut, addr S114 
                invoke StdOut, addr S115 
                invoke StdOut, addr S116
                invoke StdOut, addr S117 
            .elseif seminp == "2"
                ;first year/ 2nd sem  
                invoke StdOut, addr Y1S2 
                invoke StdOut, addr C12 
                invoke StdOut, addr S121 
                invoke StdOut, addr S122
                invoke StdOut, addr S123 
                invoke StdOut, addr S124 
                invoke StdOut, addr S125 
                invoke StdOut, addr S126
            .elseif seminp == "3"
                ;first year/ SUMMER  
                invoke StdOut, addr Y1S 
                invoke StdOut, addr C1S 
                invoke StdOut, addr S1S1 
                invoke StdOut, addr S1S2
                invoke StdOut, addr S1S3 
            .endif
        .endif
        
        .if yearinp == "2"
            .if seminp == "1"
                ;2nd year/ 1st sem
                invoke StdOut, addr Y2S1 
                invoke StdOut, addr C21 
                invoke StdOut, addr S211 
                invoke StdOut, addr S212 
                invoke StdOut, addr S213 
                invoke StdOut, addr S214
                invoke StdOut, addr S215
                invoke StdOut, addr S216
                invoke StdOut, addr S217

            .elseif seminp == "2"
                ;2nd year/ 2nd sem    
                invoke StdOut, addr Y2S2 
                invoke StdOut, addr C22 
                invoke StdOut, addr S221 
                invoke StdOut, addr S222 
                invoke StdOut, addr S223 
                invoke StdOut, addr S224 
                invoke StdOut, addr S225
                invoke StdOut, addr S226

            .elseif seminp == "3"
                ;2nd year/ SUMMER  
                invoke StdOut, addr Y1SS 
                invoke StdOut, addr C1SS 
                invoke StdOut, addr S1SS1 
                invoke StdOut, addr S1SS2
                invoke StdOut, addr S1SS3 
            .endif
        .endif
        
        .if yearinp == "3"



            .if seminp == "1"
            ;3rd year/1st sem
                invoke StdOut, addr Y3S1 
                invoke StdOut, addr C31 
                invoke StdOut, addr S311 
                invoke StdOut, addr S312 
                invoke StdOut, addr S313    
                invoke StdOut, addr S314 
                invoke StdOut, addr S315 
                invoke StdOut, addr S316
                invoke StdOut, addr S317 
                
            .elseif seminp == "2"
            ;3rd year/2nd sem    
                invoke StdOut, addr Y3S2 
                invoke StdOut, addr C32 
                invoke StdOut, addr S321 
                invoke StdOut, addr S322 
                invoke StdOut, addr S323 
                invoke StdOut, addr S324 
                invoke StdOut, addr S325  
            .endif
        .endif
        
        .if yearinp == "4"
            .if seminp == "1"
            ;4th year/1st sem
                invoke StdOut, addr Y4S1 
                invoke StdOut, addr C41 
                invoke StdOut, addr S411 
                invoke StdOut, addr S412 

            .elseif seminp == "2"
            ;4th year/1st sem
                invoke StdOut, addr Y4S2 
                invoke StdOut, addr C42 
                invoke StdOut, addr S421 
                invoke StdOut, addr S422
                invoke StdOut, addr S423 
                invoke StdOut, addr S424 
            .endif
        .endif

    .elseif input == "3"    
        invoke ClearScreen
        invoke StdOut, addr mh1
        invoke StdOut, addr mh2
        invoke StdOut, addr mh3


        invoke StdOut, addr nameprompt
        invoke StdIn, addr studname, 100

        invoke StdOut, addr idprompt
        invoke StdIn, addr studid, 50

        invoke StdOut, addr yearprompt
        invoke StdIn, addr yearinp,50

        invoke StdOut, addr semesterprompt
        invoke StdIn, addr seminp,50

        

        .if yearinp == "1"
            .if seminp == "1"
                ; First year/1st sem  
                invoke StdOut, addr Y1S1   
                invoke StdOut, addr C11 
                invoke StdOut, addr S111 
                invoke lstrcpy, addr subject1, addr S111
                mov unit1, 3     
                invoke StdOut, addr S112 
                invoke lstrcpy, addr subject2, addr S112
                mov unit2, 3 
                invoke StdOut, addr S113
                invoke lstrcpy, addr subject3, addr S113
                mov unit3, 6
                invoke StdOut, addr S114 
                invoke lstrcpy, addr subject4, addr S114
                mov unit4, 3                
                invoke StdOut, addr S115 
                invoke lstrcpy, addr subject5, addr S115
                mov unit5, 5
                invoke StdOut, addr S116 
                invoke lstrcpy, addr subject6, addr S116
                mov unit6, 5
                invoke StdOut, addr S117 
                invoke lstrcpy, addr subject7, addr S117
                mov unit7, 2
            .elseif seminp == "2"
                ; First year/2nd sem  
                invoke StdOut, addr Y1S2 
                invoke StdOut, addr C12 
                invoke StdOut, addr S121 
                invoke lstrcpy, addr subject1, addr S121
                mov unit1, 6
                invoke StdOut, addr S122 
                invoke lstrcpy, addr subject2, addr S122
                mov unit2, 3
                invoke StdOut, addr S123 
                invoke lstrcpy, addr subject3, addr S123
                mov unit3, 6
                invoke StdOut, addr S124 
                invoke lstrcpy, addr subject4, addr S124
                mov unit4, 5
                invoke StdOut, addr S125 
                invoke lstrcpy, addr subject5, addr S125
                mov unit5, 3
                invoke StdOut, addr S126 
                invoke lstrcpy, addr subject6, addr S126
                mov unit6, 2
            .elseif seminp == "3"
                ; First year/SUMMER  
                invoke StdOut, addr Y1S 
                invoke StdOut, addr C1S 
                invoke StdOut, addr S1S1 
                invoke lstrcpy, addr subject1, addr S1S1
                mov unit1, 3
                invoke StdOut, addr S1S2 
                invoke lstrcpy, addr subject2, addr S1S2
                mov unit2, 3
                invoke StdOut, addr S1S3 
                invoke lstrcpy, addr subject3, addr S1S3
                mov unit3, 3
            .endif
        .elseif yearinp == "2"
            .if seminp == "1"
                ; 2nd year/1st sem
                invoke StdOut, addr Y2S1 
                invoke StdOut, addr C21 
                invoke StdOut, addr S211 
                invoke lstrcpy, addr subject1, addr S211
                mov unit1, 3
                invoke StdOut, addr S212 
                invoke lstrcpy, addr subject2, addr S212
                mov unit2, 3
                invoke StdOut, addr S213 
                invoke lstrcpy, addr subject3, addr S213
                mov unit3, 5
                invoke StdOut, addr S214 
                invoke lstrcpy, addr subject4, addr S214
                mov unit4, 3
                invoke StdOut, addr S215 
                invoke lstrcpy, addr subject5, addr S215
                mov unit5, 6
                invoke StdOut, addr S216 
                invoke lstrcpy, addr subject6, addr S216
                mov unit6, 5
                invoke StdOut, addr S217 
                invoke lstrcpy, addr subject7, addr S217
                mov unit7, 2
            .elseif seminp == "2"
                ; 2nd year/2nd sem    
                invoke StdOut, addr Y2S2 
                invoke StdOut, addr C22 
                invoke StdOut, addr S221 
                invoke lstrcpy, addr subject1, addr S221
                mov unit1, 3
                invoke StdOut, addr S222 
                invoke lstrcpy, addr subject2, addr S222
                mov unit2, 3
                invoke StdOut, addr S223 
                invoke lstrcpy, addr subject3, addr S223
                mov unit3, 3
                invoke StdOut, addr S224 
                invoke lstrcpy, addr subject4, addr S224
                mov unit4, 6
                invoke StdOut, addr S225 
                invoke lstrcpy, addr subject5, addr S225
                mov unit5, 3
                invoke StdOut, addr S226 
                invoke lstrcpy, addr subject6, addr S226
                mov unit6, 2
            .elseif seminp == "3"
                ; 2nd year/SUMMER  
                invoke StdOut, addr Y1SS 
                invoke StdOut, addr C1SS 
                invoke StdOut, addr S1SS1 
                invoke lstrcpy, addr subject1, addr S1SS1
                mov unit1, 3
                invoke StdOut, addr S1SS2 
                invoke lstrcpy, addr subject2, addr S1SS2
                mov unit2, 3
                invoke StdOut, addr S1SS3 
                invoke lstrcpy, addr subject3, addr S1SS3
                mov unit3, 3
            .endif
    .elseif yearinp == "3"

        .if seminp == "1"
            ; 3rd year/1st sem
            invoke StdOut, addr Y3S1 
            invoke StdOut, addr C31 
            invoke StdOut, addr S311 
            invoke lstrcpy, addr subject1, addr S311
            mov unit1, 3
            invoke StdOut, addr S312 
            invoke lstrcpy, addr subject2, addr S312
            mov unit2, 3
            invoke StdOut, addr S313    
            invoke lstrcpy, addr subject3, addr S313
            mov unit3, 3
            invoke StdOut, addr S314 
            invoke lstrcpy, addr subject4, addr S313
            mov unit4, 3
            invoke StdOut, addr S315 
            invoke lstrcpy, addr subject5, addr S315
            mov unit5, 5
            invoke StdOut, addr S316 
            invoke lstrcpy, addr subject6, addr S316
            mov unit6, 3
            invoke StdOut, addr S317 
            invoke lstrcpy, addr subject7, addr S317
            mov unit7, 3
        .elseif seminp == "2"
            ; 3rd year/2nd sem    
            invoke StdOut, addr Y3S2 
            invoke StdOut, addr C32 
            invoke StdOut, addr S321 
            invoke lstrcpy, addr subject1, addr S321
            mov unit1, 3
            invoke StdOut, addr S322 
            invoke lstrcpy, addr subject2, addr S322
            mov unit3, 6
            invoke StdOut, addr S323 
            invoke lstrcpy, addr subject3, addr S323
            mov unit2, 3
            invoke StdOut, addr S324 
            invoke lstrcpy, addr subject4, addr S324
            mov unit4, 3
            invoke StdOut, addr S325 
            invoke lstrcpy, addr subject5, addr S325
            mov unit5, 3
        .endif
    .elseif yearinp == "4"
        .if seminp == "1"
            ; 4th year/1st sem
            invoke StdOut, addr Y4S1 
            invoke StdOut, addr C41 
            invoke StdOut, addr S411 
            invoke lstrcpy, addr subject1, addr S411
            
            mov unit1, 3
            invoke StdOut, addr S412 
            invoke lstrcpy, addr subject2, addr S412
            mov unit2, 6
        .elseif seminp == "2"
            ; 4th year/1st sem
            invoke StdOut, addr Y4S2 
            invoke StdOut, addr C42 
            invoke StdOut, addr S421 
            invoke lstrcpy, addr subject1, addr S421               
            mov unit1, 3
            invoke StdOut, addr S422 
            invoke lstrcpy, addr subject2, addr S422
            mov unit2, 3
            invoke StdOut, addr S423 
            invoke lstrcpy, addr subject3, addr S423
            mov unit3, 3
            invoke StdOut, addr S424 
            invoke lstrcpy, addr subject4, addr S424
            mov unit4, 3
        .endif
    .endif


    Enlist:
            invoke StdOut, addr subjectprompt
            invoke StdIn, addr subjectinput,100
            
            .if subjectinput == "1"
                invoke StdOut, addr subject1
                mov subjectchoice1, 1 
            .elseif subjectinput == "2"
                invoke StdOut, addr subject2
                mov subjectchoice2, 1
            .elseif subjectinput == "3"
                invoke StdOut, addr subject3
                mov subjectchoice3, 1
            .elseif subjectinput == "4"
                invoke StdOut, addr subject4
                mov subjectchoice4, 1
            .elseif subjectinput == "5"
                invoke StdOut, addr subject5
                mov subjectchoice5, 1
            .elseif subjectinput == "6"
                invoke StdOut, addr subject6
                mov subjectchoice6, 1
            .elseif subjectinput == "7"
                invoke StdOut, addr subject7
                mov subjectchoice7, 1
            .elseif subjectinput == "8"
                invoke StdOut, addr subject8
                mov subjectchoice8, 1
            .endif

        .if subjectinput == "x" || subjectinput == "X"
                jmp Finalize
        .endif 

        jmp Enlist

        Finalize:
        invoke StdOut, addr enlistedsubjects
        
            .if subjectchoice1 == 1
                invoke StdOut, addr subject1
                mov eax, unit1
                
                add totalunits, eax
            .endif

            .if subjectchoice2 == 1
                invoke StdOut, addr subject2
                mov eax, unit2
                add totalunits, eax
            .endif

            .if subjectchoice3 == 1
                invoke StdOut, addr subject3
                mov eax, unit3
                add totalunits, eax
            .endif

            .if subjectchoice4 == 1
                invoke StdOut, addr subject4
                mov eax, unit4
                add totalunits, eax
            .endif

            .if subjectchoice5 == 1
                invoke StdOut, addr subject5
                mov eax, unit5
                add totalunits, eax
            .endif

            .if subjectchoice6 == 1
                invoke StdOut, addr subject6
                mov eax, unit6
                add totalunits, eax
            .endif

            .if subjectchoice7 == 1
                invoke StdOut, addr subject7
                mov eax, unit7
                add totalunits, eax
            .endif

            .if subjectchoice8 == 1
                invoke StdOut, addr subject8
                mov eax, unit8
                add totalunits, eax
            .endif

        invoke StdOut, addr finalprompt
        invoke StdIn, addr confirm, 50

        .if confirm == "Y" || confirm == "y"
            jmp Form1
        .endif 

        Form1:
            invoke StdOut, addr mh1
            invoke StdOut, addr mh2
            invoke StdOut, addr mh3
            invoke StdOut, addr menuseparator
            invoke StdOut, addr displayname
            invoke StdOut, addr studname
            invoke StdOut, addr displayid
            invoke StdOut, addr studid
            invoke StdOut, addr menuseparator
            invoke StdOut, addr C32 

            .if subjectchoice1 == 1
                invoke StdOut, addr subject1
                invoke atodw, addr unit1
                invoke atodw, addr totalunits
                mov eax, unit1
                mov ebx, totalunits
                add ebx, eax
            .endif

            .if subjectchoice2 == 1
                invoke StdOut, addr subject2
                invoke atodw, addr unit2
                invoke atodw, addr totalunits
                mov eax, unit2
                mov ebx, totalunits
                add ebx, eax

            .endif

            .if subjectchoice3 == 1
                invoke StdOut, addr subject3
                invoke atodw, addr unit3
                invoke atodw, addr totalunits
                mov eax, unit3
                mov ebx, totalunits
                add ebx, eax
            .endif

            .if subjectchoice4 == 1
                invoke StdOut, addr subject4
                invoke atodw, addr unit4
                invoke atodw, addr totalunits
                mov eax, unit4
                mov ebx, totalunits
                add ebx, eax
            .endif

            .if subjectchoice5 == 1
                invoke StdOut, addr subject5
                invoke atodw, addr unit5
                invoke atodw, addr totalunits
                mov eax, unit5
                mov ebx, totalunits
                add ebx, eax
            .endif

            .if subjectchoice6 == 1
                invoke StdOut, addr subject6
                invoke atodw, addr unit6
                invoke atodw, addr totalunits
                mov eax, unit6
                mov ebx, totalunits
                add ebx, eax
            .endif

            .if subjectchoice7 == 1
                invoke StdOut, addr subject7
                invoke atodw, addr unit7
                invoke atodw, addr totalunits
                mov eax, unit7
                mov ebx, totalunits
                add ebx, eax
            .endif

            .if subjectchoice8 == 1
                invoke StdOut, addr subject8
                invoke atodw, addr unit8
                invoke atodw, addr totalunits
                mov eax, unit8
                mov ebx, totalunits
                add ebx, eax
            .endif

            invoke StdOut, addr totalprompt
            invoke dwtoa, totalunits, addr buffer
            invoke StdOut, addr buffer
            invoke StdOut, addr menuseparator

    .elseif input == "4"
        invoke ExitProcess, 0
    .endif

    back:
    invoke StdOut, addr backprompt

    prompt:
    invoke StdIn, addr backinput, 3

    .if backinput == "y" || backinput == "Y"
    mov input, " "
        jmp start

    .endif
    jmp prompt


end start
