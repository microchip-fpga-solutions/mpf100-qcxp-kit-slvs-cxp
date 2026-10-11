/*
 File Name        : word_alignment.v  

 Description     : Aligns an incoming data stream to the required word boundary.
 
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

module word_alignment
(
 input CLK_I,
 input RESETN_I,
 input [31:0] Data_I,
 input [3:0] K_CHAR_I,
 output reg [31:0] Data_o,
 output reg [3:0] K_CHAR_o
);


//--------------------

always@(posedge CLK_I or negedge RESETN_I)
begin
  if(!RESETN_I)
  begin
    Data_o <= 0;
    K_CHAR_o <= 0;
  end
  else
  begin
    Data_o <= {Data_I[7:0],Data_I[15:8],Data_I[23:16],Data_I[31:24]};
    K_CHAR_o <= {K_CHAR_I[0],K_CHAR_I[1],K_CHAR_I[2],K_CHAR_I[3]};
  end

end



endmodule

