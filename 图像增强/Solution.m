close all
clear
clc

RGB = imread('1-1.bmp');
% HSV Equalization processing and display the result
HSV = rgb2hsv(RGB);
figure('name','HSV Equalization processing');
subplot(221);imshow(RGB,[]); title('RGB');
HSV1=HSV;

HSV1(:,:,3)=adapthisteq(HSV(:,:,3));
imwrite(hsv2rgb(HSV1),'HSV_adapthisteq.jpg');
subplot(222);imshow(hsv2rgb(HSV1),[]); title('adapthisteq');

HSV1(:,:,3)=histeq(HSV(:,:,3));
imwrite(hsv2rgb(HSV1),'HSV_histeq.jpg');
subplot(223);imshow(hsv2rgb(HSV1),[]);title('histeq');

HSV1(:,:,3)=imadjust(HSV(:,:,3) ,[0.2,0.8],[],0.6);
imwrite(hsv2rgb(HSV1),'HSV_imadjust.jpg');
subplot(224);imshow(hsv2rgb(HSV1),[]);title('imadjust');



% LAB Equalization processing and display the result
LAB = applycform(RGB,makecform('srgb2lab'));
figure('name','LAB Equalization processing');
subplot(221);imshow(RGB,[]); title('RGB');
LAB1=LAB;

LAB1(:,:,1)=adapthisteq(LAB(:,:,1));
imwrite(applycform(LAB1,makecform('lab2srgb')),'LAB_adapthisteq.jpg');
subplot(222);imshow(applycform(LAB1,makecform('lab2srgb')),[]); title('adapthisteq');

LAB1(:,:,1)=histeq(LAB(:,:,1));
imwrite(applycform(LAB1,makecform('lab2srgb')),'LAB_histeq.jpg');
subplot(223);imshow(applycform(LAB1,makecform('lab2srgb')),[]); title('histeq');

LAB1(:,:,1)=imadjust(LAB(:,:,1) ,[0.2,0.8],[],0.6);
imwrite(applycform(LAB1,makecform('lab2srgb')),'LAB_imadjust.jpg');
subplot(224);imshow(applycform(LAB1,makecform('lab2srgb')),[]); title('imadjust');

