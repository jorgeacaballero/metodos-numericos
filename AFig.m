function [z] = AFig()
    areaTotal=0;
    im = imread('ejemplo.jpg');
    imshow(im);
    
    pause;
    
    [n,m]=size(im);
    imSup = imcrop(im,[0,0,m,n/3.03]);
    subplot(2,1,1);
    imshow(imSup);
    [x1,y1,valor]=impixel;
    subplot(2,1,2);
    imInf = imcrop(im,[0,n/3.03,m,n-(n/3.03)]);
    imshow(imInf);
    [x2,y2,valor]=impixel;
    
    
    subplot(1,1,1);
     [n1,s1]=Spline(x1-(n-300),(n/3.03)-y1,3);
    [p1,p2]=size(s1);
    for i=1:1:p2
        areaTotal=areaTotal+CGauss(s1(i),(x1(i)-(n-300)),(x1(i+1)-(n-300)),2);
    end
    
    %[n1,s2]=Spline(x2-(n-300),(y2-(n/3.03))+400,3);
    [n1,s2]=Spline(x2-(n-300),(0-(y2-(n/3.03)+400)),3);
    [p1,p2]=size(s2);
    for i=1:1:p2
        areaTotal=areaTotal+CGauss((s2(i)),(x2(i)-(n-300)),(x2(i+1)-(n-300)),2)*(-1);
    end
    pause;
    
    %[x2,y2,valor]=impixel;
    %[n2,s2]=Spline(x2,y2,3);
    z=areaTotal; %efectúa la suma
end

