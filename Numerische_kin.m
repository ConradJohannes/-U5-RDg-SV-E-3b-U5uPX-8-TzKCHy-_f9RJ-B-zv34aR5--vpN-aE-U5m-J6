function angels=Numerische_kin(pos)
%% Diese Programm berechnet die Winkel zu einer Position numerisch. Es stellt eine alternative zum algebraischen Ansatz dar.
%%In dieser Iteration wird jedoch nicht auf kollisionen oder die
%%Beschrängkungen denen die Winkel unterliegen geprüft!!.
a=166;
b=218;
c=130;
x=pos(2);
y=pos(1);
z=pos(3)-122;
p=0;
q=0;
r=0;
s=0;
distance=1;
distance_max=sqrt((x-(sin(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s))))^2+(y-(cos(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s))))^2+(z-(a*cos(q)+b*cos(q+r)+c*cos(q+r+s)))^2);
run=0;
Skal=0.01;         %Skalierungsfaktor
while distance>0.01
       % Z=a*cos(q)+b*cos(q+r)+c*cos(q+r+s);        
       % X=sin(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s));
       % Y=cos(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s));
    run=run+1;
    Dp=((c*sin(s+r+q)+b*sin(r+q)+a*sin(q))*(y*sin(p)-x*cos(p)))/sqrt((x-(c*sin(s+r+q)+b*sin(r+q)+a*sin(q))*sin(p))^2+(y-(c*sin(s+r+q)+b*sin(r+q)+a*sin(q))*cos(p))^2+(z-c*cos(s+r+q)-b*cos(r+q)-a*cos(q))^2);   %Ableitung der abstandsfunktion norm([X y Z]-[x y z]) nach p
    Dq=(2*sin(p)*(c*cos(q+s+r)+b*cos(q+r)+a*cos(q))*(sin(p)*(c*sin(q+s+r)+b*sin(q+r)+a*sin(q))-x)+2*cos(p)*(c*cos(q+s+r)+b*cos(q+r)+a*cos(q))*(cos(p)*(c*sin(q+s+r)+b*sin(q+r)+a*sin(q))-y)+2*(c*cos(q+s+r)+b*cos(q+r)+a*cos(q)-z)*(-c*sin(q+s+r)-b*sin(q+r)-a*sin(q)))/(2*sqrt((sin(p)*(c*sin(q+s+r)+b*sin(q+r)+a*sin(q))-x)^2+(cos(p)*(c*sin(q+s+r)+b*sin(q+r)+a*sin(q))-y)^2+(c*cos(q+s+r)+b*cos(q+r)+a*cos(q)-z)^2));   %Ableitung nach q
    Dr=(2*sin(p)*(c*cos(r+s+q)+b*cos(r+q))*(sin(p)*(c*sin(r+s+q)+b*sin(r+q)+a*sin(q))-x)+2*cos(p)*(c*cos(r+s+q)+b*cos(r+q))*(cos(p)*(c*sin(r+s+q)+b*sin(r+q)+a*sin(q))-y)+2*(c*cos(r+s+q)+b*cos(r+q)-z+a*cos(q))*(-c*sin(r+s+q)-b*sin(r+q)))/(2*sqrt((sin(p)*(c*sin(r+s+q)+b*sin(r+q)+a*sin(q))-x)^2+(cos(p)*(c*sin(r+s+q)+b*sin(r+q)+a*sin(q))-y)^2+(c*cos(r+s+q)+b*cos(r+q)-z+a*cos(q))^2));  %Ableitung nach r
    Ds=(c*(((c*sin(p)^2+c*cos(p)^2-c)*cos(s+r+q)+z-b*cos(r+q)-a*cos(q))*sin(s+r+q)+(-cos(p)*y-sin(p)*x+(b*sin(p)^2+b*cos(p)^2)*sin(r+q)+(a*sin(p)^2+a*cos(p)^2)*sin(q))*cos(s+r+q)))/sqrt((x-sin(p)*(c*sin(s+r+q)+b*sin(r+q)+a*sin(q)))^2+(y-cos(p)*(c*sin(s+r+q)+b*sin(r+q)+a*sin(q)))^2+(-c*cos(s+r+q)+z-b*cos(r+q)-a*cos(q))^2); %Ableitung nach s
    % Zusammen stellen Dp, Dq, Dr, und Ds den Gradienten der
    % Abstandsfunktion nach den Winkeln dar. Durch diesen kann man sich den
    % Winkeln bei jedem Durchlauf der Schleife annähern.
    p=p-Skal*Dp*distance/distance_max/(nthroot(run,10));
    q=q-Skal*Dq*distance/distance_max/(nthroot(run,10));
    r=r-Skal*Dr*distance/distance_max/(nthroot(run,10));
    s=s-Skal*Ds*distance/distance_max/(nthroot(run,10));
    distance=sqrt((x-(sin(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s))))^2+(y-(cos(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s))))^2+(z-(a*cos(q)+b*cos(q+r)+c*cos(q+r+s)))^2);
end
pos_x=[0,sin(p)*(a*sin(q)),sin(p)*(a*sin(q)+b*sin(q+r)),sin(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s))];
pos_y=[0,cos(p)*(a*sin(q)),cos(p)*(a*sin(q)+b*sin(q+r)),cos(p)*(a*sin(q)+b*sin(q+r)+c*sin(q+r+s))];
pos_z=[0,a*cos(q),a*cos(q)+b*cos(q+r),a*cos(q)+b*cos(q+r)+c*cos(q+r+s)];
plot3(pos_x,pos_y,pos_z);   %Dieser Plot dient zum Überprüfen der Winkel, und stellt den Roboterarm schematisch dar. P(0,0,0) = Basis
angels=[p,q,r,s];
angels=angels*(360/(2*pi));
%vRob.moveAngels([1 2 3 4],angels,10);

end