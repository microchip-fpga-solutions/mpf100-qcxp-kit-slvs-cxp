/*-------------------------------------------------------------------------------------------------
--
-- File Name    : coaxpressDevice.c



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

#include "hal/hal.h"

#include <drivers/fpga_ip/CoaXPressDevice/coaxpressBootstrapReg.h>
#include <drivers/fpga_ip/CoaXPressDevice/coaxpressDevice.h>
#include <drivers/fpga_ip/CoaXPressDevice/coaxpressCrc.h>
#include <drivers/fpga_ip/CoaXPressDevice/genicamMchpXML_x4.h>
#include <drivers/fpga_ip/CoaXPressDevice/coaxpressXcvrSpeed.h>

uint32_t rd_pkt[128];
uint32_t crc_buffer[128];
uint32_t crc_value=0 ;

uint32_t reply_acknowledge_cmd  = 0;
uint32_t control_cmd_tag_status = 0;
uint32_t control_cmd_tag        = 0;
uint32_t control_cmd_read_write = 0;
uint32_t control_cmd_size       = 0;
uint32_t control_cmd_address    = 0;
uint32_t control_cmd_data       = 0;

uint32_t count         = 0;
uint8_t  half_rate_sel = 0x0;

uint32_t width_reg_st 			= WIDTH_MAX;
uint32_t height_reg_st 			= HEIGHT_MAX;
uint32_t width_max_reg_st 		= WIDTH_MAX;
uint32_t height_max_reg_st 		= HEIGHT_MAX;
uint32_t sensor_width_reg_st 	= WIDTH_MAX;
uint32_t sensor_height_reg_st 	= HEIGHT_MAX;
uint32_t offsetx_reg_st         = 0;
uint32_t offsety_reg_st         = 0;

uint8_t Pattern_st 	 = 0;
uint8_t pattern_en   = 0;
uint8_t ReverseXY_st  = 0;
uint8_t ReverseX_st  = 0;
uint8_t reversex_en  = 0;
uint8_t ReverseY_st  = 0;
uint8_t reversey_en  = 0;
uint32_t Gain_st 	 = 200;
uint8_t RGain_st 	 = 64;
uint8_t GGain_st 	 = 64;
uint8_t BGain_st 	 = 64;
uint8_t gain_en      = 0;
uint8_t RGBgain_en   = 0;
uint8_t width_en     = 0;
uint8_t height_en    = 0;
uint32_t TLP_lock_st = 0;

uint32_t OffsetX_st = 0;
uint8_t offsetx_en  = 0;
uint32_t OffsetY_st = 0;
uint8_t offsety_en  = 0;

uint32_t PixelFormat_st 			  = BAYER_RG8;
uint32_t AcquisitionMode_st 		  = ACQUISITION_MODE_CONTINUOUS;
uint32_t AcquisitionFrameRateMax_st   = MAX_FRAME_COUNT;
uint32_t XmlManifestSelector_st       = 0;
uint32_t DeviceUserID_st              = 0x11ff;
uint32_t ConnectionReset_st           = 0;
uint32_t ControlPacketSizeMax_st      = MAX_CONTROL_PACKET_SIZE;
uint32_t StreamPacketSizeMax_st       = 0;
uint32_t ConnectionConfig_st          = (NUM_CONNECTIONS <<16 )| DEF_RATE;
uint32_t MasterHostConnectionID_st    = 0;
uint32_t TestMode_st                  = 0;
uint32_t TestErrorCountSelector_st    = 0;
uint32_t TestErrorCount_st            = 0;
uint32_t TestPacketCountTx_st         = 0;
uint32_t TestPacketCountRx_st         = 0;
uint32_t ElectricalComplianceTest_st  = 0;
uint32_t FeatureControlRegister_st    = 0;
uint32_t VersionUsed_st               = COAXPRESS_VER_1DOT1;
uint32_t ConnectionConfigDefault_st   = DEF_RATE;
uint8_t StreamIDSelect_st             = STREAM0;
uint8_t ResolutionSelect_st           = RESOLUTION_4K;
uint8_t resolution_en                 = 0;
uint8_t img1StreamID_st               = 0;
uint8_t imgNStreamID_st               = 1;

uint8_t sid0 = 0, sid1 = 1;

uint32_t calculate_coaxpress_crc32();

void delay(uint32_t tms)
{
    int i = 0;
    for(i = 0; i < 50000; i++);

}

void resolution_cxp_setting(uint32_t cxp_base_addr,uint8_t resolution[4])
{
    width_reg_st  = (resolution[1] << 8) | resolution[0];
    height_reg_st = (resolution[3] << 8) | resolution[2];

    *(volatile unsigned int *)(cxp_base_addr + CMD_DISP_YSIZE_ADDR)      = height_reg_st;//HEIGHT_MAX;
    *(volatile unsigned int *)(cxp_base_addr + CMD_DISP_XSIZE_ADDR)      = width_reg_st;//WIDTH_MAX;
    *(volatile unsigned int *)(cxp_base_addr + CMD_DISP_DSIZE_ADDR)      = width_reg_st/4;//WIDTH_MAX/4;
#if DUAL_STREAM_ENABLE
    *(volatile unsigned int *)(cxp_base_addr + CMD2_DISP_YSIZE_ADDR)     = height_reg_st;//HEIGHT_MAX;
    *(volatile unsigned int *)(cxp_base_addr + CMD2_DISP_XSIZE_ADDR)     = width_reg_st;//WIDTH_MAX;
    *(volatile unsigned int *)(cxp_base_addr + CMD2_DISP_DSIZE_ADDR)     = width_reg_st/4;//WIDTH_MAX/4;
#endif
}

void CoaxpressDeviceInit(uint32_t cxp_base_addr, uint8_t resolution[4])
{
    *(volatile unsigned int *)(cxp_base_addr + CMD_RATE_SEL_ADDR)      = 0x0;            // Low speed Upconnection Rate Select
    *(volatile unsigned int *)(cxp_base_addr + CMD_HB_EN_ADDR)         = 0x0;
    *(volatile unsigned int *)(cxp_base_addr + STREAM_EN)              = 0x0;            // Default Stop
	*(volatile unsigned int *)(cxp_base_addr + CMD_PIXEL_FORMAT_ADDR)  = BAYER_BG8;      // Default BayerRG8
    *(volatile unsigned int *)(cxp_base_addr + CMD_DISP_PSIZE_ADDR)    = 0x800 << 16 | sid0; //2k sdp packet, flags=0,sid =0

#if DUAL_STREAM_ENABLE
    //stream2
    *(volatile unsigned int *)(cxp_base_addr + STREAM2_EN)             = 0x0;            // Default Stop
    *(volatile unsigned int *)(cxp_base_addr + CMD2_PIXEL_FORMAT_ADDR) = BAYER_RG8;      // Default BayerRG8
    *(volatile unsigned int *)(cxp_base_addr + CMD2_DISP_PSIZE_ADDR)   = 0x800 << 16 | sid1 ; //2k sdp packet, flags=0,sid =1
#endif

    resolution_cxp_setting(cxp_base_addr,resolution);

    update_cxp_xcvr_uplink_speed(DEF_RATE);
}

void stream_enable(uint32_t cxp_base_addr)
{
    if (StreamIDSelect_st == STREAM0 || StreamIDSelect_st == STREAM1 || StreamIDSelect_st == DUAL_STREAM)
    {
        *(volatile unsigned int *)(cxp_base_addr + STREAM_EN)  = (StreamIDSelect_st & 0x1);        // stream Start
#if DUAL_STREAM_ENABLE
        *(volatile unsigned int *)(cxp_base_addr + STREAM2_EN) = (StreamIDSelect_st >> 1) & 0x1;
#endif
    }
}

void stream_disable(uint32_t cxp_base_addr)
{
    if (StreamIDSelect_st == STREAM0)
    {
        *(volatile unsigned int *)(cxp_base_addr + STREAM_EN)  = 0;        // stream Stop
    }
#if DUAL_STREAM_ENABLE
    else if (StreamIDSelect_st == STREAM1)
    {
        *(volatile unsigned int *)(cxp_base_addr + STREAM2_EN) = 0;        // stream Stop
    }
#endif
    else
    {
        *(volatile unsigned int *)(cxp_base_addr + STREAM_EN)  = 0;
#if DUAL_STREAM_ENABLE
        *(volatile unsigned int *)(cxp_base_addr + STREAM2_EN) = 0;
#endif
    }
}


void CoaxpressDeviceMain(uint32_t cxp_base_addr)
{

    uint8_t index;
    uint32_t num_loc;

	volatile uint32_t  *pkt_rx_add;
	pkt_rx_add = (uint32_t*)(cxp_base_addr + CMD_READ_ADDRESS);

    num_loc = *pkt_rx_add;

    delay(10);

    for(index=0; index<num_loc; index++)
    {
        rd_pkt[index+1] = *pkt_rx_add;

        delay(10);

        if (index == 1)
        {
        	control_cmd_tag_status = rd_pkt[2];
        }

    }

    delay(10);

    if (control_cmd_tag_status == CONTROL_CMD_WITHOUT_TAG)
    {
        control_cmd_read_write 	= rd_pkt[3] & 0xff000000;
        control_cmd_size 	 	= rd_pkt[3] & 0x00ffffff;
        control_cmd_address		= rd_pkt[4];
        control_cmd_data		= rd_pkt[5];
        count                   = 2;
    }
    else if (control_cmd_tag_status == CONTROL_CMD_WITH_TAG)
    {
    	control_cmd_tag         = rd_pkt[3];
        control_cmd_read_write 	= rd_pkt[4] & 0xff000000;
        control_cmd_size 	 	= rd_pkt[4] & 0x00ffffff;
        control_cmd_address		= rd_pkt[5];
        control_cmd_data		= rd_pkt[6];
        count                   = 3;
    }

	if(control_cmd_read_write == CONTROL_CMD_WRITE)
	{
		dataFromHostToDevice(control_cmd_address, control_cmd_data,cxp_base_addr);

		count = 0;
		sendPacketDataFromDevice(reply_acknowledge_cmd, count,cxp_base_addr);

		delay(10);

            if ((control_cmd_address == ConnectionConfig) && (reply_acknowledge_cmd == ACK_CMD_EXEC_OK_NO_APPEND_REPLY))
            {
                *(volatile unsigned int *)(cxp_base_addr + PKT_ORDER_RST_ADDRESS)  = 1;
                *(volatile unsigned int *)(cxp_base_addr + NUM_OF_CONN)  = control_cmd_data >> 16;
                control_cmd_data = control_cmd_data & 0xFF;
                update_cxp_xcvr_uplink_speed(control_cmd_data);
                delay(10);
                *(volatile unsigned int *)(cxp_base_addr + PKT_ORDER_RST_ADDRESS)  = 0;
            }

		reply_acknowledge_cmd = 0;
	}
	else if(control_cmd_read_write ==  CONTROL_CMD_READ)
	{
		count = dataFromDeviceToHost(control_cmd_size, control_cmd_address, count,cxp_base_addr);
		//sendPacketDataFromDevice(reply_acknowledge_cmd, count);
	}
}

/* packet data from Host to Device */
void dataFromHostToDevice(uint32_t bs_reg_address, uint32_t data,uint32_t cxp_base_addr)
{
    uint32_t num_con=0;
    uint8_t dl_rate=0;

    switch(bs_reg_address)
    {
		case Standard:
		case Revision:
		case XmlManifestSize:
		case XmlVersion:
		case XmlSchemaVersion:
		case XmlUrlAddress:
		case Iidc2Address:
		case DeviceVendorName:
		case DeviceModelName:
		case DeviceManufacturerInfo:
		case DeviceVersion:
		case DeviceSerialNumber:
		case AcquisitionModeAddress:
		case ControlPacketSizeMax:
		case ConnectionConfigDefault:
		case VersionsSupported:
		case CapabilityRegister:
		case DeviceConnectionID:
		{
			reply_acknowledge_cmd = ACK_CMD_WRITE_ATTEMPT_TO_READONLY_ADDRESS;
		}
		break;

		case XmlManifestSelector:
		{
			if (data == 0x0)
			{
				XmlManifestSelector_st = data;
				reply_acknowledge_cmd  = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			}
			else
			{
				reply_acknowledge_cmd  = ACK_CMD_INVALID_DATA_FOR_ADDRESS;
			}
		}
		break;

#if 0  //for future release
		case DeviceUserID:
		{
			DeviceUserID_st       = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;
#endif

		case ConnectionReset:
		{
			if (data == 0x1)
			{

				stream_disable(cxp_base_addr);

				update_cxp_xcvr_uplink_speed(DEF_RATE);

				VersionUsed_st = COAXPRESS_VER_2DOT0;//COAXPRESS_VER_1DOT1;
				*(volatile unsigned int *)(cxp_base_addr + CMD_HB_ID_ADDR) = data;
				ConnectionConfig_st 		 = (NUM_CONNECTIONS <<16) | DEF_RATE;
				MasterHostConnectionID_st	 = 0;
				StreamPacketSizeMax_st 		 = 0;
				TestMode_st 				 = 0;
				TestErrorCountSelector_st 	 = 0;
				TestErrorCount_st			 = 0;
				TestPacketCountTx_st 		 = 0;
				TestPacketCountRx_st 		 = 0;
				ElectricalComplianceTest_st  = 0;
				FeatureControlRegister_st 	 = 0;
				ConnectionReset_st  		 = 0;
				XmlManifestSelector_st 		 = 0;
				reply_acknowledge_cmd        = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			}
			else
			{
				reply_acknowledge_cmd = ACK_CMD_INVALID_CONTROL_OPERATION;
			}
		}
		break;

		case StreamPacketSizeMax: //in bytes
		{
		    if (data > STRM_MAX_SZ)
		        data = STRM_MAX_SZ;//limit to STRM_MAX_SZ
			StreamPacketSizeMax_st = data;
			*(volatile unsigned int *)(cxp_base_addr + CMD_DISP_PSIZE_ADDR)  = data << 16 | sid0; //flags=0,sid =0
#if DUAL_STREAM_ENABLE
			*(volatile unsigned int *)(cxp_base_addr + CMD2_DISP_PSIZE_ADDR) = data << 16 | sid1; //flags=0,sid =1
#endif
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;

		case ConnectionConfig:
		{
			dl_rate = data & 0xff ;
			num_con = data >> 16 ;

			if ((dl_rate == RATE_1DOT25G || dl_rate == RATE_2DOT5G || dl_rate == RATE_3DOT125G || dl_rate == RATE_5DOT0G || dl_rate == RATE_6DOT25G || dl_rate == RATE_10DOT0G || dl_rate == RATE_12DOT5G))// && (num_con < 2))  //need to check (num_con < 2) condition
			{
				ConnectionConfig_st = data;
				reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			}
			else
			{
				reply_acknowledge_cmd = ACK_CMD_INVALID_DATA_FOR_ADDRESS;
			}
		}
		break;

		case MasterHostConnectionID:
		{
			MasterHostConnectionID_st = data;
            *(volatile unsigned int *)(cxp_base_addr + HOST_CONN_ID) = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			*(volatile unsigned int *)(cxp_base_addr + CMD_HB_ID_ADDR) = data;
		}
		break;

		case VersionUsed:
		{
			if ((data == 0x00010001) || (data == 0x00020000))
			{
				VersionUsed_st = data;
				reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			}
			else
			{
				reply_acknowledge_cmd = ACK_CMD_INVALID_DATA_FOR_ADDRESS;
			}
		}
		break;

        case IMG1StreamIDReg:
        {
            img1StreamID_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
        }
        break;

        case IMGNStreamIDReg:
        {
            imgNStreamID_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
        }
        break;

        case StreamIDSelectReg:
        {
            StreamIDSelect_st = data;

            //Stop Streaming, wait for acquisition start to start video streaming
            if (StreamIDSelect_st == STREAM0 || StreamIDSelect_st == STREAM1 || StreamIDSelect_st == DUAL_STREAM)
            {
                stream_disable(cxp_base_addr);
                reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            }
            else
            {
                reply_acknowledge_cmd = ACK_CMD_INVALID_CONTROL_OPERATION;
            }
        }
        break;

		case AcquisitionStartReg:
		{
		    //start acquisition
		    if (StreamIDSelect_st == STREAM0 || StreamIDSelect_st == STREAM1 || StreamIDSelect_st == DUAL_STREAM)
			{
		        stream_enable(cxp_base_addr);

				reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			}
			else
			{
				reply_acknowledge_cmd = ACK_CMD_INVALID_CONTROL_OPERATION;
			}
		}
		break;

		case AcquisitionStopReg:
		{
			//stop acquisition
		    stream_disable(cxp_base_addr);
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;

        case AcquisitionFrameRateMaxReg:
        {
            AcquisitionFrameRateMax_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
        }
        break;
        
		case PatternReg:
		{
			//pattern change
			Pattern_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			pattern_en = 1;
		}
		break;
		
		case GainReg:
		{
			//gain change
			Gain_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			gain_en = 1;
		}
		break;

		case RgainReg:
		{
			//gain change
			RGain_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			RGBgain_en = 1;
		}
		break;

		case GgainReg:
		{
			//gain change
			GGain_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			RGBgain_en = 1;
		}
		break;

		case BgainReg:
		{
			//gain change
			BGain_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			RGBgain_en = 1;
		}
		break;

		case TLPLockReg:
		{
			TLP_lock_st = data & 0x1;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;
		
        case ReverseXReg:
        {
            //horizontal flip
            ReverseX_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            reversex_en = 1;
        }
        break;

        case ReverseYReg:
        {
            //vertical flip
            ReverseY_st           = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            reversey_en = 1;
        }
        break;

#if 0
        case OffsetXReg:
        {
            offsetx_reg_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            offsetx_en = 1;
        }
        break;

        case OffsetYReg:
        {
            offsety_reg_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            offsety_en = 1;
        }
        break;
#endif

        case WidthReg:
		{
			width_reg_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            width_en = 1;
		}
		break;

		case HeightReg:
		{
			height_reg_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			height_en = 1;
		}
		break;
		
		case WidthMaxReg:
		{
			width_max_reg_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;
		
		case HeightMaxReg:
		{
			height_max_reg_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;

        case ResolutionSelectReg:
        {
            ResolutionSelect_st   = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            resolution_en = 1;
        }
        break;
#if 0
		case SensorWidthReg:
		{
			sensor_width_reg_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;
		
		case SensorHeightReg:
		{
			sensor_height_reg_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
		}
		break;
#endif

		case PixelFormatReg:
		{

			PixelFormat_st = data;
			reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
			*(volatile unsigned int *)(cxp_base_addr + CMD_PIXEL_FORMAT_ADDR)  = data;
#if DUAL_STREAM_ENABLE
			*(volatile unsigned int *)(cxp_base_addr + CMD2_PIXEL_FORMAT_ADDR) = data;
#endif			
		}
		break;

		case TestMode:
        {
            TestMode_st = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            *(volatile unsigned int *)(cxp_base_addr + TestModeReg) = TestMode_st;
        }
        break;

		case TestErrorCount:
        {
            TestErrorCount_st     = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            *(volatile unsigned int *)(cxp_base_addr + TestErrorCountReg) = TestErrorCount_st;
        }
        break;

		case TestPacketCountTx:
        {
            TestPacketCountTx_st  = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            *(volatile unsigned int *)(cxp_base_addr + TestPacketCountTxReg) = TestPacketCountTx_st;
        }
        break;

		case TestPacketCountRx:
        {
            TestPacketCountRx_st  = data;
            reply_acknowledge_cmd = ACK_CMD_EXEC_OK_NO_APPEND_REPLY;
            *(volatile unsigned int *)(cxp_base_addr + TestPacketCountRxReg) = TestPacketCountRx_st;
        }
        break;

		default :
		{
			reply_acknowledge_cmd = ACK_CMD_WRITE_ATTEMPT_TO_READONLY_ADDRESS;
		}
        break;

    }
}

/* packet data from Device to Host */
uint32_t dataFromDeviceToHost(uint32_t resp_size, uint32_t bs_reg_address, uint32_t count_new, uint32_t cxp_base_addr)
{
    volatile uint32_t *pkt_ack_write1_add;

    uint32_t index=0;
    uint32_t index1=0;
    uint32_t index2=0;
    uint32_t address;
    uint32_t buf_cnt=0;
    uint32_t rem_val=0;
    uint32_t crc_value=0;

    pkt_ack_write1_add = (uint32_t *)(cxp_base_addr + CMD_WRITE_ADDRESS);

    resp_size = resp_size & 0xFFFFFF ;

    count = 0;
    //count = count_new;

#if 1
    crc_buffer[count++] = START_OF_THE_PACKET;

    if (control_cmd_tag_status == CONTROL_CMD_WITHOUT_TAG)
    {
        crc_buffer[count++] = CONTROL_ACK_WITHOUT_TAG;
    }
    else
    {
        crc_buffer[count++] = CONTROL_ACK_WITH_TAG;
        crc_buffer[count++] = control_cmd_tag;
    }
#endif

    crc_buffer[count++] = ACK_CMD_EXEC_OK_APPEND_REPLY;   //Final, command executed OK, reply data is appended (Table 25)

    crc_buffer[count++] = resp_size;

    delay(10);


    if ((bs_reg_address & 0xfffff000) == XML_ADD) // â€œLocal: xml_mchp_desc.xml;8100;C00?SchemaVersion=1.0.0â€
    {
    	address = (bs_reg_address & 0x0fff);
		for (index1=0; index1<resp_size; index1=index1+4)
		{
			index2 = address + index1;
			if(index2 < 128)
				crc_buffer[count++] = (xml_location[index2]<<24) | (xml_location[index2+1]<<16) | (xml_location[index2+2] << 8) | xml_location[index2+3];
			else
				crc_buffer[count++] = 0;
		}

        delay(10);
    }
    else if ((bs_reg_address >= XML_REQ) && (bs_reg_address < (XML_REQ+XML_ZIP_SIZE)))
    {
        address = bs_reg_address - XML_REQ;
        for (index1=0; index1<resp_size; index1=index1+4)
        {
            index2 = address + index1;
            crc_buffer[count++] = (camera_desc_file[index2]<<24) | (camera_desc_file[index2+1]<<16) | (camera_desc_file[index2+2] << 8) | camera_desc_file[index2+3];
        }
    }
    else
    {
    	index = 4;  //for all the single count crc_buffer save
        switch(bs_reg_address)
        {
            case Standard:
            {
                crc_buffer[count++] = COAXPRESS_STANDARD;
            }
            break;

            case Revision: //v2.0
            {
                crc_buffer[count++] = COAXPRESS_VER_2DOT0;
            }
            break;

            case XmlManifestSize: // 1 file
            {
                crc_buffer[count++] = 0x1;
            }
            break;

            case XmlManifestSelector:  // 0 to XmlManifestSize-1
            {
                crc_buffer[count++] = XmlManifestSelector_st;
            }
            break;

            case XmlVersion:  // v2.5 subver 2
            {
                crc_buffer[count++] = COAXPRESS_VER_2DOT5_SUBVER2;
            }
            break;

            case XmlSchemaVersion:  // v1.1 subver 0
            {
                crc_buffer[count++] = COAXPRESS_VER_1DOT1_SUBVER0;
            }
            break;

            case XmlUrlAddress:  // none as of now
            {
                crc_buffer[count++] = XML_ADD;
            }
            break;

            case Iidc2Address:  // For Devices that do not support IIDC2, this register shall be set to the value 0x00000000.
            {
                crc_buffer[count++] = 0x0;
            }
            break;

            case DeviceVendorName:
            {
                char vnm[12] = "Microchip";
                index = 0;
                crc_buffer[count++] = (vnm[0] << 24)|(vnm[1] << 16)|(vnm[2] << 8)|vnm[3];
                index += 4;
                crc_buffer[count++] = (vnm[4] << 24)|(vnm[5] << 16)|(vnm[6] << 8)|vnm[7];
                index += 4;
                crc_buffer[count++] = (vnm[8] << 24)|(0 << 16)|(0 << 8)|0;
                index += 4;
            }
            break;

            case DeviceModelName:
            {
                char vnm[8] = "MCHPCXP";
                index = 0;
                crc_buffer[count++] = (vnm[0] << 24)|(vnm[1] << 16)|(vnm[2] << 8)|vnm[3];
                index += 4;
                crc_buffer[count++] = (vnm[4] << 24)|(vnm[5] << 16)|(vnm[6] << 8)|0;
                index += 4;
            }
            break;

            case DeviceManufacturerInfo:
            {
                char vnm[5] = "MCHP";
                index = 0;
                crc_buffer[count++] = (vnm[0] << 24)|(vnm[1] << 16)|(vnm[2] << 8)|vnm[3];
                index += 4;
            }
            break;

            case DeviceVersion:
            {
                char vnm[5] = "1.0";
                index = 0;
                crc_buffer[count++] = (vnm[0] << 24)|(vnm[1] << 16)|(vnm[2] << 8)|0;
                index += 4;
            }
            break;

            case DeviceSerialNumber:
            {
                crc_buffer[count++] = 0x1111;   //dummy, later give exact number
            }
            break;

#if 0  //for future release
            case DeviceUserID:
            {
                crc_buffer[count++] = DeviceUserID_st;
            }
            break;
#endif

            case WidthAddress:
            {
                crc_buffer[count++] = WidthReg;
            }
            break;

            case HeightAddress:
            {
                crc_buffer[count++] = HeightReg;
            }
            break;

            case AcquisitionModeAddress:
            {
                crc_buffer[count++] = AcquisitionModeReg;
            }
            break;

            case AcquisitionStartAddress:
            {
                crc_buffer[count++] = AcquisitionStartReg;
            }
            break;

            case AcquisitionStopAddress:
            {
                crc_buffer[count++] = AcquisitionStopReg;
            }
            break;

            case PixelFormatAddress:
            {
                crc_buffer[count++] = PixelFormatReg;
            }
            break;

            case DeviceTapGeometryAddress:
            {
                crc_buffer[count++] = DeviceTapGeometryReg;
            }
            break;

            case Image1StreamIDAddress:
            {
                crc_buffer[count++] = IMG1StreamIDReg;
            }
            break;

            case ImagenStreamIDAddress:
            {
                crc_buffer[count++] = IMGNStreamIDReg;
            }
            break;

            case ConnectionReset:
            {
                crc_buffer[count++] = ConnectionReset_st;
            }
            break;

            case DeviceConnectionID:
            {
                crc_buffer[count++] = 0;
            }
            break;

            case MasterHostConnectionID:
            {
                crc_buffer[count++] = MasterHostConnectionID_st;
            }
            break;

            case ControlPacketSizeMax:
            {
                crc_buffer[count++] = ControlPacketSizeMax_st;
            }
            break;

            case StreamPacketSizeMax:
            {
                crc_buffer[count++] = StreamPacketSizeMax_st;
            }
            break;
            
            case VersionsSupported:
            {
                crc_buffer[count++] = COAXPRESS_VERBIT_1DOT1_2DOT0;//COAXPRESS_VERBIT_1DOT1;
            }
            break;

            case VersionUsed:
            {
                crc_buffer[count++] = VersionUsed_st;
            }
            break;

            case ConnectionConfig:
            {
            	crc_buffer[count++] = ConnectionConfig_st;//(NUM_CONNECTIONS <<16) | NEW_RATE;
            }
            break;

            case ConnectionConfigDefault:
            {
            	crc_buffer[count++] = (NUM_CONNECTIONS <<16) | NEW_RATE;
            }
            break;

            case TestMode:
            {
				TestMode_st         = *(volatile unsigned int *)(cxp_base_addr + TestModeReg);
                crc_buffer[count++] = TestMode_st;
            }
            break;

            case TestErrorCount:
            {
				TestErrorCount_st   = *(volatile unsigned int *)(cxp_base_addr + TestErrorCountReg);
                crc_buffer[count++] = TestErrorCount_st;
            }
            break;

            case TestPacketCountTx:
            {
            	TestPacketCountTx_st = *(volatile unsigned int *)(cxp_base_addr + TestPacketCountTxReg);
                crc_buffer[count++]  = TestPacketCountTx_st;
            }
            break;

            case TestPacketCountRx:
            {
            	TestPacketCountRx_st = *(volatile unsigned int *)(cxp_base_addr + TestPacketCountRxReg);
                crc_buffer[count++]  = TestPacketCountRx_st;
            }
            break;

            case Start_of_manufacturer_specific_register_space:
            {
                crc_buffer[count++] = 0;
            }
            break;

            case TLPLockReg:
            {
                crc_buffer[count++] = (TLP_lock_st & 0x1);
            }
            break;
#if 0
            case OffsetXReg:
            {
                crc_buffer[count++] = offsetx_reg_st;
            }
            break;

            case OffsetYReg:
            {
                crc_buffer[count++] = offsety_reg_st;
            }
            break;
#endif
            case WidthReg:
            {
                crc_buffer[count++] = width_reg_st;
            }
            break;

            case HeightReg:
            {
                crc_buffer[count++] = height_reg_st;
            }
            break;

            case WidthMaxReg:
            {
                crc_buffer[count++] = width_max_reg_st;
            }
            break;

            case HeightMaxReg:
            {
                crc_buffer[count++] = height_max_reg_st;
            }
            break;

            case ResolutionSelectReg:
            {
                crc_buffer[count++] = ResolutionSelect_st;    //default select 4K Resolution
            }
            break;

#if 0
            case SensorWidthReg:
            {
                crc_buffer[count++] = sensor_width_reg_st;
            }
            break;

            case SensorHeightReg:
            {
                crc_buffer[count++] = sensor_height_reg_st;
            }
            break;
#endif

            case PixelFormatReg:
            {
                crc_buffer[count++] = PixelFormat_st;
            }
            break;

            case AcquisitionModeReg:
            {
                crc_buffer[count++] = AcquisitionMode_st;
            }
            break;

            case AcquisitionFrameRateMaxReg:
            {
                crc_buffer[count++] = AcquisitionFrameRateMax_st;
            }
            break;

            case StreamIDSelectReg:
            {
                crc_buffer[count++] = StreamIDSelect_st;    //default select stream 0
            }
            break;

            case IMG1StreamIDReg:
            {
                crc_buffer[count++] = img1StreamID_st;//0x0;
            }
            break;

            case IMGNStreamIDReg:
            {
                crc_buffer[count++] = imgNStreamID_st;//0x1;
            }
            break;

            case DeviceTapGeometryReg:
            {
                crc_buffer[count++] = 0x0;
            }
            break;

            case ReverseXReg:
            {
                crc_buffer[count++] = ReverseX_st;
            }
            break;

            case ReverseYReg:
            {
                crc_buffer[count++] = ReverseY_st;
            }
            break;

            case PatternReg:
            {
                crc_buffer[count++] = Pattern_st;
            }
            break;

            case GainReg:
            {
                crc_buffer[count++] = Gain_st;
            }
            break;

            case RgainReg:
            {
                crc_buffer[count++] = RGain_st;
            }
            break;

            case GgainReg:
            {
                crc_buffer[count++] = GGain_st;
            }
            break;

            case BgainReg:
            {
                crc_buffer[count++] = BGain_st;
            }
            break;

            default:
            {
                crc_buffer[count++] = 0;
            }
			break;
        }

        if (resp_size > 0x4)
        {
            for (; index<resp_size; index=index+4)
            {
                crc_buffer[count++] = 0;
            }
        }

    }

    crc_value = calculate_coaxpress_crc32();

    for (index2=0; index2<count; index2=index2+1)
    {
        *pkt_ack_write1_add = crc_buffer[index2];
    }

    *pkt_ack_write1_add = crc_value;
    *pkt_ack_write1_add = END_OF_THE_PACKET;

    reply_acknowledge_cmd = crc_value;

    return count;
}


void sendPacketDataFromDevice(uint32_t ack_code, uint32_t count_new, uint32_t cxp_base_addr)
{
    volatile uint32_t  *pkt_ack_write1_add;

    uint32_t rem_val, buf_cnt;

    pkt_ack_write1_add = (uint32_t *)(cxp_base_addr + CMD_WRITE_ADDRESS);

    count = 0;

    crc_buffer[count++] = START_OF_THE_PACKET;

    if (control_cmd_tag_status == CONTROL_CMD_WITHOUT_TAG)
    {
        crc_buffer[count++] = CONTROL_ACK_WITHOUT_TAG;
    }
    else
    {
        crc_buffer[count++] = CONTROL_ACK_WITH_TAG;
        crc_buffer[count++] = control_cmd_tag;
    }

    if(count_new > 0)
    {
    	count = count_new;
    }

    crc_buffer[count++] = ack_code;
    crc_buffer[count++] = END_OF_THE_PACKET;

    for (uint32_t index=0; index<count; index=index+1)
    {
        *pkt_ack_write1_add = crc_buffer[index];
    }
}

uint32_t swap_msb_lsb_8bit(uint32_t input_32bit)
{
    unsigned char data_char[4];
    unsigned char swap_data_char[4];

    for (unsigned char i = 0; i < 4; i++)
    {
        data_char[i] = (input_32bit >> i * 8) & 0xff;
        swap_data_char[i] = ((data_char[i] & 1) << 7) | ((data_char[i] & 2) << 5) | ((data_char[i] & 4) << 3) | ((data_char[i] & 8) << 1) | ((data_char[i] & 16) >> 1) | ((data_char[i] & 32) >> 3) | ((data_char[i] & 64) >> 5) | ((data_char[i] & 128) >> 7);
    }

    input_32bit = (swap_data_char[3] << 24) | (swap_data_char[2] << 16) | (swap_data_char[1] << 8) | swap_data_char[0];

    return input_32bit;
}

//Coaxpress Crc Calculation
uint32_t calculate_coaxpress_crc32()
{
    uint32_t crc_count;
    uint32_t crc_in, crc_out = 0xffffffff;
    uint32_t len, index;
    unsigned char buf[4];
    unsigned char crc_index = 2;   //crc_index 0 - start of the packet, 1 - command without tag

    crc_count = count - crc_index;

    for (unsigned char i = 0; i < crc_count; i++)
    {
        index = 4;

        crc_in = swap_msb_lsb_8bit(crc_buffer[crc_index]);

        buf[0] = crc_in & 0xff;
        buf[1] = (crc_in >> 8) & 0xff;
        buf[2] = (crc_in >> 16) & 0xff;
        buf[3] = (crc_in >> 24) & 0xff;

        while (index--)
        {
            crc_out = (crc_out << 8) ^ crc32_table[((crc_out >> 24) ^ buf[index]) & 255];

        }
        crc_index++;
    }

    crc_out = swap_msb_lsb_8bit(crc_out);

    return crc_out;
}
