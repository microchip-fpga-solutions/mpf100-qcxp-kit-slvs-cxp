/*
File Name        : apb3_if2.vhd  

 Description     : Implements an AMBA APB3 slave interface for accessing internal control and status registers. The module decodes APB address transactions, generates read and write strobes, stores write data in configuration registers, and multiplexes register data onto the APB read-data bus. 
 
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

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
--=================================================================================================
-- apb3_if entity declaration
--=================================================================================================
entity apb3_if2 is
  generic (
    -- Specifies pwdata_i,prdata_o signal width
    g_APB3_IF_DATA_WIDTH : integer := 32;

    -- Specifies the width of constants
    g_CONST_WIDTH : integer := 12
    );
  port (
-- Port list
    -- APB reset
    preset_i : in std_logic;
    -- APB clock
    pclk_i   : in std_logic;

    -- APB slave interface
    psel_i    : in  std_logic;
    pwrite_i  : in  std_logic;
    penable_i : in  std_logic;
    paddr_i   : in  std_logic_vector(g_APB3_IF_DATA_WIDTH-1 downto 0);
    pwdata_i  : in  std_logic_vector(g_APB3_IF_DATA_WIDTH-1 downto 0);
    pready_o  : out std_logic;
    pslverr_o : out std_logic;
    prdata_o  : out std_logic_vector(g_APB3_IF_DATA_WIDTH-1 downto 0);
        
    rgain_o   : out std_logic_vector(7 downto 0);
    ggain_o   : out std_logic_vector(7 downto 0);
    bgain_o   : out std_logic_vector(7 downto 0);
    rgb_gain_en_o: out std_logic;
    hres_o    : out std_logic_vector(15 downto 0);
    vres_o    : out std_logic_vector(15 downto 0)
    );
end apb3_if2;

--=================================================================================================
-- apb3_if architecture body
--=================================================================================================

architecture apb3_if2 of apb3_if2 is

--=================================================================================================
-- Component declarations
--=================================================================================================
--NA--

--=================================================================================================
-- Synthesis Attributes
--=================================================================================================
--NA--

--=================================================================================================
-- Signal declarations
--=================================================================================================
--ADC Register Addresses
  constant C_HRES_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"000";
  constant C_VRES_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"004";
  constant C_GAIN_ADDR    : std_logic_vector(g_CONST_WIDTH-1 downto 0) := x"008";
  
  
begin


--=================================================================================================
-- Top level output port assignments
--=================================================================================================
  pready_o  <= '1';  -- pready_o Is always ready,there will not be any
  -- latency from the Fabric modules
  pslverr_o <= '0';  -- Slave error is always '0' as there will not be
  --any slave error.

--=================================================================================================
-- Generate blocks
--=================================================================================================

--=================================================================================================
-- Asynchronous blocks
--=================================================================================================
--------------------------------------------------------------------------
-- Name       : READ_DECODE_PROC
-- Description: Process implements the APB read operation
--------------------------------------------------------------------------

  READ_DECODE_PROC :
  process (paddr_i)
  begin
    case paddr_i(11 downto 0) is
--------------------
-- C_PKT_ADDR
--------------------
      when C_HRES_ADDR =>
        prdata_o(15 downto 0) <= hres_o;
        prdata_o(g_APB3_IF_DATA_WIDTH-1 downto 16)
          <= (others => '0');
--------------------          
-- OTHERS
--------------------
      when others =>
        prdata_o <= (others => '0');

    end case;

  end process;

--=================================================================================================
-- Synchronous blocks
--=================================================================================================

--------------------------------------------------------------------------
-- Name       : WRITE_DECODE_PROC
-- Description: Process implements the APB write operation
--------------------------------------------------------------------------
  WRITE_DECODE_PROC :
  process (preset_i, pclk_i)
  begin
    if(preset_i = '0')then
      hres_o             <= x"0f00";
      vres_o             <= x"0870";      
      rgain_o            <= x"40";      
      ggain_o            <= x"40";      
      bgain_o            <= x"40";      
      rgb_gain_en_o      <= '0';      
    elsif (pclk_i'event and pclk_i = '1') then
      if ((psel_i = '1') and (pwrite_i = '1') and (penable_i = '1')) then
        
        case paddr_i(11 downto 0) is
--------------------
-- C_HRES_ADDR
--------------------
          when C_HRES_ADDR =>
            hres_o <= pwdata_i(15 downto 0);
--------------------
-- C_VRES_ADDR
--------------------
          when C_VRES_ADDR =>
            vres_o <= pwdata_i(15 downto 0);
--------------------
-- C_GAIN_ADDR
--------------------
          when C_GAIN_ADDR =>
            rgb_gain_en_o      <= pwdata_i(24);
            rgain_o            <= pwdata_i(23 downto 16);      
            ggain_o            <= pwdata_i(15 downto 8);      
            bgain_o            <= pwdata_i(7 downto 0);   

--------------------
-- OTHERS
--------------------
          when others =>
            null;
        end case;
      end if;
    end if;
  end process;
--=================================================================================================
-- Component Instantiations
--=================================================================================================
--NA--

end architecture apb3_if2;
