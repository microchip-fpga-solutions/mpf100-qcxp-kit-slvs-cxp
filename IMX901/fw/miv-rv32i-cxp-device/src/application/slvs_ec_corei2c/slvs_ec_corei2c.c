#include <stdio.h>
#include "slvs_ec_corei2c.h"

extern gpio_instance_t g_gpio_out;

extern i2c_instance_t g_i2c_instance_cam1;
static i2c_instance_t * sensor1_i2c = &g_i2c_instance_cam1;
extern i2c_instance_t g_i2c_instance_cam2;
static i2c_instance_t * sensor2_i2c = &g_i2c_instance_cam2;

static uint8_t tx_buffer[64];
static uint16_t write_length;
static i2c_status_t status;

void msdelay(uint32_t tms);

static i2c_status_t sensor_i2c_write(uint8_t i2c_ch_sel, uint16_t data_reg, uint8_t data) {
    tx_buffer[0] = data_reg >> 8;
    tx_buffer[1] = data_reg & 0xff;
    tx_buffer[2] = data;// >> 8;
    write_length = sizeof(data_reg) + sizeof(data);


        I2C_write(sensor1_i2c, SLVS_EC_1_DEV_REG, (const uint8_t *) tx_buffer,
                    write_length, I2C_RELEASE_BUS );
            status = I2C_wait_complete(sensor1_i2c, I2C_NO_TIMEOUT );

            tx_buffer[0] = data_reg >> 8;
            tx_buffer[1] = data_reg & 0xff;
            tx_buffer[2] = data;// >> 8;
            write_length = sizeof(data_reg) + sizeof(data);
    return status;
}

static uint8_t sensor_i2c_read(uint8_t i2c_ch_sel, uint16_t data_reg) {
    uint8_t dummy = -1;
//    tx_buffer[0] = data_reg >> 8;
//    tx_buffer[1] = data_reg & 0xff;
//    write_length = sizeof(data_reg) ;
//
//        I2C_write(sensor1_i2c, SLVS_EC_1_DEV_REG, (const uint8_t *) tx_buffer,
//                    write_length, I2C_RELEASE_BUS );
//        status = I2C_wait_complete(sensor1_i2c, I2C_NO_TIMEOUT );

        I2C_read(sensor1_i2c, SLVS_EC_1_DEV_REG, &dummy, 1, I2C_RELEASE_BUS);


    return dummy;
}

//----------------------------------------------------------------
// Camera Initialization
//----------------------------------------------------------------


void slvs_ec_cam_init()
{
    I2C_init( sensor1_i2c, COREI2C_SLVS1_BASE_ADDR, SLVS_EC_1_DEV_REG, I2C_PCLK_DIV_256 );
    GPIO_set_output(&g_gpio_out, CAM1_RST, 0u);
    //GPIO_set_output(&g_gpio_out, CAM2_RST, 0u);
    msdelay(100);
    GPIO_set_output(&g_gpio_out, CAM1_RST, 1u); // Bring camera out of reset
    //GPIO_set_output(&g_gpio_out, CAM2_RST, 1u); // Bring camera out of reset
    msdelay(100);
    GPIO_set_output(&g_gpio_out, CAM_CLK_EN, 1u); //Enable Cam clock from FPGA
    msdelay(100);
}

//----------------------------------------------------------------
// Camera Register Configurations (SLVS EC - IMX901) & Initializations
//----------------------------------------------------------------
void slvs_ec_cam_reginit( uint8_t i2c_ch_sel)
{
    uint32_t i;

    // ------------ CHIP ID -02 ----- address 30xx ----------------

    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x8D);// STANDBY MODE enabled 8c disable; 8d- enable
    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x01);// Master mode disabled

    sensor_i2c_write(i2c_ch_sel, 0x3014, 0x1E);// INCKSEL_ST0
    sensor_i2c_write(i2c_ch_sel, 0x3015, 0x0D);// INCKSEL_ST1
    sensor_i2c_write(i2c_ch_sel, 0x3016, 0xBC);// INCKSEL_ST2
    //sensor_i2c_write(i2c_ch_sel, 0x3017, 0x02);// INCKSEL_ST3
    sensor_i2c_write(i2c_ch_sel, 0x3018, 0x1E);// INCKSEL_ST4
    sensor_i2c_write(i2c_ch_sel, 0x3019, 0x6A);// INCKSEL_ST5
    sensor_i2c_write(i2c_ch_sel, 0x301A, 0x03);// INCKSEL_ST6
    sensor_i2c_write(i2c_ch_sel, 0x301C, 0x0A);// INCKSEL_ST7
    sensor_i2c_write(i2c_ch_sel, 0x301D, 0x22);// INCKSEL_ST8
    sensor_i2c_write(i2c_ch_sel, 0x301E, 0x01);// INCKSEL_ST9
    sensor_i2c_write(i2c_ch_sel, 0x3020, 0xD6);// INCKSEL_ST10
    sensor_i2c_write(i2c_ch_sel, 0x3021, 0x02);// INCKSEL_ST11
    sensor_i2c_write(i2c_ch_sel, 0x3024, 0x1E);// INCKSEL_ST13
    //sensor_i2c_write(i2c_ch_sel, 0x3025, 0x00);// INCKSEL_ST14
    sensor_i2c_write(i2c_ch_sel, 0x303A, 0x15);// I2CSPICK

    sensor_i2c_write(i2c_ch_sel, 0x30D4, 0x62);// 40VMAX      //0x62     VMAX For ADC 10 bit,4Lane & 2.376G =  0x000862
    sensor_i2c_write(i2c_ch_sel, 0x30D5, 0x0B);// 0BVMAX      //0x08
    sensor_i2c_write(i2c_ch_sel, 0x30D6, 0x00);// 00VMAX      //0x00
    sensor_i2c_write(i2c_ch_sel, 0x30D8, 0xA0);// A0HMAX      //0x53   HMAX For ADC 10 bit,4Lane & 2.376G = 0x353
    sensor_i2c_write(i2c_ch_sel, 0x30D9, 0x01);// 01HMAX      //0x03
    sensor_i2c_write(i2c_ch_sel, 0x30DC, 0x02);// Data Rate 2.376 Gbps -- IMX 901 (SLVS 3.0)   0x01 -9.504G ; 0x2 4.752Gl 0x03 - 2.376G
    sensor_i2c_write(i2c_ch_sel, 0x30DE, 0x03); // SLVS_EC ENable -- IF SEL - 0x00 - CSI-2 ; 0x02 - SLVS ; 0x03 - SLVS_EC

    sensor_i2c_write(i2c_ch_sel, 0x30E2, 0x08);// GMRWT 0x04
    sensor_i2c_write(i2c_ch_sel, 0x30E3, 0x08);// GMTWT 0x04
    //sensor_i2c_write(i2c_ch_sel, 0x30E5, 0x02);// GAINDLY Gain switching wait time setting
    sensor_i2c_write(i2c_ch_sel, 0x30E6, 0x08);// GSDLY 0x04


    // ------------ CHIP ID -04 ----- address 32xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x321C, 0x04);// INCKSEL_ST15
    sensor_i2c_write(i2c_ch_sel, 0x3225, 0x04);// INCKSEL_ST18
    sensor_i2c_write(i2c_ch_sel, 0x3229, 0x90);// INCKSEL_ST20 0xA0 -2.376G; 0x90 - 4.752G ; 0x80 - 9.504G
    sensor_i2c_write(i2c_ch_sel, 0x322A, 0x88); ///---
    sensor_i2c_write(i2c_ch_sel, 0x3232, 0xE8);// INCKSEL_ST24
    sensor_i2c_write(i2c_ch_sel, 0x3233, 0x02);// INCKSEL_ST25
    sensor_i2c_write(i2c_ch_sel, 0x3234, 0x80);// INCKSEL_ST26
    sensor_i2c_write(i2c_ch_sel, 0x3235, 0x80);// INCKSEL_ST27 0xE0
    sensor_i2c_write(i2c_ch_sel, 0x3236, 0x2E);// INCKSEL_ST28 0x5c
    sensor_i2c_write(i2c_ch_sel, 0x3240, 0x20);// INCKSEL_ST30     0x40 -2.3g ; 0x20 - 4.7g; 0x00 9.5G ---

    sensor_i2c_write(i2c_ch_sel, 0x324A, 0x33);// 0x38 VINT_EN  VINT_EN_NOR ; bits [7:2] - 0x08 - 1/2 subsample color ; 0x0A - 1/2 subsample monochrome; 0x0C - ALl pixel
    sensor_i2c_write(i2c_ch_sel, 0x324C, 0x08);// SHS 0xB4
    //sensor_i2c_write(i2c_ch_sel, 0x324D, 0x08);// SHS
    //sensor_i2c_write(i2c_ch_sel, 0x324E, 0x00);// SHS
    sensor_i2c_write(i2c_ch_sel, 0x32AC, 0x4B); //------No reg


    // ------------ CHIP ID -05 ----- address 33xx ----------------

    sensor_i2c_write(i2c_ch_sel, 0x3308, 0x4A); //------No reg
    sensor_i2c_write(i2c_ch_sel, 0x3344, 0x00); //------ 0x00- 10 bit, 0xFF -12 bit
    sensor_i2c_write(i2c_ch_sel, 0x3345, 0x00); //------ 0x00- 10 bit, 0x0F -12 bit
    sensor_i2c_write(i2c_ch_sel, 0x3346, 0x69); //------
    //sensor_i2c_write(i2c_ch_sel, 0x3347, 0x00); //------

    // ------------ CHIP ID -06 ----- address 34xx ----------------

    sensor_i2c_write(i2c_ch_sel, 0x3440, 0x01); //------ No reg

    // ------------ CHIP ID -07 ----- address 35xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x3502, 0x08);// GAIN_RTS
    sensor_i2c_write(i2c_ch_sel, 0x3514, 0xC0);
    sensor_i2c_write(i2c_ch_sel, 0x3515, 0x0);
    sensor_i2c_write(i2c_ch_sel, 0x3542, 0x27);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x359C, 0x0F);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35A4, 0x2B);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35A5, 0x02);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35A6, 0xF0);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35A8, 0x2B);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35A9, 0x42);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35EC, 0x2B);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35ED, 0x12);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35FD, 0xC0);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x35FE, 0x03);// -No reg

    //sensor_i2c_write(i2c_ch_sel, 0x35F4, 0x00);// 0x00 slvs ec

    // ------------ CHIP ID -08 ----- address 36xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x362C, 0x71);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x362E, 0xD8);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x362F, 0x1F);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3642, 0xF4);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3643, 0x1F);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3648, 0x61);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3649, 0x01);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x364A, 0x0A);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3654, 0x71);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3656, 0xFC);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3657, 0x1F);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x366A, 0x0A);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3670, 0x61);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3671, 0x01);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x3672, 0x0A);// -No reg
    sensor_i2c_write(i2c_ch_sel, 0x36E4, 0x01);// -No reg


    // ------------ CHIP ID -0C ----- address 3Axx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x3A4E, 0x01);//

    // ------------ CHIP ID -0E ----- address 3Cxx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x3C98, 0x48);// BASECK_FREQ LSB
    sensor_i2c_write(i2c_ch_sel, 0x3C99, 0x09);// BASECK_FREQ MSB


    // ------------ CHIP ID -10 ----- address 3Exx ----------------

    sensor_i2c_write(i2c_ch_sel, 0x3E98, 0x45);// No reg



    // ------------ CHIP ID -11 ----- address 3Fxx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x3F3A, 0x0B);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x3F3C, 0x36);// No reg


    // ------------ CHIP ID -13 ----- address 41xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x4184, 0x46);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x41A2, 0x0A);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x41A4, 0x37);// No reg

    // ------------ CHIP ID -14 ----- address 42xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x4232, 0x3C);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4234, 0x0A);// No reg

    // ------------ CHIP ID -15 ----- address 43xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x4310, 0x06);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x432C, 0x0B);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x432E, 0x19);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4334, 0x0C);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4336, 0x1A);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x433D, 0x0B);// No reg

    // ------------ CHIP ID -16 ----- address 44xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x4466, 0xCA);// No reg


    // ------------ CHIP ID -19 ----- address 47xx ----------------
    sensor_i2c_write(i2c_ch_sel, 0x4718, 0x9A);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4722, 0x9A);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4770, 0x9A);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4776, 0x9A);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4788, 0x04);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4789, 0x10);// No reg

    // ------------ CHIP ID -1A ----- address 48xx ----------------

    sensor_i2c_write(i2c_ch_sel, 0x4864, 0xF5);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x4868, 0xF5);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x486C, 0xF5);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x48A4, 0x13);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x48A8, 0x13);// No reg
    sensor_i2c_write(i2c_ch_sel, 0x48AC, 0x13);// No reg

   // -------------- extra reg required ---------------------------
    sensor_i2c_write(i2c_ch_sel, 0x3200, 0x05);// ADC 8 bit mode, bits [5:4] : 0x00 - 10 bit ; 0x10 - 12 bit
    sensor_i2c_write(i2c_ch_sel, 0x3430, 0x00);// ODBIT 0x00-10bit,  0x01-12bit
    sensor_i2c_write(i2c_ch_sel, 0x3904, 0x02);// SLVS-EC NUM of Lanes - IMX 901 --> 0x02-4lane; 0x03 - 2lane, 0x04 - 1Lane
    sensor_i2c_write(i2c_ch_sel, 0x3A00, 0xC1);// CRC enabled, ECC disabled
    //sensor_i2c_write(i2c_ch_sel, 0x392A, 0x10);// Deskew code  Default: 10h (when using 8b10b) ; 40h (when using GCC)
    sensor_i2c_write(i2c_ch_sel, 0x394D, 0x00); // bit6 - 1 = GCC ENCODING ; bit 6 = 0 = 8b10b ENcoding
    sensor_i2c_write(i2c_ch_sel, 0x3204, 0x03); //H and V Reverse; //bit 0 - 1 -> V reverse ; bit 0 - 0 -> V Noramal,  bit 1 - 1 -> H reverse ; bit 1 - 0 -> H Noraml



//for PG ENable make 1, else 0

#if 0

    sensor_i2c_write(i2c_ch_sel, 0x3520, 0x1F); // 0x1F - Black level adjust off, 0x10 - Black level adjustment on
    sensor_i2c_write(i2c_ch_sel, 0x3540, 0x00);
    sensor_i2c_write(i2c_ch_sel, 0x3550, 0x07); // PGREGEN/PGTHRU/PGCLKEN 0x7 - On , 0x0 -Off
    sensor_i2c_write(i2c_ch_sel, 0x3551, 0x0A); // PGMODE
    //sensor_i2c_write(i2c_ch_sel, 0x3562, 0x00); // step increment -> for 00:+1, 01 : +2,
    //sensor_i2c_write(i2c_ch_sel, 0x3560, 0x10);
    sensor_i2c_write(i2c_ch_sel, 0x35B4, 0x00); // BLKLEVEL for Pg
    sensor_i2c_write(i2c_ch_sel, 0x35B5, 0x00); // BLKLEVEL for Pg

#else
    //sensor_i2c_write(i2c_ch_sel, 0x3520, 0x10); // 0x1F - Black level adjust off, 0x10 - Black level adjustment on
    sensor_i2c_write(i2c_ch_sel, 0x3550, 0x00); // PGREGEN/PGTHRU/PGCLKEN 0x7 - On , 0x0 -Off
    sensor_i2c_write(i2c_ch_sel, 0x35B4, 0x3C); // BLKLEVEL for video 0x3c - 10bit, 0xF0 -12 bit
    sensor_i2c_write(i2c_ch_sel, 0x35B5, 0x3C); // BLKLEVEL for video 0x3c - 10bit, 0xF0 -12 bit

#endif


    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x00);// Master mode
    msdelay(1000);
    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x8c);// STANDBY mode disabled 8c disable;8d- enable

}


void slvs_ec_cam_standby_en_dis( uint8_t i2c_ch_sel)
{

    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x8D);// STANDBY MODE enabled 8c disable; 8d- enable
    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x01);// Master mode disabled

    msdelay(1u);

    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x00);// Master mode
    //msdelay(1);
    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x8c);// STANDBY mode disabled 8c disable;8d- enable
}

void gain_setting( uint8_t i2c_ch_sel,uint16_t in_gain)
{
    uint8_t gain_lsb, gain_msb;
    //in_gain = in_gain * 2;
//    gain_msb = in_gain >> 8;
    if (in_gain >= 0xFE)
        gain_msb = 1;
    else
        gain_msb = 0;

    gain_lsb = in_gain & 0x00ff;
    sensor_i2c_write(i2c_ch_sel, 0x3514, gain_lsb);
    sensor_i2c_write(i2c_ch_sel, 0x3515, gain_msb);// GAIN
}

