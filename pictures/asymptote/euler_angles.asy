import graph3;

size3(200,200,150,IgnoreAspect);
scale(true);

currentprojection=orthographic(8,6,8);

triple orig = (0,0,0);
triple ux = (1,0,0);
triple uy = (0,1,0);
triple uz = (0,0,1);

// Global config
real theta = 20;
arrowbar3 arrow = ArcArrow3(HookHead3,3);

// First rotation
triple ux2 = rotate(theta, uz)*ux;
pen p=dashed;
draw(Label("$x_2$", EndPoint), orig--ux2, p, Arrow3);
//label("$x_2$", ux2);
draw(arc(orig,0.8,90,0,90,theta), arrow);

triple uy2 = rotate(theta, uz)*uy;
draw(Label("$y_2=y_3$", EndPoint), orig--uy2, p, Arrow3);
draw(arc(orig,0.5,90,90,90,90+theta), arrow);

// Second rotation
p = linewidth(1);
triple uz3 = rotate(theta, uy2)*uz;
draw(Label("$z_3$", EndPoint), orig--uz3, p, Arrow3(4));
draw(arc(orig,0.5,0,0,theta,theta), arrow);

triple ux3 = rotate(theta, uy2)*ux2;
draw(Label("$x_3$", EndPoint), orig--ux3, p, ArcArrow3(4));
draw(arc(orig,0.5,90,theta,90+theta,theta), arrow);

axes3("$x$","$y$","$z$", (0,0,0), ArcArrow3);
