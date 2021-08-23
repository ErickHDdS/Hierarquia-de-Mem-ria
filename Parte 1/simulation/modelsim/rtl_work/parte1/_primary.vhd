library verilog;
use verilog.vl_types.all;
entity parte1 is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        data            : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        wren            : in     vl_logic;
        q               : out    vl_logic_vector(7 downto 0)
    );
end parte1;
