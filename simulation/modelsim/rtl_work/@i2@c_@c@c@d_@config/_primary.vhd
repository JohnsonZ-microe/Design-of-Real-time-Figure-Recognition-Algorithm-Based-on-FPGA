library verilog;
use verilog.vl_types.all;
entity I2C_CCD_Config is
    generic(
        default_exposure: vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        exposure_change_value: vl_logic_vector(0 to 15) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        CLK_Freq        : integer := 50000000;
        I2C_Freq        : integer := 20000;
        LUT_SIZE        : integer := 25
    );
    port(
        iCLK            : in     vl_logic;
        iRST_N          : in     vl_logic;
        iUART_CTRL      : in     vl_logic;
        iZOOM_MODE_SW   : in     vl_logic;
        iEXPOSURE_ADJ   : in     vl_logic;
        iEXPOSURE_DEC_p : in     vl_logic;
        I2C_SCLK        : out    vl_logic;
        I2C_SDAT        : inout  vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of default_exposure : constant is 1;
    attribute mti_svvh_generic_type of exposure_change_value : constant is 1;
    attribute mti_svvh_generic_type of CLK_Freq : constant is 1;
    attribute mti_svvh_generic_type of I2C_Freq : constant is 1;
    attribute mti_svvh_generic_type of LUT_SIZE : constant is 1;
end I2C_CCD_Config;
