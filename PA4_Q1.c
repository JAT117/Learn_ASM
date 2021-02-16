#include <stdio.h>

float force(float mass, float acc){         // function to find force
	return (mass * acc); 	                    // finding the force
}


float KE(float mass, float vel){            // function to find kinetic energy
	return (mass *(vel * vel))/2;           // finding kinetic energy
}



int main(int argc, char **argv){
	float m, a, v, f, k;                   //declare variables

	printf("mass = ");                     //ask user to enter mass
	scanf("%f",&m);                        // scan input value
    printf("velocity = ");                 //ask user to enter velocity
	scanf("%f",&v);                        // scan input value
    printf("acceleration = ");             //ask user to enter mass acceleration
	scanf("%f",&a);                        //scan input value
	printf("\nForce= %.2f\nKinectic Energy= %.2f\n",f = force(m, a),k = KE(m, v));	//output the force and kinectic energy
return 0;
}
