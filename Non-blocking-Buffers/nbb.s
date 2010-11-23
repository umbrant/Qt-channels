	.file	"nbb.c"
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
	.section	.rodata
	.align 16
	.type	NAMESERVER_PID_FILE, @object
	.size	NAMESERVER_PID_FILE, 20
NAMESERVER_PID_FILE:
	.string	"/tmp/nameserver_pid"
	.align 16
	.type	NAMESERVER_CHANNEL_FULL, @object
	.size	NAMESERVER_CHANNEL_FULL, 16
NAMESERVER_CHANNEL_FULL:
	.string	"Nameserver Full"
	.align 16
	.type	UNKNOWN_SERVICE, @object
	.size	UNKNOWN_SERVICE, 16
UNKNOWN_SERVICE:
	.string	"Unknown Service"
	.align 16
	.type	SERVICE_BUSY, @object
	.size	SERVICE_BUSY, 17
SERVICE_BUSY:
	.string	"Service Too Busy"
	.type	SERVICE, @object
	.size	SERVICE, 2
SERVICE:
	.string	"0"
	.type	CLIENT, @object
	.size	CLIENT, 2
CLIENT:
	.string	"1"
	.type	GUI, @object
	.size	GUI, 4
GUI:
	.string	"GUI"
.globl channel_list
	.bss
	.align 32
	.type	channel_list, @object
	.size	channel_list, 1320
channel_list:
	.zero	1320
.globl connected_nodes
	.align 32
	.type	connected_nodes, @object
	.size	connected_nodes, 240
connected_nodes:
	.zero	240
	.comm	delay_buffers,360,32
	.comm	sem_id,8,8
	.section	.rodata
.LC0:
	.string	"nbb.c"
	.align 8
.LC1:
	.string	"request != ((void *)0) && ret != ((void *)0) && ret_len != ((void *)0)"
.LC2:
	.string	"r+"
.LC3:
	.string	"%d"
	.text
.globl nbb_nameserver_connect
	.type	nbb_nameserver_connect, @function
nbb_nameserver_connect:
.LFB0:
	.file 1 "nbb.c"
	.loc 1 20 0
	.cfi_startproc
	pushq	%rbp
.LCFI0:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI1:
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 21 0
	movl	$0, -4(%rbp)
	.loc 1 28 0
	cmpq	$0, -40(%rbp)
	je	.L2
	cmpq	$0, -48(%rbp)
	je	.L2
	cmpq	$0, -56(%rbp)
	jne	.L3
.L2:
	leaq	__PRETTY_FUNCTION__.3488(%rip), %rcx
	movl	$28, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	__assert_fail@PLT
.L3:
	.loc 1 29 0
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 30 0
	movq	-56(%rbp), %rax
	movl	$0, (%rax)
	.loc 1 33 0
	movl	$0, %ecx
	movl	$4001, %edx
	movl	$4000, %esi
	movl	$0, %edi
	call	nbb_open_channel@PLT
	testl	%eax, %eax
	je	.L4
	.loc 1 34 0
	movl	$-1, %eax
	jmp	.L5
.L4:
	.loc 1 37 0
	leaq	.LC2(%rip), %rax
	movq	%rax, %rsi
	leaq	NAMESERVER_PID_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	.loc 1 38 0
	leaq	.LC3(%rip), %rcx
	leaq	-4(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fscanf@PLT
	.loc 1 39 0
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 41 0
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	nbb_insert_item@PLT
	.loc 1 42 0
	call	__libc_current_sigrtmax@PLT
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	kill@PLT
.L6:
	.loc 1 46 0
	leaq	-24(%rbp), %rax
	leaq	-32(%rbp), %rdx
	movq	%rax, %rsi
	movl	$0, %edi
	call	nbb_read_item@PLT
	movl	%eax, -8(%rbp)
	.loc 1 47 0
	cmpl	$3, -8(%rbp)
	je	.L6
	cmpl	$4, -8(%rbp)
	je	.L6
	.loc 1 50 0
	movq	-24(%rbp), %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 51 0
	movq	-32(%rbp), %rax
	movl	%eax, %edx
	movq	-56(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 54 0
	movl	$0, %eax
.L5:
	.loc 1 55 0
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	nbb_nameserver_connect, .-nbb_nameserver_connect
	.section	.rodata
.LC4:
	.string	"/1337"
.LC5:
	.string	"! Unable to obtain semaphore\n"
.LC6:
	.string	"! Unable to open channel"
.LC7:
	.string	"w+"
	.text
.globl init_nameserver
	.type	init_nameserver, @function
init_nameserver:
.LFB1:
	.loc 1 58 0
	.cfi_startproc
	pushq	%rbp
.LCFI2:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI3:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 62 0
	movl	$1, %ecx
	movl	$438, %edx
	movl	$64, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	sem_open@PLT
	movq	sem_id@GOTPCREL(%rip), %rdx
	movq	%rax, (%rdx)
	.loc 1 63 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L9
	.loc 1 64 0
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	.loc 1 65 0
	movl	$-1, %eax
	jmp	.L10
.L9:
	.loc 1 68 0
	movl	$512, %ecx
	movl	$4000, %edx
	movl	$4001, %esi
	movl	$0, %edi
	call	nbb_open_channel@PLT
	testl	%eax, %eax
	je	.L11
	.loc 1 69 0
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	.loc 1 70 0
	movl	$-1, %eax
	jmp	.L10
.L11:
	.loc 1 73 0
	leaq	.LC7(%rip), %rax
	movq	%rax, %rsi
	leaq	NAMESERVER_PID_FILE(%rip), %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	.loc 1 74 0
	call	getpid@PLT
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	movq	-8(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf@PLT
	.loc 1 75 0
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 77 0
	movl	$0, %eax
.L10:
	.loc 1 78 0
	leave
	ret
	.cfi_endproc
.LFE1:
	.size	init_nameserver, .-init_nameserver
	.section	.rodata
	.align 8
.LC8:
	.string	"num_channels > 0 && name != ((void *)0)"
	.align 8
.LC9:
	.string	"! nbb_init_service(): Unable to obtain semaphore\n"
.LC10:
	.string	" "
.LC11:
	.string	"request: %s, len: %zu\n"
	.align 8
.LC12:
	.string	"! nbb_init_service(): Could not connect to nameserver"
	.align 8
.LC13:
	.string	"! nbb_init_service(): Reserving channel unsuccessful"
.LC14:
	.string	"recv (%d): %.*s\n"
	.align 8
.LC15:
	.string	"** Acquired the following channels: %.*s\n"
	.align 8
.LC16:
	.string	"! nbb_init_service(): Failed to open the %d-th channel\n"
	.text
.globl nbb_init_service
	.type	nbb_init_service, @function
nbb_init_service:
.LFB2:
	.loc 1 81 0
	.cfi_startproc
	pushq	%rbp
.LCFI4:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI5:
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1096, %rsp
	movl	%edi, -1092(%rbp)
	movq	%rsi, -1104(%rbp)
	.loc 1 81 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 82 0
	leaq	-1024(%rbp), %rbx
	.cfi_offset 3, -24
	movl	$0, %eax
	movl	$125, %edx
	movq	%rbx, %rdi
	movq	%rdx, %rcx
	rep stosq
	.loc 1 86 0
	cmpl	$0, -1092(%rbp)
	jle	.L14
	cmpq	$0, -1104(%rbp)
	jne	.L15
.L14:
	leaq	__PRETTY_FUNCTION__.3533(%rip), %rcx
	movl	$86, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC8(%rip), %rdi
	call	__assert_fail@PLT
.L15:
	.loc 1 88 0
	movl	$0, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	sem_open@PLT
	movq	sem_id@GOTPCREL(%rip), %rdx
	movq	%rax, (%rdx)
	.loc 1 89 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L16
	.loc 1 90 0
	leaq	.LC9(%rip), %rdi
	call	perror@PLT
	.loc 1 91 0
	movl	$-1, %eax
	jmp	.L17
.L16:
	.loc 1 97 0
	leaq	.LC3(%rip), %rcx
	movl	-1092(%rbp), %edx
	leaq	-1040(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 98 0
	call	getpid@PLT
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	leaq	-1072(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 100 0
	leaq	-1024(%rbp), %rax
	movl	$2, %edx
	leaq	SERVICE(%rip), %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 101 0
	leaq	.LC10(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 102 0
	movq	-1104(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 103 0
	leaq	.LC10(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 104 0
	leaq	-1040(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 105 0
	leaq	.LC10(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 106 0
	leaq	-1072(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 108 0
	leaq	-1024(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	.LC11(%rip), %rax
	leaq	-1024(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 113 0
	leaq	-1044(%rbp), %rdx
	leaq	-1080(%rbp), %rcx
	leaq	-1024(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	nbb_nameserver_connect@PLT
	testl	%eax, %eax
	je	.L18
	.loc 1 114 0
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	.loc 1 115 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	.loc 1 116 0
	movl	$-1, %eax
	jmp	.L17
.L18:
	.loc 1 119 0
	movq	-1080(%rbp), %rax
	leaq	NAMESERVER_CHANNEL_FULL(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L19
	.loc 1 120 0
	leaq	.LC13(%rip), %rdi
	call	puts@PLT
	.loc 1 122 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	.loc 1 123 0
	movl	$-1, %eax
	jmp	.L17
.L19:
.LBB2:
	.loc 1 126 0
	movq	-1080(%rbp), %rcx
	movl	-1044(%rbp), %edx
	movl	-1044(%rbp), %ebx
	leaq	.LC14(%rip), %rax
	movl	%ebx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 127 0
	movq	-1080(%rbp), %rdx
	movl	-1044(%rbp), %ecx
	leaq	.LC15(%rip), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 133 0
	leaq	.LC10(%rip), %rdx
	movq	-1080(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1088(%rbp)
	.loc 1 134 0
	movl	$1, -1048(%rbp)
	jmp	.L20
.L22:
	.loc 1 135 0
	movq	-1088(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -1052(%rbp)
	.loc 1 136 0
	movl	-1052(%rbp), %eax
	leal	1000(%rax), %edx
	movl	-1052(%rbp), %ebx
	movq	-1104(%rbp), %rax
	movl	$512, %ecx
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	nbb_open_channel@PLT
	cmpl	$-1, %eax
	jne	.L21
	.loc 1 138 0
	leaq	.LC16(%rip), %rax
	movl	-1048(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 139 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	.loc 1 140 0
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 141 0
	movl	$-1, %eax
	jmp	.L17
.L21:
	.loc 1 143 0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1088(%rbp)
	.loc 1 134 0
	addl	$1, -1048(%rbp)
.L20:
	movl	-1048(%rbp), %eax
	cmpl	-1092(%rbp), %eax
	jle	.L22
	.loc 1 146 0
	call	__libc_current_sigrtmax@PLT
	movq	nbb_recv_data@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	signal@PLT
	.loc 1 148 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	.loc 1 149 0
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 150 0
	movl	$0, %eax
.L17:
.LBE2:
	.loc 1 153 0
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L24
	call	__stack_chk_fail@PLT
.L24:
	addq	$1096, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE2:
	.size	nbb_init_service, .-nbb_init_service
	.section	.rodata
.LC17:
	.string	"service_name != ((void *)0)"
	.align 8
.LC18:
	.string	"! nbb_connect_service(): Unable to obtain semaphore\n"
	.align 8
.LC19:
	.string	"! nbb_connect_service(): Could not connect to nameserver!"
	.align 8
.LC20:
	.string	"! nbb_connect_service(): Invalid service: %s\n"
	.align 8
.LC21:
	.string	"! nbb_connect_service(): Service %s too busy, not enough channel\n"
.LC22:
	.string	"**Q_Q**"
	.align 8
.LC23:
	.string	"! nbb_connect_service(): Can't notify service '%s' of new connection\n"
	.align 8
.LC24:
	.string	"** Connecting to service successful, channel: %d service pid: %d\n"
	.text
.globl nbb_connect_service
	.type	nbb_connect_service, @function
nbb_connect_service:
.LFB3:
	.loc 1 158 0
	.cfi_startproc
	pushq	%rbp
.LCFI6:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI7:
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$2088, %rsp
	movq	%rdi, -2088(%rbp)
	movq	%rsi, -2096(%rbp)
	.loc 1 158 0
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 162 0
	cmpq	$0, -2096(%rbp)
	jne	.L26
	.cfi_offset 3, -24
	leaq	__PRETTY_FUNCTION__.3597(%rip), %rcx
	movl	$162, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC17(%rip), %rdi
	call	__assert_fail@PLT
.L26:
	.loc 1 164 0
	movl	$0, %esi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	sem_open@PLT
	movq	sem_id@GOTPCREL(%rip), %rdx
	movq	%rax, (%rdx)
	.loc 1 165 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	jne	.L27
	.loc 1 166 0
	leaq	.LC18(%rip), %rdi
	call	perror@PLT
	.loc 1 167 0
	movl	$-1, %eax
	jmp	.L28
.L27:
	.loc 1 170 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	sem_wait@PLT
	.loc 1 172 0
	leaq	-1024(%rbp), %rax
	movl	$2, %edx
	leaq	CLIENT(%rip), %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 173 0
	leaq	.LC10(%rip), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 174 0
	movq	-2096(%rbp), %rdx
	leaq	-1024(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 178 0
	leaq	-2040(%rbp), %rdx
	leaq	-2072(%rbp), %rcx
	leaq	-1024(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	nbb_nameserver_connect@PLT
	testl	%eax, %eax
	je	.L29
	.loc 1 179 0
	leaq	.LC19(%rip), %rdi
	call	puts@PLT
	.loc 1 180 0
	movl	$-1, %eax
	jmp	.L28
.L29:
	.loc 1 183 0
	movq	-2072(%rbp), %rax
	testq	%rax, %rax
	jne	.L30
	.loc 1 184 0
	movl	$-1, -2036(%rbp)
	jmp	.L31
.L30:
	.loc 1 187 0
	movq	-2072(%rbp), %rax
	leaq	UNKNOWN_SERVICE(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L32
	.loc 1 188 0
	leaq	.LC20(%rip), %rax
	movq	-2096(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 189 0
	movl	$-1, -2036(%rbp)
	jmp	.L31
.L32:
	.loc 1 192 0
	movq	-2072(%rbp), %rax
	leaq	SERVICE_BUSY(%rip), %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L33
	.loc 1 193 0
	leaq	.LC21(%rip), %rax
	movq	-2096(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 194 0
	movl	$-1, -2036(%rbp)
	jmp	.L31
.L33:
.LBB3:
	.loc 1 205 0
	leaq	.LC10(%rip), %rdx
	movq	-2072(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -2080(%rbp)
	.loc 1 206 0
	movq	-2080(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -2048(%rbp)
	.loc 1 207 0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -2080(%rbp)
	.loc 1 208 0
	movq	-2080(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movl	%eax, -2052(%rbp)
	.loc 1 210 0
	movl	-2048(%rbp), %eax
	leal	1000(%rax), %ebx
	movl	-2048(%rbp), %edx
	movq	-2088(%rbp), %rax
	movl	$0, %ecx
	movl	%ebx, %esi
	movq	%rax, %rdi
	call	nbb_open_channel@PLT
	movl	%eax, -2044(%rbp)
	.loc 1 212 0
	movl	-2044(%rbp), %ebx
	movl	$1000, %edi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%ebx,%rcx
	salq	$4, %rcx
	movq	%rdx, (%rcx,%rax)
	.loc 1 213 0
	movl	-2044(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	salq	$4, %rdx
	movq	(%rdx,%rax), %rax
	movq	-2096(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	.loc 1 214 0
	movl	-2044(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	movq	%rdx, %rcx
	salq	$4, %rcx
	movl	-2052(%rbp), %edx
	movl	%edx, 8(%rcx,%rax)
	.loc 1 216 0
	movl	-2044(%rbp), %eax
	movl	%eax, -2036(%rbp)
	.loc 1 218 0
	call	getpid@PLT
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	leaq	-2064(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 1 219 0
	leaq	.LC22(%rip), %rcx
	leaq	-2032(%rbp), %rax
	movl	$8, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 220 0
	leaq	.LC10(%rip), %rdx
	leaq	-2032(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 221 0
	leaq	-2064(%rbp), %rdx
	leaq	-2032(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 222 0
	leaq	.LC10(%rip), %rdx
	leaq	-2032(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 223 0
	movq	-2088(%rbp), %rdx
	leaq	-2032(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	.loc 1 226 0
	leaq	-2032(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	leaq	-2032(%rbp), %rcx
	movq	-2096(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	nbb_send@PLT
	testl	%eax, %eax
	je	.L34
	.loc 1 227 0
	leaq	.LC23(%rip), %rax
	movq	-2096(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 228 0
	movl	$-1, -2036(%rbp)
	jmp	.L31
.L34:
	.loc 1 230 0
	leaq	.LC24(%rip), %rax
	movl	-2052(%rbp), %edx
	movl	-2048(%rbp), %ecx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 231 0
	call	__libc_current_sigrtmax@PLT
	movq	nbb_recv_data@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	signal@PLT
.L31:
.LBE3:
	.loc 1 236 0
	movq	sem_id@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	sem_post@PLT
	.loc 1 238 0
	movl	-2036(%rbp), %eax
.L28:
	.loc 1 239 0
	movq	-24(%rbp), %rdx
	xorq	%fs:40, %rdx
	je	.L36
	call	__stack_chk_fail@PLT
.L36:
	addq	$2088, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE3:
	.size	nbb_connect_service, .-nbb_connect_service
	.section	.rodata
	.align 8
.LC25:
	.string	"owner != ((void *)0) && func != ((void *)0)"
	.align 8
.LC26:
	.string	"***NBB***: Set new_conn callback for '%s'\n"
	.text
.globl nbb_set_cb_new_connection
	.type	nbb_set_cb_new_connection, @function
nbb_set_cb_new_connection:
.LFB4:
	.loc 1 242 0
	.cfi_startproc
	pushq	%rbp
.LCFI8:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI9:
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 246 0
	cmpq	$0, -24(%rbp)
	je	.L38
	cmpq	$0, -32(%rbp)
	jne	.L39
.L38:
	leaq	__PRETTY_FUNCTION__.3668(%rip), %rcx
	movl	$246, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L39:
	.loc 1 248 0
	movl	$1, -4(%rbp)
	jmp	.L40
.L43:
	.loc 1 249 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L45
.L41:
	.loc 1 253 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L42
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L42
	.loc 1 254 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	48(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, 8(%rdx)
	.loc 1 255 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	64(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rax, 8(%rdx)
	.loc 1 256 0
	leaq	.LC26(%rip), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L42
.L45:
	.loc 1 250 0
	nop
.L42:
	.loc 1 248 0
	addl	$1, -4(%rbp)
.L40:
	cmpl	$14, -4(%rbp)
	jle	.L43
	.loc 1 259 0
	leave
	ret
	.cfi_endproc
.LFE4:
	.size	nbb_set_cb_new_connection, .-nbb_set_cb_new_connection
.globl nbb_set_cb_new_data
	.type	nbb_set_cb_new_data, @function
nbb_set_cb_new_data:
.LFB5:
	.loc 1 262 0
	.cfi_startproc
	pushq	%rbp
.LCFI10:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI11:
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 265 0
	cmpq	$0, -24(%rbp)
	je	.L47
	cmpq	$0, -32(%rbp)
	jne	.L48
.L47:
	leaq	__PRETTY_FUNCTION__.3697(%rip), %rcx
	movl	$265, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC25(%rip), %rdi
	call	__assert_fail@PLT
.L48:
	.loc 1 267 0
	movl	$1, -4(%rbp)
	jmp	.L49
.L52:
	.loc 1 268 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L54
.L50:
	.loc 1 272 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L51
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	(%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L51
	.loc 1 273 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	64(%rax), %rdx
	movq	-32(%rbp), %rax
	movq	%rax, (%rdx)
	jmp	.L51
.L54:
	.loc 1 269 0
	nop
.L51:
	.loc 1 267 0
	addl	$1, -4(%rbp)
.L49:
	cmpl	$14, -4(%rbp)
	jle	.L52
	.loc 1 276 0
	leave
	ret
	.cfi_endproc
.LFE5:
	.size	nbb_set_cb_new_data, .-nbb_set_cb_new_data
	.section	.rodata
	.align 8
.LC27:
	.string	"** nbb_write_bytes() read shmid: %d, write shmid: %d,  msg: %s, msg_len: %d\n"
.LC28:
	.string	"msg != ((void *)0)"
	.align 8
.LC29:
	.string	"! nbb_send(): nothing to send (0 length passed in)"
	.align 8
.LC30:
	.string	"slot_id >= 0 && slot_id < 15 && \"Process not found\""
	.align 8
.LC31:
	.string	"** nbb_write_bytes() Sent kill to %d\n"
	.text
.globl nbb_write_bytes
	.type	nbb_write_bytes, @function
nbb_write_bytes:
.LFB6:
	.loc 1 279 0
	.cfi_startproc
	pushq	%rbp
.LCFI12:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI13:
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$40, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 280 0
	movq	-40(%rbp), %rax
	movl	%eax, %ecx
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rbx
	.cfi_offset 3, -24
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$32, %rax
	movl	8(%rax), %esi
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$16, %rax
	movl	(%rax), %ebx
	leaq	.LC27(%rip), %rax
	movq	-32(%rbp), %rdx
	movl	%ecx, %r8d
	movq	%rdx, %rcx
	movl	%esi, %edx
	movl	%ebx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 281 0
	cmpq	$0, -32(%rbp)
	jne	.L56
	leaq	__PRETTY_FUNCTION__.3724(%rip), %rcx
	movl	$281, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC28(%rip), %rdi
	call	__assert_fail@PLT
.L56:
	.loc 1 283 0
	cmpq	$0, -40(%rbp)
	jne	.L57
	.loc 1 284 0
	leaq	.LC29(%rip), %rdi
	call	puts@PLT
	.loc 1 285 0
	movl	$0, %eax
	jmp	.L58
.L57:
	.loc 1 288 0
	cmpl	$0, -20(%rbp)
	js	.L59
	cmpl	$14, -20(%rbp)
	jle	.L60
.L59:
	leaq	__PRETTY_FUNCTION__.3724(%rip), %rcx
	movl	$288, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC30(%rip), %rdi
	call	__assert_fail@PLT
.L60:
	.loc 1 290 0
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movl	-20(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	nbb_insert_item@PLT
	.loc 1 291 0
	call	__libc_current_sigrtmax@PLT
	movl	%eax, %edx
	movl	-20(%rbp), %ecx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%ecx,%rcx
	salq	$4, %rcx
	movl	8(%rcx,%rax), %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	kill@PLT
	.loc 1 293 0
	movl	-20(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	salq	$4, %rdx
	movl	8(%rdx,%rax), %edx
	leaq	.LC31(%rip), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 295 0
	movl	$0, %eax
.L58:
	.loc 1 297 0
	addq	$40, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE6:
	.size	nbb_write_bytes, .-nbb_write_bytes
.globl nbb_send
	.type	nbb_send, @function
nbb_send:
.LFB7:
	.loc 1 300 0
	.cfi_startproc
	pushq	%rbp
.LCFI14:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI15:
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	.loc 1 305 0
	movl	$1, -4(%rbp)
	jmp	.L63
.L66:
	.loc 1 306 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L64
	movl	-4(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	salq	$4, %rdx
	movq	(%rdx,%rax), %rax
	testq	%rax, %rax
	je	.L64
	.loc 1 307 0
	movl	-4(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	salq	$4, %rdx
	movq	(%rdx,%rax), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	.loc 1 306 0
	testl	%eax, %eax
	je	.L68
.L64:
	.loc 1 305 0
	addl	$1, -4(%rbp)
.L63:
	cmpl	$14, -4(%rbp)
	jle	.L66
	jmp	.L65
.L68:
	.loc 1 308 0
	nop
.L65:
	.loc 1 312 0
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rcx
	movl	-4(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	nbb_write_bytes@PLT
	.loc 1 314 0
	leave
	ret
	.cfi_endproc
.LFE7:
	.size	nbb_send, .-nbb_send
	.section	.rodata
	.align 8
.LC32:
	.string	"***NBB***: Inside signal handler"
	.align 8
.LC33:
	.string	"***NBB***: New connection on slot %d from client_name: %s with pid: %d\n"
.LC34:
	.string	"** Received %zu bytes: "
.LC35:
	.string	"%02x"
.LC36:
	.string	" from shm id %d slot %d\n"
	.text
.globl nbb_recv_data
	.type	nbb_recv_data, @function
nbb_recv_data:
.LFB8:
	.loc 1 318 0
	.cfi_startproc
	pushq	%rbp
.LCFI16:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI17:
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	movl	%edi, -68(%rbp)
	.loc 1 321 0
	movq	$0, -48(%rbp)
	.loc 1 322 0
	movl	$-1, -24(%rbp)
	.loc 1 324 0
	movl	$0, -28(%rbp)
	.loc 1 327 0
	leaq	.LC32(%rip), %rdi
	.cfi_offset 3, -24
	call	puts@PLT
	.loc 1 331 0
	movl	$1, -20(%rbp)
	jmp	.L70
.L79:
	.loc 1 332 0
	leaq	-40(%rbp), %rcx
	leaq	-48(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	nbb_read_item@PLT
	movl	%eax, -24(%rbp)
	.loc 1 334 0
	cmpl	$0, -24(%rbp)
	jne	.L71
.LBB4:
	.loc 1 335 0
	movq	-40(%rbp), %rax
	movl	$7, %edx
	leaq	.LC22(%rip), %rsi
	movq	%rax, %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	jne	.L72
.LBB5:
	.loc 1 336 0
	movq	-48(%rbp), %rax
	leaq	1(%rax), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, -40(%rbp)
	.loc 1 337 0
	movq	-40(%rbp), %rdx
	movq	-48(%rbp), %rax
	leaq	(%rdx,%rax), %rax
	movb	$0, (%rax)
	.loc 1 339 0
	movq	$0, -56(%rbp)
	.loc 1 341 0
	leaq	.LC10(%rip), %rdx
	movq	-40(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	.loc 1 342 0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -56(%rbp)
	.loc 1 343 0
	movl	-20(%rbp), %ebx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	atoi@PLT
	movq	connected_nodes@GOTPCREL(%rip), %rdx
	movslq	%ebx,%rcx
	salq	$4, %rcx
	movl	%eax, 8(%rcx,%rdx)
	.loc 1 344 0
	leaq	.LC10(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -56(%rbp)
	.loc 1 345 0
	movl	-20(%rbp), %ebx
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%ebx,%rcx
	salq	$4, %rcx
	movq	%rdx, (%rcx,%rax)
	.loc 1 346 0
	movq	-56(%rbp), %rdx
	movl	-20(%rbp), %ecx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%ecx,%rcx
	salq	$4, %rcx
	movq	(%rcx,%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	.loc 1 349 0
	movl	-20(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	salq	$4, %rdx
	movl	8(%rdx,%rax), %ecx
	movl	-20(%rbp), %edx
	movq	connected_nodes@GOTPCREL(%rip), %rax
	movslq	%edx,%rdx
	salq	$4, %rdx
	movq	(%rdx,%rax), %rdx
	leaq	.LC33(%rip), %rax
	movl	-20(%rbp), %ebx
	movl	%ebx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 351 0
	movl	$1, -28(%rbp)
.L72:
.LBE5:
	.loc 1 355 0
	cmpl	$0, -28(%rbp)
	je	.L73
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	8(%rax), %rax
	testq	%rax, %rax
	je	.L73
	.loc 1 356 0
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	8(%rax), %rcx
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$64, %rax
	movq	8(%rax), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	*%rcx
.L73:
	.loc 1 361 0
	cmpl	$0, -28(%rbp)
	jne	.L74
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$64, %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L74
	.loc 1 362 0
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$64, %rax
	movq	(%rax), %rdx
	movl	-20(%rbp), %eax
	movl	%eax, %edi
	call	*%rdx
.L74:
	.loc 1 365 0
	movq	-48(%rbp), %rdx
	leaq	.LC34(%rip), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 368 0
	movl	$0, -32(%rbp)
	jmp	.L75
.L76:
	.loc 1 369 0
	movq	-40(%rbp), %rdx
	movl	-32(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rax
	movzbl	(%rax), %eax
	movsbl	%al,%edx
	leaq	.LC35(%rip), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 368 0
	addl	$1, -32(%rbp)
.L75:
	movl	-32(%rbp), %eax
	movslq	%eax,%rdx
	movq	-48(%rbp), %rax
	cmpq	%rax, %rdx
	jb	.L76
	.loc 1 372 0
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	(%rax), %ecx
	leaq	.LC36(%rip), %rax
	movl	-20(%rbp), %edx
	movl	%ecx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 375 0
	cmpl	$0, -28(%rbp)
	jne	.L77
	.loc 1 376 0
	movq	-48(%rbp), %rax
	movl	%eax, %edx
	movq	-40(%rbp), %rcx
	movl	-20(%rbp), %eax
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	nbb_flush_shm@PLT
.L77:
	.loc 1 386 0
	movq	$0, -48(%rbp)
	.loc 1 387 0
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
.L71:
.LBE4:
	.loc 1 331 0
	addl	$1, -20(%rbp)
.L70:
	movl	-20(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	je	.L78
	cmpl	$14, -20(%rbp)
	jle	.L79
.L78:
	.loc 1 392 0
	call	__libc_current_sigrtmax@PLT
	movq	nbb_recv_data@GOTPCREL(%rip), %rdx
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	signal@PLT
	.loc 1 393 0
	addq	$72, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE8:
	.size	nbb_recv_data, .-nbb_recv_data
	.section	.rodata
	.align 8
.LC37:
	.string	"! nbb_open_channel(): no free_slot"
.LC38:
	.string	"shmget"
.LC39:
	.string	"shmat"
	.text
.globl nbb_open_channel
	.type	nbb_open_channel, @function
nbb_open_channel:
.LFB9:
	.loc 1 396 0
	.cfi_startproc
	pushq	%rbp
.LCFI18:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI19:
	.cfi_def_cfa_register 6
	pushq	%r12
	pushq	%rbx
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movl	%esi, -44(%rbp)
	movl	%edx, -48(%rbp)
	movl	%ecx, -52(%rbp)
	.loc 1 401 0
	cmpl	$4000, -44(%rbp)
	jne	.L82
	.cfi_offset 3, -32
	.cfi_offset 12, -24
	cmpl	$4001, -48(%rbp)
	jne	.L82
	.loc 1 402 0
	movl	$0, -24(%rbp)
	.loc 1 401 0
	jmp	.L83
.L82:
	.loc 1 405 0
	movl	$0, %eax
	call	nbb_free_channel_slot@PLT
	movl	%eax, -24(%rbp)
.L83:
	.loc 1 408 0
	cmpl	$-1, -24(%rbp)
	jne	.L84
	.loc 1 409 0
	leaq	.LC37(%rip), %rdi
	call	puts@PLT
	.loc 1 410 0
	movl	$-1, %eax
	jmp	.L85
.L84:
	.loc 1 417 0
	movl	-52(%rbp), %eax
	movl	%eax, %edx
	orl	$438, %edx
	movl	-44(%rbp), %eax
	movl	$8192, %esi
	movl	%eax, %edi
	call	shmget@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.L86
	.loc 1 418 0
	leaq	.LC38(%rip), %rdi
	call	perror@PLT
	.loc 1 419 0
	movl	$-1, %eax
	jmp	.L85
.L86:
	.loc 1 421 0
	movl	-20(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, -32(%rbp)
	cmpq	$-1, -32(%rbp)
	jne	.L87
	.loc 1 422 0
	leaq	.LC39(%rip), %rdi
	call	perror@PLT
	.loc 1 423 0
	movl	$-1, %eax
	jmp	.L85
.L87:
	.loc 1 426 0
	movq	-32(%rbp), %rax
	movl	$8192, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 428 0
	movl	-24(%rbp), %eax
	movq	-32(%rbp), %rbx
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rbx, (%rax,%rcx)
	.loc 1 429 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	(%rax,%rcx), %rax
	movw	$4096, 12(%rax)
	.loc 1 430 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	(%rax,%rcx), %rax
	movw	$4096, 10(%rax)
	.loc 1 431 0
	movl	-24(%rbp), %eax
	movq	-32(%rbp), %rdx
	leaq	4096(%rdx), %rbx
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rbx, 8(%rax,%rcx)
	.loc 1 432 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	16(%rax), %rdx
	movl	-44(%rbp), %eax
	movl	%eax, (%rdx)
	.loc 1 433 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	$0, 4(%rax)
	.loc 1 436 0
	movl	$-1, -20(%rbp)
	.loc 1 437 0
	movq	$-1, -32(%rbp)
	.loc 1 438 0
	movl	-52(%rbp), %eax
	movl	%eax, %edx
	orl	$438, %edx
	movl	-48(%rbp), %eax
	movl	$8192, %esi
	movl	%eax, %edi
	call	shmget@PLT
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	jns	.L88
	.loc 1 439 0
	leaq	.LC38(%rip), %rdi
	call	perror@PLT
	.loc 1 440 0
	movl	$-1, %eax
	jmp	.L85
.L88:
	.loc 1 442 0
	movl	-20(%rbp), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmat@PLT
	movq	%rax, -32(%rbp)
	cmpq	$-1, -32(%rbp)
	jne	.L89
	.loc 1 443 0
	leaq	.LC39(%rip), %rdi
	call	perror@PLT
	.loc 1 444 0
	movl	$-1, %eax
	jmp	.L85
.L89:
	.loc 1 447 0
	movq	-32(%rbp), %rax
	movl	$8192, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 449 0
	movl	-24(%rbp), %eax
	movq	-32(%rbp), %rcx
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$16, %rax
	movq	%rcx, 8(%rax)
	.loc 1 450 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movq	8(%rax), %rax
	movw	$4096, 12(%rax)
	.loc 1 451 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movq	8(%rax), %rax
	movw	$4096, 10(%rax)
	.loc 1 452 0
	movl	-24(%rbp), %eax
	movq	-32(%rbp), %rdx
	leaq	4096(%rdx), %rcx
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$32, %rax
	movq	%rcx, (%rax)
	.loc 1 453 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	leaq	32(%rax), %rdx
	movl	-48(%rbp), %eax
	movl	%eax, 8(%rdx)
	.loc 1 454 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movl	$0, 12(%rax)
	.loc 1 456 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	$1, (%rax)
	.loc 1 458 0
	cmpq	$0, -40(%rbp)
	je	.L90
	.loc 1 459 0
	movl	-24(%rbp), %r12d
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	addq	$1, %rax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rcx
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%r12d,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$48, %rax
	movq	%rcx, (%rax)
	.loc 1 460 0
	movl	-24(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$48, %rax
	movq	(%rax), %rax
	movq	-40(%rbp), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
.L90:
	.loc 1 463 0
	movl	-24(%rbp), %eax
	movslq	%eax,%rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	delay_buffers@GOTPCREL(%rip), %rax
	leaq	(%rdx,%rax), %rax
	movl	$24, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	.loc 1 465 0
	movl	-24(%rbp), %eax
.L85:
	.loc 1 466 0
	addq	$48, %rsp
	popq	%rbx
	popq	%r12
	leave
	ret
	.cfi_endproc
.LFE9:
	.size	nbb_open_channel, .-nbb_open_channel
	.section	.rodata
.LC40:
	.string	"index >= 0 && index < 15"
	.text
.globl nbb_close_channel
	.type	nbb_close_channel, @function
nbb_close_channel:
.LFB10:
	.loc 1 469 0
	.cfi_startproc
	pushq	%rbp
.LCFI20:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI21:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 472 0
	cmpl	$0, -4(%rbp)
	js	.L93
	cmpl	$14, -4(%rbp)
	jle	.L94
.L93:
	leaq	__PRETTY_FUNCTION__.3929(%rip), %rcx
	movl	$472, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC40(%rip), %rdi
	call	__assert_fail@PLT
.L94:
	.loc 1 474 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	(%rax,%rcx), %rax
	movq	%rax, %rdi
	call	shmdt@PLT
	.loc 1 475 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	(%rax), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmctl@PLT
	cmpl	$-1, %eax
	jne	.L95
	.loc 1 476 0
	movl	$-1, %eax
	jmp	.L96
.L95:
	.loc 1 479 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movq	8(%rax), %rax
	movq	%rax, %rdi
	call	shmdt@PLT
	.loc 1 480 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movl	8(%rax), %eax
	movl	$0, %edx
	movl	$0, %esi
	movl	%eax, %edi
	call	shmctl@PLT
	cmpl	$-1, %eax
	jne	.L97
	.loc 1 481 0
	movl	$-1, %eax
	jmp	.L96
.L97:
	.loc 1 484 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	$0, (%rax)
	.loc 1 485 0
	movl	$0, %eax
.L96:
	.loc 1 486 0
	leave
	ret
	.cfi_endproc
.LFE10:
	.size	nbb_close_channel, .-nbb_close_channel
.globl nbb_free_channel_slot
	.type	nbb_free_channel_slot, @function
nbb_free_channel_slot:
.LFB11:
	.loc 1 489 0
	.cfi_startproc
	pushq	%rbp
.LCFI22:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI23:
	.cfi_def_cfa_register 6
	.loc 1 492 0
	movl	$0, -4(%rbp)
	jmp	.L100
.L103:
	.loc 1 493 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$80, %rax
	movl	(%rax), %eax
	testl	%eax, %eax
	jne	.L101
	.loc 1 494 0
	movl	-4(%rbp), %eax
	jmp	.L102
.L101:
	.loc 1 492 0
	addl	$1, -4(%rbp)
.L100:
	cmpl	$14, -4(%rbp)
	jle	.L103
	.loc 1 498 0
	movl	$-1, %eax
.L102:
	.loc 1 499 0
	leave
	ret
	.cfi_endproc
.LFE11:
	.size	nbb_free_channel_slot, .-nbb_free_channel_slot
	.section	.rodata
	.align 8
.LC41:
	.string	"slot >= 0 && buf != ((void *)0) && size >= 0"
	.align 8
.LC42:
	.string	"***NBB***: Delay buffer %d: %d/%d\n"
	.align 8
.LC43:
	.string	"delay_buffer->capacity >= delay_buffer->len"
	.align 8
.LC44:
	.string	"delay_buffer->content != ((void *)0) && delay_buffer->len > 0"
	.text
.globl nbb_read_bytes
	.type	nbb_read_bytes, @function
nbb_read_bytes:
.LFB12:
	.loc 1 505 0
	.cfi_startproc
	pushq	%rbp
.LCFI24:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI25:
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movl	%edx, -52(%rbp)
	.loc 1 506 0
	cmpl	$0, -36(%rbp)
	js	.L106
	.cfi_offset 3, -24
	cmpq	$0, -48(%rbp)
	je	.L106
	cmpl	$0, -52(%rbp)
	jns	.L107
.L106:
	leaq	__PRETTY_FUNCTION__.3965(%rip), %rcx
	movl	$506, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC41(%rip), %rdi
	call	__assert_fail@PLT
.L107:
	.loc 1 508 0
	movl	-36(%rbp), %eax
	movslq	%eax,%rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	delay_buffers@GOTPCREL(%rip), %rax
	leaq	(%rdx,%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 509 0
	movq	-32(%rbp), %rax
	movl	12(%rax), %ecx
	movq	-32(%rbp), %rax
	movl	8(%rax), %edx
	leaq	.LC42(%rip), %rax
	movl	-36(%rbp), %ebx
	movl	%ebx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 511 0
	movq	-32(%rbp), %rax
	movl	12(%rax), %edx
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	%eax, %edx
	jge	.L108
	leaq	__PRETTY_FUNCTION__.3965(%rip), %rcx
	movl	$511, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC43(%rip), %rdi
	call	__assert_fail@PLT
.L108:
	.loc 1 514 0
	cmpl	$0, -52(%rbp)
	je	.L109
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L109
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jne	.L110
.L109:
	.loc 1 515 0
	movl	$0, %eax
	jmp	.L111
.L110:
	.loc 1 518 0
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L112
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	testl	%eax, %eax
	jg	.L113
.L112:
	leaq	__PRETTY_FUNCTION__.3965(%rip), %rcx
	movl	$518, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC44(%rip), %rdi
	call	__assert_fail@PLT
.L113:
	.loc 1 521 0
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	cmpl	-52(%rbp), %eax
	jge	.L114
	.loc 1 522 0
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	movl	%eax, -52(%rbp)
.L114:
	.loc 1 526 0
	movl	-52(%rbp), %eax
	movslq	%eax,%rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rcx
	movq	-48(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 527 0
	movl	-36(%rbp), %esi
	movl	-36(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	4(%rax), %eax
	movl	%eax, %ecx
	addl	-52(%rbp), %ecx
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%esi,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$16, %rax
	movl	%ecx, 4(%rax)
	.loc 1 530 0
	movq	-32(%rbp), %rax
	movl	8(%rax), %eax
	subl	-52(%rbp), %eax
	movl	%eax, -20(%rbp)
	.loc 1 531 0
	cmpl	$0, -20(%rbp)
	jle	.L115
	.loc 1 532 0
	movl	-20(%rbp), %eax
	movslq	%eax,%rdx
	movq	-32(%rbp), %rax
	movq	(%rax), %rcx
	movl	-52(%rbp), %eax
	cltq
	addq	%rax, %rcx
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memmove@PLT
.L115:
	.loc 1 534 0
	movq	-32(%rbp), %rax
	movl	-20(%rbp), %edx
	movl	%edx, 8(%rax)
	.loc 1 536 0
	movl	-52(%rbp), %eax
.L111:
	.loc 1 537 0
	addq	$56, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE12:
	.size	nbb_read_bytes, .-nbb_read_bytes
	.section	.rodata
.LC45:
	.string	"slot >= 0 && slot < 15"
	.text
.globl nbb_bytes_available
	.type	nbb_bytes_available, @function
nbb_bytes_available:
.LFB13:
	.loc 1 540 0
	.cfi_startproc
	pushq	%rbp
.LCFI26:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI27:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 542 0
	cmpl	$0, -4(%rbp)
	js	.L118
	cmpl	$14, -4(%rbp)
	jle	.L119
.L118:
	leaq	__PRETTY_FUNCTION__.4013(%rip), %rcx
	movl	$542, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	call	__assert_fail@PLT
.L119:
	.loc 1 543 0
	movl	-4(%rbp), %eax
	movq	delay_buffers@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movl	8(%rax,%rcx), %eax
	.loc 1 544 0
	leave
	ret
	.cfi_endproc
.LFE13:
	.size	nbb_bytes_available, .-nbb_bytes_available
.globl nbb_bytes_read
	.type	nbb_bytes_read, @function
nbb_bytes_read:
.LFB14:
	.loc 1 547 0
	.cfi_startproc
	pushq	%rbp
.LCFI28:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI29:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 548 0
	cmpl	$0, -4(%rbp)
	js	.L122
	cmpl	$14, -4(%rbp)
	jle	.L123
.L122:
	leaq	__PRETTY_FUNCTION__.4022(%rip), %rcx
	movl	$548, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	call	__assert_fail@PLT
.L123:
	.loc 1 549 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movl	4(%rax), %eax
	.loc 1 550 0
	leave
	ret
	.cfi_endproc
.LFE14:
	.size	nbb_bytes_read, .-nbb_bytes_read
.globl nbb_bytes_written
	.type	nbb_bytes_written, @function
nbb_bytes_written:
.LFB15:
	.loc 1 553 0
	.cfi_startproc
	pushq	%rbp
.LCFI30:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI31:
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	.loc 1 554 0
	cmpl	$0, -4(%rbp)
	js	.L126
	cmpl	$14, -4(%rbp)
	jle	.L127
.L126:
	leaq	__PRETTY_FUNCTION__.4031(%rip), %rcx
	movl	$554, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	call	__assert_fail@PLT
.L127:
	.loc 1 555 0
	movl	-4(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movl	12(%rax), %eax
	.loc 1 556 0
	leave
	ret
	.cfi_endproc
.LFE15:
	.size	nbb_bytes_written, .-nbb_bytes_written
	.section	.rodata
	.align 8
.LC46:
	.string	"array_to_flush != ((void *)0) && size >= 0"
	.text
.globl nbb_flush_shm
	.type	nbb_flush_shm, @function
nbb_flush_shm:
.LFB16:
	.loc 1 559 0
	.cfi_startproc
	pushq	%rbp
.LCFI32:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI33:
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	.loc 1 560 0
	cmpl	$0, -20(%rbp)
	js	.L130
	cmpl	$14, -20(%rbp)
	jle	.L131
.L130:
	leaq	__PRETTY_FUNCTION__.4042(%rip), %rcx
	movl	$560, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC45(%rip), %rdi
	call	__assert_fail@PLT
.L131:
	.loc 1 561 0
	cmpq	$0, -32(%rbp)
	je	.L132
	cmpl	$0, -36(%rbp)
	jns	.L133
.L132:
	leaq	__PRETTY_FUNCTION__.4042(%rip), %rcx
	movl	$561, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC46(%rip), %rdi
	call	__assert_fail@PLT
.L133:
	.loc 1 563 0
	cmpl	$0, -36(%rbp)
	je	.L139
.L134:
	.loc 1 566 0
	movl	-20(%rbp), %eax
	movslq	%eax,%rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	%rax, %rdx
	movq	delay_buffers@GOTPCREL(%rip), %rax
	leaq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 567 0
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	addl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
	.loc 1 570 0
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	cmpl	-4(%rbp), %eax
	jge	.L136
	.loc 1 572 0
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	testl	%eax, %eax
	jne	.L137
	.loc 1 573 0
	movq	-16(%rbp), %rax
	movl	$1000, 12(%rax)
.L137:
	.loc 1 575 0
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	addl	%eax, %eax
	movslq	%eax,%rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	realloc@PLT
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 576 0
	movq	-16(%rbp), %rax
	movl	12(%rax), %eax
	leal	(%rax,%rax), %edx
	movq	-16(%rbp), %rax
	movl	%edx, 12(%rax)
.L136:
	.loc 1 580 0
	movl	-36(%rbp), %eax
	movslq	%eax,%rdx
	movq	-16(%rbp), %rax
	movq	(%rax), %rcx
	movq	-16(%rbp), %rax
	movl	8(%rax), %eax
	cltq
	addq	%rax, %rcx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movq	%rcx, %rdi
	call	memcpy@PLT
	.loc 1 581 0
	movq	-16(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, 8(%rax)
	jmp	.L138
.L139:
	.loc 1 564 0
	nop
.L138:
	.loc 1 585 0
	leave
	ret
	.cfi_endproc
.LFE16:
	.size	nbb_flush_shm, .-nbb_flush_shm
	.section	.rodata
	.align 8
.LC47:
	.string	"channel_id >= 0 && channel_id < 15"
	.align 8
.LC48:
	.string	"ptr_to_item != ((void *)0) && size >= 0"
.LC49:
	.string	"else..."
	.align 8
.LC50:
	.string	"poff: %d psize: %d size: %zu bsize: %d\n"
	.text
.globl nbb_insert_item
	.type	nbb_insert_item, @function
nbb_insert_item:
.LFB17:
	.loc 1 588 0
	.cfi_startproc
	pushq	%rbp
.LCFI34:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI35:
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$72, %rsp
	movl	%edi, -52(%rbp)
	movq	%rsi, -64(%rbp)
	movq	%rdx, -72(%rbp)
	.loc 1 589 0
	cmpl	$0, -52(%rbp)
	js	.L141
	.cfi_offset 3, -24
	cmpl	$14, -52(%rbp)
	jle	.L142
.L141:
	leaq	__PRETTY_FUNCTION__.4080(%rip), %rcx
	movl	$589, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC47(%rip), %rdi
	call	__assert_fail@PLT
.L142:
	.loc 1 590 0
	cmpq	$0, -64(%rbp)
	jne	.L143
	leaq	__PRETTY_FUNCTION__.4080(%rip), %rcx
	movl	$590, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC48(%rip), %rdi
	call	__assert_fail@PLT
.L143:
	.loc 1 592 0
	movl	-52(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$16, %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 593 0
	movl	-52(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	.loc 1 595 0
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movw	%ax, -18(%rbp)
	.loc 1 597 0
	cmpl	$0, -52(%rbp)
	js	.L144
	cmpl	$14, -52(%rbp)
	jle	.L145
.L144:
	leaq	__PRETTY_FUNCTION__.4080(%rip), %rcx
	movl	$597, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC47(%rip), %rdi
	call	__assert_fail@PLT
.L145:
	.loc 1 598 0
	cmpq	$0, -64(%rbp)
	jne	.L146
	leaq	__PRETTY_FUNCTION__.4080(%rip), %rcx
	movl	$598, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC48(%rip), %rdi
	call	__assert_fail@PLT
.L146:
	.loc 1 600 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-18(%rbp), %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$512, %eax
	jne	.L147
	.loc 1 601 0
	movl	$1, %eax
	jmp	.L148
.L147:
	.loc 1 604 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	movzwl	%ax, %edx
	movzwl	-18(%rbp), %eax
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	cmpl	$511, %eax
	jne	.L149
	.loc 1 605 0
	movl	$2, %eax
	jmp	.L148
.L149:
	.loc 1 614 0
	movq	-32(%rbp), %rax
	leaq	14(%rax), %rcx
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	shrw	%ax
	movzwl	%ax, %eax
	leal	-1(%rax), %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%eax, %edx
	andl	$255, %edx
	movl	%edx, %ebx
	subl	%eax, %ebx
	movl	%ebx, %eax
	cltq
	salq	$2, %rax
	leaq	(%rcx,%rax), %rax
	movq	%rax, -48(%rbp)
	.loc 1 618 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	testw	%ax, %ax
	jne	.L150
	.loc 1 619 0
	movl	$0, -24(%rbp)
	jmp	.L151
.L150:
	.loc 1 621 0
	movq	-48(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movq	-48(%rbp), %rax
	movzwl	2(%rax), %eax
	movzwl	%ax, %eax
	leal	(%rdx,%rax), %eax
	cltq
	movq	%rax, %rdx
	addq	-72(%rbp), %rdx
	movq	-32(%rbp), %rax
	movzwl	12(%rax), %eax
	movzwl	%ax, %eax
	cmpq	%rax, %rdx
	jae	.L152
	.loc 1 622 0
	movq	-48(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %edx
	movq	-48(%rbp), %rax
	movzwl	2(%rax), %eax
	movzwl	%ax, %eax
	leal	(%rdx,%rax), %eax
	movl	%eax, -24(%rbp)
	jmp	.L151
.L152:
	.loc 1 627 0
	movq	-32(%rbp), %rax
	movzwl	2(%rax), %eax
	shrw	%ax
	movzwl	%ax, %eax
	movzbl	%al,%edx
	movq	-32(%rbp), %rax
	movslq	%edx,%rdx
	movzwl	14(%rax,%rdx,4), %eax
	movzwl	%ax, %eax
	cmpq	-72(%rbp), %rax
	jbe	.L153
	.loc 1 628 0
	movl	$0, -24(%rbp)
	jmp	.L151
.L153:
	.loc 1 632 0
	leaq	.LC49(%rip), %rdi
	call	puts@PLT
	.loc 1 634 0
	movq	-32(%rbp), %rax
	movzwl	12(%rax), %eax
	.loc 1 633 0
	movzwl	%ax, %esi
	.loc 1 634 0
	movq	-48(%rbp), %rax
	movzwl	2(%rax), %eax
	.loc 1 633 0
	movzwl	%ax, %edx
	movq	-48(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %ebx
	leaq	.LC50(%rip), %rax
	movq	-72(%rbp), %rcx
	movl	%esi, %r8d
	movl	%ebx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 635 0
	movl	$1, %eax
	jmp	.L148
.L151:
	.loc 1 639 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	leal	1(%rax), %edx
	movq	-32(%rbp), %rax
	movw	%dx, 4(%rax)
	.loc 1 642 0
	movl	-24(%rbp), %eax
	cltq
	addq	-40(%rbp), %rax
	movq	-72(%rbp), %rdx
	movq	-64(%rbp), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 645 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	shrw	%ax
	movzwl	%ax, %eax
	movzbl	%al,%edx
	movl	-24(%rbp), %eax
	movl	%eax, %ecx
	movq	-32(%rbp), %rax
	movslq	%edx,%rdx
	movw	%cx, 14(%rax,%rdx,4)
	.loc 1 646 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	shrw	%ax
	movzwl	%ax, %eax
	movzbl	%al,%edx
	movq	-72(%rbp), %rax
	movl	%eax, %ecx
	movq	-32(%rbp), %rax
	movslq	%edx,%rdx
	movw	%cx, 16(%rax,%rdx,4)
	.loc 1 649 0
	movq	-32(%rbp), %rax
	movzwl	6(%rax), %eax
	leal	2(%rax), %edx
	movq	-32(%rbp), %rax
	movw	%dx, 4(%rax)
	.loc 1 656 0
	movq	-32(%rbp), %rax
	movzwl	4(%rax), %edx
	movq	-32(%rbp), %rax
	movw	%dx, 6(%rax)
	.loc 1 658 0
	movq	-64(%rbp), %rax
	movl	$8, %edx
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rdi
	call	memcmp@PLT
	testl	%eax, %eax
	je	.L154
	.loc 1 659 0
	movl	-52(%rbp), %esi
	movl	-52(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rcx, %rax
	addq	$32, %rax
	movl	12(%rax), %eax
	movl	%eax, %edx
	movq	-72(%rbp), %rax
	leal	(%rdx,%rax), %eax
	subl	$1, %eax
	movl	%eax, %ecx
	movq	channel_list@GOTPCREL(%rip), %rbx
	movslq	%esi,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	addq	%rbx, %rax
	addq	$32, %rax
	movl	%ecx, 12(%rax)
.L154:
	.loc 1 662 0
	movl	$0, %eax
.L148:
	.loc 1 663 0
	addq	$72, %rsp
	popq	%rbx
	leave
	ret
	.cfi_endproc
.LFE17:
	.size	nbb_insert_item, .-nbb_insert_item
	.section	.rodata
	.align 8
.LC51:
	.string	"ptr_to_item != ((void *)0) && size != ((void *)0)"
	.align 8
.LC52:
	.string	"! nbb_read_item(): invalid channel_id %d\n"
	.text
.globl nbb_read_item
	.type	nbb_read_item, @function
nbb_read_item:
.LFB18:
	.loc 1 666 0
	.cfi_startproc
	pushq	%rbp
.LCFI36:
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
.LCFI37:
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	.loc 1 667 0
	movl	-36(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	(%rax,%rcx), %rax
	movq	%rax, -16(%rbp)
	.loc 1 668 0
	movl	-36(%rbp), %eax
	movq	channel_list@GOTPCREL(%rip), %rcx
	movslq	%eax,%rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$3, %rax
	movq	8(%rax,%rcx), %rax
	movq	%rax, -24(%rbp)
	.loc 1 669 0
	movq	-16(%rbp), %rax
	movzwl	4(%rax), %eax
	movw	%ax, -2(%rbp)
	.loc 1 671 0
	cmpl	$0, -36(%rbp)
	js	.L157
	cmpl	$14, -36(%rbp)
	jle	.L158
.L157:
	leaq	__PRETTY_FUNCTION__.4191(%rip), %rcx
	movl	$671, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC47(%rip), %rdi
	call	__assert_fail@PLT
.L158:
	.loc 1 672 0
	cmpq	$0, -48(%rbp)
	je	.L159
	cmpq	$0, -56(%rbp)
	jne	.L160
.L159:
	leaq	__PRETTY_FUNCTION__.4191(%rip), %rcx
	movl	$672, %edx
	leaq	.LC0(%rip), %rsi
	leaq	.LC51(%rip), %rdi
	call	__assert_fail@PLT
.L160:
	.loc 1 674 0
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 675 0
	movq	-56(%rbp), %rax
	movq	$0, (%rax)
	.loc 1 677 0
	cmpl	$0, -36(%rbp)
	jns	.L161
	.loc 1 678 0
	leaq	.LC52(%rip), %rax
	movl	-36(%rbp), %edx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 679 0
	movl	$-1, %eax
	jmp	.L162
.L161:
	.loc 1 687 0
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	cmpw	-2(%rbp), %ax
	jne	.L163
	.loc 1 688 0
	movl	$3, %eax
	jmp	.L162
.L163:
	.loc 1 691 0
	movzwl	-2(%rbp), %edx
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	movzwl	%ax, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	movl	%ecx, %eax
	cmpl	$1, %eax
	jne	.L164
	.loc 1 692 0
	movl	$4, %eax
	jmp	.L162
.L164:
	.loc 1 695 0
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	leal	1(%rax), %edx
	movq	-16(%rbp), %rax
	movw	%dx, (%rax)
	.loc 1 699 0
	movq	-16(%rbp), %rax
	leaq	14(%rax), %rdx
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	shrw	%ax
	movzwl	%ax, %eax
	andl	$255, %eax
	salq	$2, %rax
	leaq	(%rdx,%rax), %rax
	movq	%rax, -32(%rbp)
	.loc 1 700 0
	movq	-32(%rbp), %rax
	movzwl	2(%rax), %eax
	movzwl	%ax, %eax
	movq	%rax, %rdi
	call	malloc@PLT
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 701 0
	movq	-32(%rbp), %rax
	movzwl	2(%rax), %eax
	movzwl	%ax, %edx
	movq	-32(%rbp), %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	movq	%rax, %rcx
	addq	-24(%rbp), %rcx
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	.loc 1 702 0
	movq	-32(%rbp), %rax
	movzwl	2(%rax), %eax
	movzwl	%ax, %edx
	movq	-56(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 706 0
	movq	-16(%rbp), %rax
	movzwl	2(%rax), %eax
	leal	2(%rax), %edx
	movq	-16(%rbp), %rax
	movw	%dx, (%rax)
	.loc 1 707 0
	movq	-16(%rbp), %rax
	movzwl	(%rax), %edx
	movq	-16(%rbp), %rax
	movw	%dx, 2(%rax)
	.loc 1 709 0
	movl	$0, %eax
.L162:
	.loc 1 710 0
	leave
	ret
	.cfi_endproc
.LFE18:
	.size	nbb_read_item, .-nbb_read_item
	.section	.rodata
	.type	__PRETTY_FUNCTION__.4191, @object
	.size	__PRETTY_FUNCTION__.4191, 14
__PRETTY_FUNCTION__.4191:
	.string	"nbb_read_item"
	.align 16
	.type	__PRETTY_FUNCTION__.4080, @object
	.size	__PRETTY_FUNCTION__.4080, 16
__PRETTY_FUNCTION__.4080:
	.string	"nbb_insert_item"
	.type	__PRETTY_FUNCTION__.4042, @object
	.size	__PRETTY_FUNCTION__.4042, 14
__PRETTY_FUNCTION__.4042:
	.string	"nbb_flush_shm"
	.align 16
	.type	__PRETTY_FUNCTION__.4031, @object
	.size	__PRETTY_FUNCTION__.4031, 18
__PRETTY_FUNCTION__.4031:
	.string	"nbb_bytes_written"
	.type	__PRETTY_FUNCTION__.4022, @object
	.size	__PRETTY_FUNCTION__.4022, 15
__PRETTY_FUNCTION__.4022:
	.string	"nbb_bytes_read"
	.align 16
	.type	__PRETTY_FUNCTION__.4013, @object
	.size	__PRETTY_FUNCTION__.4013, 20
__PRETTY_FUNCTION__.4013:
	.string	"nbb_bytes_available"
	.type	__PRETTY_FUNCTION__.3965, @object
	.size	__PRETTY_FUNCTION__.3965, 15
__PRETTY_FUNCTION__.3965:
	.string	"nbb_read_bytes"
	.align 16
	.type	__PRETTY_FUNCTION__.3929, @object
	.size	__PRETTY_FUNCTION__.3929, 18
__PRETTY_FUNCTION__.3929:
	.string	"nbb_close_channel"
	.align 16
	.type	__PRETTY_FUNCTION__.3724, @object
	.size	__PRETTY_FUNCTION__.3724, 16
__PRETTY_FUNCTION__.3724:
	.string	"nbb_write_bytes"
	.align 16
	.type	__PRETTY_FUNCTION__.3697, @object
	.size	__PRETTY_FUNCTION__.3697, 20
__PRETTY_FUNCTION__.3697:
	.string	"nbb_set_cb_new_data"
	.align 16
	.type	__PRETTY_FUNCTION__.3668, @object
	.size	__PRETTY_FUNCTION__.3668, 26
__PRETTY_FUNCTION__.3668:
	.string	"nbb_set_cb_new_connection"
	.align 16
	.type	__PRETTY_FUNCTION__.3597, @object
	.size	__PRETTY_FUNCTION__.3597, 20
__PRETTY_FUNCTION__.3597:
	.string	"nbb_connect_service"
	.align 16
	.type	__PRETTY_FUNCTION__.3533, @object
	.size	__PRETTY_FUNCTION__.3533, 17
__PRETTY_FUNCTION__.3533:
	.string	"nbb_init_service"
	.align 16
	.type	__PRETTY_FUNCTION__.3488, @object
	.size	__PRETTY_FUNCTION__.3488, 23
__PRETTY_FUNCTION__.3488:
	.string	"nbb_nameserver_connect"
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LFB0-.Ltext0
	.quad	.LCFI0-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI0-.Ltext0
	.quad	.LCFI1-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI1-.Ltext0
	.quad	.LFE0-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST1:
	.quad	.LFB1-.Ltext0
	.quad	.LCFI2-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI2-.Ltext0
	.quad	.LCFI3-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI3-.Ltext0
	.quad	.LFE1-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST2:
	.quad	.LFB2-.Ltext0
	.quad	.LCFI4-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI4-.Ltext0
	.quad	.LCFI5-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI5-.Ltext0
	.quad	.LFE2-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST3:
	.quad	.LFB3-.Ltext0
	.quad	.LCFI6-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI6-.Ltext0
	.quad	.LCFI7-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI7-.Ltext0
	.quad	.LFE3-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST4:
	.quad	.LFB4-.Ltext0
	.quad	.LCFI8-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI8-.Ltext0
	.quad	.LCFI9-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI9-.Ltext0
	.quad	.LFE4-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST5:
	.quad	.LFB5-.Ltext0
	.quad	.LCFI10-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI10-.Ltext0
	.quad	.LCFI11-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI11-.Ltext0
	.quad	.LFE5-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST6:
	.quad	.LFB6-.Ltext0
	.quad	.LCFI12-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI12-.Ltext0
	.quad	.LCFI13-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI13-.Ltext0
	.quad	.LFE6-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST7:
	.quad	.LFB7-.Ltext0
	.quad	.LCFI14-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI14-.Ltext0
	.quad	.LCFI15-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI15-.Ltext0
	.quad	.LFE7-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST8:
	.quad	.LFB8-.Ltext0
	.quad	.LCFI16-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI16-.Ltext0
	.quad	.LCFI17-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI17-.Ltext0
	.quad	.LFE8-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST9:
	.quad	.LFB9-.Ltext0
	.quad	.LCFI18-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI18-.Ltext0
	.quad	.LCFI19-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI19-.Ltext0
	.quad	.LFE9-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST10:
	.quad	.LFB10-.Ltext0
	.quad	.LCFI20-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI20-.Ltext0
	.quad	.LCFI21-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI21-.Ltext0
	.quad	.LFE10-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST11:
	.quad	.LFB11-.Ltext0
	.quad	.LCFI22-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI22-.Ltext0
	.quad	.LCFI23-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI23-.Ltext0
	.quad	.LFE11-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST12:
	.quad	.LFB12-.Ltext0
	.quad	.LCFI24-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI24-.Ltext0
	.quad	.LCFI25-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI25-.Ltext0
	.quad	.LFE12-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST13:
	.quad	.LFB13-.Ltext0
	.quad	.LCFI26-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI26-.Ltext0
	.quad	.LCFI27-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI27-.Ltext0
	.quad	.LFE13-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST14:
	.quad	.LFB14-.Ltext0
	.quad	.LCFI28-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI28-.Ltext0
	.quad	.LCFI29-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI29-.Ltext0
	.quad	.LFE14-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST15:
	.quad	.LFB15-.Ltext0
	.quad	.LCFI30-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI30-.Ltext0
	.quad	.LCFI31-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI31-.Ltext0
	.quad	.LFE15-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST16:
	.quad	.LFB16-.Ltext0
	.quad	.LCFI32-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI32-.Ltext0
	.quad	.LCFI33-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI33-.Ltext0
	.quad	.LFE16-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST17:
	.quad	.LFB17-.Ltext0
	.quad	.LCFI34-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI34-.Ltext0
	.quad	.LCFI35-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI35-.Ltext0
	.quad	.LFE17-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
.LLST18:
	.quad	.LFB18-.Ltext0
	.quad	.LCFI36-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 8
	.quad	.LCFI36-.Ltext0
	.quad	.LCFI37-.Ltext0
	.value	0x2
	.byte	0x77
	.sleb128 16
	.quad	.LCFI37-.Ltext0
	.quad	.LFE18-.Ltext0
	.value	0x2
	.byte	0x76
	.sleb128 16
	.quad	0x0
	.quad	0x0
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/4.4.5/include/stddef.h"
	.file 3 "/usr/include/bits/types.h"
	.file 4 "/usr/include/stdio.h"
	.file 5 "/usr/include/libio.h"
	.file 6 "/usr/include/bits/semaphore.h"
	.file 7 "constants.h"
	.file 8 "nbb.h"
	.section	.debug_info
	.long	0x1193
	.value	0x2
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF160
	.byte	0x1
	.long	.LASF161
	.long	.LASF162
	.quad	.Ltext0
	.quad	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
	.byte	0xd3
	.long	0x38
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x8d
	.long	0x69
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8e
	.long	0x69
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.uleb128 0x6
	.byte	0x8
	.uleb128 0x7
	.byte	0x8
	.long	0x91
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x4
	.byte	0x31
	.long	0xa3
	.uleb128 0x8
	.long	.LASF41
	.byte	0xd8
	.byte	0x4
	.byte	0x2d
	.long	0x26f
	.uleb128 0x9
	.long	.LASF12
	.byte	0x5
	.value	0x110
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF13
	.byte	0x5
	.value	0x115
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0x9
	.long	.LASF14
	.byte	0x5
	.value	0x116
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x9
	.long	.LASF15
	.byte	0x5
	.value	0x117
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0x9
	.long	.LASF16
	.byte	0x5
	.value	0x118
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF17
	.byte	0x5
	.value	0x119
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0x9
	.long	.LASF18
	.byte	0x5
	.value	0x11a
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF19
	.byte	0x5
	.value	0x11b
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0x9
	.long	.LASF20
	.byte	0x5
	.value	0x11c
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.value	0x11e
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.value	0x11f
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.uleb128 0x9
	.long	.LASF23
	.byte	0x5
	.value	0x120
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x58
	.uleb128 0x9
	.long	.LASF24
	.byte	0x5
	.value	0x122
	.long	0x2bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x60
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.value	0x124
	.long	0x2c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x68
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.value	0x126
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x70
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.value	0x12a
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x74
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.value	0x12c
	.long	0x70
	.byte	0x2
	.byte	0x23
	.uleb128 0x78
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.value	0x130
	.long	0x46
	.byte	0x3
	.byte	0x23
	.uleb128 0x80
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.value	0x131
	.long	0x54
	.byte	0x3
	.byte	0x23
	.uleb128 0x82
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.value	0x132
	.long	0x2c9
	.byte	0x3
	.byte	0x23
	.uleb128 0x83
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.value	0x136
	.long	0x2d9
	.byte	0x3
	.byte	0x23
	.uleb128 0x88
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.value	0x13f
	.long	0x7b
	.byte	0x3
	.byte	0x23
	.uleb128 0x90
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.value	0x148
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0x98
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.value	0x149
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0xa0
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.value	0x14a
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0xa8
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.value	0x14b
	.long	0x89
	.byte	0x3
	.byte	0x23
	.uleb128 0xb0
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.value	0x14c
	.long	0x2d
	.byte	0x3
	.byte	0x23
	.uleb128 0xb8
	.uleb128 0x9
	.long	.LASF39
	.byte	0x5
	.value	0x14e
	.long	0x62
	.byte	0x3
	.byte	0x23
	.uleb128 0xc0
	.uleb128 0x9
	.long	.LASF40
	.byte	0x5
	.value	0x150
	.long	0x2df
	.byte	0x3
	.byte	0x23
	.uleb128 0xc4
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x27f
	.uleb128 0xb
	.long	0x86
	.byte	0x3
	.byte	0x0
	.uleb128 0xc
	.long	.LASF163
	.byte	0x5
	.byte	0xb4
	.uleb128 0x8
	.long	.LASF42
	.byte	0x18
	.byte	0x5
	.byte	0xba
	.long	0x2bd
	.uleb128 0xd
	.long	.LASF43
	.byte	0x5
	.byte	0xbb
	.long	0x2bd
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF44
	.byte	0x5
	.byte	0xbc
	.long	0x2c3
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.long	.LASF45
	.byte	0x5
	.byte	0xc0
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x286
	.uleb128 0x7
	.byte	0x8
	.long	0xa3
	.uleb128 0xa
	.long	0x91
	.long	0x2d9
	.uleb128 0xb
	.long	0x86
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x27f
	.uleb128 0xa
	.long	0x91
	.long	0x2ef
	.uleb128 0xb
	.long	0x86
	.byte	0x13
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x2f5
	.uleb128 0xe
	.long	0x91
	.uleb128 0x7
	.byte	0x8
	.long	0x300
	.uleb128 0xf
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF46
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF47
	.uleb128 0x7
	.byte	0x8
	.long	0x315
	.uleb128 0x10
	.byte	0x1
	.long	0x321
	.uleb128 0x11
	.long	0x62
	.byte	0x0
	.uleb128 0x12
	.byte	0x20
	.byte	0x6
	.byte	0x26
	.long	0x340
	.uleb128 0x13
	.long	.LASF48
	.byte	0x6
	.byte	0x27
	.long	0x340
	.uleb128 0x13
	.long	.LASF49
	.byte	0x6
	.byte	0x28
	.long	0x69
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x350
	.uleb128 0xb
	.long	0x86
	.byte	0x1f
	.byte	0x0
	.uleb128 0x2
	.long	.LASF50
	.byte	0x6
	.byte	0x29
	.long	0x321
	.uleb128 0x14
	.byte	0x4
	.byte	0x7
	.byte	0xd
	.long	0x387
	.uleb128 0x15
	.long	.LASF51
	.sleb128 3000
	.uleb128 0x15
	.long	.LASF52
	.sleb128 3000
	.uleb128 0x15
	.long	.LASF53
	.sleb128 3002
	.uleb128 0x15
	.long	.LASF54
	.sleb128 4000
	.uleb128 0x15
	.long	.LASF55
	.sleb128 4001
	.byte	0x0
	.uleb128 0x14
	.byte	0x4
	.byte	0x8
	.byte	0x30
	.long	0x3b3
	.uleb128 0x16
	.string	"OK"
	.sleb128 0
	.uleb128 0x15
	.long	.LASF56
	.sleb128 1
	.uleb128 0x15
	.long	.LASF57
	.sleb128 2
	.uleb128 0x15
	.long	.LASF58
	.sleb128 3
	.uleb128 0x15
	.long	.LASF59
	.sleb128 4
	.uleb128 0x15
	.long	.LASF60
	.sleb128 5
	.byte	0x0
	.uleb128 0x2
	.long	.LASF61
	.byte	0x8
	.byte	0x3d
	.long	0x3be
	.uleb128 0x7
	.byte	0x8
	.long	0x3c4
	.uleb128 0x10
	.byte	0x1
	.long	0x3d5
	.uleb128 0x11
	.long	0x62
	.uleb128 0x11
	.long	0x89
	.byte	0x0
	.uleb128 0x2
	.long	.LASF62
	.byte	0x8
	.byte	0x41
	.long	0x30f
	.uleb128 0x8
	.long	.LASF63
	.byte	0x10
	.byte	0x8
	.byte	0x44
	.long	0x409
	.uleb128 0xd
	.long	.LASF64
	.byte	0x8
	.byte	0x45
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x17
	.string	"pid"
	.byte	0x8
	.byte	0x46
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x8
	.long	.LASF65
	.byte	0x58
	.byte	0x8
	.byte	0x4a
	.long	0x4cc
	.uleb128 0xd
	.long	.LASF66
	.byte	0x8
	.byte	0x4b
	.long	0x54a
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF67
	.byte	0x8
	.byte	0x4c
	.long	0x550
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.long	.LASF68
	.byte	0x8
	.byte	0x4d
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xd
	.long	.LASF69
	.byte	0x8
	.byte	0x4e
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xd
	.long	.LASF70
	.byte	0x8
	.byte	0x50
	.long	0x54a
	.byte	0x2
	.byte	0x23
	.uleb128 0x18
	.uleb128 0xd
	.long	.LASF71
	.byte	0x8
	.byte	0x51
	.long	0x550
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xd
	.long	.LASF72
	.byte	0x8
	.byte	0x52
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x28
	.uleb128 0xd
	.long	.LASF73
	.byte	0x8
	.byte	0x53
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x2c
	.uleb128 0xd
	.long	.LASF74
	.byte	0x8
	.byte	0x55
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xd
	.long	.LASF75
	.byte	0x8
	.byte	0x56
	.long	0x3b3
	.byte	0x2
	.byte	0x23
	.uleb128 0x38
	.uleb128 0xd
	.long	.LASF76
	.byte	0x8
	.byte	0x57
	.long	0x3d5
	.byte	0x2
	.byte	0x23
	.uleb128 0x40
	.uleb128 0x17
	.string	"arg"
	.byte	0x8
	.byte	0x58
	.long	0x89
	.byte	0x2
	.byte	0x23
	.uleb128 0x48
	.uleb128 0xd
	.long	.LASF77
	.byte	0x8
	.byte	0x5a
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x50
	.byte	0x0
	.uleb128 0x18
	.long	.LASF78
	.value	0x40e
	.byte	0x8
	.byte	0x4b
	.long	0x54a
	.uleb128 0xd
	.long	.LASF79
	.byte	0x8
	.byte	0x66
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF80
	.byte	0x8
	.byte	0x67
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF81
	.byte	0x8
	.byte	0x68
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xd
	.long	.LASF82
	.byte	0x8
	.byte	0x69
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.uleb128 0xd
	.long	.LASF83
	.byte	0x8
	.byte	0x6a
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.long	.LASF84
	.byte	0x8
	.byte	0x6e
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xd
	.long	.LASF85
	.byte	0x8
	.byte	0x6f
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xd
	.long	.LASF86
	.byte	0x8
	.byte	0x72
	.long	0x57f
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x4cc
	.uleb128 0x7
	.byte	0x8
	.long	0x3f
	.uleb128 0x8
	.long	.LASF87
	.byte	0x4
	.byte	0x8
	.byte	0x5e
	.long	0x57f
	.uleb128 0xd
	.long	.LASF88
	.byte	0x8
	.byte	0x5f
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF89
	.byte	0x8
	.byte	0x60
	.long	0x46
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x0
	.uleb128 0xa
	.long	0x556
	.long	0x58f
	.uleb128 0xb
	.long	0x86
	.byte	0xff
	.byte	0x0
	.uleb128 0x8
	.long	.LASF90
	.byte	0x18
	.byte	0x8
	.byte	0x76
	.long	0x5d4
	.uleb128 0xd
	.long	.LASF91
	.byte	0x8
	.byte	0x77
	.long	0x8b
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x17
	.string	"len"
	.byte	0x8
	.byte	0x78
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.uleb128 0xd
	.long	.LASF92
	.byte	0x8
	.byte	0x79
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xd
	.long	.LASF69
	.byte	0x8
	.byte	0x7a
	.long	0x62
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.byte	0x0
	.uleb128 0x2
	.long	.LASF93
	.byte	0x8
	.byte	0x7b
	.long	0x58f
	.uleb128 0x19
	.byte	0x1
	.long	.LASF101
	.byte	0x1
	.byte	0x13
	.byte	0x1
	.long	0x62
	.quad	.LFB0
	.quad	.LFE0
	.long	.LLST0
	.long	0x68a
	.uleb128 0x1a
	.long	.LASF94
	.byte	0x1
	.byte	0x13
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1b
	.string	"ret"
	.byte	0x1
	.byte	0x13
	.long	0x68a
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x1a
	.long	.LASF95
	.byte	0x1
	.byte	0x13
	.long	0x690
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x1c
	.long	.LASF96
	.byte	0x1
	.byte	0x15
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1c
	.long	.LASF97
	.byte	0x1
	.byte	0x16
	.long	0x696
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1c
	.long	.LASF98
	.byte	0x1
	.byte	0x17
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1c
	.long	.LASF99
	.byte	0x1
	.byte	0x18
	.long	0x8b
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1c
	.long	.LASF100
	.byte	0x1
	.byte	0x19
	.long	0x2d
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1d
	.long	.LASF105
	.long	0x6ac
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3488
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x8b
	.uleb128 0x7
	.byte	0x8
	.long	0x62
	.uleb128 0x7
	.byte	0x8
	.long	0x98
	.uleb128 0xa
	.long	0x91
	.long	0x6ac
	.uleb128 0xb
	.long	0x86
	.byte	0x16
	.byte	0x0
	.uleb128 0xe
	.long	0x69c
	.uleb128 0x1e
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.byte	0x39
	.long	0x62
	.quad	.LFB1
	.quad	.LFE1
	.long	.LLST1
	.long	0x6e4
	.uleb128 0x1c
	.long	.LASF97
	.byte	0x1
	.byte	0x3b
	.long	0x696
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF102
	.byte	0x1
	.byte	0x50
	.byte	0x1
	.long	0x62
	.quad	.LFB2
	.quad	.LFE2
	.long	.LLST2
	.long	0x7c4
	.uleb128 0x1a
	.long	.LASF103
	.byte	0x1
	.byte	0x50
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -1108
	.uleb128 0x1a
	.long	.LASF64
	.byte	0x1
	.byte	0x50
	.long	0x2ef
	.byte	0x3
	.byte	0x91
	.sleb128 -1120
	.uleb128 0x1c
	.long	.LASF94
	.byte	0x1
	.byte	0x52
	.long	0x7c4
	.byte	0x3
	.byte	0x91
	.sleb128 -1040
	.uleb128 0x1c
	.long	.LASF104
	.byte	0x1
	.byte	0x53
	.long	0x7d5
	.byte	0x3
	.byte	0x91
	.sleb128 -1056
	.uleb128 0x1f
	.string	"pid"
	.byte	0x1
	.byte	0x54
	.long	0x7e5
	.byte	0x3
	.byte	0x91
	.sleb128 -1088
	.uleb128 0x1d
	.long	.LASF105
	.long	0x805
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3533
	.uleb128 0x1c
	.long	.LASF99
	.byte	0x1
	.byte	0x6e
	.long	0x8b
	.byte	0x3
	.byte	0x91
	.sleb128 -1096
	.uleb128 0x1c
	.long	.LASF100
	.byte	0x1
	.byte	0x6f
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -1060
	.uleb128 0x20
	.quad	.LBB2
	.quad	.LBE2
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0x81
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -1064
	.uleb128 0x1c
	.long	.LASF65
	.byte	0x1
	.byte	0x82
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -1068
	.uleb128 0x1f
	.string	"tmp"
	.byte	0x1
	.byte	0x83
	.long	0x8b
	.byte	0x3
	.byte	0x91
	.sleb128 -1104
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x7d5
	.uleb128 0x21
	.long	0x86
	.value	0x3e7
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x7e5
	.uleb128 0xb
	.long	0x86
	.byte	0x1
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x7f5
	.uleb128 0xb
	.long	0x86
	.byte	0x5
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x805
	.uleb128 0xb
	.long	0x86
	.byte	0x10
	.byte	0x0
	.uleb128 0xe
	.long	0x7f5
	.uleb128 0x19
	.byte	0x1
	.long	.LASF106
	.byte	0x1
	.byte	0x9d
	.byte	0x1
	.long	0x62
	.quad	.LFB3
	.quad	.LFE3
	.long	.LLST3
	.long	0x90a
	.uleb128 0x1a
	.long	.LASF107
	.byte	0x1
	.byte	0x9d
	.long	0x2ef
	.byte	0x3
	.byte	0x91
	.sleb128 -2104
	.uleb128 0x1a
	.long	.LASF108
	.byte	0x1
	.byte	0x9d
	.long	0x2ef
	.byte	0x3
	.byte	0x91
	.sleb128 -2112
	.uleb128 0x1c
	.long	.LASF94
	.byte	0x1
	.byte	0x9f
	.long	0x7c4
	.byte	0x3
	.byte	0x91
	.sleb128 -1040
	.uleb128 0x1c
	.long	.LASF109
	.byte	0x1
	.byte	0xa0
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -2052
	.uleb128 0x1d
	.long	.LASF105
	.long	0x90a
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3597
	.uleb128 0x1c
	.long	.LASF99
	.byte	0x1
	.byte	0xb0
	.long	0x8b
	.byte	0x3
	.byte	0x91
	.sleb128 -2088
	.uleb128 0x1c
	.long	.LASF100
	.byte	0x1
	.byte	0xb1
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -2056
	.uleb128 0x20
	.quad	.LBB3
	.quad	.LBE3
	.uleb128 0x1f
	.string	"tmp"
	.byte	0x1
	.byte	0xc6
	.long	0x8b
	.byte	0x3
	.byte	0x91
	.sleb128 -2096
	.uleb128 0x1c
	.long	.LASF110
	.byte	0x1
	.byte	0xc7
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -2060
	.uleb128 0x1c
	.long	.LASF111
	.byte	0x1
	.byte	0xc8
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -2064
	.uleb128 0x1c
	.long	.LASF112
	.byte	0x1
	.byte	0xc9
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -2068
	.uleb128 0x1f
	.string	"msg"
	.byte	0x1
	.byte	0xca
	.long	0x7c4
	.byte	0x3
	.byte	0x91
	.sleb128 -2048
	.uleb128 0x1f
	.string	"pid"
	.byte	0x1
	.byte	0xcb
	.long	0x7e5
	.byte	0x3
	.byte	0x91
	.sleb128 -2080
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.long	0x2df
	.uleb128 0x22
	.byte	0x1
	.long	.LASF114
	.byte	0x1
	.byte	0xf1
	.byte	0x1
	.quad	.LFB4
	.quad	.LFE4
	.long	.LLST4
	.long	0x97b
	.uleb128 0x1a
	.long	.LASF74
	.byte	0x1
	.byte	0xf1
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x1a
	.long	.LASF115
	.byte	0x1
	.byte	0xf1
	.long	0x3b3
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x1b
	.string	"arg"
	.byte	0x1
	.byte	0xf1
	.long	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0xf3
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LASF105
	.long	0x98b
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3668
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0x98b
	.uleb128 0xb
	.long	0x86
	.byte	0x19
	.byte	0x0
	.uleb128 0xe
	.long	0x97b
	.uleb128 0x23
	.byte	0x1
	.long	.LASF116
	.byte	0x1
	.value	0x105
	.byte	0x1
	.quad	.LFB5
	.quad	.LFE5
	.long	.LLST5
	.long	0x9f2
	.uleb128 0x24
	.long	.LASF74
	.byte	0x1
	.value	0x105
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x24
	.long	.LASF115
	.byte	0x1
	.value	0x105
	.long	0x3d5
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x25
	.string	"i"
	.byte	0x1
	.value	0x107
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LASF105
	.long	0x9f2
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3697
	.byte	0x0
	.uleb128 0xe
	.long	0x2df
	.uleb128 0x26
	.byte	0x1
	.long	.LASF117
	.byte	0x1
	.value	0x116
	.byte	0x1
	.long	0x62
	.quad	.LFB6
	.quad	.LFE6
	.long	.LLST6
	.long	0xa5f
	.uleb128 0x24
	.long	.LASF118
	.byte	0x1
	.value	0x116
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x27
	.string	"msg"
	.byte	0x1
	.value	0x116
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x24
	.long	.LASF119
	.byte	0x1
	.value	0x116
	.long	0x2d
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x1d
	.long	.LASF105
	.long	0xa6f
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3724
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0xa6f
	.uleb128 0xb
	.long	0x86
	.byte	0xf
	.byte	0x0
	.uleb128 0xe
	.long	0xa5f
	.uleb128 0x26
	.byte	0x1
	.long	.LASF120
	.byte	0x1
	.value	0x12b
	.byte	0x1
	.long	0x62
	.quad	.LFB7
	.quad	.LFE7
	.long	.LLST7
	.long	0xad5
	.uleb128 0x24
	.long	.LASF121
	.byte	0x1
	.value	0x12b
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x27
	.string	"msg"
	.byte	0x1
	.value	0x12b
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x24
	.long	.LASF119
	.byte	0x1
	.value	0x12b
	.long	0x2d
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x25
	.string	"i"
	.byte	0x1
	.value	0x12d
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF122
	.byte	0x1
	.value	0x13d
	.byte	0x1
	.quad	.LFB8
	.quad	.LFE8
	.long	.LLST8
	.long	0xb92
	.uleb128 0x24
	.long	.LASF123
	.byte	0x1
	.value	0x13d
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -84
	.uleb128 0x25
	.string	"i"
	.byte	0x1
	.value	0x13f
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x28
	.long	.LASF99
	.byte	0x1
	.value	0x140
	.long	0x8b
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x28
	.long	.LASF100
	.byte	0x1
	.value	0x141
	.long	0x2d
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x28
	.long	.LASF98
	.byte	0x1
	.value	0x142
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x28
	.long	.LASF124
	.byte	0x1
	.value	0x144
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x20
	.quad	.LBB4
	.quad	.LBE4
	.uleb128 0x25
	.string	"z"
	.byte	0x1
	.value	0x16f
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x20
	.quad	.LBB5
	.quad	.LBE5
	.uleb128 0x25
	.string	"tmp"
	.byte	0x1
	.value	0x153
	.long	0x8b
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF125
	.byte	0x1
	.value	0x18b
	.byte	0x1
	.long	0x62
	.quad	.LFB9
	.quad	.LFE9
	.long	.LLST9
	.long	0xc23
	.uleb128 0x24
	.long	.LASF74
	.byte	0x1
	.value	0x18b
	.long	0x2ef
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x24
	.long	.LASF126
	.byte	0x1
	.value	0x18b
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x24
	.long	.LASF127
	.byte	0x1
	.value	0x18b
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF128
	.byte	0x1
	.value	0x18b
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x28
	.long	.LASF129
	.byte	0x1
	.value	0x18d
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x25
	.string	"shm"
	.byte	0x1
	.value	0x18e
	.long	0x550
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x28
	.long	.LASF130
	.byte	0x1
	.value	0x18f
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF131
	.byte	0x1
	.value	0x1d4
	.byte	0x1
	.long	0x62
	.quad	.LFB10
	.quad	.LFE10
	.long	.LLST10
	.long	0xc6d
	.uleb128 0x24
	.long	.LASF132
	.byte	0x1
	.value	0x1d4
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LASF105
	.long	0xc7d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3929
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0xc7d
	.uleb128 0xb
	.long	0x86
	.byte	0x11
	.byte	0x0
	.uleb128 0xe
	.long	0xc6d
	.uleb128 0x29
	.byte	0x1
	.long	.LASF133
	.byte	0x1
	.value	0x1e8
	.long	0x62
	.quad	.LFB11
	.quad	.LFE11
	.long	.LLST11
	.long	0xcb5
	.uleb128 0x25
	.string	"i"
	.byte	0x1
	.value	0x1ea
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF134
	.byte	0x1
	.value	0x1f8
	.byte	0x1
	.long	0x62
	.quad	.LFB12
	.quad	.LFE12
	.long	.LLST12
	.long	0xd3c
	.uleb128 0x24
	.long	.LASF110
	.byte	0x1
	.value	0x1f8
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x27
	.string	"buf"
	.byte	0x1
	.value	0x1f8
	.long	0x8b
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF89
	.byte	0x1
	.value	0x1f8
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x1d
	.long	.LASF105
	.long	0xd4c
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.3965
	.uleb128 0x28
	.long	.LASF90
	.byte	0x1
	.value	0x1fc
	.long	0xd51
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x28
	.long	.LASF135
	.byte	0x1
	.value	0x212
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0xd4c
	.uleb128 0xb
	.long	0x86
	.byte	0xe
	.byte	0x0
	.uleb128 0xe
	.long	0xd3c
	.uleb128 0x7
	.byte	0x8
	.long	0x5d4
	.uleb128 0x26
	.byte	0x1
	.long	.LASF136
	.byte	0x1
	.value	0x21b
	.byte	0x1
	.long	0x62
	.quad	.LFB13
	.quad	.LFE13
	.long	.LLST13
	.long	0xda1
	.uleb128 0x24
	.long	.LASF110
	.byte	0x1
	.value	0x21b
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LASF105
	.long	0xda1
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4013
	.byte	0x0
	.uleb128 0xe
	.long	0x2df
	.uleb128 0x26
	.byte	0x1
	.long	.LASF137
	.byte	0x1
	.value	0x222
	.byte	0x1
	.long	0x62
	.quad	.LFB14
	.quad	.LFE14
	.long	.LLST14
	.long	0xdf0
	.uleb128 0x24
	.long	.LASF110
	.byte	0x1
	.value	0x222
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LASF105
	.long	0xdf0
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4022
	.byte	0x0
	.uleb128 0xe
	.long	0xd3c
	.uleb128 0x26
	.byte	0x1
	.long	.LASF138
	.byte	0x1
	.value	0x228
	.byte	0x1
	.long	0x62
	.quad	.LFB15
	.quad	.LFE15
	.long	.LLST15
	.long	0xe3f
	.uleb128 0x24
	.long	.LASF110
	.byte	0x1
	.value	0x228
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1d
	.long	.LASF105
	.long	0xe3f
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4031
	.byte	0x0
	.uleb128 0xe
	.long	0xc6d
	.uleb128 0x23
	.byte	0x1
	.long	.LASF139
	.byte	0x1
	.value	0x22e
	.byte	0x1
	.quad	.LFB16
	.quad	.LFE16
	.long	.LLST16
	.long	0xec6
	.uleb128 0x24
	.long	.LASF110
	.byte	0x1
	.value	0x22e
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x24
	.long	.LASF140
	.byte	0x1
	.value	0x22e
	.long	0x8b
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x24
	.long	.LASF89
	.byte	0x1
	.value	0x22e
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x1d
	.long	.LASF105
	.long	0xed6
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4042
	.uleb128 0x28
	.long	.LASF78
	.byte	0x1
	.value	0x236
	.long	0xd51
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x28
	.long	.LASF141
	.byte	0x1
	.value	0x237
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.byte	0x0
	.uleb128 0xa
	.long	0x91
	.long	0xed6
	.uleb128 0xb
	.long	0x86
	.byte	0xd
	.byte	0x0
	.uleb128 0xe
	.long	0xec6
	.uleb128 0x26
	.byte	0x1
	.long	.LASF142
	.byte	0x1
	.value	0x24b
	.byte	0x1
	.long	0x62
	.quad	.LFB17
	.quad	.LFE17
	.long	.LLST17
	.long	0xf91
	.uleb128 0x24
	.long	.LASF111
	.byte	0x1
	.value	0x24b
	.long	0x62
	.byte	0x3
	.byte	0x91
	.sleb128 -68
	.uleb128 0x24
	.long	.LASF143
	.byte	0x1
	.value	0x24b
	.long	0x2fa
	.byte	0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x24
	.long	.LASF89
	.byte	0x1
	.value	0x24b
	.long	0x2d
	.byte	0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x1d
	.long	.LASF105
	.long	0xf91
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4080
	.uleb128 0x25
	.string	"buf"
	.byte	0x1
	.value	0x250
	.long	0x54a
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x28
	.long	.LASF144
	.byte	0x1
	.value	0x251
	.long	0x550
	.byte	0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x28
	.long	.LASF145
	.byte	0x1
	.value	0x253
	.long	0x46
	.byte	0x2
	.byte	0x91
	.sleb128 -34
	.uleb128 0x28
	.long	.LASF146
	.byte	0x1
	.value	0x265
	.long	0xf96
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x28
	.long	.LASF147
	.byte	0x1
	.value	0x268
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.byte	0x0
	.uleb128 0xe
	.long	0xa5f
	.uleb128 0x7
	.byte	0x8
	.long	0x556
	.uleb128 0x26
	.byte	0x1
	.long	.LASF148
	.byte	0x1
	.value	0x299
	.byte	0x1
	.long	0x62
	.quad	.LFB18
	.quad	.LFE18
	.long	.LLST18
	.long	0x1041
	.uleb128 0x24
	.long	.LASF111
	.byte	0x1
	.value	0x299
	.long	0x62
	.byte	0x2
	.byte	0x91
	.sleb128 -52
	.uleb128 0x24
	.long	.LASF143
	.byte	0x1
	.value	0x299
	.long	0x1041
	.byte	0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x24
	.long	.LASF89
	.byte	0x1
	.value	0x299
	.long	0x1047
	.byte	0x3
	.byte	0x91
	.sleb128 -72
	.uleb128 0x25
	.string	"buf"
	.byte	0x1
	.value	0x29b
	.long	0x54a
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x28
	.long	.LASF144
	.byte	0x1
	.value	0x29c
	.long	0x550
	.byte	0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x28
	.long	.LASF149
	.byte	0x1
	.value	0x29d
	.long	0x46
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x1d
	.long	.LASF105
	.long	0x104d
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.4191
	.uleb128 0x25
	.string	"tmp"
	.byte	0x1
	.value	0x2ba
	.long	0xf96
	.byte	0x2
	.byte	0x91
	.sleb128 -48
	.byte	0x0
	.uleb128 0x7
	.byte	0x8
	.long	0x89
	.uleb128 0x7
	.byte	0x8
	.long	0x2d
	.uleb128 0xe
	.long	0xec6
	.uleb128 0x1c
	.long	.LASF150
	.byte	0x7
	.byte	0x1a
	.long	0x1067
	.byte	0x9
	.byte	0x3
	.quad	NAMESERVER_PID_FILE
	.uleb128 0xe
	.long	0x2df
	.uleb128 0x1c
	.long	.LASF151
	.byte	0x7
	.byte	0x1b
	.long	0x1081
	.byte	0x9
	.byte	0x3
	.quad	NAMESERVER_CHANNEL_FULL
	.uleb128 0xe
	.long	0xa5f
	.uleb128 0x1c
	.long	.LASF152
	.byte	0x7
	.byte	0x1c
	.long	0x109b
	.byte	0x9
	.byte	0x3
	.quad	UNKNOWN_SERVICE
	.uleb128 0xe
	.long	0xa5f
	.uleb128 0x1c
	.long	.LASF153
	.byte	0x7
	.byte	0x1d
	.long	0x10b5
	.byte	0x9
	.byte	0x3
	.quad	SERVICE_BUSY
	.uleb128 0xe
	.long	0x7f5
	.uleb128 0x1c
	.long	.LASF154
	.byte	0x7
	.byte	0x1f
	.long	0x10cf
	.byte	0x9
	.byte	0x3
	.quad	SERVICE
	.uleb128 0xe
	.long	0x7d5
	.uleb128 0x1c
	.long	.LASF155
	.byte	0x7
	.byte	0x20
	.long	0x10e9
	.byte	0x9
	.byte	0x3
	.quad	CLIENT
	.uleb128 0xe
	.long	0x7d5
	.uleb128 0x1f
	.string	"GUI"
	.byte	0x7
	.byte	0x21
	.long	0x1103
	.byte	0x9
	.byte	0x3
	.quad	GUI
	.uleb128 0xe
	.long	0x26f
	.uleb128 0xa
	.long	0x409
	.long	0x1118
	.uleb128 0xb
	.long	0x86
	.byte	0xe
	.byte	0x0
	.uleb128 0x2a
	.long	.LASF156
	.byte	0x1
	.byte	0x5
	.long	0x1108
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	channel_list
	.uleb128 0xa
	.long	0x3e0
	.long	0x113e
	.uleb128 0xb
	.long	0x86
	.byte	0xe
	.byte	0x0
	.uleb128 0x2a
	.long	.LASF157
	.byte	0x1
	.byte	0x6
	.long	0x112e
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	connected_nodes
	.uleb128 0xa
	.long	0x5d4
	.long	0x1164
	.uleb128 0xb
	.long	0x86
	.byte	0xe
	.byte	0x0
	.uleb128 0x2a
	.long	.LASF158
	.byte	0x1
	.byte	0x7
	.long	0x1154
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	delay_buffers
	.uleb128 0x2a
	.long	.LASF159
	.byte	0x1
	.byte	0x9
	.long	0x1190
	.byte	0x1
	.byte	0x9
	.byte	0x3
	.quad	sem_id
	.uleb128 0x7
	.byte	0x8
	.long	0x350
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x1e6
	.value	0x2
	.long	.Ldebug_info0
	.long	0x1197
	.long	0x5df
	.string	"nbb_nameserver_connect"
	.long	0x6b1
	.string	"init_nameserver"
	.long	0x6e4
	.string	"nbb_init_service"
	.long	0x80a
	.string	"nbb_connect_service"
	.long	0x90f
	.string	"nbb_set_cb_new_connection"
	.long	0x990
	.string	"nbb_set_cb_new_data"
	.long	0x9f7
	.string	"nbb_write_bytes"
	.long	0xa74
	.string	"nbb_send"
	.long	0xad5
	.string	"nbb_recv_data"
	.long	0xb92
	.string	"nbb_open_channel"
	.long	0xc23
	.string	"nbb_close_channel"
	.long	0xc82
	.string	"nbb_free_channel_slot"
	.long	0xcb5
	.string	"nbb_read_bytes"
	.long	0xd57
	.string	"nbb_bytes_available"
	.long	0xda6
	.string	"nbb_bytes_read"
	.long	0xdf5
	.string	"nbb_bytes_written"
	.long	0xe44
	.string	"nbb_flush_shm"
	.long	0xedb
	.string	"nbb_insert_item"
	.long	0xf9c
	.string	"nbb_read_item"
	.long	0x1118
	.string	"channel_list"
	.long	0x113e
	.string	"connected_nodes"
	.long	0x1164
	.string	"delay_buffers"
	.long	0x117a
	.string	"sem_id"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0x0
	.value	0x0
	.value	0x0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0x0
	.quad	0x0
	.section	.debug_str,"MS",@progbits,1
.LASF94:
	.string	"request"
.LASF102:
	.string	"nbb_init_service"
.LASF106:
	.string	"nbb_connect_service"
.LASF59:
	.string	"BUFFER_EMPTY_PRODUCER_INSERTING"
.LASF31:
	.string	"_shortbuf"
.LASF160:
	.string	"GNU C 4.4.5"
.LASF69:
	.string	"read_count"
.LASF163:
	.string	"_IO_lock_t"
.LASF120:
	.string	"nbb_send"
.LASF92:
	.string	"capacity"
.LASF110:
	.string	"slot"
.LASF20:
	.string	"_IO_buf_end"
.LASF78:
	.string	"buffer"
.LASF109:
	.string	"ret_code"
.LASF139:
	.string	"nbb_flush_shm"
.LASF145:
	.string	"temp_ac"
.LASF18:
	.string	"_IO_write_end"
.LASF3:
	.string	"unsigned int"
.LASF12:
	.string	"_flags"
.LASF124:
	.string	"is_new_conn_msg"
.LASF142:
	.string	"nbb_insert_item"
.LASF24:
	.string	"_markers"
.LASF95:
	.string	"ret_len"
.LASF97:
	.string	"pFile"
.LASF115:
	.string	"func"
.LASF161:
	.string	"nbb.c"
.LASF75:
	.string	"new_conn"
.LASF96:
	.string	"nameserver_pid"
.LASF55:
	.string	"NAMESERVER_READ"
.LASF158:
	.string	"delay_buffers"
.LASF45:
	.string	"_pos"
.LASF151:
	.string	"NAMESERVER_CHANNEL_FULL"
.LASF23:
	.string	"_IO_save_end"
.LASF132:
	.string	"index"
.LASF46:
	.string	"long long unsigned int"
.LASF56:
	.string	"BUFFER_FULL"
.LASF143:
	.string	"ptr_to_item"
.LASF155:
	.string	"CLIENT"
.LASF150:
	.string	"NAMESERVER_PID_FILE"
.LASF72:
	.string	"write_id"
.LASF22:
	.string	"_IO_backup_base"
.LASF33:
	.string	"_offset"
.LASF74:
	.string	"owner"
.LASF98:
	.string	"retval"
.LASF100:
	.string	"recv_len"
.LASF26:
	.string	"_fileno"
.LASF63:
	.string	"connected_node"
.LASF80:
	.string	"last_ack_counter"
.LASF85:
	.string	"data_size"
.LASF7:
	.string	"size_t"
.LASF88:
	.string	"offset"
.LASF15:
	.string	"_IO_read_base"
.LASF87:
	.string	"channel_item"
.LASF119:
	.string	"msg_len"
.LASF43:
	.string	"_next"
.LASF123:
	.string	"signum"
.LASF140:
	.string	"array_to_flush"
.LASF149:
	.string	"temp_uc"
.LASF58:
	.string	"BUFFER_EMPTY"
.LASF93:
	.string	"delay_buffer_t"
.LASF152:
	.string	"UNKNOWN_SERVICE"
.LASF122:
	.string	"nbb_recv_data"
.LASF153:
	.string	"SERVICE_BUSY"
.LASF10:
	.string	"char"
.LASF39:
	.string	"_mode"
.LASF42:
	.string	"_IO_marker"
.LASF108:
	.string	"service_name"
.LASF13:
	.string	"_IO_read_ptr"
.LASF54:
	.string	"NAMESERVER_WRITE"
.LASF51:
	.string	"SERVICE_TEST"
.LASF127:
	.string	"shm_write_id"
.LASF117:
	.string	"nbb_write_bytes"
.LASF111:
	.string	"channel_id"
.LASF101:
	.string	"nbb_nameserver_connect"
.LASF147:
	.string	"item_offset"
.LASF157:
	.string	"connected_nodes"
.LASF159:
	.string	"sem_id"
.LASF60:
	.string	"SHM_ERROR"
.LASF16:
	.string	"_IO_write_base"
.LASF47:
	.string	"long long int"
.LASF70:
	.string	"write"
.LASF104:
	.string	"num_channel"
.LASF21:
	.string	"_IO_save_base"
.LASF62:
	.string	"cb_new_data_func"
.LASF53:
	.string	"SERVICE_TEST_WRITE"
.LASF77:
	.string	"in_use"
.LASF76:
	.string	"new_data"
.LASF79:
	.string	"ack_counter"
.LASF162:
	.string	"/home/awang/dev/qt-everywhere-opensource-src-4.7.0/Non-blocking-Buffers"
.LASF89:
	.string	"size"
.LASF113:
	.string	"init_nameserver"
.LASF133:
	.string	"nbb_free_channel_slot"
.LASF146:
	.string	"prev_item"
.LASF131:
	.string	"nbb_close_channel"
.LASF34:
	.string	"__pad1"
.LASF35:
	.string	"__pad2"
.LASF36:
	.string	"__pad3"
.LASF37:
	.string	"__pad4"
.LASF38:
	.string	"__pad5"
.LASF73:
	.string	"write_count"
.LASF30:
	.string	"_vtable_offset"
.LASF126:
	.string	"shm_read_id"
.LASF86:
	.string	"items"
.LASF50:
	.string	"sem_t"
.LASF130:
	.string	"free_slot"
.LASF156:
	.string	"channel_list"
.LASF65:
	.string	"channel"
.LASF134:
	.string	"nbb_read_bytes"
.LASF14:
	.string	"_IO_read_end"
.LASF5:
	.string	"short int"
.LASF83:
	.string	"recycle_counter"
.LASF6:
	.string	"long int"
.LASF103:
	.string	"num_channels"
.LASF90:
	.string	"delay_buffer"
.LASF107:
	.string	"client_name"
.LASF144:
	.string	"data_buf"
.LASF68:
	.string	"read_id"
.LASF81:
	.string	"update_counter"
.LASF125:
	.string	"nbb_open_channel"
.LASF116:
	.string	"nbb_set_cb_new_data"
.LASF138:
	.string	"nbb_bytes_written"
.LASF64:
	.string	"name"
.LASF128:
	.string	"is_ipc_create"
.LASF141:
	.string	"new_size"
.LASF32:
	.string	"_lock"
.LASF0:
	.string	"long unsigned int"
.LASF28:
	.string	"_old_offset"
.LASF57:
	.string	"BUFFER_FULL_CONSUMER_READING"
.LASF41:
	.string	"_IO_FILE"
.LASF67:
	.string	"read_data"
.LASF135:
	.string	"new_len"
.LASF52:
	.string	"SERVICE_TEST_READ"
.LASF1:
	.string	"unsigned char"
.LASF44:
	.string	"_sbuf"
.LASF17:
	.string	"_IO_write_ptr"
.LASF91:
	.string	"content"
.LASF82:
	.string	"last_update_counter"
.LASF148:
	.string	"nbb_read_item"
.LASF84:
	.string	"data_offset"
.LASF136:
	.string	"nbb_bytes_available"
.LASF61:
	.string	"cb_new_conn_func"
.LASF112:
	.string	"service_pid"
.LASF118:
	.string	"slot_id"
.LASF8:
	.string	"__off_t"
.LASF99:
	.string	"recv"
.LASF121:
	.string	"destination"
.LASF4:
	.string	"signed char"
.LASF2:
	.string	"short unsigned int"
.LASF71:
	.string	"write_data"
.LASF105:
	.string	"__PRETTY_FUNCTION__"
.LASF114:
	.string	"nbb_set_cb_new_connection"
.LASF137:
	.string	"nbb_bytes_read"
.LASF49:
	.string	"__align"
.LASF25:
	.string	"_chain"
.LASF11:
	.string	"FILE"
.LASF27:
	.string	"_flags2"
.LASF154:
	.string	"SERVICE"
.LASF48:
	.string	"__size"
.LASF29:
	.string	"_cur_column"
.LASF66:
	.string	"read"
.LASF129:
	.string	"shmid"
.LASF9:
	.string	"__off64_t"
.LASF40:
	.string	"_unused2"
.LASF19:
	.string	"_IO_buf_base"
	.ident	"GCC: (Ubuntu/Linaro 4.4.4-14ubuntu5) 4.4.5"
	.section	.note.GNU-stack,"",@progbits
