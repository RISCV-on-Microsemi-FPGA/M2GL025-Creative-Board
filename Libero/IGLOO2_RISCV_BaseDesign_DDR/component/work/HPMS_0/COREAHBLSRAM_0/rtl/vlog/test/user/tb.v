`timescale 1ns/100ps

module testbench ();
`include "../../../../coreparameters.v"
   
   localparam AHB_CLK_PERIOD = 5;   // Assuming AHB CLK to be 100MHz
  

   localparam IDLE   = 2'b00;
   localparam BUSY   = 2'b01;
   localparam NONSEQ = 2'b10;
   localparam SEQ    = 2'b11;
   
   localparam SINGLE    = 3'b000;
   localparam INCR      = 3'b001;
   localparam WRAP4     = 3'b010;
   localparam INCR4     = 3'b011;
   localparam WRAP8     = 3'b100;
   localparam INCR8     = 3'b101;
   localparam WRAP16    = 3'b110;
   localparam INCR16    = 3'b111;

   localparam BYTE       = 2'b00;
   localparam HALFWORD   = 2'b01;
   localparam WORD       = 2'b10;
   localparam DOUBLEWORD = 2'b11;
   
   localparam OKAY       = 2'b00;
   localparam ERROR      = 2'b01;
   localparam RETRY      = 2'b10;
   localparam SPLIT      = 2'b11;

   localparam WRITE      = 1'b1;
   localparam READ       = 1'b0;
   localparam HIGH       = 1'b1;
   localparam LOW        = 1'b0;

     localparam DEPTH      = 4000;
     //localparam DEPTH08      = SEL_SRAM_TYPE ? (USRAM_NUM_LOCATIONS_DWIDTH32/1) : (LSRAM_NUM_LOCATIONS_DWIDTH32/1);
     //localparam DEPTH16      = SEL_SRAM_TYPE ? (USRAM_NUM_LOCATIONS_DWIDTH32/2) : (LSRAM_NUM_LOCATIONS_DWIDTH32/2);
     //localparam DEPTH32      = SEL_SRAM_TYPE ? (USRAM_NUM_LOCATIONS_DWIDTH32/4) : (LSRAM_NUM_LOCATIONS_DWIDTH32/4);
     localparam DEPTH08      = SEL_SRAM_TYPE ? (128/1) : (2048/1);
     localparam DEPTH16      = SEL_SRAM_TYPE ? (128/2) : (2048/2);
     localparam DEPTH32      = SEL_SRAM_TYPE ? (128/4) : (2048/4);

   reg        HCLK;
   reg        HSEL;
   reg        HWRITE;
   reg [1:0]  HTRANS;
   reg [2:0]  HSIZE;
   reg [2:0]  HBURST;

   wire       HREADYIN;
   reg [AHB_AWIDTH-1:0] HADDR;
   reg [AHB_DWIDTH-1:0] HWDATA;
   
   wire                 HREADYOUT;
   wire [1:0]           HRESP;
   wire [AHB_DWIDTH-1:0] HRDATA;
   
   reg                   nreset;
   reg [AHB_DWIDTH-1:0]  read_data;
  
   reg [AHB_AWIDTH-1:0]  haddr, haddr_w,init_addr;
  
   reg [3:0]             haddr_incr;
   reg [4:0]             hburst_value;
   reg                   wrap_enable;
   reg [7:0]             set_wrap_addr;
   reg [1:0]             write_resp;

   integer               adr_0, adr_00, ii, error_count_0;
   integer               adr_1, adr_11, rr, error_count_1;
   integer               error_count;
   reg [8*79:1]          pound_str,test_str;   

   reg [AHB_AWIDTH-1:0]  start_waddr;
   reg [AHB_AWIDTH-1:0]  start_raddr;

   //---------------------------------------------------------------------------
   // Initial value declarations
   //---------------------------------------------------------------------------
   initial begin
      nreset          = 1'b0; 
      HCLK            = 1'b0; 
      HSEL            = 1'b0; 
      HWRITE          = 1'b0;
      
      HTRANS          = 2'b00;
      HADDR           = 32'h0000_0000;
      HBURST          = 3'b000;
      HSIZE           = 3'b000;
        start_waddr     = 32'h0000_0000;
        start_raddr     = 32'h0000_0000;
   end

   //-----------------------------------------------------------------------------
   assign HRESETN = nreset;
   always begin
      #AHB_CLK_PERIOD HCLK = ~HCLK;
   end

//-----------------------------------------------------------------------------
// AHBLite-to-AXI Simple Write operation
//-----------------------------------------------------------------------------

   integer  i, r, int;
   reg [2:0] burst;
   reg [1:0] size;
   reg [3:0] trans_no;
   integer   j;
   integer   iter;
   reg [31:0] haddr_set;
   reg [31:0] hraddr_set;   
   
   initial begin
      
      // Reset DUT
        @(posedge HCLK);
        @(posedge HCLK);
      dut_reset;
      
      iter = 3;
     
      // 1st transaction  
      burst = SINGLE;
     
      size = WORD;      
      // AHB write operation

      ahb_write(burst,size,0,DEPTH32-1);
      // AHB read operation
      ahb_read(burst,size,0,DEPTH32-1);

     // Task for Comparision.
      ahb_compare(size,DEPTH32);

      #100
        @(posedge HCLK);

// Second Transactions
              
      burst = SINGLE;

        size = HALFWORD;      
          
      // AHB write operation

      ahb_write(burst,size,0,DEPTH16-1);
      // AHB read operation
      ahb_read(burst,size,0,DEPTH16-1);

     // Task for Comparision.
      ahb_compare(size,DEPTH16);


// Third Transactions
 
      burst = SINGLE;
      size = BYTE;
 
      // AHB write operation

      ahb_write(burst,size,0,DEPTH08-1);
      // AHB read operation
      ahb_read(burst,size,0,DEPTH08-1);

     // Task for Comparision.
      ahb_compare(size,DEPTH08);

     // Stop the simulations
     #100
     $stop;
     $finish;

   end // initial begin
   
//#############################################################################

// TASKS  
   task dut_reset;
      begin
         nreset = #2 1'b1;
      end
   endtask

   task ahb_compare;
    input [1:0] size; 
    input DEPTH;
    integer i;
    integer DEPTH;
    integer counter;

    begin
       counter = 0;
       for(i=0 ; i < DEPTH ; i=i+1) begin
           case(size)
               2'b10 : begin
                        if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                            if(ahb_write.writedata[i] == ahb_read.readdata[i]) begin
                                $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                $display("TEST CASE PASSED");
                                counter = counter + 1;
                                if(counter == DEPTH) begin
                                    $display("TOTAL TESTCASE PASSED");
                                    counter = 0;
                                end
                            end else begin
                                $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                            end
                        end else begin
                            $display("TEST CASE FAILED");
                        end
                     end
               2'b01 : begin
                            case(ahb_write.writeaddr[i][1:0])
                                2'b00 : begin
                                            if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                                                if(ahb_write.writedata[i][15:0] == ahb_read.readdata[i][15:0]) begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i][15:0],ahb_read.readaddr[i],ahb_read.readdata[i][15:0]);
                                                    $display("TEST CASE PASSED");
                                                    counter = counter + 1;
                                                    if(counter == DEPTH) begin
                                                        $display("TOTAL TESTCASE PASSED");
                                                        counter = 0;
                                                    end
                                                end else begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                                end
                                            end else begin
                                                $display("TEST CASE FAILED");
                                            end
                                        end
                                2'b10 : begin
                                            if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                                                if(ahb_write.writedata[i][31:16] == ahb_read.readdata[i][31:16]) begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i][31:16],ahb_read.readaddr[i],ahb_read.readdata[i][31:16]);
                                                    $display("TEST CASE PASSED");
                                                    counter = counter + 1;
                                                    if(counter == DEPTH) begin
                                                        $display("TOTAL TESTCASE PASSED");
                                                        counter = 0;
                                                    end
                                                end else begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                                end
                                            end else begin
                                                $display("TEST CASE FAILED");
                                            end
                                        end
                            endcase
                        end
                2'b00 : begin
                            case(ahb_write.writeaddr[i][1:0])
                                2'b00 : begin
                                            if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                                                if(ahb_write.writedata[i][7:0] == ahb_read.readdata[i][7:0]) begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i][7:0],ahb_read.readaddr[i],ahb_read.readdata[i][7:0]);
                                                    $display("TEST CASE PASSED");
                                                    counter = counter + 1;
                                                    if(counter == DEPTH) begin
                                                        $display("TOTAL TESTCASE PASSED");
                                                        counter = 0;
                                                    end
                                                end else begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                                end
                                            end else begin
                                                $display("TEST CASE FAILED");
                                            end
                                        end
                                2'b01 : begin
                                            if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                                                if(ahb_write.writedata[i][15:8] == ahb_read.readdata[i][15:8]) begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i][15:8],ahb_read.readaddr[i],ahb_read.readdata[i][15:8]);
                                                    $display("TEST CASE PASSED");
                                                    counter = counter + 1;
                                                    if(counter == DEPTH) begin
                                                        $display("TOTAL TESTCASE PASSED");
                                                        counter = 0;
                                                    end
                                                end else begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                                end
                                            end else begin
                                                $display("TEST CASE FAILED");
                                            end
                                        end
                                 2'b10 : begin
                                            if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                                                if(ahb_write.writedata[i][23:16] == ahb_read.readdata[i][23:16]) begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i][23:16],ahb_read.readaddr[i],ahb_read.readdata[i][23:16]);
                                                    $display("TEST CASE PASSED");
                                                    counter = counter + 1;
                                                    if(counter == DEPTH) begin
                                                        $display("TOTAL TESTCASE PASSED");
                                                        counter = 0;
                                                    end
                                                end else begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                                end
                                            end else begin
                                                $display("TEST CASE FAILED");
                                            end
                                        end
                                2'b11 : begin
                                            if(ahb_write.writeaddr[i] == ahb_read.readaddr[i]) begin
                                                if(ahb_write.writedata[i][31:24] == ahb_read.readdata[i][31:24]) begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i][31:24],ahb_read.readaddr[i],ahb_read.readdata[i][31:24]);
                                                    $display("TEST CASE PASSED");
                                                    counter = counter + 1;
                                                    if(counter == DEPTH) begin
                                                        $display("TOTAL TESTCASE PASSED");
                                                        counter = 0;
                                                    end
                                                end else begin
                                                    $display(" WRITE ADDRESS = %h, WRITE_DATA = %h, READ_ADDRESS = %h, READ_DATA =%h",ahb_write.writeaddr[i],ahb_write.writedata[i],ahb_read.readaddr[i],ahb_read.readdata[i]);
                                                end
                                            end else begin
                                                $display("TEST CASE FAILED");
                                            end
                                        end
                            endcase
                      end
             endcase
        end
   end
   endtask
   
   task ahb_write;
      input  [2:0]   hburst;
      input [1:0]    hsize;
      input [3:0]    adr_incr;
      input          iter;
      
      reg [AHB_DWIDTH -1 :0] writedata[DEPTH - 1 : 0];
      reg [AHB_AWIDTH -1 :0] writeaddr[DEPTH - 1 : 0];
      
      integer        i;
      integer        cnt;
      integer        iter;
      
      reg [AHB_DWIDTH-1:0] hwdata;
      begin
         case (hsize[1:0])
           2'b00: haddr = start_waddr + adr_incr;
           2'b01: haddr = start_waddr + (2*adr_incr);
           2'b10: haddr = start_waddr + (4*adr_incr);
           2'b11: haddr = start_waddr;
         endcase
         init_addr = haddr;
         set_wraddr_incr_value(hsize);

         @ (posedge HCLK);
         @ (posedge HCLK);

         // First non-seq cycle 
         HSEL   = HIGH; 
         HTRANS = NONSEQ;
         HADDR  = haddr;
         HBURST = hburst;
         HWRITE = WRITE;
         HSIZE  = hsize;

         wait (HREADYOUT);

         set_wraddr_incr_value(hsize);         
         haddr_set = haddr_incr;

         for(cnt = 0; cnt < iter; cnt = cnt+1) begin                    
            @ (posedge HCLK); 
            hwdata = $random; 
            wait (HREADYOUT);
            

            // Subsequent cycle - ready high for previous cycle
            HWDATA = hwdata;
            
            writeaddr[cnt] = HADDR;
            writedata[cnt] = hwdata;
            
            HTRANS = NONSEQ;
            HADDR  = HADDR+haddr_set;
            
            set_wraddr_incr_value(hsize);
            haddr_set = haddr_incr;
            @ (posedge HCLK);          

            wait (HREADYOUT);

            // latch write response here
            write_resp = HRESP[1:0];

         end // for (cnt = 0; cnt < iter; cnt = cnt+1)
         
         //cnt = cnt + 1;
         //wait (HREADYOUT);
         @ (posedge HCLK);
         hwdata = $random; 
         HWDATA = hwdata;

         writeaddr[cnt] = HADDR;
         writedata[cnt] = hwdata;
         
         // Last non-seq cycle 
         @ (posedge HCLK);
         HSEL   = LOW; 
         HTRANS = IDLE;
         HBURST = SINGLE;
         HWRITE = READ;
         HSIZE  = 3'b000;
         
      end     
   endtask // ahb_write
 
   task ahb_address;
      input  [1:0]   w_hw_b;
      begin
      end
   endtask // ahb_address

   assign HREADYIN = HREADYOUT;
   
   task ahb_read;
      input  [2:0]   hburst;
      input [1:0]    hsize;
      input [3:0]    adr_incr;
      input          iter;
      integer        i;
      integer        iter;
      integer        cnt;
      reg [AHB_DWIDTH-1:0] hrdata;
      
      reg [AHB_DWIDTH -1 :0] readdata[DEPTH - 1 : 0];
      reg [AHB_AWIDTH -1 :0] readaddr[DEPTH - 1 : 0];

      begin
         case (hsize[1:0])
           2'b00: haddr = start_raddr + adr_incr;
           2'b01: haddr = start_raddr + (2*adr_incr);
           2'b10: haddr = start_raddr + (4*adr_incr);
           2'b11: haddr = start_raddr;
         endcase
         init_addr = haddr;
         set_wraddr_incr_value(hsize);

         @ (posedge HCLK);
         @ (posedge HCLK);

         // First non-seq cycle 
         HSEL   = HIGH; 
         HTRANS = NONSEQ;
         HADDR  = haddr;
         HBURST = hburst;
         HWRITE = READ;
         HSIZE  = hsize;
       
         //wait (HREADYOUT);

         set_wraddr_incr_value(hsize);
         hraddr_set = haddr_incr;

         for(cnt = 0; cnt < iter; cnt = cnt+1) begin       
            @ (posedge HCLK);
            wait (HREADYOUT);
            //hrdata = HRDATA;
            
           // readdata[cnt] = hrdata;
            readaddr[cnt] = HADDR;

            // Second cycle - ready high for previous cycle
            HSEL   = HIGH; 
            HTRANS = NONSEQ;
            HADDR  = HADDR+hraddr_set;
            HBURST = hburst;
            HWRITE = READ;
            HSIZE  = hsize;

            set_wraddr_incr_value(hsize);
            hraddr_set = haddr_incr;
            @ (posedge HCLK);       
            wait (HREADYOUT);
            @ (negedge HCLK);       
            readdata[cnt] = HRDATA;
         end

         wait (HREADYOUT);
         @ (posedge HCLK);       
         // Last non-seq cycle 
         HSEL   = LOW; 
         HTRANS = IDLE;
         HBURST = 3'b000;
         HWRITE = 1'b0;
         HSIZE  = 3'b000;
         
         //cnt =cnt + 1;
         wait (HREADYOUT);
         readaddr[cnt] = HADDR;
         @ (posedge HCLK);       
         wait (HREADYOUT);
         @ (negedge HCLK);       
         readdata[cnt] = HRDATA;
         hrdata = HRDATA;

      end
   endtask // ahb_read
  
  task set_number_of_transfers;
    input  [1:0]  size;
    output [3:0]  transcount;
    begin
        transcount = 4'b1000 >> size;
    end
  endtask

  task ahb_write_busy_cycle;
    input  [2:0]   hburst;
    input  [1:0]   hsize;
    input  [3:0]   adr_incr;
    integer i;
    reg    [AHB_DWIDTH-1:0]  hwdata;
    begin
      case (hsize[1:0])
        2'b00: haddr = 32'h1111_AA20+adr_incr;
        2'b01: haddr = 32'h1111_AA20+(2*adr_incr);
        2'b10: haddr = 32'h1111_AA20+(4*adr_incr);
        2'b11: haddr = 32'h1111_AA20;
      endcase
      init_addr = haddr;
      hwdata = $random; 
      set_wraddr_incr_value(hsize);
//      set_hburst_value(hburst);
      @ (posedge HCLK);
      @ (posedge HCLK);
      // First non-seq cycle 
      HSEL   = HIGH; 
      HTRANS = NONSEQ;
      HADDR  = haddr;
      HBURST = hburst;
      HWRITE = WRITE;
      HSIZE  = hsize;
//      HREADYIN = HIGH;
      HWDATA = {AHB_DWIDTH{1'b0}};
      wait (HREADYOUT);
      @ (posedge HCLK);
      // Second cycle - ready low from master
      HTRANS = BUSY;
      set_haddr(init_addr,haddr,hsize,haddr_w);
      HADDR  = haddr_w;
      HWDATA = hwdata;
//      HREADYIN = HIGH;
      wait (HREADYOUT);
      @ (posedge HCLK);
      // Third cycle - ready high for previous cycle
      HTRANS = SEQ;
      HADDR  = haddr_w;
      HWDATA = $random;
//      HREADYIN = HIGH;
      wait (HREADYOUT);
      @ (posedge HCLK);

      for (i=0;i<hburst_value;i=i+1) begin
        HTRANS = SEQ;
        set_haddr(init_addr,haddr_w,hsize,haddr_w);
        //hwdata = hwdata + 2'b01;
        hwdata = $random;
        HADDR  = haddr_w;
        HWDATA = hwdata;
//        HREADYIN = HIGH;
        wait (HREADYOUT);
        @ (posedge HCLK);
      end

      // wait for write response from slave side
      wait (HREADYOUT);
      // latch write response here
      write_resp = HRESP[1:0];
      // After completion of last cycle 
     // @ (posedge HCLK);
      HSEL   = LOW; 
      HTRANS = IDLE;
      HADDR  = 32'h0000_0000;
      HBURST = 3'b000;
      HWRITE = 1'b0;
      HSIZE  = 3'b000;
//      HREADYIN = LOW;
      HWDATA = {AHB_DWIDTH{1'b0}};
      @ (posedge HCLK);
    end
  endtask // ahb_write_busy_cycle

  task set_wraddr_incr_value;
    input  [1:0]   hsize;
    begin
      case (hsize) 
        2'b00 : haddr_incr = 4'h1;
        2'b01 : haddr_incr = 4'h2;
        2'b10 : haddr_incr = 4'h4;
        2'b11 : haddr_incr = 4'h8;
      endcase
    end
  endtask

  task set_wrap_value;
    begin
      case (HBURST[2:0]) 
        3'b010 : if (HSIZE == 2'b10) begin
                   set_wrap_addr = 8'h0C;
                 end else if (HSIZE == 2'b01) begin
                   set_wrap_addr = 8'h06;
                 end else if (HSIZE == 2'b00) begin
                   set_wrap_addr = 8'h03;
                 end
        3'b100 : if (HSIZE == 2'b10) begin
                   set_wrap_addr = 8'h1C;
                 end else if (HSIZE == 2'b01) begin
                   set_wrap_addr = 8'h0E;
                 end else if (HSIZE == 2'b00) begin
                   set_wrap_addr = 8'h07;
                 end
        3'b110 : if (HSIZE == 2'b10) begin
                   set_wrap_addr = 8'h3C;
                 end else if (HSIZE == 2'b01) begin
                   set_wrap_addr = 8'h1E;
                 end else if (HSIZE == 2'b00) begin
                   set_wrap_addr = 8'h0F;
                 end
        default : set_wrap_addr = 8'h00;
      endcase
    end
  endtask

  task set_haddr;
    input  [31:0]  initaddr;
    input  [31:0]  haddr;
    input  [1:0]   hsize;  // 00-byte, 01-halfword, 10-word, 11-doubleword
    output [31:0]  haddr_out;
    reg    [31:0]  haddr_reg;
    reg    [3:0]   LAST_NIBBLE;
    begin
      case (hsize) 
        2'b00: LAST_NIBBLE = 4'hF;  // Byte
        2'b01: LAST_NIBBLE = 4'hE;  // Halfword
        2'b10: LAST_NIBBLE = 4'hC;  // Word
      endcase 
      set_wrap_value;
      haddr_reg = haddr;
      if (wrap_enable) begin
        //if ((haddr_reg[3:0] == 4'hC) && (haddr_reg[7:4] == initaddr[7:4])) begin
        if ((haddr_reg[3:0] == LAST_NIBBLE) && (haddr_reg[7:4] == initaddr[7:4])) begin
          haddr_reg = haddr_reg - set_wrap_addr;
        end
        else begin
          haddr_reg  = haddr_reg + haddr_incr;
        end
      end
      else begin
        haddr_reg  = haddr_reg + haddr_incr;
      end
      haddr_out = haddr_reg;
    end   
  endtask // set_haddr

  task tcstatus();
    begin
      error_count = error_count_0 + error_count_1;
      #100;   // wait to finish all DUT process
      $display(">>>>>>>>>>>>   TOTAL NUMBER OF ERRORS:= %0d   <<<<<<<<<<<<<",error_count);
      $display("");
      $display("%0s",pound_str);

      //$write("%c[1;34m",27);
      if (error_count !== 0) begin
      $display("\t\t\t TESTCASE FAIL");
      end
      else begin
      $display("\t\t\t TESTCASE PASS");
      end
      $write("%c[0m",27);
      $display("%0s",pound_str);
      $display("");
      // color display start
      //$write("%c[1;34m",27);
      //$display("*********** This is in colour ***********");
      //$write("%c[0m",27);
      // color display end
    end
  endtask // tcstatus

  task testcase_start();
    begin
      $display("%0s",test_str);
      $display("\t\t\t TESTCASE START");
      $display("%0s",test_str);
    end
  endtask // testcase_start

  task testcase_end();
    begin
      $display("%0s",test_str);
      $display("\t\t\t TESTCASE END");
      $display("%0s",test_str);
    end
  endtask // testcase_end

//#############################################################################


   
    HPMS_0_COREAHBLSRAM_0_COREAHBLSRAM # (
                           .AHB_AWIDTH(AHB_AWIDTH),
                   .AHB_DWIDTH(AHB_DWIDTH),
                           .FAMILY(FAMILY),
                               .LSRAM_NUM_LOCATIONS_DWIDTH32(LSRAM_NUM_LOCATIONS_DWIDTH32),
                               .USRAM_NUM_LOCATIONS_DWIDTH32(USRAM_NUM_LOCATIONS_DWIDTH32),
                               .SEL_SRAM_TYPE(SEL_SRAM_TYPE)
                               ) COREAHBLSRAM_0 (
                                      .HCLK(HCLK),    
                                      .HRESETN(HRESETN),
                                      .HSEL(HSEL),
                                      .HWRITE(HWRITE),
                                      .HADDR(HADDR),
                                      .HWDATA(HWDATA),
                                      .HRDATA(HRDATA),
                                      .HSIZE(HSIZE),
                                      .HTRANS(HTRANS),
                                      .HBURST(HBURST),
                                      .HRESP(HRESP),
                                      .HREADYIN(HREADYIN),
                                      .HREADYOUT(HREADYOUT)
                                      );






   
endmodule
