function [] = demo_inpaint_foe()
%DEMO_INPAINT_FOE?? Image inpainting demo with FoE model.
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
 
  % Load 3x3 model (change to "foe_5_24" for 5x5 model);
  p = foe_3_8();
 
   
  % 3 children B/W image
  fprintf('Restoration of a photograph:\n\n');
  I = double(imread('images/inpainting/3ch_original.png'));
  M = double(imread('images/inpainting/3ch_mask.png'));
   
  % Scale down image and mask for faster results (comment out for
  % original images)
  I = imresize(I, 0.5);
  M = imresize(M, 0.5);
   
  % Perform 2500 iterations of inpainting
  O = inpaint_foe(I, M > 0, p, 2500);
   
  % Show results
  figure; 
  subplot(1, 3, 1)
  imagesc(I); colormap gray(256); axis image; axis off;
  title('Original image');
  subplot(1, 3, 2)
  imagesc(M); colormap gray(256); axis image; axis off;
  title('Inpainting mask');
  subplot(1, 3, 3)
  imagesc(O); colormap gray(256); axis image; axis off;
  title('Inpainted image');
   
   
  % New Orleans RGB image
  fprintf('\nText removal for an RGB image:\n\n');
  I = double(imread('images/inpainting/new_original.png'));
  M = double(imread('images/inpainting/new_mask.png'));
  M = repmat(M, [1 1 3]);
   
  % Scale down image and mask for faster results (comment out for
  % original images)
  I = imresize(I, 0.5);
  M = imresize(M, 0.5);
   
  % Perform 2500 iterations of inpainting
  O = inpaint_foe(I, M > 0, p, 2500);
   
  % Show results
  figure;
  subplot(1, 3, 1)
  imagesc(I / 255); axis image; axis off;
  title('Original image');
  subplot(1, 3, 2)
  imagesc(M / 255); axis image; axis off;
  title('Inpainting mask');
  subplot(1, 3, 3)
  imagesc(O / 255); axis image; axis off;
  title('Inpainted image');
 
  % Restore path and working directory
  rmpath([dir '/models']);
  cd(prev_dir);
