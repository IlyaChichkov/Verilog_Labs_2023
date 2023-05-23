#include "sp2.h"

void sp2_init(){
    SP2_ADDR_RST = 1;
}

void uint2bits(char bitsArray[32], unsigned int number){
    int i = 0;
    for (i = 31; i >= 0; i--)
    {
        int bitValue = ((number >> i) & 0x1);
        bitsArray[31-i] = (char)bitValue + '0';
    }
}

unsigned int getKeyCode(unsigned int number){
    return number & 0xFF;
}

unsigned int getServiceCode(unsigned int number){
    return (number >> 8) & 0xFF;
}

unsigned int read_usb_key(){
    SP2_ADDR_REQ = 1;
    unsigned int busy = 1;
    while(busy){
        busy = SP2_ADDR_BUSY;
    }
    return SP2_ADDR_DATA_OUT; // 32 bits variable = 16 bits variable [ 8 service data; 8 key code ]
    // SP2_ADDR_ACK = 1;
}

unsigned int getKeycodeFromArray(char bitsArray[32]){
    int i = 0;
    char buff[8];
    for (i = 24; i < 31; i++)
    {
        buff[i-24] = bitsArray[i];
    }
    return (unsigned int)buff;
}


unsigned int getReleasedKeycode(){
    SP2_ADDR_REQ = 1;
    unsigned int busy = 1;
    unsigned int keyCode = 0;
    while(busy){
        busy = SP2_ADDR_BUSY;
    }
    while (keyCode != 0xF0)
    {
        keyCode = SP2_ADDR_DATA_OUT;
    }
    while (keyCode == 0xF0)
    {
        keyCode = SP2_ADDR_DATA_OUT;
    }
    return keyCode;
}
