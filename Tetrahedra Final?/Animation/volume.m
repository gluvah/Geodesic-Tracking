function res = volume(y)
gro = [y(7) - y(1), y(9) - y(3), y(11) - y(5)];
bro = [y(13) - y(1), y(15) - y(3), y(17) - y(5)];
fro = [y(19) - y(1), y(21) - y(3), y(23) - y(5)];

ohwoah = [gro ; bro ; fro];
duh = det(ohwoah);
res = duh/6;
end
