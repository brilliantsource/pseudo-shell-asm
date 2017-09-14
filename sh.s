# Pseudo-Shell
# If no Argument after "-c" then go to an infinite Loop
# Print a fixed Message otherwise

# Constants
.section .data
Message:
  .ascii  "0\n"        # String to print
  Length = . - Message # String Length

.section .text
  STDOUT    = 1
  SYS_EXIT  = 60
  SYS_WRITE = 1

  .global main

# Main Function
main:
  cmp $2, 0(%rsp) # 0(%rsp) for argc, 8(%rsp) for argv[0], 16(%rsp) for argv[1]...
  jg print        # Jump to echo
  jmp loop        # Otherwise jump to loop

# Print the Message
print:
  mov $SYS_WRITE, %rax # System Call to write
  mov $STDOUT,    %rdi # File Descriptor
  mov $Message,   %rsi # Address of String to output
  mov $Length,    %rdx # Number of Bytes
  syscall              # Invoke OS to write
  jmp exit

# Infinite Loop
loop:
  jmp loop

# Exit Function
exit:
  mov $SYS_EXIT, %rax # System Call to exit
  xor %rdi,      %rdi # Return code 0
  syscall             # Invoke OS to exit
  ret
