library verilog;
use verilog.vl_types.all;
entity sort is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        per_clken       : in     vl_logic;
        data1           : in     vl_logic_vector(9 downto 0);
        data2           : in     vl_logic_vector(9 downto 0);
        data3           : in     vl_logic_vector(9 downto 0);
        max_data        : out    vl_logic_vector(9 downto 0);
        mid_data        : out    vl_logic_vector(9 downto 0);
        min_data        : out    vl_logic_vector(9 downto 0)
    );
end sort;
