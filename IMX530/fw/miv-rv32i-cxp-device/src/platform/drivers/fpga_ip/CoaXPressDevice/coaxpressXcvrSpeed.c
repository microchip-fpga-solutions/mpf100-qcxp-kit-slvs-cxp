/*-------------------------------------------------------------------------------------------------
--
-- File Name    : coaxpressXcvrSpeed.c



-- Description  : This module replicates the CoaXPress Device Link speed settings.




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

#include "hal.h"

#include "coaxpressXcvrSpeed.h"
#include "coaxpressDevice.h"

uint32_t pll_lock;

void cxp_xcvr_uplink_preemphasis()
{
    /* reset Tx */
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN0_BASE + SER_RSTPD)=0x3;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN1_BASE + SER_RSTPD)=0x3;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN2_BASE + SER_RSTPD)=0x3;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN3_BASE + SER_RSTPD)=0x3;

    cxp_xcvr_uplink_lane_preemphasis(XCVR_SERDES_0_PMA_LN0_BASE);
    cxp_xcvr_uplink_lane_preemphasis(XCVR_SERDES_0_PMA_LN1_BASE);
    cxp_xcvr_uplink_lane_preemphasis(XCVR_SERDES_0_PMA_LN2_BASE);
    cxp_xcvr_uplink_lane_preemphasis(XCVR_SERDES_0_PMA_LN3_BASE);

    /* release reset */
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN0_BASE + SER_RSTPD)=0x1;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN1_BASE + SER_RSTPD)=0x1;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN2_BASE + SER_RSTPD)=0x1;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN3_BASE + SER_RSTPD)=0x1;
}
void cxp_xcvr_uplink_lane_preemphasis(uint32_t lane_addr)
{
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_TERM_CTRL)=0xF300;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_DRV_DATA_CTRL)=0x6082AA;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_DRV_CTRL)=0x160B9FFF;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_DRV_CTRL_SEL)=0xC;
}

void update_cxp_xcvr_uplink_speed(uint8_t data)
{
    /* reset Tx */
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN0_BASE + SER_RSTPD)=0x3;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN1_BASE + SER_RSTPD)=0x3;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN2_BASE + SER_RSTPD)=0x3;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN3_BASE + SER_RSTPD)=0x3;

    *(volatile unsigned int *)(COAXPRESS_DEVICE_APB_BASE_ADDRESS + CMD_RATE_SEL_ADDR)=0x0;

    cxp_xcvr_uplink_speed(XCVR_SERDES_0_PMA_LN0_BASE, data);
    cxp_xcvr_uplink_speed(XCVR_SERDES_0_PMA_LN1_BASE, data);
    cxp_xcvr_uplink_speed(XCVR_SERDES_0_PMA_LN2_BASE, data);
    cxp_xcvr_uplink_speed(XCVR_SERDES_0_PMA_LN3_BASE, data);

    /* release reset */
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN0_BASE + SER_RSTPD)=0x1;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN1_BASE + SER_RSTPD)=0x1;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN2_BASE + SER_RSTPD)=0x1;
    *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + XCVR_SERDES_0_PMA_LN3_BASE + SER_RSTPD)=0x1;
}

void cxp_xcvr_uplink_speed(uint32_t lane_addr, uint8_t data)
{ //default  Low speed Upconnection Rate Select

    if (data == RATE_1DOT25G) //1.25G
    {

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x75;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)= 0x00210014;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01AB8754;

    }
    else if (data == RATE_2DOT5G) //2.5G
    {

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x73;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)= 0x00210014;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01AB8754;

    }
    else if (data == RATE_3DOT125G) //3.125
    {

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x73;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)= 0x002A0019;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01166929;

    }
    else if (data == RATE_5DOT0G) //5G
    {

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x71;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)= 0x00210014;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01AB8754;

    }
    else if (data == RATE_6DOT25G) //6.25G
    {

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x71;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)=0x002A0019;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01166929;

    }
    else if (data == RATE_10DOT0G) //10G
    {
        *(volatile unsigned int *)(COAXPRESS_DEVICE_APB_BASE_ADDRESS + CMD_RATE_SEL_ADDR)=0x1;   // Low speed Upconnection Rate Select

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x70;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)= 0x00210014;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01AB8754;

    }
    else if (data == RATE_12DOT5G) //12.5G
    {
        *(volatile unsigned int *)(COAXPRESS_DEVICE_APB_BASE_ADDRESS + CMD_RATE_SEL_ADDR)=0x1;   // Low speed Upconnection Rate Select

        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + lane_addr + SER_CLK_CTRL)=0x70;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_1)= 0x002A0019;
        *(volatile unsigned int *)(CXP_DEV_XCVR_BASE + TXPLL_DIV_2)= 0x01166929;
    }

}
