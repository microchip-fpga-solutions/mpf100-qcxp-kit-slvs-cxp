/*-------------------------------------------------------------------------------------------------
--
-- File Name    : main.c



-- Description  : This module replicates the CoaXPress Device main interface functionality.




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


#include <stdio.h>
#include "hal/hal.h"
#include "miv_rv32_hal/miv_rv32_hal.h"
#include "drivers/fpga_ip/CoreGPIO/core_gpio.h"
#include "slvs_ec_corei2c/slvs_ec_corei2c.h"

#include <drivers/fpga_ip/CoaXPressDevice/coaxpressDevice.h>
#include <drivers/fpga_ip/CoaXPressDevice/coaxpressXcvrSpeed.h>

#define LED1 GPIO_0
#define LED2 GPIO_1
#define LED3 GPIO_2
#define LED4 GPIO_3

#define CXP_RESET GPIO_5

i2c_instance_t g_i2c_instance_cam1;
volatile uint8_t irq_flag  = 0;

/*-----------------------------------------------------------------------------
 * GPIO instance data.
 */
gpio_instance_t g_gpio_out;

/*-----------------------------------------------------------------------------
 *
 * Global state counter.
 */
uint8_t resolution[4];

void GPIO_settings();
extern void msdelay(uint32_t tms);

/*-----------------------------------------------------------------------------
 * Interrupt handlers.
 * Weakly linked default versions of all the interrupt handlers are defined
 * in miv_rv32_stubs.c.
 */

void External_IRQHandler()
{
    irq_flag = 1;
}

void MSYS_EI1_IRQHandler(void)
{
    I2C_isr(&g_i2c_instance_cam1);
}


/*-------------------------------------------------------------------------//**
  main() function.
*/
int main(void)
{
    volatile  uint32_t counter, lsuc_conn=0;
    uint8_t state, select;

    counter    = 0;
    state      = 0;

    /* Initializing GPIOs */
    GPIO_settings();

    /* enabling local interrupts */
    MRV_enable_local_irq(MRV32_EXT_IRQn);
    MRV_enable_local_irq(MRV32_MSYS_EIE1_IRQn);

    /* This must be done for all Mi-V cores to enable interrupts globally. */
    HAL_enable_interrupts();

    GPIO_set_output(&g_gpio_out, LED2, 1);

    GPIO_set_output(&g_gpio_out, CAM1_RST, 1u);
    cxp_xcvr_uplink_preemphasis();
    GPIO_set_output(&g_gpio_out, CXP_RESET, 1u);//cxp ip reset release

    msdelay(1);

    //initializations for 4K
    width_reg_st  = WIDTH_MAX;
    height_reg_st = HEIGHT_MAX;
    resolution[0] = width_reg_st & 0xff;
    resolution[1] = (width_reg_st >> 8) & 0xff;
    resolution[2] = height_reg_st & 0xff;
    resolution[3] = (height_reg_st >> 8) & 0xff;
    
    update_cxp_xcvr_uplink_speed(DEF_RATE);

    //default 2 cameras
    StreamIDSelect_st = STREAM0;
    /* Initialize camera */
    slvs_ec_cam_init();
    slvs_ec_cam_reginit(1u);
    GPIO_set_output(&g_gpio_out, LED3, 1);
    msdelay(1);

    GPIO_set_output(&g_gpio_out, LED4, 1);

    msdelay(10);

    /* Initialize Coaxpress Device */
    CoaxpressDeviceInit(COAXPRESS_DEVICE_APB_BASE_ADDRESS,resolution);
    StreamIDSelect_st = STREAM0;
    /**************************************************************************
    * Loop
    *************************************************************************/
    do
    {
        if(100000u == counter)
        {
            counter = 0;
            state = !state;
            GPIO_set_output(&g_gpio_out, LED1, state);
        }
        else
        {
            counter = counter + 1;
        }

        if(irq_flag == 1)
        {
            irq_flag = 0;
             CoaxpressDeviceMain(COAXPRESS_DEVICE_APB_BASE_ADDRESS);
        }


        if(pattern_en)
        {
            pattern_en = 0;
            pattern_setting(1u, Pattern_st);
            delay(1);
        }

        if(gain_en)
        {
            gain_en = 0;
            gain_setting(1u, Gain_st);
            delay(1);
        }

        if(reversex_en)
        {
            reversex_en = 0;
            ReverseXY_st = (ReverseX_st << 1) | ReverseY_st;
            reverse_xy_setting(1u, ReverseXY_st);
            delay(1);
        }

        if(reversey_en)
        {
            reversey_en = 0;
            ReverseXY_st = (ReverseX_st << 1) | ReverseY_st;
            reverse_xy_setting(1u, ReverseXY_st);
            delay(1);
        }


    } while (1);

    return 0u;
}


void GPIO_settings()
{
    GPIO_init(&g_gpio_out, COREGPIO_OUT_BASE_ADDR, GPIO_APB_32_BITS_BUS);
    GPIO_set_output(&g_gpio_out, LED4, 1);
}
