library verilog;
use verilog.vl_types.all;
entity cacheL1 is
    port(
        clock           : in     vl_logic;
        tag             : in     vl_logic_vector(4 downto 0);
        data            : in     vl_logic_vector(7 downto 0);
        wren            : in     vl_logic
    );
end cacheL1;
