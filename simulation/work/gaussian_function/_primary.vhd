library verilog;
use verilog.vl_types.all;
entity gaussian_function is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        Cb              : in     vl_logic_vector(9 downto 0);
        Cr              : in     vl_logic_vector(9 downto 0);
        gauss_A         : out    vl_logic_vector(3 downto 0)
    );
end gaussian_function;
