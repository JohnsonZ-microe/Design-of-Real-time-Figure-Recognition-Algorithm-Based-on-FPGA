library verilog;
use verilog.vl_types.all;
entity altsquare is
    generic(
        data_width      : integer := 1;
        lpm_hint        : string  := "UNUSED";
        lpm_type        : string  := "altsquare";
        pipeline        : integer := 1;
        representation  : string  := "UNSIGNED";
        result_width    : integer := 1
    );
    port(
        aclr            : in     vl_logic;
        clock           : in     vl_logic;
        data            : in     vl_logic_vector;
        ena             : in     vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of data_width : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of pipeline : constant is 1;
    attribute mti_svvh_generic_type of representation : constant is 1;
    attribute mti_svvh_generic_type of result_width : constant is 1;
end altsquare;
