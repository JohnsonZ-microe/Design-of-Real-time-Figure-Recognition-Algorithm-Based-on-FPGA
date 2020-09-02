library verilog;
use verilog.vl_types.all;
entity mult is
    port(
        dataa           : in     vl_logic_vector(9 downto 0);
        datab           : in     vl_logic_vector(9 downto 0);
        result          : out    vl_logic_vector(19 downto 0)
    );
end mult;
