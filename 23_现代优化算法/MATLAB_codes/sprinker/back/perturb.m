function pipeNew = perturb(pipe, HeadPos, T)
scalePos = 60*T;
scaleAng = pi*T;
pipeNew = pipe;

for i = 1:length(pipe)
    pipeNew(i).pos = pipe(i).pos + scalePos * [0.5-rand(1,2)];
    pipeNew(i).ang = pipe(i).ang + scaleAng * [0.5-rand(1,1)];

    x = pipeNew(i).pos(1) + cos(pipeNew(i).ang) * HeadPos;
    y = pipeNew(i).pos(2) + sin(pipeNew(i).ang) * HeadPos;
    
    if any(x<0|x>80) | any(y<0|y>30)
        pipeNew(i) = pipe(i);
    end
end