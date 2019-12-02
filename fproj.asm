;; Stephanie Koehl
;; Assembly Programming - CompSci 2XA3 McMaster

%include "simple_io.inc"

global asm_main
extern rperm

section .data
str1: db "..+------+",0 ;; declaring strings for drawing boxes
str2: db "..+-----+.",0
str3: db "...+----+.",0
str4: db "...+---+..",0
str5: db "....+--+..",0
str6: db "....+-+...",0
str7: db ".....++...",0
str8: db ".....+....",0
str9: db "          ",0
str10: db "  +------+",0
str11: db "  +-----+ ",0
str12: db "   +----+ ",0
str13: db "   +---+  ",0
str14: db "    +--+  ",0
str15: db "    +-+   ",0
str16: db "     ++   ",0
str17: db "      +   ",0
str18: db "  +      +",0
str19: db "  +     + ",0
str20: db "   +    + ",0
str21: db "   +   +  ",0
str22: db "    +  +  ",0
str23: db "    + +   ",0
str24: db "     ++   ",0
str25: db "      +   ",0
str26: db "     ",0
str27: db "    ",0

section .bss
	array: resq 8

section .text

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
asm_main:
	enter	0,0
	saveregs

	mov	rdi, array     ;1st param for rperm
	mov	rsi, qword 8   ;2nd param for rperm
	call rperm

	;; now the array 'array' is randomly initialzed
	push qword 8
	mov rdi, array
	push rdi
	call display
	add rsp, 16

	restoregs
	leave
	ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; add2line(size,level):
add2line:
	mov rdi, [rsp+8]		; get size
	mov rsi, [rsp+16]		; get level
	cmp rsi, 1				; if level == 1:
	je doif
	ja doelif				; elif level > 1:
    mov rax, str26			; else:
	call print_string		; print "     "
	mov rax, rdi
	call print_int			; print str(size)
	mov rax, str27
	call print_string		; print "    "
	jmp return
	doif:
		cmp rdi, 8			; if size == 8:
        jne doelif1
		mov rax, str1
		call print_string	; print "..+------+"
		jmp return
		doelif1:
			cmp rdi, 7			; elif size == 7:
			jne doelif2
			mov rax, str2
			call print_string	; print "..+-----+."
			jmp return
        doelif2:
			cmp rdi, 6			; elif size == 6:
			jne doelif3
			mov rax, str3
			call print_string	; print "...+----+."
			jmp return
        doelif3:
			cmp rdi, 5			; elif size == 5:
			jne doelif4
			mov rax, str4
			call print_string	; print "...+---+.."
			jmp return
        doelif4:
			cmp rdi, 4			; elif size == 4:
			jne doelif5
			mov rax, str5
			call print_string	; print "....+--+.."
			jmp return
        doelif5:
			cmp rdi, 3			; elif size == 3:
			jne doelif6
			mov rax, str6
			call print_string	; print "....+-+..."
			jmp return
		doelif6:
			cmp rdi, 2			; elif size == 2:
			jne else1
			mov rax, str7
			call print_string	; print ".....++..."
			jmp return
        else1:
			mov rax, str8
			call print_string	; print ".....+...."
			jmp return
	doelif:
		cmp rdi, rsi			; if size < level:
		jb doif1
		je doelif7				; elif size == level:
		cmp rdi, 8				; if size == 8:
        jne doelif8
		mov rax, str18
		call print_string		; print "  +      +"
		jmp return
		doelif8:
			cmp rdi, 7			; elif size == 7:
			jne doelif9
			mov rax, str19
			call print_string	; print "  +     + "
			jmp return
        doelif9:
			cmp rdi, 6			; elif size == 6:
			jne doelif10
			mov rax, str20
			call print_string	; print "   +    + "
			jmp return
        doelif10:
			cmp rdi, 5			; elif size == 5:
			jne doelif11
			mov rax, str21
			call print_string	; print "   +   +  "
			jmp return
        doelif11:
			cmp rdi, 4			; elif size == 4:
			jne doelif12
			mov rax, str22
			call print_string	; print "    +  +  "
			jmp return
        doelif12:
			cmp rdi, 3			; elif size == 3:
			jne doelif13
			mov rax, str23
			call print_string	; print "    + +   "
			jmp return
		doelif13:
			cmp rdi, 2			; elif size == 2:
			jne else2
			mov rax, str24
			call print_string	; print "     ++   "
			jmp return
        else2:
			mov rax, str25
			call print_string	; print "      +   "
			jmp return
		doif1:
			mov rax, str9
			call print_string	; print "          "
            jmp return
        doelif7:
			cmp rdi, 8				; if size == 8:
			jne doelif14
			mov rax, str10
			call print_string		; print "  +------+"
			jmp return
		doelif14:
			cmp rdi, 7			; elif size == 7:
			jne doelif15
			mov rax, str11
			call print_string	; print "  +-----+ "
			jmp return
        doelif15:
			cmp rdi, 6			; elif size == 6:
			jne doelif16
			mov rax, str12
			call print_string	; print "   +----+ "
			jmp return
        doelif16:
			cmp rdi, 5			; elif size == 5:
			jne doelif17
			mov rax, str13
			call print_string	; print "   +---+  "
			jmp return
        doelif17:
			cmp rdi, 4			; elif size == 4:
			jne doelif18
			mov rax, str14
			call print_string	; print "    +--+  "
			jmp return
        doelif18:
			cmp rdi, 3			; elif size == 3:
			jne doelif19
			mov rax, str15
			call print_string	; print "    +-+   "
			jmp return
		doelif19:
			cmp rdi, 2			; elif size == 2:
			jne else3
			mov rax, str16
			call print_string	; print "     ++   "
			jmp return
        else3:
			mov rax, str17
			call print_string	; print "      +   "
	return:
		ret

; create_line(array, arrayize, level):
create_line:
	mov rcx, 0
	forLoop_:					; for i in range(0,8):
		mov rsi, [rsp+16]		; get array's size
		cmp rcx, rsi
		jae endforLoop
		mov rdi, [rsp+8]		; get array's address
		mov rax, [rsp+24]		; get level
		push rcx				; save rcx
		push rax				; push level
		mov rax, [rdi+rcx*8]
		push rax				; push x[i]
		call add2line			; add2line(x[i],level)
		add rsp, 16
		pop rcx					; pop rcx
		inc rcx
		jmp forLoop_
	endforLoop:
    ret

; display(array, arraysize)
display:
	mov rcx, [rsp+16]			; get array's size
	inc rcx
	forLoop:					; for i in range(9,0,-1):
		mov rsi, rcx
		dec rsi					; i-1
		mov rdi, [rsp+8]		; get array's address
		mov rax, [rsp+16]		; get array's size
		push rcx				; save rcx
		push rsi				; i-1
		push rax				; array size
		push rdi				; x
		call create_line		; create_line(x,i-1)
		add rsp, 24
		call print_nl
		pop rcx					; restore rcx
		loop forLoop
    ret
