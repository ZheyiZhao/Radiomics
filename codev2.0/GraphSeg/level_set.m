
close all;
clear all;
I=imread('cut_cancer_0.png');
I=I(:,:,1);
I=double(I);
imwrite(I,'double.jpg');


isinside = 0;
center=[size(I)/2] ;

center(:,1) = center(:,2) - 20;
center(:,2) = center(:,2) -10;
radius=min(size(I))/16;
d_it=10;


ITERATIONS=350;
tao=10;
lambda=5;
ve=-1.5;
epsilon=1.5;
mu=0.04;


imsize=size(I);
m=imsize(1);
n=imsize(2);
phi=zeros(imsize);

for i = 1 : m
    for j = 1 : n
        % Euclidean distance
        distance = sqrt( sum( ( center - [ i, j ] ).^2 ) );
        phi( i, j ) = distance - radius;
        phi( i, j ) = -phi( i, j );
        if phi(i,j)>0.00001
            phi(i,j)=4;
        else if phi(i,j)<-0.00001
            phi(i,j)=-4;
        end
        end
    end
end
% Edge indicator function
h=fspecial('gaussian',3,0.5);
I=imfilter(I,h);
[Ix Iy]=gradient(I);
g=1./(1+Ix.^2+Iy.^2);

h = fspecial('laplacian',0.6);

% iteration
for ii=1:ITERATIONS
fprintf( 1, '%d\n', ii );
if( mod( ii - 1, d_it ) == 0 )
pause(0.2);
clf;
% uint8(I);
imshow(uint8(I));

hold on;
% a contour plot of matrix Z treating the values in Z as heights above a plane.
contour(phi,[0,0],'r');
end;

% Dirac function
dirac=zeros(m,n);
for i=1:m
    for j=1:n
        if abs(phi(i,j))<=epsilon
            dirac(i,j)=1./(2*epsilon).*(1+cos(pi*phi(i,j)/epsilon));
        end
    end
end

% 1
% central differencing

dx_central = ( circshift( phi, [ 0, -1 ] ) - circshift( phi, [ 0, 1 ] ) ) / 2;
dy_central = ( circshift( phi, [ -1, 0 ] ) - circshift( phi, [ 1, 0 ] ) ) / 2;
abs_grad_phi = ( sqrt( dx_central.^2 + dy_central.^2 ) + 0.00001 );
	

x = dx_central ./ abs_grad_phi;
y = dy_central ./ abs_grad_phi;
z = imfilter(phi,h);
first=mu.* (z - divergence(x,y));

% 2
x = dx_central ./ abs_grad_phi;
y = dy_central ./ abs_grad_phi;
x=x.*g;
y=y.*g;
second=lambda.*dirac.*divergence(x,y);

% 3
third=ve.* g.*dirac;

phi=phi+tao.*(first+second+third);
end;



