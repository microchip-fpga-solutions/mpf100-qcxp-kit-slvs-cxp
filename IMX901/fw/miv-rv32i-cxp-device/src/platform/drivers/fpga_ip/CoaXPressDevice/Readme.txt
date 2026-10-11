*********************************************************************************************************************************
CoaXPressDevice Driver Release Notes
*********************************************************************************************************************************
Driver Name : CoaXPressDevice
*********************************************************************************************************************************
*********************************************************************************************************************************
Version No : 1.0.0
*********************************************************************************************************************************
*********************************************************************************************************************************
 
Notes:


*********************************************************************************************************************************
*********************************************************************************************************************************
Introduction:

CoaXPressDevice Driver has the modules for communicating between CoaXPress Device and Different Frame Grabbers

*********************************************************************************************************************************
*********************************************************************************************************************************

Additional Information:

Camera XML is in zipped format. 
Camera xml zipped file is converted into hex data using open source tool https://hexed.it/

*********************************************************************************************************************************
*********************************************************************************************************************************

Modules:


1. void dataFromHostToDevice(uint32_t bs_reg_address, uint32_t data)

Arguments:

uint32_t bs_reg_address	 		- address of the register from host 
uint32_t data					- data from host

Purpose:
dataFromHostToDevice() is used to Read Data received from Host to Device.

Example:
Reading CoaXPress ConnectionReset address and data from Host.


2. uint32_t dataFromDeviceToHost(uint32_t resp_size, uint32_t bs_reg_address, uint32_t count);

Arguments:

uint32_t resp_size				- size of the response packet
uint32_t bs_reg_address	 		- address of the register from host 
uint32_t count					- size of the packet data

Purpose:
dataFromDeviceToHost() is used to send the reply packet data or acknowledgement packet data from device to Host.

Example:
Sending CoaXPress Standard information packet from Device.