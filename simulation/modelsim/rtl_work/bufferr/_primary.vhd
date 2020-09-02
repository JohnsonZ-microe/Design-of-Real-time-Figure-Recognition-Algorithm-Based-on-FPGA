library verilog;
use verilog.vl_types.all;
entity bufferr is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        per_img_Y       : in     vl_logic_vector(9 downto 0);
        aclr            : in     vl_logic;
        matrix_p11      : out    vl_logic_vector(9 downto 0);
        matrix_p12      : out    vl_logic_vector(9 downto 0);
        matrix_p13      : out    vl_logic_vector(9 downto 0);
        matrix_p21      : out    vl_logic_vector(9 downto 0);
        matrix_p22      : out    vl_logic_vector(9 downto 0);
        matrix_p23      : out    vl_logic_vector(9 downto 0);
        matrix_p31      : out    vl_logic_vector(9 downto 0);
        matrix_p32      : out    vl_logic_vector(9 downto 0);
        matrix_p33      : out    vl_logic_vector(9 downto 0);
        ien             : in     vl_logic;
        oen             : out    vl_logic
    );
end bufferr;
