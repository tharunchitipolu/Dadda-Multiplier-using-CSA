
//self checking test bench for 8*8 dadda
module dadda_8TB();


parameter M=8,N=8;

reg [N-1:0]A;
reg [M-1:0]B;
wire [N+M-1:0]y;



//---- Instantiation of main test module----
//Array_MUL_USign #(64,64) UUT(A,B,Y); //M=4,N=6
 dadda_8 UUT(.A(A),.B(B),.y(y));


// initializing the inputs to the test module
// initial block executes only once
initial
repeat(15)
begin
	#10 A = $random; B = $random;
	#100//give required simulation time to complete the operation one by one.
	#100
	#10
	//-----VERIFICATION OF THE OBTAINED RESULT WITH EXISTING RESULT------
	$display(" A=%d,B=%d,AxB=%d",(A),(B),(y));

	if( (A)*(B) != (y)) 
		$display(" *ERROR* ");

end

endmodule


