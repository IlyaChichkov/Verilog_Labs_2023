#include <kuznechik.h>
#include <uart.h>

void cipher_init(void){
    CIPHER_ADDR_RST = 1;
}

void cipher_reset(void){
    CIPHER_ADDR_RST = 0;
    CIPHER_ADDR_RST = 1;
}

void cipher_write_data(unsigned int data[4]){
    unsigned int busy = 1;
    do{
        busy = CIPHER_ADDR_BUSY;
    } while(busy);
    CIPHER_ADDR_DATA_IN_0 = data[0];
    CIPHER_ADDR_DATA_IN_1 = data[1];
    CIPHER_ADDR_DATA_IN_2 = data[2];
    CIPHER_ADDR_DATA_IN_3 = data[3];
    CIPHER_ADDR_REQ = 1;
}

void cipher_read_data(unsigned int data[4]){
    unsigned int valid = 0;
    do {
        valid = CIPHER_ADDR_VALID;
    } while(!valid);
    data[0] = CIPHER_ADDR_DATA_OUT_0;
    data[1] = CIPHER_ADDR_DATA_OUT_1;
    data[2] = CIPHER_ADDR_DATA_OUT_2;
    data[3] = CIPHER_ADDR_DATA_OUT_3;
    CIPHER_ADDR_ACK = 1;
}
