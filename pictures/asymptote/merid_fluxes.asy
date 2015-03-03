pair a, b, c, d;
pair a1, c1;
real off = 0.3;

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

c1 = d+0.65*(c-d);
a1 = a+0.3*(b-a);

// Draw other cells
draw(a--a-(off,0));
draw(a1--a1-(0,off));
draw(b--b+(off,0));

draw(d--d-(off,0));
draw(c1--c1+(0,off));
draw(c--c+(off,0));

// Merid
pair dir = (0,1);
draw_interface(a, a1, dir, "$v_{ij3}$");
draw_interface(a1, b, dir, "$v_{ij4}$");
draw_interface(d, c1, dir, "$v_{i-1j1}$");
draw_interface(c1, c, dir, "$v_{i-1j2}$");

label("$ij$", 0.5*(a+c));

//dir = (-1,0);
//draw_interface(a, d, dir, "$u_{ij}$");
//draw_interface(b, c, dir, "$u_{ij+1}$");

