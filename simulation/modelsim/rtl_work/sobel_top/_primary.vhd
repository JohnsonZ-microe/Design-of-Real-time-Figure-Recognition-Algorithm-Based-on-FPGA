library verilog;
use verilog.vl_types.all;
entity sobel_top is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        per_clken       : in     vl_logic;
        R_in            : in     vl_logic_vector(9 downto 0);
        G_in            : in     vl_logic_vector(9 downto 0);
        B_in            : in     vl_logic_vector(9 downto 0);
        out_data        : out    vl_logic_vector(9 downto 0)
    );
end sobel_top;
