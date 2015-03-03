prologues := 2; % Necessary for good BB !
u:=1cm;
nb_lat2 := 90;
nb_lat := 2*nb_lat2;
input hatching

% Number of cells at line i
vardef get_nb_cells(expr i)=
  if (i = 0) :
    nb := 11;
  elseif (i = n-1):
    nb := 15;
  else:
    nb := 7 + 2*i
  fi;
  nb
enddef;

vardef get_start(expr i)=
  if (i = 0) :
    start := 5.2;
  elseif (i = 1) :
    start := 5.5;
  elseif (i = 2) :
    start := 5;
  elseif (i = 3) :
    start := 4.5;
  elseif (i = 4) :
    start := 4;
  elseif (i = 5) :
    start := 3.5;
  else:
    start := 3;
  fi;
  start*u
enddef;

% Draw a single cell
def draw_cell(expr j,i,inside)=
  path p;
  j_next := j+step_x;
  i_next := i+step_y;
  p :=(j,i)--(j_next,i)--(j_next,i_next)--(j,i_next)--cycle;
  % 1 for boundary, 2 for ghost cell
  if (inside = 1):
    fill p withcolor 0.5white;
  elseif (inside = 2):
    hatchfill p withcolor (45,2mm,-1pt);
  fi;
  draw p; 

enddef;

vardef set_fill(expr i,j,nb_cells)=
  % Default is a normal cell
  inside := -1;

  % Zonal
  if (boundary = 1):
    if ((j = 0) or (j = nb_cells-1)):
      inside := 1;
    fi;

  % Meridional
  elseif (boundary = 2):
    % Ghost cells
    if ((i = 0) or(i = n-1)): inside := 2;
    elseif ((i = 1) or(i = n-2)): inside := 1;
    else:
      % West boundary cell
      if ((i > 1) and (j < 1)): inside := 1; fi;

     % East boundary cell
     if ((i < n-1) and (j > nb_cells-2)): inside := 1; fi;
    fi;
  fi;
  inside
enddef;

%Draw a line of cells
def draw_line(expr i,n)=
  i_cur := height - i*step_y;
  nb_cells := get_nb_cells(i);
  step_x := width/nb_cells;
  if (i = 0):
    step_x := u;
  elseif (i = n-1):
    step_x := 0.7*u;
  fi;

  offset := get_start(i);
  for j=0 upto nb_cells-1:
    inside := set_fill(i,j,nb_cells);
    j_cur := offset + j*step_x;
    draw_cell(j_cur,i_cur,inside);
  endfor;
  if (boundary = 1):
    j_cur := offset - step_x;
    draw_cell(j_cur,i_cur,2);
    j_cur := offset + width;
    draw_cell(j_cur,i_cur,2);
  elseif (boundary = 2):
    if ((i > 0) and (i < n-1)):
      j_cur := offset-step_x;
      draw_cell(j_cur,i_cur,2);

      j_cur := offset + width;
      draw_cell(j_cur,i_cur,2);
    fi;
  fi;
enddef;

def draw_grid(expr n)=
  width := 10*u;
  height := 10*u;
  step_y := u;

  for i=1 upto n-2:
    draw_line(i,n);
  endfor;
  if (boundary = 2):
    draw_line(0,n);
    draw_line(n-1,n);
  fi;
enddef;

def draw_element(expr text,inside)=
  draw_cell(x_pos,y_pos0,inside);
  x_pos := x_pos + delta;
  pI := text infont "cmtex10" scaled 1.8 shifted (x_pos,y_pos1);
  draw pI;
  dim := (lrcorner pI) - (llcorner pI);
  x_pos := x_pos + xpart(dim) + delta;
enddef;

def legend(expr n)=
  picture pI;
  pair dim;
  step_x := u;
  step_y := u;
  y_pos0 := 2.3*u;
  y_pos1 := y_pos0 + 0.3*step_x;
  x_pos := 0.5*u;
  delta := 1.2*step_x;

  draw_element("Ghost cells",2);
  draw_element("Boundary",1);
  draw_element("Interior",-1);
enddef;

n := 7;
boundary := 0;
%filenametemplate "band_grid.mps";
%beginfig(1);
%  draw_grid(n);
%endfig;

boundary := 1;
filenametemplate "ghost_cells_we.mps";
beginfig(1);
  draw_grid(n);
  legend(n);
endfig;

boundary := 2;
filenametemplate "ghost_cells_ns.mps";
beginfig(1);
  draw_grid(n);
%  legend(n);
endfig;

end
