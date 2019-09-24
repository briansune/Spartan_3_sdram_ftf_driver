# Spartan_3_sdram_ftf_driver

Spartan-3E Xilinx's FPGA TFT driver design with SDRAM and UART user interface supported.

The TFT model that is using in this design is AT070N92/94 or AT050Nxxx.

This controller support 8 display frames, which utilize the internal SDRAM 4 Banks (2 bits) and MSb of the Row address.

Please feel free to pull requests, update, and improve the design.

Have fun~ =]

Here are the images of the TFT with the FPGA-SDRAM driver board:

# How to control:

This TFT driver is controlled via the UART.

Open the UART software and set the Baud rate to "1,000,000", 8 bit, 1 stop bit and no parity bit.

The instructions are listed below:

1)	TFT_C\r\n
2)	TFT_C:X,XXXX\r\n
3)	TFT_L:XXXXX\r\n

All command will return OK\r\n after successfully communicate.

If command 3 does not receive color data after ~5s, it will automatically timeout.

The 1st command is a verification command, which is to ensure the communication is working correctly.

For the 2nd command X,XXXX where the first X, is the op-code and the second ,XXXX is the data corresponding to the op-code.

The last command TFT_L: is to load the color data onto the TFT SDRAM and the XXXXX is the total data going to send (16 bits data by sending two 8 bit).  

# Some demo images:
![Alt text](images/img_a.jpg?raw=true "Title")
![Alt text](images/img_b.jpg?raw=true "Title")

