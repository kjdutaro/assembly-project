.386



.model flat, stdcall



option casemap :none



include \masm32\include\windows.inc



include \masm32\include\kernel32.inc



include \masm32\include\masm32.inc



includelib \masm32\lib\kernel32.lib



includelib \masm32\lib\masm32.lib

.data


.data?

.code

    start:
    
display:
;first year/ 1st sem  
    invoke StdOut, addr Y1S1   
    invoke StdOut, addr C11 
    invoke StdOut, addr S111 
    invoke StdOut, addr S112 
    invoke StdOut, addr S113 
    invoke StdOut, addr S114 
    invoke StdOut, addr S115 
    invoke StdOut, addr S116 
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
;2nd year/ 2nd sem    
    invoke StdOut, addr Y2S2 
    invoke StdOut, addr C22 
    invoke StdOut, addr S221 
    invoke StdOut, addr S222 
    invoke StdOut, addr S223 
    invoke StdOut, addr S224 
    invoke StdOut, addr S225
    invoke StdOut, addr S226
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
    invoke StdOut, addr S318
;3rd year/2nd sem    
    invoke StdOut, addr Y3S2 
    invoke StdOut, addr C32 
    invoke StdOut, addr S321 
    invoke StdOut, addr S322 
    invoke StdOut, addr S323 
    invoke StdOut, addr S324 
    invoke StdOut, addr S325 
    invoke StdOut, addr S326 
;4th year/1st sem
    invoke StdOut, addr Y4S1 
    invoke StdOut, addr C41 
    invoke StdOut, addr S411 
    invoke StdOut, addr S412 
    invoke StdOut, addr S413 
    invoke StdOut, addr S414
    invoke StdOut, addr S415  
;4th year/2nd sem
    invoke StdOut, addr Y4S2 
    invoke StdOut, addr C42 
    invoke StdOut, addr S421 
    invoke StdOut, addr S422
    invoke StdOut, addr S423 
    invoke StdOut, addr S424 

          invoke ClearScreen

          invoke ExitProcess,0

end start
