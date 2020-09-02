library verilog;
use verilog.vl_types.all;
entity CCD_Capture is
    generic(
        COLUMN_WIDTH    : integer := 1280
    );
    port(
        oDATA           : out    vl_logic_vector(11 downto 0);
        oDVAL           : out    vl_logic;
        oX_Cont         : out    vl_logic_vector(15 downto 0);
        oY_Cont         : out    vl_logic_vector(15 downto 0);
        oFrame_Cont     : out    vl_logic_vector(31 downto 0);
        iDATA           : in     vl_logic_vector(11 downto 0);
        iFVAL           : in     vl_logic;
        iLVAL           : in     vl_logic;
        iSTART          : in     vl_logic;
        iEND            : in     vl_logic;
        iCLK            : in     vl_logic;
        iRST            : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of COLUMN_WIDTH : constant is 1;
end CCD_Capture;
