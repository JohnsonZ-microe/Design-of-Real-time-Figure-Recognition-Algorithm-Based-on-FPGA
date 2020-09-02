library verilog;
use verilog.vl_types.all;
entity median_filter is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data11          : in     vl_logic_vector(9 downto 0);
        data12          : in     vl_logic_vector(9 downto 0);
        data13          : in     vl_logic_vector(9 downto 0);
        data21          : in     vl_logic_vector(9 downto 0);
        data22          : in     vl_logic_vector(9 downto 0);
        data23          : in     vl_logic_vector(9 downto 0);
        data31          : in     vl_logic_vector(9 downto 0);
        data32          : in     vl_logic_vector(9 downto 0);
        data33          : in     vl_logic_vector(9 downto 0);
        ien             : in     vl_logic;
        oen             : out    vl_logic;
        target_data     : out    vl_logic_vector(9 downto 0)
    );
end median_filter;
