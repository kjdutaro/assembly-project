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

          invoke ClearScreen

          invoke ExitProcess,0

end start