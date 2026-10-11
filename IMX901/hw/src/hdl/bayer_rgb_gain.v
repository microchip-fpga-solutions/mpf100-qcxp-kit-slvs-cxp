/*
 File Name        : bayer_rgb_gain.v  

 Description     : Applies independent programmable gain correction to the R, G, and B components of a raw Bayer image stream. The Bayer color of each pixel is determined from the pixel row and column coordinates. 
 
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

module bayer_rgb_gain #(
    parameter DATA_WIDTH  = 8,
    parameter GAIN_WIDTH  = 8,
    parameter GAIN_FRAC   = 6,
    parameter NUM_PIXELS  = 16
)(
    input  wire                              clk,
    input  wire                              rst_n,

    input  wire                              enable,
    input  wire                              gamma_enable,
    input  wire                              frame_start,
    input  wire                              line_valid,
    input  wire [NUM_PIXELS*DATA_WIDTH-1:0]  data_in,

    input  wire [GAIN_WIDTH-1:0]             gain_r,
    input  wire [GAIN_WIDTH-1:0]             gain_g,
    input  wire [GAIN_WIDTH-1:0]             gain_b,

    output reg                               frame_start_out,
    output reg                               line_valid_out,
    output reg  [NUM_PIXELS*DATA_WIDTH-1:0]  data_out
);

    reg                              frame_start_d;
    reg                              frame_start_d2;
    reg                              line_valid_d;
    reg                              line_valid_d2;
    reg                              row_odd;
    reg                              enable_d;
    reg                              enable_d2;
    reg                              gamma_enable_d;

    wire                             line_end;

    wire [GAIN_WIDTH-1:0]            gain_sel      [0:NUM_PIXELS-1];
    wire [DATA_WIDTH+GAIN_WIDTH-1:0] data_mult     [0:NUM_PIXELS-1];
    wire [DATA_WIDTH-1:0]            data_gained   [0:NUM_PIXELS-1];
    reg  [DATA_WIDTH-1:0]            data_d        [0:NUM_PIXELS-1];
    reg  [DATA_WIDTH-1:0]            data_bypass   [0:NUM_PIXELS-1];
    reg  [DATA_WIDTH-1:0]            data_gamma    [0:NUM_PIXELS-1];
    reg  [DATA_WIDTH-1:0]            data_bypass_d [0:NUM_PIXELS-1];

    function [7:0] gamma_lut;
        input [7:0] addr;
        begin
            case (addr)
                8'd0:   gamma_lut = 8'h00;
                8'd1:   gamma_lut = 8'h15;
                8'd2:   gamma_lut = 8'h1C;
                8'd3:   gamma_lut = 8'h22;
                8'd4:   gamma_lut = 8'h27;
                8'd5:   gamma_lut = 8'h2B;
                8'd6:   gamma_lut = 8'h2F;
                8'd7:   gamma_lut = 8'h32;
                8'd8:   gamma_lut = 8'h35;
                8'd9:   gamma_lut = 8'h38;
                8'd10:  gamma_lut = 8'h3B;
                8'd11:  gamma_lut = 8'h3D;
                8'd12:  gamma_lut = 8'h40;
                8'd13:  gamma_lut = 8'h42;
                8'd14:  gamma_lut = 8'h44;
                8'd15:  gamma_lut = 8'h47;
                8'd16:  gamma_lut = 8'h49;
                8'd17:  gamma_lut = 8'h4B;
                8'd18:  gamma_lut = 8'h4D;
                8'd19:  gamma_lut = 8'h4F;
                8'd20:  gamma_lut = 8'h50;
                8'd21:  gamma_lut = 8'h52;
                8'd22:  gamma_lut = 8'h54;
                8'd23:  gamma_lut = 8'h56;
                8'd24:  gamma_lut = 8'h57;
                8'd25:  gamma_lut = 8'h59;
                8'd26:  gamma_lut = 8'h5B;
                8'd27:  gamma_lut = 8'h5C;
                8'd28:  gamma_lut = 8'h5E;
                8'd29:  gamma_lut = 8'h5F;
                8'd30:  gamma_lut = 8'h61;
                8'd31:  gamma_lut = 8'h62;
                8'd32:  gamma_lut = 8'h64;
                8'd33:  gamma_lut = 8'h65;
                8'd34:  gamma_lut = 8'h66;
                8'd35:  gamma_lut = 8'h68;
                8'd36:  gamma_lut = 8'h69;
                8'd37:  gamma_lut = 8'h6A;
                8'd38:  gamma_lut = 8'h6C;
                8'd39:  gamma_lut = 8'h6D;
                8'd40:  gamma_lut = 8'h6E;
                8'd41:  gamma_lut = 8'h6F;
                8'd42:  gamma_lut = 8'h71;
                8'd43:  gamma_lut = 8'h72;
                8'd44:  gamma_lut = 8'h73;
                8'd45:  gamma_lut = 8'h74;
                8'd46:  gamma_lut = 8'h75;
                8'd47:  gamma_lut = 8'h77;
                8'd48:  gamma_lut = 8'h78;
                8'd49:  gamma_lut = 8'h79;
                8'd50:  gamma_lut = 8'h7A;
                8'd51:  gamma_lut = 8'h7B;
                8'd52:  gamma_lut = 8'h7C;
                8'd53:  gamma_lut = 8'h7D;
                8'd54:  gamma_lut = 8'h7E;
                8'd55:  gamma_lut = 8'h7F;
                8'd56:  gamma_lut = 8'h80;
                8'd57:  gamma_lut = 8'h81;
                8'd58:  gamma_lut = 8'h82;
                8'd59:  gamma_lut = 8'h83;
                8'd60:  gamma_lut = 8'h84;
                8'd61:  gamma_lut = 8'h85;
                8'd62:  gamma_lut = 8'h86;
                8'd63:  gamma_lut = 8'h87;
                8'd64:  gamma_lut = 8'h88;
                8'd65:  gamma_lut = 8'h89;
                8'd66:  gamma_lut = 8'h8A;
                8'd67:  gamma_lut = 8'h8B;
                8'd68:  gamma_lut = 8'h8C;
                8'd69:  gamma_lut = 8'h8D;
                8'd70:  gamma_lut = 8'h8E;
                8'd71:  gamma_lut = 8'h8F;
                8'd72:  gamma_lut = 8'h90;
                8'd73:  gamma_lut = 8'h91;
                8'd74:  gamma_lut = 8'h92;
                8'd75:  gamma_lut = 8'h93;
                8'd76:  gamma_lut = 8'h93;
                8'd77:  gamma_lut = 8'h94;
                8'd78:  gamma_lut = 8'h95;
                8'd79:  gamma_lut = 8'h96;
                8'd80:  gamma_lut = 8'h97;
                8'd81:  gamma_lut = 8'h98;
                8'd82:  gamma_lut = 8'h99;
                8'd83:  gamma_lut = 8'h9A;
                8'd84:  gamma_lut = 8'h9A;
                8'd85:  gamma_lut = 8'h9B;
                8'd86:  gamma_lut = 8'h9C;
                8'd87:  gamma_lut = 8'h9D;
                8'd88:  gamma_lut = 8'h9E;
                8'd89:  gamma_lut = 8'h9E;
                8'd90:  gamma_lut = 8'h9F;
                8'd91:  gamma_lut = 8'hA0;
                8'd92:  gamma_lut = 8'hA1;
                8'd93:  gamma_lut = 8'hA2;
                8'd94:  gamma_lut = 8'hA2;
                8'd95:  gamma_lut = 8'hA3;
                8'd96:  gamma_lut = 8'hA4;
                8'd97:  gamma_lut = 8'hA5;
                8'd98:  gamma_lut = 8'hA6;
                8'd99:  gamma_lut = 8'hA6;
                8'd100: gamma_lut = 8'hA7;
                8'd101: gamma_lut = 8'hA8;
                8'd102: gamma_lut = 8'hA9;
                8'd103: gamma_lut = 8'hA9;
                8'd104: gamma_lut = 8'hAA;
                8'd105: gamma_lut = 8'hAB;
                8'd106: gamma_lut = 8'hAC;
                8'd107: gamma_lut = 8'hAC;
                8'd108: gamma_lut = 8'hAD;
                8'd109: gamma_lut = 8'hAE;
                8'd110: gamma_lut = 8'hAE;
                8'd111: gamma_lut = 8'hAF;
                8'd112: gamma_lut = 8'hB0;
                8'd113: gamma_lut = 8'hB1;
                8'd114: gamma_lut = 8'hB1;
                8'd115: gamma_lut = 8'hB2;
                8'd116: gamma_lut = 8'hB3;
                8'd117: gamma_lut = 8'hB3;
                8'd118: gamma_lut = 8'hB4;
                8'd119: gamma_lut = 8'hB5;
                8'd120: gamma_lut = 8'hB5;
                8'd121: gamma_lut = 8'hB6;
                8'd122: gamma_lut = 8'hB7;
                8'd123: gamma_lut = 8'hB8;
                8'd124: gamma_lut = 8'hB8;
                8'd125: gamma_lut = 8'hB9;
                8'd126: gamma_lut = 8'hBA;
                8'd127: gamma_lut = 8'hBA;
                8'd128: gamma_lut = 8'hBB;
                8'd129: gamma_lut = 8'hBC;
                8'd130: gamma_lut = 8'hBC;
                8'd131: gamma_lut = 8'hBD;
                8'd132: gamma_lut = 8'hBE;
                8'd133: gamma_lut = 8'hBE;
                8'd134: gamma_lut = 8'hBF;
                8'd135: gamma_lut = 8'hBF;
                8'd136: gamma_lut = 8'hC0;
                8'd137: gamma_lut = 8'hC1;
                8'd138: gamma_lut = 8'hC1;
                8'd139: gamma_lut = 8'hC2;
                8'd140: gamma_lut = 8'hC3;
                8'd141: gamma_lut = 8'hC3;
                8'd142: gamma_lut = 8'hC4;
                8'd143: gamma_lut = 8'hC5;
                8'd144: gamma_lut = 8'hC5;
                8'd145: gamma_lut = 8'hC6;
                8'd146: gamma_lut = 8'hC6;
                8'd147: gamma_lut = 8'hC7;
                8'd148: gamma_lut = 8'hC8;
                8'd149: gamma_lut = 8'hC8;
                8'd150: gamma_lut = 8'hC9;
                8'd151: gamma_lut = 8'hC9;
                8'd152: gamma_lut = 8'hCA;
                8'd153: gamma_lut = 8'hCB;
                8'd154: gamma_lut = 8'hCB;
                8'd155: gamma_lut = 8'hCC;
                8'd156: gamma_lut = 8'hCC;
                8'd157: gamma_lut = 8'hCD;
                8'd158: gamma_lut = 8'hCE;
                8'd159: gamma_lut = 8'hCE;
                8'd160: gamma_lut = 8'hCF;
                8'd161: gamma_lut = 8'hCF;
                8'd162: gamma_lut = 8'hD0;
                8'd163: gamma_lut = 8'hD1;
                8'd164: gamma_lut = 8'hD1;
                8'd165: gamma_lut = 8'hD2;
                8'd166: gamma_lut = 8'hD2;
                8'd167: gamma_lut = 8'hD3;
                8'd168: gamma_lut = 8'hD3;
                8'd169: gamma_lut = 8'hD4;
                8'd170: gamma_lut = 8'hD5;
                8'd171: gamma_lut = 8'hD5;
                8'd172: gamma_lut = 8'hD6;
                8'd173: gamma_lut = 8'hD6;
                8'd174: gamma_lut = 8'hD7;
                8'd175: gamma_lut = 8'hD7;
                8'd176: gamma_lut = 8'hD8;
                8'd177: gamma_lut = 8'hD9;
                8'd178: gamma_lut = 8'hD9;
                8'd179: gamma_lut = 8'hDA;
                8'd180: gamma_lut = 8'hDA;
                8'd181: gamma_lut = 8'hDB;
                8'd182: gamma_lut = 8'hDB;
                8'd183: gamma_lut = 8'hDC;
                8'd184: gamma_lut = 8'hDC;
                8'd185: gamma_lut = 8'hDD;
                8'd186: gamma_lut = 8'hDD;
                8'd187: gamma_lut = 8'hDE;
                8'd188: gamma_lut = 8'hDF;
                8'd189: gamma_lut = 8'hDF;
                8'd190: gamma_lut = 8'hE0;
                8'd191: gamma_lut = 8'hE0;
                8'd192: gamma_lut = 8'hE1;
                8'd193: gamma_lut = 8'hE1;
                8'd194: gamma_lut = 8'hE2;
                8'd195: gamma_lut = 8'hE2;
                8'd196: gamma_lut = 8'hE3;
                8'd197: gamma_lut = 8'hE3;
                8'd198: gamma_lut = 8'hE4;
                8'd199: gamma_lut = 8'hE4;
                8'd200: gamma_lut = 8'hE5;
                8'd201: gamma_lut = 8'hE5;
                8'd202: gamma_lut = 8'hE6;
                8'd203: gamma_lut = 8'hE6;
                8'd204: gamma_lut = 8'hE7;
                8'd205: gamma_lut = 8'hE7;
                8'd206: gamma_lut = 8'hE8;
                8'd207: gamma_lut = 8'hE8;
                8'd208: gamma_lut = 8'hE9;
                8'd209: gamma_lut = 8'hE9;
                8'd210: gamma_lut = 8'hEA;
                8'd211: gamma_lut = 8'hEA;
                8'd212: gamma_lut = 8'hEB;
                8'd213: gamma_lut = 8'hEB;
                8'd214: gamma_lut = 8'hEC;
                8'd215: gamma_lut = 8'hEC;
                8'd216: gamma_lut = 8'hED;
                8'd217: gamma_lut = 8'hED;
                8'd218: gamma_lut = 8'hEE;
                8'd219: gamma_lut = 8'hEE;
                8'd220: gamma_lut = 8'hEF;
                8'd221: gamma_lut = 8'hEF;
                8'd222: gamma_lut = 8'hF0;
                8'd223: gamma_lut = 8'hF0;
                8'd224: gamma_lut = 8'hF1;
                8'd225: gamma_lut = 8'hF1;
                8'd226: gamma_lut = 8'hF2;
                8'd227: gamma_lut = 8'hF2;
                8'd228: gamma_lut = 8'hF3;
                8'd229: gamma_lut = 8'hF3;
                8'd230: gamma_lut = 8'hF4;
                8'd231: gamma_lut = 8'hF4;
                8'd232: gamma_lut = 8'hF5;
                8'd233: gamma_lut = 8'hF5;
                8'd234: gamma_lut = 8'hF6;
                8'd235: gamma_lut = 8'hF6;
                8'd236: gamma_lut = 8'hF7;
                8'd237: gamma_lut = 8'hF7;
                8'd238: gamma_lut = 8'hF8;
                8'd239: gamma_lut = 8'hF8;
                8'd240: gamma_lut = 8'hF9;
                8'd241: gamma_lut = 8'hF9;
                8'd242: gamma_lut = 8'hFA;
                8'd243: gamma_lut = 8'hFA;
                8'd244: gamma_lut = 8'hFA;
                8'd245: gamma_lut = 8'hFB;
                8'd246: gamma_lut = 8'hFB;
                8'd247: gamma_lut = 8'hFC;
                8'd248: gamma_lut = 8'hFC;
                8'd249: gamma_lut = 8'hFD;
                8'd250: gamma_lut = 8'hFD;
                8'd251: gamma_lut = 8'hFE;
                8'd252: gamma_lut = 8'hFE;
                8'd253: gamma_lut = 8'hFF;
                8'd254: gamma_lut = 8'hFF;
                8'd255: gamma_lut = 8'hFF;
            endcase
        end
    endfunction

    assign line_end = ~line_valid & line_valid_d;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            frame_start_d  <= 1'b0;
            frame_start_d2 <= 1'b0;
            line_valid_d   <= 1'b0;
            line_valid_d2  <= 1'b0;
        end else begin
            frame_start_d  <= frame_start;
            frame_start_d2 <= frame_start_d;
            line_valid_d   <= line_valid;
            line_valid_d2  <= line_valid_d;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            row_odd <= 1'b0;
        end else if (frame_start) begin
            row_odd <= 1'b0;
        end else if (line_end) begin
            row_odd <= ~row_odd;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            enable_d       <= 1'b0;
            enable_d2      <= 1'b0;
            gamma_enable_d <= 1'b0;
        end else begin
            enable_d       <= enable;
            enable_d2      <= enable_d;
            gamma_enable_d <= gamma_enable;
        end
    end

    genvar i;
    generate
        for (i = 0; i < NUM_PIXELS; i = i + 1) begin : pixel_proc
            wire col_odd = i[0];

            assign gain_sel[i] = (~row_odd & ~col_odd) ? gain_b :
                                 (~row_odd &  col_odd) ? gain_g :
                                 ( row_odd & ~col_odd) ? gain_g :
                                                         gain_r;

            assign data_mult[i] = data_in[i*DATA_WIDTH +: DATA_WIDTH] * gain_sel[i];

            assign data_gained[i] = (data_mult[i][DATA_WIDTH+GAIN_WIDTH-1:GAIN_FRAC] > {DATA_WIDTH{1'b1}}) ?
                                    {DATA_WIDTH{1'b1}} :
                                    data_mult[i][DATA_WIDTH+GAIN_FRAC-1:GAIN_FRAC];

            always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    data_d[i]      <= {DATA_WIDTH{1'b0}};
                    data_bypass[i] <= {DATA_WIDTH{1'b0}};
                end else begin
                    data_d[i]      <= data_gained[i];
                    data_bypass[i] <= data_in[i*DATA_WIDTH +: DATA_WIDTH];
                end
            end

            always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    data_gamma[i]    <= {DATA_WIDTH{1'b0}};
                    data_bypass_d[i] <= {DATA_WIDTH{1'b0}};
                end else begin
                    if (gamma_enable_d)
                        data_gamma[i] <= {gamma_lut(data_d[i][DATA_WIDTH-1-:8]), {(DATA_WIDTH-8){1'b0}}};
                    else
                        data_gamma[i] <= data_d[i];
                    data_bypass_d[i] <= data_bypass[i];
                end
            end

            always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    data_out[i*DATA_WIDTH +: DATA_WIDTH] <= {DATA_WIDTH{1'b0}};
                end else begin
                    data_out[i*DATA_WIDTH +: DATA_WIDTH] <= enable_d2 ? data_gamma[i] : data_bypass_d[i];
                end
            end
        end
    endgenerate

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            frame_start_out <= 1'b0;
            line_valid_out  <= 1'b0;
        end else begin
            frame_start_out <= frame_start_d2;
            line_valid_out  <= line_valid_d2;
        end
    end

endmodule
