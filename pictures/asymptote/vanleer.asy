pair a, b, c, d;
pair e, f, g;
pair c1, d1, e1;
pair tmp, offset;

// Figure 1

size(300);
a = (1,1);
b = (xpart(a),3);
d = (3,1);
c = (xpart(d),3.5);
draw(a--b--c--d--cycle);

c1 = b + 0.7(c-b);
d1 = a + 0.7(d-a);
fill(c1--c--d--d1--cycle,0.7white);
draw(c1--c--d--d1--cycle);

e = (xpart(d), 4);
g = (5, ypart(a)) ;
f = (xpart(g), 4.5);
draw(d--e--f--g--cycle);

dot(Label("$q_i$", align=N), 0.5*(b+c));
dot(Label("$q_{i+1}$", align=N), 0.5*(e+f));
dot(shift(9,0)*Label("$\hat{q}_{i+1/2}$", align=E), 0.5(c1+c));
dot(Label("${1 \over 2} (1-{u_{i+1/2} \Delta t \over \Delta x})$", align=S), 
    0.5*(d1+d));
tmp = 0.5(c+d);
draw(Label("$u_{i+1/2}$"),tmp--tmp+(1,0), Arrow);

// Figure 2

offset = (5,0);
a = (1,1) + offset;
b = (xpart(a),3);
d = (3,1) + offset;
c = (xpart(d),3.5);
draw(a--b--c--d--cycle);

e = (xpart(d), 4);
g = (5, ypart(a)) + offset ;
f = (xpart(g), 4.5);

e1 = e + 0.3(f-e);
d1 = d + 0.3(g-d);
draw(d--g--f--e--cycle);
fill(d--d1--e1--e--cycle,0.7white);
draw(d--d1--e1--e--cycle);

dot(Label("$q_i$", align=N), 0.5*(b+c));
dot(Label("$q_{i+1}$", align=N), 0.5*(e+f));
dot(Label("$\hat{q}_{i+1/2}$", align=N), 0.5(e1+e));
dot(Label("${1 \over 2} (1+{u_{i+1/2} \Delta t \over \Delta x})$", align=S), 
    0.5*(d1+d));
tmp = 0.5(d+e);
draw(Label("$u_{i+1/2}$"),tmp--tmp-(1,0), Arrow);
