.data
cores: .word 0x54035d
grays: .word -1

.text
main:
   la t1, cores
   lw s2, 0(t1)  # Cor Indigo: 0x54035d em s2
    
   addi s3, zero, 0xff # R
   slli s3, s3, 16     # 0xff0000
   addi s4, zero, 0xff # G
   slli s4, s4, 8      # 0x00ff00
   addi s5, zero, 0xff # B
   		       # 0x0000ff
   
   and s3, s3, s2  # R = 0x54 = 0101 0100
   srli s3, s3, 16
   and s4, s4, s2  # G = 0x03 = 0000 0011
   srli s4, s4, 8
   and s5, s5, s2  # B = 0x5d = 0101 1101
   
   # Gray: 0.25xR + 0.5xG + 0.25xB
   srli s3, s3, 2  # R = 0001 0101 = 0x15
   srli s4, s4, 1  # G = 0000 0001 = 0x01
   srli s5, s5, 2  # B = 0001 0111 = 0x17
   
   add s3, s3, s4
   add s3, s3, s5 # Gray
   
   slli s5, s3, 0  # B
   slli s4, s3, 8  # G
   slli s3, s3, 16 # R
   
   or s2, s3, s4
   or s2, s2, s5 # RGB
   
   la t1, grays
   sw s2, 0(t1)
