library verilog;
use verilog.vl_types.all;
entity lpm_mult is
    generic(
        lpm_type        : string  := "lpm_mult";
        lpm_widtha      : integer := 1;
        lpm_widthb      : integer := 1;
        lpm_widths      : integer := 1;
        lpm_widthp      : integer := 1;
        lpm_representation: string  := "UNSIGNED";
        lpm_pipeline    : integer := 0;
        lpm_hint        : string  := "UNUSED";
        intended_device_family: string  := "UNUSED";
        max_width       : vl_notype;
        normalized_width: integer := 1;
        adder_width     : vl_notype;
        lpm_in_pipeline : vl_notype;
        lpm_out_pipeline: vl_notype
    );
    port(
        dataa           : in     vl_logic_vector;
        datab           : in     vl_logic_vector;
        sum             : in     vl_logic_vector;
        clock           : in     vl_logic;
        clken           : in     vl_logic;
        aclr            : in     vl_logic;
        result          : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of lpm_type : constant is 1;
    attribute mti_svvh_generic_type of lpm_widtha : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthb : constant is 1;
    attribute mti_svvh_generic_type of lpm_widths : constant is 1;
    attribute mti_svvh_generic_type of lpm_widthp : constant is 1;
    attribute mti_svvh_generic_type of lpm_representation : constant is 1;
    attribute mti_svvh_generic_type of lpm_pipeline : constant is 1;
    attribute mti_svvh_generic_type of lpm_hint : constant is 1;
    attribute mti_svvh_generic_type of intended_device_family : constant is 1;
    attribute mti_svvh_generic_type of max_width : constant is 3;
    attribute mti_svvh_generic_type of normalized_width : constant is 1;
    attribute mti_svvh_generic_type of adder_width : constant is 3;
    attribute mti_svvh_generic_type of lpm_in_pipeline : constant is 3;
    attribute mti_svvh_generic_type of lpm_out_pipeline : constant is 3;
end lpm_mult;
