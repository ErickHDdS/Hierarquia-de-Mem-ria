/*
LABORATÓRIO DE ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES II
PARTE 1 - PROJETO 1
ERICK HENRIQUE DUTRA DE SOUZA
MARINA BERNARDES DINIZ
*/

module parte1 (address, data, clock, wren, q);

    input    [4:0]  address;
    input      clock, wren;
    input [7:0]  data;
    output [7:0]  q;
	 
/*	 Ram ram0(5'b00001, clock, 8'b00000011, 1, q_outE);
	 Ram ram1(5'b00011, clock, 8'b00001000, 1, q_outM);
	 
initial begin
            $display("Testando RAM ...");
            $monitor(" Endereco = %b  esc = %b     dado = %b saida = %b ", address, wren,  data, q);
        end
		  
	        always@(*)
            case(address)
                5'b00001: 
                    begin
                        if(wren == 1)
                            data <= 8'b00000011;
								else
									 data <= q_outE;
                    end

                5'b00011: 
                    begin
                        if(wren == 1)
                            data <= 8'b00001000;
								else
									 data <= q_outM;
                    end

                default: 
                    begin
								if(wren == 1)
										 data <= 8'b00000000;
									else
										 data <= 8'b00000000;
                            
                    end
            endcase*/

    Ram MemoriaRam(address, clock, data, wren, q);

endmodule