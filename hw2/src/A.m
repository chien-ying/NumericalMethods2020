h = [1, 0.5, 0.1, 0.05, 0.01, 0.005]function f=f(H)  f = sin((4+H))/(4+H)^3;endfunctiongrad = (cos(4)*4^3 - 3 * sin(4)*4^2)/4^6grad_1H = []; grad_2H = []; grad_4H = [];% forwardfor i = 1:size(h)(2)  grad_1H = [grad_1H, (f(h(i))-f(0)) / h(i)];endfor% second-orderfor i = 1:size(h)(2)  grad_2H = [grad_2H, (f(h(i))-f(-h(i)))/(h(i)*2)];endfor% fourth-order centralfor i = 1:size(h)(2)  grad_4H = [grad_4H, (-f(h(i)*2)+8*f(h(i))-8*f(-h(i))+f(-h(i)*2))/(12*h(i))];endforerror1h = log10(abs(grad - grad_1H))error2h = log10(abs(grad - grad_2H))error4h = log10(abs(grad - grad_4H))x = log10(h)% plotting parthold onplot(x, error1h, "r-*")plot(x, error2h, "g-o")plot(x, error4h, "b-+")hold offxlabel("log(h)");ylabel("log(error)");legend("1st order","2nd order","4th order");legend('Location','southeast');print("-djpeg",["A_2",'.jpg'])