function vaksinmodel =vaksinmodel(t,y)

a = evalin('base', 'a');
b = evalin('base', 'b');
v = evalin('base', 'v');

vaksinmodel(1) =-a*y(1)*y(2)-v*y(1);
vaksinmodel(2) =a*y(1)*y(2)-b*y(2);
vaksinmodel(3) = b*y(2)+v*y(1);
vaksinmodel = [vaksinmodel(1) vaksinmodel(2) vaksinmodel(3)]'; 