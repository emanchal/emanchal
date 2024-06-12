//write a 4 bit priority counter 
//truth table
//   inputs       output
//  p3 p2 p1 p0   y
//  0  0  0  0    0
//  1  0  0  0    p3
//  0  1  0  0    p2
//  0  0  1  0    p1
//  0  0  0  1    p0

module priority_counter;
  inputs p3, p2, p1, p0;
  outputs y;
  
  //design code
  always @ ( p0 or p1 or p2 or p3)
    begin
    case 0000;
      y = 0;
    case 1000;
      y= p3;
    case 0100;
      y= p2;
    case 0010;
      y = p1;
    case 0001;
      y = p0;
    default y = 0;
      end
  
endmodule
