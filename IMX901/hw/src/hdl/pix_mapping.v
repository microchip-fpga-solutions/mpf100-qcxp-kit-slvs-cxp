///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: pix_mapping.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::PolarFire> <Die::MPF100T> <Package::FCG484>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>

module pix_mapping( 

input [159:0] din,
output [127:0] dout
);

assign dout = {din[159:152], din[149:142],din[139:132], din[129:122],din[119:112], din[109:102], 
               din[99:92], din[89:82],din[79:72], din[69:62],din[59:52], din[49:42],
               din[39:32], din[29:22],din[19:12], din[9:2]};
endmodule

