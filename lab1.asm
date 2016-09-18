%include "asm_io.inc"
segment .data 
;
;   used for initialized data
prompt1 db "Enter the 1st integer:", 0
prompt2 db "Enter the 2nd integer:", 0
prompt3 db "Enter the 3rd integer:", 0
prompt4 db "Enter the 4th integer:", 0
outmsg1 db "The result is:", 0
;
;
segment .bss 
;
;   used for uninitialized data
;   should have reserved 4 32-bit memory spaces
input1 resd 1
input2 resd 2
input3 resd 3
input4 resd 4
;
;
segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	    
            ; prompt user to input 4 integers

            ; prompt and store first integer
            mov eax, prompt1    ; move pointer to string into eax
            call print_string   ; print string pointed to in eax
            call read_int       ; read int store in eax
            mov [input1], eax   ; store into input1

            ; prompt and store second integer
            mov eax, prompt2    ; move pointer to string into eax
            call print_string   ; print string pointed to in eax
            call read_int       ; read int into eax
            mov [input2], eax   ; store into input2

            ; prompt and store third integer
            mov eax, prompt3    ; move pointer to string into eax
            call print_string   ; print string
            call read_int       ; read and store int in eax
            mov [input3], eax   ; store into input3

            ; prompt and store fourth integer
            mov eax, prompt4    ; move pointer to string into eax
            call print_string   ; print string
            call read_int       ; read and store int into eax
            mov [input4], eax   ; store into input4

            ; add integers and print result
            mov eax, [input1]   ; move input1 into eax
            add eax, [input2]   ; eax = input1 + input2
            add eax, [input3]   ; eax += input3
            add eax, [input4]   ; eax += input4
            mov ebx, eax        ; store a copy of sum into ebx
            mov eax, outmsg1    ; move pointer to string into eax
            call print_string   ; print string
            mov eax, ebx        ; move sum back into eax
            call print_int      ; print out sum
            call print_nl       ; print newline
;
;
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
