import graph;
pair a, b, c, d;
pair a1, c1;
pair[] z;
real off = 0.7;

// Draw an interface and a vector at the middle
// dir is the direction of vector 
void draw_interface(pair x, pair y, pair dir, string s) {
  // Orthogonal vector
  pair dx = 0.05*(dir.y, -dir.x);

  // Square and bold
  pen p = linecap(0)+2;
  path line = x+dx--y-dx;
  draw(line, p);
  pair i = midpoint(line);
  draw(i--i-0.3*dir, Arrow);
  if (dir.x == 0) { label(s,align=N,i); }
    else { label(s,align=W,i); }
}

size(150);
//defaultpen(1);
a = (0,0);
b = (1,0);
c = (1,1);
d = (0,1);

draw(a--b--c--d--cycle);

c1 = d+0.7*(c-d);
a1 = a+0.3*(b-a);

// Draw other cells
draw(a--a-(off,0));
draw(a1--a1-(0,off));
draw(b--b+(off,0));

draw(d--d-(off,0));
draw(c1--c1+(0,off));
draw(c--c+(off,0));

// South
z.push(a+(-0.2,-0.4));
z.push(b+(0,-0.4));
// North
z.push(c+(0.2,0.4));
z.push(d+(0.2,0.4));

// Draw neighbour lines
for(int i = 0; i < z.length; ++i){ dot(z[i]);}
//label("$q_{i+1j_3}$", z[0], align=W);
draw(z[0]--z[1], dashed);
draw(z[2]--z[3], dashed);

// Draw interpolation
pair[] interp;
pair center = 0.5*(a+c);
interp.push((center.x, z[0].y));
interp.push((center.x, z[3].y));
draw(interp[0]--center--interp[1], dashed);
dot(Label("$q'_{ij}$", align=E), center);

// Custom cross
pen croix=makepen(scale(4)*cross(4,0.1))+10;
dot(Label("$q''_{i+1j}$",align=S),interp[0], croix);
dot(Label("$q''_{i-1j}$",align=N), interp[1], croix);

