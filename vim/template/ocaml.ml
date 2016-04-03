(*    
 *    Title	      :
 *    Author 	  : Gasparina Damien
 *    Description :
 *
 *)


let main x = () ;;

let _ = 
  for i = 1 to  Array.length Sys.argv - 1 do
      main x;
      print_newline ()
  done
