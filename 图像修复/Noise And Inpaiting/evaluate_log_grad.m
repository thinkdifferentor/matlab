function g = evaluate_log_grad(this, x)
%EVALUATE_FOE_LOG_GRAD?? Gradient of the?log?of an FoE distribution
%?? EVALUATE_FOE_LOG_GRAD(P, X) computes the gradient with respect to the
%?? image of the?log?density of an FoE distribution P at image X.?
%
%?? Author:? Stefan Roth, Department of Computer Science, Brown University
%?? Contact: roth@cs.brown.edu
%?? $Date: 2005-06-09 12:08:55 -0400 (Thu, 09 Jun 2005) $
%?? $Revision: 72 $

% Copyright 2004,2005, Brown University, Providence, RI.
%
%???????????????????????? All Rights Reserved
%
% Permission to use, copy, modify, and distribute?this?software and its
% documentation?for?any purpose other than its incorporation into a
% commercial product is hereby granted without fee, provided that the
% above copyright notice appear in all copies and that both that
% copyright notice and?this?permission notice appear in supporting
% documentation, and that the name of Brown University not be used in
% advertising or publicity pertaining to distribution of the software
% without specific, written prior permission.
%
% BROWN UNIVERSITY DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
% INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR ANY
% PARTICULAR PURPOSE.? IN NO EVENT SHALL BROWN UNIVERSITY BE LIABLE FOR
% ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
% WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
% ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
% OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 
   
  nfilters = size(this.J, 2);
 
  % Transform filters if necessary
  if (isfield(this, 'basis') && isempty(this.basis))
    Jp = this.J;
  else
    Jp = this.basis' * this.J;
  end
 
  pad_lo = ceil(0.5 * (this.dims - 1));
  pad_hi = floor(0.5 * (this.dims - 1));
  g      = zeros(size(x)); 
   
  for j = 1:nfilters
    % Filter mask and mirrored filter mask
    f  = reshape(Jp(end:-1:1, j), this.dims);
    fm = reshape(Jp(:, j), this.dims);
     
    % Convolve and pad image appropriately
    tmp = zeros(size(x));
    tmp(1+pad_lo(1):end-pad_hi(1), 1+pad_lo(2):end-pad_hi(2)) = ...
        conv2(x, f, 'valid');
       
    % Compute expert gradient
    tmp2 = conv2(this.alpha(j) * tmp ./ (1 + 0.5 * tmp.^2), fm, 'same');
    g = g - tmp2;
  end
