// SP_2
#ifndef _SP_2_H_
#define _SP_2_H_

#include <pulpino.h>

#define SP2_REG_ADDR_RST                 ( SP2_BASE_ADDR + 0x00 )
#define SP2_REG_ADDR_REQ                 ( SP2_BASE_ADDR + 0x04 )
#define SP2_REG_ADDR_ACK                 ( SP2_BASE_ADDR + 0x08 )
#define SP2_REG_ADDR_VALID               ( SP2_BASE_ADDR + 0x0C )
#define SP2_REG_ADDR_BUSY                ( SP2_BASE_ADDR + 0x10 )
#define SP2_REG_ADDR_DATA_OUT            ( SP2_BASE_ADDR + 0x14 )


#define SP2_ADDR_RST                  REG( SP2_REG_ADDR_RST        )
#define SP2_ADDR_REQ                  REG( SP2_REG_ADDR_REQ        )
#define SP2_ADDR_ACK                  REG( SP2_REG_ADDR_ACK        )
#define SP2_ADDR_VALID                REG( SP2_REG_ADDR_VALID      )
#define SP2_ADDR_BUSY                 REG( SP2_REG_ADDR_BUSY       )
#define SP2_ADDR_DATA_OUT             REG( SP2_REG_ADDR_DATA_OUT   )

void sp2_init();

void uint2bits(char bitsArray[32], unsigned int number);

unsigned int getKeyCode(unsigned int number);
unsigned int getServiceCode(unsigned int number);

unsigned int read_usb_key();

unsigned int getReleasedKeycode();
unsigned int getKeycodeFromArray(char bitsArray[32]);

#endif
