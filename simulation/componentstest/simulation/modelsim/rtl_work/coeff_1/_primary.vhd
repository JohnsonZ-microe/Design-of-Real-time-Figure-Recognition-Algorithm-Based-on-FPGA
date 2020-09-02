library verilog;
use verilog.vl_types.all;
entity coeff_1 is
    port(
        datain          : in     vl_logic_vector(19 downto 0);
        dataout         : out    vl_logic_vector(19 downto 0)
    );
end coeff_1;
