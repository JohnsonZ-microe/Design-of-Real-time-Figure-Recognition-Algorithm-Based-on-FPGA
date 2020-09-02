library verilog;
use verilog.vl_types.all;
entity delay is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        per_clken       : in     vl_logic;
        aclr            : in     vl_logic;
        gauss_A_in      : in     vl_logic_vector(9 downto 0);
        delay_8x        : out    vl_logic_vector(9 downto 0)
    );
end delay;
