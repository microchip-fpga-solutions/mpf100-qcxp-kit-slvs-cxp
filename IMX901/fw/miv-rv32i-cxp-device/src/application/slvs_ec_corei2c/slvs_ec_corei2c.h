/*
 * slvs_ec_corei2c.h
 *
 *  Created on: 18-Feb-2019
 *      Author: I30392
 */

#ifndef APPLICATION_slvs_ec_COREI2C_slvs_ec_COREI2C_H_
#define APPLICATION_slvs_ec_COREI2C_slvs_ec_COREI2C_H_


#include "../../src/platform/drivers/fpga_ip/CoreI2C/core_i2c.h"
#include "drivers/fpga_ip/CoreGPIO/core_gpio.h"
#include "fpga_design_config.h"

#define CAM1_RST GPIO_8
#define CAM2_RST GPIO_7
#define CAM_CLK_EN GPIO_9
/*I2C Addresses*/
#define SLVS_EC_1_DEV_REG  (0x1A )	//After adjusting for shift
#define SLVS_EC_2_DEV_REG  (0x10)	//After adjusting for shift

void slvs_ec_cam_reginit(uint8_t );
void slvs_ec_cam_init(void);
void slvs_ec_cam_standby_en_dis(uint8_t);

#endif /* APPLICATION_slvs_ec_COREI2C_slvs_ec_COREI2C_H_ */
