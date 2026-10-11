/*-------------------------------------------------------------------------------------------------
--
-- File Name    : coaxpressDevice.h



-- Description  : This module replicates the CoaXPress Device interface functionality.




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

#ifndef COAXPRESSDEVICE_H
#define COAXPRESSDEVICE_H

#define LINE_SCAN	0
#define DEF_RATE    0x38 //0x38 - 3.125Gbps
#define NEW_RATE    0x58 //0x28 - 1.25Gbps    0x30 - 2.5Gbps  //0x40 - 5Gbps     //0x48 - 6.25Gbps //0x50 - 10Gbps //0x58 - 12.5Gbps

#define NUM_CONNECTIONS     4   //4 connection
#define STRM_MAX_SZ         2048//8192

#define DUAL_STREAM_ENABLE  0
#define STREAM0             1
#define STREAM1             2
#define DUAL_STREAM         3
#define RESOLUTION_4K       1
#define RESOLUTION_FHD      2


enum manufacturer_reg
{
		WidthReg                   = 0x00100010,
		HeightReg                  = 0x00100014,
        OffsetXReg                 = 0x00100018,
        OffsetYReg                 = 0x0010001C,
        ResolutionSelectReg        = 0x00100020,
		PixelFormatReg             = 0x00100024,
        DeviceTapGeometryReg       = 0x00100050,
		IMG1StreamIDReg            = 0x00100054,
		IMGNStreamIDReg            = 0x00100058,
		StreamIDSelectReg          = 0x0010005C,
		AcquisitionStartReg        = 0x00100100,
		AcquisitionStopReg         = 0x00100104,
		AcquisitionFrameRateReg    = 0x00100110,
		AcquisitionModeReg         = 0x0010011c,
		AcquisitionFrameRateMaxReg = 0x00100120,
		SensorWidthReg             = 0x00100150,
		SensorHeightReg            = 0x00100154,
		WidthMaxReg                = 0x00100158,
		HeightMaxReg               = 0x0010015C,
		PatternReg                 = 0x00100160,
		GainReg                    = 0x00100164,
        ReverseXReg                = 0x00100168,
        ReverseYReg                = 0x0010016C,
        RgainReg                   = 0x00100170,
        GgainReg                   = 0x00100174,
        BgainReg                   = 0x00100178,
		TLPLockReg                 = 0x0010f000,

		//manufacturer specific boot strap registers
		Start_of_manufacturer_specific_register_space = 0x00006000,

		XML_ADD   = 0x00007000,
		XML_REQ   = 0x00008100,
};

#define COAXPRESS_DEVICE_APB_BASE_ADDRESS        (0x71000000)

enum device_apb_reg
{
    CMD_RATE_SEL_ADDR         = 0x00,
    CMD_WRITE_ADDRESS         = 0x08,
    LSUC_RX_SW_PKT_VAL        = 0x0C,
    CMD_READ_ADDRESS          = 0x10,
    
    PKT_ORDER_RST_ADDRESS     = 0x18,

    CMD_HB_EN_ADDR            = 0x30,
    CMD_HB_ID_ADDR            = 0x34,
    HOST_CONN_ID              = 0x38,
    NUM_OF_CONN               = 0x3C,
    
    //Stream1
    CMD_DISP_PSIZE_ADDR       = 0x40,
    CMD_DISP_XSIZE_ADDR       = 0x44,
    CMD_DISP_YSIZE_ADDR       = 0x48,
    CMD_DISP_DSIZE_ADDR       = 0x4C,
    CMD_PIXEL_FORMAT_ADDR     = 0x50,
    STREAM_EN                 = 0x54,
	
	//Stream2
	CMD2_DISP_PSIZE_ADDR      = 0x60,
    CMD2_DISP_XSIZE_ADDR      = 0x64,
    CMD2_DISP_YSIZE_ADDR      = 0x68,
    CMD2_DISP_DSIZE_ADDR      = 0x6C,
    CMD2_PIXEL_FORMAT_ADDR    = 0x70,
    STREAM2_EN                = 0x74,
    
    //Stream3
    CMD3_DISP_PSIZE_ADDR       = 0x80,
    CMD3_DISP_XSIZE_ADDR       = 0x84,
    CMD3_DISP_YSIZE_ADDR       = 0x88,
    CMD3_DISP_DSIZE_ADDR       = 0x8C,
    CMD3_PIXEL_FORMAT_ADDR     = 0x90,
    STREAM3_EN                 = 0x94,
	
	//Stream4
	CMD4_DISP_PSIZE_ADDR      = 0xA0,
    CMD4_DISP_XSIZE_ADDR      = 0xA4,
    CMD4_DISP_YSIZE_ADDR      = 0xA8,
    CMD4_DISP_DSIZE_ADDR      = 0xAC,
    CMD4_PIXEL_FORMAT_ADDR    = 0xB0,
    STREAM4_EN                = 0xB4,
    
    TestModeReg               = 0x20,
    TestPacketCountTxReg      = 0x24,
    TestPacketCountRxReg      = 0x28,
    TestErrorCountReg         = 0x2C,

};

#define WIDTH_MAX   7840//1920//3840//5312
#define HEIGHT_MAX  2112//1080//2160//4671

#define CONTROL_CMD_WITHOUT_TAG 					0x02020202
#define CONTROL_CMD_WITH_TAG 						0x05050505
#define CONTROL_ACK_WITHOUT_TAG 					0x03030303
#define CONTROL_ACK_WITH_TAG 						0x06060606
#define CONTROL_CMD_READ	       					0x00000000
#define CONTROL_CMD_WRITE       					0x01000000
#define ACK_CMD_EXEC_OK_APPEND_REPLY				0x00000000
#define ACK_CMD_EXEC_OK_NO_APPEND_REPLY				0x01010101
#define ACK_CMD_INVALID_DATA_FOR_ADDRESS			0x41414141
#define ACK_CMD_INVALID_CONTROL_OPERATION			0x42424242
#define ACK_CMD_WRITE_ATTEMPT_TO_READONLY_ADDRESS	0x43434343
#define START_OF_THE_PACKET 						0xfbfbfbfb
#define END_OF_THE_PACKET 							0xfdfdfdfd


//Pixel format
#define BAYER_BG8	0x0341
#define BAYER_RG8	0x0321
#define BAYER_GB8	0x0331
#define YCBCR_422_8	0x0621

//Acquisition modes
#define ACQUISITION_MODE_SINGLE 		0
#define ACQUISITION_MODE_MULTIPLE 	    1
#define ACQUISITION_MODE_CONTINUOUS 	2

#define MAX_CONTROL_PACKET_SIZE			132
#define MAX_FRAME_COUNT					60

//Magic number is an approximation of �CoaXPress� which is indication that Device implements the CoaXPress standard
#define COAXPRESS_STANDARD				0xC0A79AE5

//VersionsSupported bits set
#define COAXPRESS_VERBIT_1DOT0			0x1		//bit 0
#define COAXPRESS_VERBIT_1DOT1			0x2		//bit 1
#define COAXPRESS_VERBIT_2DOT0			0x4		//bit 2
#define COAXPRESS_VERBIT_2DOT1			0x8		//bit 3
#define COAXPRESS_VERBIT_1DOT1_2DOT0	0x6		//bit 1 & 2

//VersionUsed  MSB 16bits - integer value, LSB 16bits - fraction value
#define COAXPRESS_VER_1DOT0			0x00010000
#define COAXPRESS_VER_1DOT1			0x00010001
#define COAXPRESS_VER_2DOT0			0x00020000
#define COAXPRESS_VER_2DOT1			0x00020001

#define COAXPRESS_VER_2DOT5_SUBVER2		0x2<<16|0x5<<8|0x2
#define COAXPRESS_VER_1DOT1_SUBVER0		0x1<<16|0x1<<8|0x0

//Configuring different rates 1.25G, 2.5G, 3.125G, 5.0G, 6.25G, 10.0G, 12.5G
#define RATE_1DOT25G	0x28
#define RATE_2DOT5G		0x30
#define RATE_3DOT125G	0x38
#define RATE_5DOT0G		0x40
#define RATE_6DOT25G	0x48
#define RATE_10DOT0G	0x50
#define RATE_12DOT5G	0x58

void CoaxpressDeviceInit(uint32_t cxp_base_addr,uint8_t resolution[4]);
void resolution_cxp_setting(uint32_t cxp_base_addr,uint8_t resolution[4]);
void CoaxpressDeviceMain(uint32_t cxp_base_addr);

void stream_enable();
void stream_disable();

void delay(uint32_t tms);
void dataFromHostToDevice(uint32_t bs_reg_address, uint32_t data, uint32_t cxp_base_addr);
uint32_t dataFromDeviceToHost(uint32_t resp_size, uint32_t bs_reg_address, uint32_t count, uint32_t cxp_base_addr);
void sendPacketDataFromDevice(uint32_t ack_code, uint32_t count, uint32_t cxp_base_addr);

extern uint32_t reply_acknowledge_cmd;
extern uint32_t control_cmd_tag_status;
extern uint32_t control_cmd_tag;
extern uint32_t control_cmd_read_write;
extern uint32_t control_cmd_size;
extern uint32_t control_cmd_address;
extern uint32_t control_cmd_data;

extern uint8_t def_rate;

extern uint8_t Pattern_st;
extern uint8_t pattern_en;
extern uint8_t ReverseXY_st;
extern uint8_t ReverseX_st;
extern uint8_t reversex_en;
extern uint8_t ReverseY_st;
extern uint8_t reversey_en;
extern uint32_t Gain_st;
extern uint8_t RGain_st;
extern uint8_t GGain_st;
extern uint8_t BGain_st;
extern uint8_t gain_en;
extern uint8_t RGBgain_en;
extern uint32_t TLP_lock_st;
extern uint8_t width_en;
extern uint32_t width_reg_st;
extern uint8_t height_en;
extern uint32_t height_reg_st;
extern uint8_t StreamIDSelect_st;
extern uint8_t resolution_en;
extern uint8_t ResolutionSelect_st;

#endif  //#ifndef COAXPRESSDEVICE_H
