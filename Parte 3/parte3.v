/*
LABORATÓRIO DE ARQUITETURA E ORGANIZAÇÃO DE COMPUTADORES II
PARTE 3 - PROJETO 1
ERICK HENRIQUE DUTRA DE SOUZA
MARINA BERNARDES DINIZ
*/

module cacheL1(clock, tag, data, wren);

    //RAM
    reg clock_RAM, wren_RAM;
    reg [4:0] address_RAM;
    reg [7:0] data_RAM;
    wire [7:0] saida_RAM;
    
    //entradas
    input clock,wren;
    input [7:0] data;
    input [4:0] tag;
    
    //MemoriaCache
    reg [7:0] cache [0:3][0:1]; //cache[tag][valor]
    reg [0:3] valido;
    reg [0:3] dirty;
    reg [1:0] LRU [0:3];
    
    reg [7:0] saidaCache;
    reg [7:0] cacheTAG;
    reg [7:0] cacheVALOR;
    // inicializando a cache
    initial
    begin
        cache[0][0] = 0;
        cache[0][1] = 5;
        cache[1][0] = 2;
        cache[1][1] = 1;
        cache[2][0] = 5;
        cache[2][1] = 5;
        cache[3][0] = 1;
        cache[3][1] = 3;    
        
        valido[0] = 1;        valido[1] = 1;        valido[2] = 0;        valido[3] = 1;
        dirty[0] = 0;        dirty[1] = 0;        dirty[2] = 0;        dirty[3] = 0;
        LRU[0] = 0;           LRU[1] = 1;           LRU[2] = 3;           LRU[3] = 2;    
        
    end
    
    integer contador, tam_cache, HitMiss, posicao, antigoMaior, WriteBack, paraemnomedeJesus, lru_Entrou, j;
    always@(posedge clock)
    begin
        
        tam_cache = 4;
        paraemnomedeJesus = 0;
		  WriteBack = 0;

        //verificando Miss ou Hit
        for(contador = 0; contador < tam_cache; contador = contador + 1)
        begin
        if(paraemnomedeJesus != 5) begin
            if(tag == cache[contador][0] && valido[contador] == 1)       //deu hit
            begin
                HitMiss = 1;
                posicao = contador;
                paraemnomedeJesus = 5;
            end
            
            else if(tag == cache[contador][0] && valido[contador] == 0) //deu miss
            begin
                HitMiss = 0;
                posicao = contador;
                paraemnomedeJesus = 5;
            end
            
            else
            begin
                HitMiss = 0;        //deu miss de novo
            end
        end
        end

		
        //LRU search
        antigoMaior = 0;
        for(contador = 0; contador < tam_cache; contador = contador+1)
        begin
            if(LRU[contador] == tam_cache-1)
            begin
                antigoMaior = contador; 
            end
        end

        //cresce LRU, cresce minha filha		3 0 1 2
        //cresce LRU, cresce minha filha		0   
        //cresce LRU, cresce minha filha		
        //cresce LRU, cresce minha filha		0 0 1 2
		  
        //cresce LRU, cresce minha filha		0 1 2 3	
		  
        if(HitMiss == 1) begin     
			lru_Entrou =  LRU[posicao];
            for(contador = 0; contador < tam_cache; contador = contador + 1) 
				begin
                if(LRU[contador] <lru_Entrou) 
					 begin
                    LRU[contador] = LRU[contador] + 1;
					 end
                else 
					 begin
					 if(contador == posicao)
                    LRU[posicao] = 0;
                end
            end
        end

			//cresce LRU, cresce minha filha		3 2 0 1
			//cresce LRU, cresce minha filha		0 0 1 2
			//cresce LRU, cresce minha filha		0 0 1 2
			
			//cresce LRU, cresce minha filha		0 3 1 2
        else     
		  begin// hitmiss == 0            
			lru_Entrou =  LRU[antigoMaior];
            for(contador = 0; contador < tam_cache; contador = contador + 1) 
				begin
                if(LRU[contador] < lru_Entrou) 
					 begin
                    LRU[contador] = LRU[contador] + 1;
					 end
                else 
					 begin
					 if(contador == antigoMaior)
                    LRU[antigoMaior] = 0;
                end
            end
        end
        
        //write
        if(wren == 1)
        begin
            if(HitMiss == 1)
            begin 
                //pega da entrada de dados e dirty = 1
                cache[posicao][1] = data;
                dirty[posicao] = 1;
            end
            
            else
            begin
                //salvando numa gavetinha pra mais tarde
                cacheTAG = cache[antigoMaior][0];
                cacheVALOR = cache[antigoMaior][1];
                    
                //pegando da entrada;
                cache[antigoMaior][0] = tag;
                cache[antigoMaior][1] = data;
                
                if(dirty[antigoMaior] == 0)
                begin
                    dirty[antigoMaior] = 1;
                end
            end
				WriteBack = 1;
        end
        
        //read
        else
        begin
            if(HitMiss == 1) //hit
            begin 
                saidaCache = cache[posicao][1];
            end
            
            else                  //miss
            begin
                if(valido[posicao] == 0)    //tag existe
                begin 
                    //salvando numa gavetinha pra mais tarde
                    cacheTAG = cache[posicao][0];
                    cacheVALOR = cache[posicao][1];
                    
                    //manipulando a memoria principal;
                    address_RAM = tag;
                    
                    //controle do clock
                    clock_RAM = 1;
                    wren_RAM = 0;
						  #1 clock_RAM = 0;
                    wren_RAM = 0;
                    
                    //pegando os valores da memoria principal
                    cache[posicao][0] = address_RAM;
                    cache[posicao][1] = saida_RAM;
                    
                    //salvando o valor na cache
						  #1 saidaCache = cache[posicao][1];
                    
                    valido[posicao] = 1;
                end
        
                else                            //tag não existe
                begin
                    //salvando numa gavetinha pra mais tarde
                    cacheTAG = cache[antigoMaior][0];
                    cacheVALOR = cache[antigoMaior][1];
                    
                    //manipulando a memoria principal;
                    address_RAM = tag;
                    clock_RAM = 1;
                    wren_RAM = 0;
						  #1 clock_RAM = 0; 
                    wren_RAM = 0;
                    
                    //pegando os valores da memoria principal
                    cache[antigoMaior][0] = address_RAM;
                    cache[antigoMaior][1] = saida_RAM;
                    
                    //salvando o valor na cache
						  #1 saidaCache = cache[antigoMaior][1];

                end
            end
        end
        
        //write back
        if(HitMiss == 0) 
		  begin    
            if (dirty[antigoMaior] == 1) 
				begin
					 #2 clock_RAM = 0;
                //tirando da gavetinha
                address_RAM = cacheTAG;
                data_RAM = cacheVALOR;
                    
                clock_RAM = 1;
                wren_RAM = 1; 
					 #1 clock_RAM = 0; 
                wren_RAM = 0;
                
					 //se não mechemos no dirty
					 if(WriteBack == 0)
						dirty[antigoMaior] = 0;
            end
        end
		  
		  else
		  begin
					 #2 clock_RAM = 0;
                //tirando da gavetinha
                address_RAM = cacheTAG;
                data_RAM = cacheVALOR;
                    
                clock_RAM = 1;
                wren_RAM = 1;
					 #1 clock_RAM = 0; 
                wren_RAM = 0;
                
					 //se não mechemos no dirty
					 if(WriteBack == 0) 
					 begin
						 if(wren == 1)
							dirty[posicao] = 1;
						 else
							dirty[posicao] = 0;
					end
		  end
		  
/*
		 begin
			  
			  |    Monitorando os valores da cache...
			  |-----------------------------------------------
			  
			  for(contador = 0; contador < 4; contador = contador + 1)
			  begin
					for(j = 0; j < 2; j = j +1)
					begin
						 $monitor("valido = %d dirty = %d LRU = %d tag = %d valor = %d", valido[contador], dirty[contador], LRU[contador], cache[contador][0], cache[0][j]);
					end
			  end
		 end
		  */
    end
	 

    
    // SE ISSO NÃO DER CERTO EU CHORO
    ram RAM(address_RAM, clock_RAM, data_RAM, wren_RAM, saida_RAM);
endmodule


module parte3(address, clock,    data,    wren,    saidaRAM);
    input    [4:0]  address;
    input      clock;
    input    [7:0]  data;
    input      wren;
    output    [7:0]  saidaRAM;

    cacheL1 cache(clock, address, data, wren);
    //ram RAM(address, clock, data, wren, saidaRAM);
endmodule