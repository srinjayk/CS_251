//Srinjay Kumar

use std::*;
use std::io;


fn main() {

	//the number of test cases
	let mut n;

	//the coordinates for the first point
	let mut x1;
	let mut y1;
	let mut z1;

	//the coordinates for the second point
	let mut x2;
	let mut y2;
	let mut z2;

	//the coordinates for the third point
	let mut x3;
	let mut y3;
	let mut z3;

	//the coordinates for the fourth point
	let mut x4;
	let mut y4;
	let mut z4;

	//the coordinates for the test point
	let mut x5;
	let mut y5;
	let mut z5;

	
	io::stdin().read_line(& mut n).expect("\n");

	for n in 1..101 {

		io::stdin().read_line(& mut x1).expect("");
		io::stdin().read_line(& mut y1).expect("");
		io::stdin().read_line(& mut z1).expect("\n");

		io::stdin().read_line(& mut x2).expect("");
		io::stdin().read_line(& mut y2).expect("");
		io::stdin().read_line(& mut z2).expect("\n");

		io::stdin().read_line(& mut x3).expect("");
		io::stdin().read_line(& mut y3).expect("");
		io::stdin().read_line(& mut z3).expect("\n");

		io::stdin().read_line(& mut x4).expect("");
		io::stdin().read_line(& mut y4).expect("");
		io::stdin().read_line(& mut z4).expect("\n");
	
		io::stdin().read_line(& mut x5).expect("");
		io::stdin().read_line(& mut y5).expect("");
		io::stdin().read_line(& mut z5).expect("");

		let a4 = x4 - x1;
		let b4 = y4 - y1;
		let c4 = z4 - z1;

		let a2 = x2 - x1;
		let b2 = y2 - y1;
		let c2 = z2 - z1;

		let m1 = x5 - x1;
		let n1 = y5 - y1;
		let o1 = z5 - z1;

		let m4 = x5 - x4;
		let n4 = y5 - y4;
		let o4 = z5 - z4;

		let m2 = x5 - x2;
		let n2 = y5 - y2;
		let o2 = z5 - z2;

		let dot_product1 = a4*m1 + b4*n1 + c4*o1;
		let dot_product2 = (-a4)*m4 + (-b4)*n4 + (-c4)*o4;
		let dot_product3 = a2*m1 + b2*n1 + c2*o1;
		let dot_product4 = (-a2)*m2 + (-b2)*n2 + (-c2)*o2;

		int sign1 = dot_product1*dot_product2;
		int sign2 = dot_product4*dot_product3;

		if sign1 < 0 && sign2 < 0 {
   		     print!("The point is inside \n");
   		} else {
    	    print!("The point is not inside\n");
    	}
    }	
	
	
	/*let mut s =String::new();
	println!("Press Enter to Start The Game");	
	io::stdin().read_line(& mut s).expect("");
	let mut arr = [[0u8; 4]; 6];		//all initialized to 7
	arr[0_usize][0_usize] = 7;
	arr[0_usize][1_usize] = 7;
	arr[0_usize][2_usize] = 7;
	arr[1_usize][0_usize] = 7;
	arr[1_usize][1_usize] = 7;
	arr[1_usize][2_usize] = 7;
	arr[2_usize][0_usize] = 7;
	arr[2_usize][1_usize] = 7;
	arr[2_usize][2_usize] = 7;
	let mut x=true;
	let mut i:u32;
	let mut cntr=0;
	let mut inv=false;
	let mut ow=false;
	let mut xw=false;
	let mut dr=false;
	loop
	{
		println!("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");		//clear console
		if inv
		{
			println!("Input was Invalid Play Again\n");
			inv=false;
		}
		if x{println!("O Turn");}
		else{println!("X Turn");}
		println!("_____________");		//custom formatting
		for mut i in 0..3
		{
			print!("| ");
			for mut j in 0..3
			{
				if arr[i][j]==1{print!("{} ",'X');}
				else if arr[i][j]==0{print!("{} ",'O');}
				else{print!("{} ",' ');}
				print!("| ");
				
			}
			
			
			println!("");
			println!("|___|___|___|");		//custom formatting
			
		}
		println!();
		let mut str =String::new();
		io::stdin().read_line(& mut str).expect("");
		cntr+=1;
		i=str.trim().parse().unwrap();
		let mut a=0;
		let mut b=0;
		if i==7{a=0;b=0;}
		if i==8{a=0;b=1;}
		if i==9{a=0;b=2;}
		if i==4{a=1;b=0;}
		if i==5{a=1;b=1;}
		if i==6{a=1;b=2;}
		if i==1{a=2;b=0;}
		if i==2{a=2;b=1;}
		if i==3{a=2;b=2;}
		if x
		{
			if arr[a][b]!=7
			{
				
				inv=true;
				x=true;
				cntr-=1;
				continue;	
			}
			else
			{
				arr[a][b]=0;
				x=false;
			}
		}
		else
		{
			if arr[a][b]!=7
			{
				inv=true;
				x=false;
				cntr-=1;
				continue;	
			}
			else
			{
				arr[a][b]=1;
				x=true;
			}
		}
		//first row
		if arr[0][0]==0&&arr[0][1]==0&&arr[0][2]==0{ow=true;break;}
		if arr[0][0]==1&&arr[0][1]==1&&arr[0][2]==1{xw=true;break;}
		//second row
		if arr[1][0]==0&&arr[1][1]==0&&arr[1][2]==0{ow=true;break;}
		if arr[1][0]==1&&arr[1][1]==1&&arr[1][2]==1{xw=true;break;}
		//third row
		if arr[2][0]==0&&arr[2][1]==0&&arr[2][2]==0{ow=true;break;}
		if arr[2][0]==1&&arr[2][1]==1&&arr[2][2]==1{xw=true;break;}
		//first colom
		if arr[0][0]==0&&arr[1][0]==0&&arr[2][0]==0{ow=true;break;}
		if arr[0][0]==1&&arr[1][0]==1&&arr[2][0]==1{xw=true;break;}
		//last colom
		if arr[0][2]==0&&arr[1][2]==0&&arr[2][2]==0{ow=true;break;}
		if arr[0][2]==1&&arr[1][2]==1&&arr[2][2]==1{xw=true;break;}
		//middle colom
		if arr[0][1]==0&&arr[1][1]==0&&arr[2][1]==0{ow=true;break;}
		if arr[0][1]==1&&arr[1][1]==1&&arr[2][1]==1{xw=true;break;}
		//first diagonal
		if arr[0][0]==0&&arr[1][1]==0&&arr[2][2]==0{ow=true;break;}
		if arr[0][0]==1&&arr[1][1]==1&&arr[2][2]==1{xw=true;break;}
		//second diagonal
		if arr[0][2]==0&&arr[1][1]==0&&arr[2][0]==0{ow=true;break;}
		if arr[0][2]==1&&arr[1][1]==1&&arr[2][0]==1{xw=true;break;}
		println!("");
		if cntr==9{dr=true;break;}
	}
	println!("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
		println!("Your Last Play-");
		println!("_____________");
		for mut i in 0..3
		{
			print!("| ");
			for mut j in 0..3
			{
				if arr[i][j]==1{print!("{} ",'X');}
				else if arr[i][j]==0{print!("{} ",'O');}
				else{print!("{} ",' ');}
				print!("| ");
			}
			
			println!("");
			println!("|___|___|___|");
		}
			if ow{println!("\nO wins");}
			if xw{println!("\nX wins");}
			if dr{println!("\nDraw!");}*/
		
}