function [recognize]=train(Pts)
X0=load('fixed_support.txt');
X1=load('Block.txt');
X2=load('roller_support.txt');
X3=Pts;
X4=load('Spring.txt');
X5=load('Damper.txt');
X6=load('0.txt');
X7=load('1.txt');
X8=load('2.txt');
X9=load('3.txt');
X10=load('4.txt');
X11=load('5.txt');
X12=load('6.txt');
X13=load('7.txt');
X14=load('8.txt');
X15=load('9.txt');
[st I]=Symbol_Strokes(X3,0.5); 
[~, img(:,:,1)]=pixel(X0);
[~, img(:,:,2)]=pixel(X1);
[~, img(:,:,3)]=pixel(X2);
[~, img(:,:,4)]=pixel(X4);
[~, img(:,:,5)]=pixel(X5);
[~, A]=pixel(X3);
[~, img(:,:,6)]=pixel(X6);
[~, img(:,:,7)]=pixel(X7);
[~, img(:,:,8)]=pixel(X8);
[~, img(:,:,9)]=pixel(X9);
[~, img(:,:,10)]=pixel(X10);
[~, img(:,:,11)]=pixel(X11);
[~, img(:,:,12)]=pixel(X12);
[~, img(:,:,13)]=pixel(X13);
[~, img(:,:,14)]=pixel(X14);
[~, img(:,:,15)]=pixel(X15);
for i=1:15
    haus(i)=hausdorff(A,img(:,:,i));
    mhaus(i)=modi_haus(A,img(:,:,i));
    T(i)=tanimoto(A,img(:,:,i));
    Y(i)=Yule(A,img(:,:,i));
end
nor_haus=normalize(haus);
nor_mhaus=normalize(mhaus);
nor_tan=normalize(T);
nor_yule=normalize(Y);
nor_tan=1-nor_tan;
nor_yule=1-nor_yule;
C=nor_haus+nor_mhaus+nor_tan+nor_yule;
[~, S]=min(C);
recognize=S-1;
if recognize==0 || recognize==2
    if st==3
        recognize=2;
    else 
        recognize=0;
    end
end
if recognize==3
    if st==4
        recognize=4;
    else
        recognize=3;
    end
end