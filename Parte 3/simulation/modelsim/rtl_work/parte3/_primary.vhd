library verilog;
use verilog.vl_types.all;
entity parte3 is
    port(
        address         : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        wren            : in     vl_logic;
        saidaRAM        : out    vl_logic_vector(7 downto 0)
    );
end parte3;
