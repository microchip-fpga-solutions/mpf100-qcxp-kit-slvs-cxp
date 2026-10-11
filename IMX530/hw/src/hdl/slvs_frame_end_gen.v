/* File Name        : slvs_frame_end_gen.v  

 Description     : Generates a frame-end indication for an SLVS image-data stream. The module monitors the incoming frame and line synchronization signals.
 
 Targeted device : Microchip FPGAs.
 
 Author          : Solutions Team.
 
 © [2026] Microchip Technology Inc. and its subsidiaries


 Subject to your compliance with the terms and conditions of the license agreement accompanying 
 this software, you may use this Microchip software and any derivatives exclusively with Microchip products. 
 You are responsible for complying with third party license terms applicable to your use of 
 third party software (including open source software) that may accompany this Microchip software. 
 SOFTWARE IS “AS IS.” NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, OR FITNESS FOR A PARTICULAR PURPOSE.
 IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, 
 COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED 
 OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP’S TOTAL LIABILITY 
 ON ALL CLAIMS RELATED TO THE SOFTWARE WILL NOT EXCEED AMOUNT OF FEES, IF ANY, YOU PAID DIRECTLY TO MICROCHIP FOR THIS 
 SOFTWARE.
***************************************************************************************************************************/

module slvs_frame_end_gen( 

 input clk_i,
 input resetn_i,
 input frame_valid_i,
 input line_valid_i,
 input [15:0] hres_i,
 input [15:0] vres_i,
 output reg frame_end_o,
 output line_valid_o
 );
 
localparam LOG_PW = 4; //128,  5 for 256
 
reg [15:0] h_cnt;
reg [15:0] v_cnt;
reg [ 3:0] cnt;
reg        line_valid_r;
wire       line_valid_fe;
reg        frame_end_r;
wire       frame_end_fe;//re

assign frame_end_fe = frame_valid_i & (~frame_end_r);

always@(posedge clk_i, negedge resetn_i)
  if (!resetn_i)
  begin
    frame_end_r <= 0;
    frame_end_o <= 0;
  end
  else
  begin
    frame_end_r <= frame_valid_i;
    if(frame_end_fe  == 1 || cnt != 0 )
      cnt       <= cnt + 1;
      
    if (cnt == 15)
      frame_end_o <= 1;
    else
      frame_end_o <= 0;
  end      

assign line_valid_fe = ~line_valid_i & line_valid_r;
assign line_valid_o  = (h_cnt < (hres_i[15:LOG_PW]) && v_cnt < vres_i) ? line_valid_i : 0 ; // hres/32 for 256-bit

always@(posedge clk_i, negedge resetn_i)
  if (!resetn_i)
  begin
    line_valid_r <= 0;
    h_cnt        <= 0;
    v_cnt        <= 0;
  end
  else
  begin
    line_valid_r <= line_valid_i;
    if (line_valid_i)
      h_cnt      <= h_cnt + 1;
    else
      h_cnt      <= 0;
    
    if (line_valid_fe)
      v_cnt      <= v_cnt + 1;
    else if (frame_end_fe == 1)
      v_cnt      <= 0;
  end    
       
endmodule

