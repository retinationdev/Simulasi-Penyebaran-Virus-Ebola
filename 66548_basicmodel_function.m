function basicmodel =basicmodel(t,y)

a = evalin('base', 'a');
b = evalin('base', 'b');

basicmodel(1) =-a*y(1)*y(2);
basicmodel(2) = a*y(1)*y(2)-b*y(2);
basicmodel(3) = b*y(2);
basicmodel = [basicmodel(1) basicmodel(2) basicmodel(3)]'; 