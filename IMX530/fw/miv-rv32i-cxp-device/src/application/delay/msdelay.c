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

//#include "sys_config_mss_clocks.h"
//#include "mss_timer/mss_timer.h"

#include "miv_rv32_hal/miv_rv32_hal.h"

void msdelay(uint32_t tms)
{
	int i = 0;
	for(i = 0; i < 50000; i++);


}
