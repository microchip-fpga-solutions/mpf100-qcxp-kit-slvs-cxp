#include <stdio.h>
#include "slvs_ec_corei2c.h"

extern gpio_instance_t g_gpio_out;

extern i2c_instance_t g_i2c_instance_cam1;
static i2c_instance_t * sensor1_i2c = &g_i2c_instance_cam1;

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

    return status;
}


void slvs_ec_cam_init()
{
    I2C_init( sensor1_i2c, COREI2C_SLVS1_BASE_ADDR, SLVS_EC_1_DEV_REG, I2C_PCLK_DIV_256 );
    GPIO_set_output(&g_gpio_out, CAM1_RST, 0u);
    msdelay(100);
    GPIO_set_output(&g_gpio_out, CAM1_RST, 1u); // Bring camera out of reset
    msdelay(100);
}

void slvs_ec_cam_reginit( uint8_t i2c_ch_sel)
{
    uint32_t i;

    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x01);// STANDBY MODE enabled
    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x01);// Master mode disabled
    sensor_i2c_write(i2c_ch_sel, 0x3014, 0x05);// INCKSEL_ST0
    sensor_i2c_write(i2c_ch_sel, 0x3015, 0x91);// INCKSEL_ST1
    sensor_i2c_write(i2c_ch_sel, 0x3016, 0x60);// INCKSEL_ST2
    sensor_i2c_write(i2c_ch_sel, 0x3018, 0x1F);// INCKSEL_ST3
    sensor_i2c_write(i2c_ch_sel, 0x3019, 0x02);// INCKSEL_ST4
    sensor_i2c_write(i2c_ch_sel, 0x301B, 0x1D);// INCKSEL_ST5

    sensor_i2c_write(i2c_ch_sel, 0x303C, 0x00);// HVMODE 0 - All pixels, 1 - 1/2 subsampling

    sensor_i2c_write(i2c_ch_sel, 0x30D0, 0xD0);// VOPB_VBLK_HWIDTH
    sensor_i2c_write(i2c_ch_sel, 0x30D1, 0x14);// VOPB_VBLK_HWIDTH

#if 1 //63fps
    sensor_i2c_write(i2c_ch_sel, 0x30D4, 0xc4);// VMAX      //0xc4
    sensor_i2c_write(i2c_ch_sel, 0x30D5, 0x12);// VMAX      //0x12
    sensor_i2c_write(i2c_ch_sel, 0x30D8, 0x09);// HMAX      //0xf3
    sensor_i2c_write(i2c_ch_sel, 0x30D9, 0x01);// HMAX      //0x00
#else //16fps
    sensor_i2c_write(i2c_ch_sel, 0x30D4, 0x9C);// VMAX      //0x9c
    sensor_i2c_write(i2c_ch_sel, 0x30D5, 0x12);// VMAX      //0x12
    sensor_i2c_write(i2c_ch_sel, 0x30D8, 0xCF);// HMAX      //0xcf
    sensor_i2c_write(i2c_ch_sel, 0x30D9, 0x01);// HMAX      //0x01
#endif

    sensor_i2c_write(i2c_ch_sel, 0x30DC, 0x01);// Data Rate 2.376 Gbps


    sensor_i2c_write(i2c_ch_sel, 0x30E2, 0x08);// GMRWT
    sensor_i2c_write(i2c_ch_sel, 0x30E3, 0x3C);// GMTWT
    sensor_i2c_write(i2c_ch_sel, 0x30E5, 0x04);// GAINDLY
    sensor_i2c_write(i2c_ch_sel, 0x30E6, 0x1C);// GSDLY

    sensor_i2c_write(i2c_ch_sel, 0x3100, 0x00);// ROI Overlap

    sensor_i2c_write(i2c_ch_sel, 0x3200, 0x28);// ADC 8 bit mode, H binning average
    sensor_i2c_write(i2c_ch_sel, 0x321C, 0x40);// INCKSEL_N0
    sensor_i2c_write(i2c_ch_sel, 0x321D, 0x05);// INCKSEL_N1
    sensor_i2c_write(i2c_ch_sel, 0x321E, 0xE0);// INCKSEL_N2
    sensor_i2c_write(i2c_ch_sel, 0x321F, 0x00);// INCKSEL_N3
    sensor_i2c_write(i2c_ch_sel, 0x3220, 0x40);// INCKSEL_S0
    sensor_i2c_write(i2c_ch_sel, 0x3221, 0x05);// INCKSEL_S1
    sensor_i2c_write(i2c_ch_sel, 0x3222, 0xE0);// INCKSEL_S2
    sensor_i2c_write(i2c_ch_sel, 0x3223, 0x00);// INCKSEL_S3
    sensor_i2c_write(i2c_ch_sel, 0x3224, 0x10);// INCKSEL_D0
    sensor_i2c_write(i2c_ch_sel, 0x3225, 0x14);// INCKSEL_D1
    sensor_i2c_write(i2c_ch_sel, 0x3226, 0x40);// INCKSEL_D2
    sensor_i2c_write(i2c_ch_sel, 0x3227, 0xD0);// INCKSEL_D3

    sensor_i2c_write(i2c_ch_sel, 0x322B, 0x02);// SLVS-EC enable
    sensor_i2c_write(i2c_ch_sel, 0x3233, 0x50);
    sensor_i2c_write(i2c_ch_sel, 0x323E, 0x38);// VINT_EN  VINT_EN_NOR
    sensor_i2c_write(i2c_ch_sel, 0x3240, 0xB4);// SHS
    sensor_i2c_write(i2c_ch_sel, 0x3241, 0x08);// SHS
    sensor_i2c_write(i2c_ch_sel, 0x3242, 0x00);// SHS

    //sensor_i2c_write(i2c_ch_sel, 0x323C, 0x30); //LLBLANK

    sensor_i2c_write(i2c_ch_sel, 0x3430, 0x02);// ODBIT 00-10bit, 02-8bit, 01-12bit
    sensor_i2c_write(i2c_ch_sel, 0x3480, 0x20);// PULSE2_EN_NOR  PULSE2_EN_TRIG  PULSE2_POL
    sensor_i2c_write(i2c_ch_sel, 0x3502, 0x09);// GAIN_RTS

    sensor_i2c_write(i2c_ch_sel, 0x3514, 0x60);//
    //sensor_i2c_write(i2c_ch_sel, 0x3515, 0x00);// GAIN



#if 0// Test pattern
    sensor_i2c_write(i2c_ch_sel, 0x3550, 0x05);  // Pattern Generator ON (05)/ OFF (02)
    sensor_i2c_write(i2c_ch_sel, 0x3551, 0x0A);  // Pattern Generator mode
    //sensor_i2c_write(i2c_ch_sel, 0x3551, 0x03);  // Pattern Generator mode

    sensor_i2c_write(i2c_ch_sel, 0x355C, 0x00);  // PGDATA1
    sensor_i2c_write(i2c_ch_sel, 0x355D, 0x00);  // PGDATA1
    sensor_i2c_write(i2c_ch_sel, 0x355E, 0x00);  // PGDATA2
    sensor_i2c_write(i2c_ch_sel, 0x355F, 0x00);  // PGDATA2
    sensor_i2c_write(i2c_ch_sel, 0x35B4, 0x00);  // BLKLEVEL
    sensor_i2c_write(i2c_ch_sel, 0x35B5, 0x00);  // BLKLEVEL
#else
    sensor_i2c_write(i2c_ch_sel, 0x3550, 0x02);  // Pattern Generator ON (03)/ OFF (02)
    sensor_i2c_write(i2c_ch_sel, 0x35B4, 0x0F);  // BLKLEVEL
    sensor_i2c_write(i2c_ch_sel, 0x35B5, 0x00);  // BLKLEVEL
#endif

    sensor_i2c_write(i2c_ch_sel, 0x3521, 0x89);  //
    sensor_i2c_write(i2c_ch_sel, 0x3522, 0xB0);  //
    sensor_i2c_write(i2c_ch_sel, 0x3546, 0x22);  //


    sensor_i2c_write(i2c_ch_sel, 0x360D, 0x0A);  //
    sensor_i2c_write(i2c_ch_sel, 0x3610, 0xFF);  //

    sensor_i2c_write(i2c_ch_sel, 0x3904, 0x00);// SLVS-EC NUM of Lanes
    //04-1lane, 03- 2lanes, 02=4lanes, 00=8lanes

    sensor_i2c_write(i2c_ch_sel, 0x3930, 0xAA);// SYNC_CODEfv
    sensor_i2c_write(i2c_ch_sel, 0x3931, 0x00);// SYNC_CODE
    sensor_i2c_write(i2c_ch_sel, 0x3A00, 0xC1);// CRC enabled, ECC disabled
    sensor_i2c_write(i2c_ch_sel, 0x3A0C, 0x0B);//

    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x00);// Master mode
    msdelay(1000);
    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x00);// STANDBY mode disabled

}

void gain_setting( uint8_t i2c_ch_sel,uint16_t in_gain)
{
    uint8_t gain_lsb, gain_msb;
    if (in_gain >= 0xFE)
        gain_msb = 1;
    else
        gain_msb = 0;

    gain_lsb = in_gain & 0x00ff;
    sensor_i2c_write(i2c_ch_sel, 0x3514, gain_lsb);
    sensor_i2c_write(i2c_ch_sel, 0x3515, gain_msb);// GAIN
}

void pattern_setting(uint8_t i2c_ch_sel, uint8_t Pattern_st)
{
    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x01);// STANDBY MODE enabled
    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x01);// Master mode disabled
    if (Pattern_st == 1)
    {
        sensor_i2c_write(i2c_ch_sel, 0x3550, 0x05);  // Pattern Generator ON (05)/ OFF (02)
        sensor_i2c_write(i2c_ch_sel, 0x3551, 0x0A);  // Pattern Generator mode

        sensor_i2c_write(i2c_ch_sel, 0x355C, 0x00);  // PGDATA1
        sensor_i2c_write(i2c_ch_sel, 0x355D, 0x00);  // PGDATA1
        sensor_i2c_write(i2c_ch_sel, 0x355E, 0x00);  // PGDATA2
        sensor_i2c_write(i2c_ch_sel, 0x355F, 0x00);  // PGDATA2
        sensor_i2c_write(i2c_ch_sel, 0x35B4, 0x00);  // BLKLEVEL
        sensor_i2c_write(i2c_ch_sel, 0x35B5, 0x00);  // BLKLEVEL
    }
    else
    {
        sensor_i2c_write(i2c_ch_sel, 0x3550, 0x02);  // Pattern Generator ON (03)/ OFF (02)
        sensor_i2c_write(i2c_ch_sel, 0x35B4, 0x0F);  // BLKLEVEL
        sensor_i2c_write(i2c_ch_sel, 0x35B5, 0x00);  // BLKLEVEL
    }
    sensor_i2c_write(i2c_ch_sel, 0x3010, 0x00);// Master mode
    msdelay(1000);
    sensor_i2c_write(i2c_ch_sel, 0x3000, 0x00);// STANDBY mode disabled
}

void reverse_xy_setting( uint8_t i2c_ch_sel, uint16_t reverse_xy)
{
    sensor_i2c_write(i2c_ch_sel, 0x3204, reverse_xy);//H_REVERSE
}
