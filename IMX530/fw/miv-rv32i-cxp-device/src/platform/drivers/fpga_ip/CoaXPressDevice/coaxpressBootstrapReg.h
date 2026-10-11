/*-------------------------------------------------------------------------------------------------
--
-- File Name    : coaxpressBootstrapReg.h



-- Description  : This module replicates the CoaXPress Device Bootstrap Registers definitions.




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

#ifndef BS_REG_H
#define BS_REG_H
enum bs_reg
{

        Standard                 = 0x00000000,
        Revision                 = 0x00000004,
        XmlManifestSize          = 0x00000008,
        XmlManifestSelector      = 0x0000000C,
        XmlVersion               = 0x00000010,
        XmlSchemaVersion         = 0x00000014,
        XmlUrlAddress            = 0x00000018,
        Iidc2Address             = 0x0000001C,

        DeviceVendorName         = 0x00002000,
        DeviceModelName          = 0x00002020,
        DeviceManufacturerInfo   = 0x00002040,
        DeviceVersion            = 0x00002070,
        DeviceSerialNumber       = 0x000020B0,
        DeviceUserID             = 0x000020C0,

        WidthAddress             = 0x00003000,
        HeightAddress            = 0x00003004,
        AcquisitionModeAddress   = 0x00003008,
        AcquisitionStartAddress  = 0x0000300C,
        AcquisitionStopAddress   = 0x00003010,
        PixelFormatAddress       = 0x00003014,
        DeviceTapGeometryAddress = 0x00003018,
        Image1StreamIDAddress    = 0x0000301C,
        ImagenStreamIDAddress    = 0x00003020,

        ConnectionReset          = 0x00004000,
        DeviceConnectionID       = 0x00004004,
        MasterHostConnectionID   = 0x00004008,
        ControlPacketSizeMax     = 0x0000400C,
        StreamPacketSizeMax      = 0x00004010,
        ConnectionConfig         = 0x00004014,
        ConnectionConfigDefault  = 0x00004018,
        TestMode                 = 0x0000401C,
        TestErrorCountSelector   = 0x00004020,
        TestErrorCount           = 0x00004024,
        TestPacketCountTx        = 0x00004028,
        TestPacketCountRx        = 0x00004030,
        ElectricalComplianceTest = 0x00004038,
        CapabilityRegister       = 0x0000403C,
        FeatureControlRegister   = 0x00004040,
        VersionsSupported        = 0x00004044,
        VersionUsed              = 0x00004048,

        LinkSharingStatus                = 0x0000404C,
        LinkSharingHorizontalStripeCount = 0x00004050,
        LinkSharingVerticalStripeCount   = 0x00004054,
        LinkSharingHorizontalOverlap     = 0x00004058,
        LinkSharingVerticalOverlap       = 0x0000405C,
        LinkSharingDuplicateStripe       = 0x00004060,

};

#endif /* BS_REG_H */


