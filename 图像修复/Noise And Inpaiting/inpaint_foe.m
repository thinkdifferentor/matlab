function O = inpaint_foe(I, mask, model, niters)
%INPAINT_FOE?? Image inpainting with FoE model.
%?? O = INPAINT_FOE(I, MASK, P, NITERS) performs image inpainting on
%?? image I?using?an FoE model P.? Only the pixels specified in MASK will
%?? be modified.? The algorithm will perform NITERS iterations.?
%
%?? Image I can either be a gray level image (0 .. 255), or an RGB
%?? image (0 .. 255 in all channels).
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
 
   
  % Convert to YCbCr color space if input is RGB
  if (size(I, 3) == 3)
    I = 255 * rgb2ycbcr(I / 255);
  end 
 
   
  % Perform given number of iterations with large step size for fast
  % convergence.
  O = I; 
  g = zeros(size(O));
  for i = 1:niters
    if (mod(i, 250) == 0)
      fprintf('%d/%d iterations\n', i, niters)
    end
 
    for j = 1:size(O, 3)
      g(:, :, j) = evaluate_foe_log_grad(model, O(:, :, j));
    end
    O(mask) = O(mask) + 10 * g(mask);
  end
 
  % Perform 250 iterations with a small step size in order to clean up
  % possible artifacts.
  disp('Cleaning up result with small step size...')
  for i = 1:250
    if (mod(i, 100) == 0)
      fprintf('%d/250 iterations\n', i)
    end
 
    for j = 1:size(O, 3)
      g(:, :, j) = evaluate_foe_log_grad(model, O(:, :, j));
    end
    O(mask) = O(mask) + 0.1 * g(mask);
  end
 
  % Convert back to RGB if necessary
  if (size(I, 3) == 3)
    O = 255 * ycbcr2rgb(O / 255);
  end 
