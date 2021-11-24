%___________________________________________________________________%
%  Grey Wolf Optimizer (GWO) for PV system under PSC                %
%                                                                   %
%  Developed in MATLAB R2021b                                       %
%                                                                   %
%       Detect Vpv and Ipv from the solar panel as input            %
%               to the function                                     %
%                                                                   %
%       Returns Duty cycle as output for the switching device       %
%                in the boost converter                             %
%___________________________________________________________________%
function D = GWO_code(Vpv,Ipv)
persistent u;
persistent d_current;
persistent pbest;
persistent p;
persistent dc;
persistent v;
persistent count;
persistent gbest;
if(isempty(count))
    count=0;
end
if(isempty(d_current))
    d_current=0.9;
end
if(isempty(gbest))
    gbest=0.9;
end
if(isempty(p))
    p=zeros(4,1);
end

if(isempty(v))
    v=zeros(4,1);
end

if(isempty(pbest))
    pbest=zeros(4,1);
end
if(isempty(u))
    u=0;
end
if(isempty(dc))
    dc=zeros(4,1);
    dc(1)=0;
    dc(2)=0.1;
    dc(3)=0.5;
    dc(4)=0.5;
end
if(count>=1 && count<300)
    D=d_current;
    count=count+1;
    return;
end
count=0;

if(u>=1 && u<=4)
    if((Vpv*Ipv)>p(u))
        p(u)=Vpv*Ipv;
        pbest(u)=d_current;
    end
end
u=u+1;
if(u==6)
    u=1;
end
if(u==1)
    D=dc(u);
    d_current=D;
    count=1;
    return;
elseif(u==2)
    D=dc(u);
    d_current=D;
    count=1;
    return;
elseif(u==3)
    D=dc(u);
    d_current=D;
    count=1;
    return;
elseif(u==4)
    D=dc(u);
    d_current=D;
    count=1;
    return;
elseif(u==5 )
    [m,i]=max(p);
    gbest=pbest(i);
    D=gbest;
    d_current=D;
    count=1;
    %update velocity
    v(1)=updatevelocity(pbest(1),dc(1));
    v(2)=updatevelocity(pbest(2),dc(2));
    v(3)=updatevelocity(pbest(3),dc(3));
    v(4)=updatevelocity(pbest(4),dc(4));
    %update duty cycle
    dc(1)=updateduty(v(1),gbest);
    dc(2)=updateduty(v(2),gbest);
    dc(3)=updateduty(v(3),gbest);
    dc(4)=updateduty(v(4),gbest);
    
    return;
    
else
    D=0.1;
    
end


end
function velocity_final = updatevelocity(p_best,d)
r2 = rand;
C = 2*r2;    % C = 2 * r2 where r2 is a random vector with value between 1 and 0
velocity_final = (C*p_best-d);
end
function duty_final = updateduty(velocity,g_best)
r1 = rand;
A = 2*0.1*r1-0.1;   % A = 2 * 0.1 * r1 - 0.1 where r1 is a random vector with value between 1 and 0
d1 = g_best-A*velocity;   % D1 = D(alpha) - A * E where D is the postition vector of a particular grey wolf
if(d1>1)
    duty_final = 1;
elseif(d1<0.1)
    duty_final = 0.1;
else
    duty_final = d1;
end
end