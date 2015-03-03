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

c1 = d+0.65*(c-d);
a1 = a+0.3*(b-a);

// Draw cell
draw(a-(off,0)--b+(off,0));
draw(d-(off,0)--c+(off, 0));
draw(a-(0, off)--d+(0, off));
draw(b-(0, off)--c+(0, off));

// Merid
pair dir = (0,1);
draw_interface(a, b, (0,1), "$F_{i,j+1/2}$");
draw_interface(d, c, (0,1), "$F_{i,j-1/2}$");
draw_interface(a, d, (-1, 0), "$F_{i-1/2,j}$");
draw_interface(b, c, (-1, 0), "$F_{i+1/2,j}$");

//label("$ij$", 0.5*(a+c));
