/*-------------------------------------------------------------------------------------------------
--
-- File Name    : coaxpressXcvrSpeed.h



-- Description  : This module replicates the CoaXPress Device Speed settings.




-- Targeted device : Microchip FPGAs
-- Author          : India Solutions Team




--
-- COPYRIGHT 2023 BY MICROCHIP
-- THE INFORMATION CONTAINED IN THIS DOCUMENT IS SUBJECT TO LICENSING RESTRICTIONS
-- FROM MICROCHIP CORP.  IF YOU ARE NOT IN POSSESSION OF WRITTEN AUTHORIZATION FROM
-- MICROCHIP FOR USE OF THIS FILE, THEN THE FILE SHOULD BE IMMEDIATELY DESTROYED AND
-- NO BACK-UP OF THE FILE SHOULD BE MADE.
--



-------------------------------------------------------------------------------------------------*/

#ifndef COAXPRESSXCVRSPEED_H_
#define COAXPRESSXCVRSPEED_H_

//#define CMD_RATE_SEL_ADDR     (0x71000000 + 0x00)

#define CXP_DEV_XCVR_BASE               0x60000000UL
#define XCVR_SERDES_0_PMA_LN0_BASE      0x1041000
#define XCVR_SERDES_0_PMA_LN1_BASE      0x1042000
#define XCVR_SERDES_0_PMA_LN2_BASE      0x1044000
#define XCVR_SERDES_0_PMA_LN3_BASE      0x1048000
#define XCVR_SERDES_0_PMA_CMN_BASE      0x1050000

// XVCR Register Offsets
#define DES_CDR_CTRL_2      0x008
#define DES_CDR_CTRL_3      0x00C
#define DES_DFEEM_CTRL_1    0x010
#define DES_DFEEM_CTRL_2    0x014
#define DES_DFEEM_CTRL_3    0x018
#define DES_DFE_CTRL_2      0x024
#define DES_EM_CTRL_2       0x02C
#define DES_RXPLL_DIV       0x040
#define DES_RSTPD           0x04C
#define SER_CLK_CTRL        0x074
#define SER_RSTPD           0x078

#define SER_TERM_CTRL       0x90
#define SER_DRV_DATA_CTRL   0x98
#define SER_DRV_CTRL        0x9C
#define SER_DRV_CTRL_SEL    0xA0

#define SERDES_RTL_CTRL     0x0C0
#define DES_DFE_CAL_CTRL_0  0x0D0
#define DES_DFE_CAL_CTRL_1  0x0D4
#define DES_DFE_CAL_CTRL_2  0x0D8
#define DES_DFE_CAL_CMD     0x0DC

#define TXPLL_DIV_1         XCVR_SERDES_0_PMA_CMN_BASE+0x010
#define TXPLL_DIV_2         XCVR_SERDES_0_PMA_CMN_BASE+0x014

//Configuring different rates 1.25G, 2.5G, 3.125G, 5.0G, 6.25G, 10.0G, 12.5G
#define RATE_1DOT25G    0x28
#define RATE_2DOT5G     0x30
#define RATE_3DOT125G   0x38
#define RATE_5DOT0G     0x40
#define RATE_6DOT25G    0x48
#define RATE_10DOT0G    0x50
#define RATE_12DOT5G    0x58

void wait_for_pll_lock();
void cxp_xcvr_uplink_preemphasis();
void cxp_xcvr_uplink_lane_preemphasis(uint32_t lane_addr);
void update_cxp_xcvr_uplink_speed(uint8_t data);
void cxp_xcvr_uplink_speed(uint32_t lane_addr, uint8_t data);
#endif /* COAXPRESSXCVRSPEED_H_ */
