clear all;
close all;
clc;
tic
Im=imread('256.bmp');
%Im=rgb2gray(Im);
Raw=imread('2446.bmp');
%Raw=rgb2gray(Raw);
Im(find(Raw(:)==255))=255;
imwrite(Im,'new.bmp');

