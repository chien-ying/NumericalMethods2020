%X = [-1,-0.8,-0.6,-0.4,-0.2,0,0.2,0.4,0.6,0.8,1]%Y = [0.0385,0.0588,0.1,0.2,0.5,1,0.5,0.2,0.1,0.0588,0.0385]X = [-1, -0.9511, -0.8090, -0.5878, -0.3090, 0.0, 0.3090, 0.5878, 0.8090, 0.9511, 1.0]Y = [0.0385, 0.0424, 0.0576, 0.1038, 0.2952, 1.0, 0.2952, 0.1038, 0.0576, 0.0424, 0.0385]n = length(X);Lj = zeros(n);L  = zeros(1,n);% calculating partjr = 1:n;for j = jr    i = jr(jr~=j);    Lj(j, :) = poly(X(i)) / polyval(poly(X(i)), X(j));endL = Y*Lj;% plotting partx = -1: 0.002: 1;for i = 1:n  figure(i);  plot(x, polyval(Y(i)*Lj(i,:), x)), xlabel('x'), ylabel('y')  %xlim([-1 1]), ylim([-0.5 1.5])endforfigure(n+1);hold onplot(x,polyval(L,x),'k','linewidth',2)plot(X,Y,'ro','linewidth',2,'markersize',10)hold off%xlim([-1 1]), ylim([-0.5 1.5]), xlabel('x'), ylabel('y')figure(n+2);hold onfor i = 1:n  plot(x, polyval(Y(i)*Lj(i,:),x))endforplot(x, polyval(L,x),'k', 'linewidth', 2)plot(X, Y, 'ro', 'linewidth', 2, 'markersize',10)hold off%xlim([-1 1]), ylim([-0.5 1.5]), xlabel('x'), ylabel('y')