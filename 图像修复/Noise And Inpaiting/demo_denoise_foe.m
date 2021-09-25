function [] = demo_denoise_foe()
%DEMO_DENOISE_FOE?? Image denoising demo with FoE model.
%
%?? Author:? Stefan Roth, Department of Computer Science, Brown University
%?? Contact: roth@cs.brown.edu
%?? $Date: 2005-06-08 18:47:29 -0400 (Wed, 08 Jun 2005) $
%?? $Revision: 70 $
 
% Copyright 2004,2005, Brown University, Providence, RI.
%
%                         All Rights Reserved
%
% Permission to use, copy, modify, and distribute this software and its
% documentation for any purpose other than its incorporation into a
% commercial product is hereby granted without fee, provided that the
% above copyright notice appear in all copies and that both that
% copyright notice and this permission notice appear in supporting
% documentation, and that the name of Brown University not be used in
% advertising or publicity pertaining to distribution of the software
% without specific, written prior permission.
%
% BROWN UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
% INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR ANY
% PARTICULAR PURPOSE.  IN NO EVENT SHALL BROWN UNIVERSITY BE LIABLE FOR
% ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 
   
  % Save working directory and go to correct directory
  prev_dir = pwd;
  [dir, dummy, dummy2, dummy3] = fileparts(mfilename('fullpath'));
  cd(dir);
 
  % Add FoE model directory to path
%   addpath([dir '/models']);
addpath /models
  % Load 5x5 model
  p = foe_5_24();
   
  % Peppers image
  I = double(imread('images/denoising/peppers256.png'));
 
  % Add Gaussian noise
  sigma = 15;
  N = I + sigma * randn(size(I));
   
  % Perform 3000 iterations of denoising
  O = denoise_foe(N, p, sigma, 3000, 0.1, I);  % 对加入高斯噪声的图片进行去噪
   
  % Show results
  figure; 
  subplot(1, 3, 1)
  imagesc(I); colormap gray(256); axis image; axis off;
  title('Original image');
  subplot(1, 3, 2)
  imagesc(N); colormap gray(256); axis image; axis off;
  title('Noisy image');
  subplot(1, 3, 3)
  imagesc(O); colormap gray(256); axis image; axis off;
  title(['Denoised image (PSNR=' num2str(psnr(I, O)) 'db)']);
   
 
  % Restore path and working directory
  rmpath([dir '/models']);
  cd(prev_dir);
