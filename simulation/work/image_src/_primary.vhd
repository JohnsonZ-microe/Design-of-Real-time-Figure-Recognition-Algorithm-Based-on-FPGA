library verilog;
use verilog.vl_types.all;
entity image_src is
    generic(
        iw              : integer := 640;
        ih              : integer := 512;
        dw              : integer := 8;
        h_total         : integer := 1440;
        v_total         : integer := 600;
        sync_b          : integer := 5;
        sync_e          : integer := 55;
        vld_b           : integer := 65
    );
    port(
        reset_1         : in     vl_logic;
        clk             : in     vl_logic;
        src_sel         : in     vl_logic_vector(3 downto 0);
        test_vsync      : out    vl_logic;
        test_dvalid     : out    vl_logic;
        test_data       : out    vl_logic_vector;
        clk_out         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of iw : constant is 1;
    attribute mti_svvh_generic_type of ih : constant is 1;
    attribute mti_svvh_generic_type of dw : constant is 1;
    attribute mti_svvh_generic_type of h_total : constant is 1;
    attribute mti_svvh_generic_type of v_total : constant is 1;
    attribute mti_svvh_generic_type of sync_b : constant is 1;
    attribute mti_svvh_generic_type of sync_e : constant is 1;
    attribute mti_svvh_generic_type of vld_b : constant is 1;
end image_src;
