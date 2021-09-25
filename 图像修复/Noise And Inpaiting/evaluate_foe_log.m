function ld = evaluate_foe_log(this, x)
%EVALUATE_FOE_LOG?? Log density of unnormalized FoE distribution
%?? EVALUATE_FOE_LOG(P, X) computes the?log?density of an unnormalized
%?? FoE distribution P?for?an image X.
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
 
   
  nfilters = size(this.J, 2);
 
  % Transform filters if necessary
  if (isfield(this, 'basis') && isempty(this.basis))
    Jp = this.J;
  else
    Jp = this.basis' * this.J;
  end
   
  ld = 0;
  for j = 1:nfilters
    f = reshape(Jp(end:-1:1, j), this.dims);
     
    % Convolve image and compute expert response
    tmp  = conv2(x, f, 'valid');
    tmp2 = reallog(1 + 0.5 * tmp.^2);
    ld = ld - this.alpha(j) * sum(tmp2(:));
  end
