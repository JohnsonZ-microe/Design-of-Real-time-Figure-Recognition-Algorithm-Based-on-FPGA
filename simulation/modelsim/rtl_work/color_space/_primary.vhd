library verilog;
use verilog.vl_types.all;
entity color_space is
    generic(
        DSIZE           : integer := 10;
        MSIZE           : integer := 12
    );
    port(
        clock           : in     vl_logic;
        rst_n           : in     vl_logic;
        inR             : in     vl_logic_vector;
        inG             : in     vl_logic_vector;
        inB             : in     vl_logic_vector;
        outY            : out    vl_logic_vector;
        outCb           : out    vl_logic_vector;
        outCr           : out    vl_logic_vector;
        ien             : in     vl_logic;
        oen             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DSIZE : constant is 1;
    attribute mti_svvh_generic_type of MSIZE : constant is 1;
end color_space;
