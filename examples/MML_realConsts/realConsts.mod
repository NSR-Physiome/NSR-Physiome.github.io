// Variable Consts example
import  nsrunit; unit conversion on;
math VarConsts {        
real Rgas   = 8.31441 J/(mol*K),         
     Temp   = 310.16 K,                
     RT     = Rgas*Temp,           
     Farad  = 96484.56 coulomb/mol;  
real Temp2 = 310.16;
real x volt; 
real xx volt;
real xxx volt, // All three give same value in source code:   
  x    = (8.31441*310.16)/(96484.56);
  xx   = (8.31441*Temp2)/(96484.56);  
  xxx  = Rgas*Temp/Farad;  
}
