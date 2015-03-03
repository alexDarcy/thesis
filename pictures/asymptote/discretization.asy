pair a, b, c, d;
pair a1, c1;
real off = 0.3;

size(150);
a = (0,0);
b = (1,0);
c = (1,1);
d = (0,1);

draw(a--b--c--d--cycle);

c1 = d+0.6*(c-d);
a1 = a+0.3*(b-a);

// Draw other cells
draw(a--a-(off,0));
draw(a1--a1-(0,off));
draw(b--b+(off,0));

draw(d--d-(off,0));
draw(c1--c1+(0,off));
draw(c--c+(off,0));

// Draw position of quantities
dot(Label("$q_{ij}$"), 0.5*(a+c));
dot(Label("$v_{i-1j1}$", align=N), 0.5*(d+c1));
dot(Label("$v_{i-1j2}$", align=N), 0.5*(c+c1));
dot(Label("$v_{ij3}$", align=S), 0.5*(a+a1));
dot(Label("$v_{ij4}$",align=S) ,0.5*(a1+b));
dot(Label("$u_{ij}$",align=W),0.5*(a+d));
dot(Label("$u_{ij+1}$",align=E),0.5*(b+c));

