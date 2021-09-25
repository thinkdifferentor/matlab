function p = foe_3_8()
%foe_3_8?? 3x3 FoE model with 8 filters
%?? P = FOE_3_8() returns a?struct?P of an FoE model with 3 or 4 fields:
%?? - P.dims contains the size of the filters (e.g. [3, 3].)
%?? - P.alpha is a vector of expert parameters.? Its length determines the
%???? number of experts.
%?? - P.J contains a matrix of filters, where each column contains the
%???? filter corresponding to a particular expert.
%?? - P.basis (optional) contains the basis in which the filter coefficients
%???? are defined.? The filters as they apply to the unmodified pixels can be
%???? obtained from the product of P.basis' * P.J.
%
%?? Author:? Stefan Roth, Department of Computer Science, Brown University
%?? Contact: roth@cs.brown.edu
%?? Date:??? 06/07/2005
 
% Copyright 2004,2005, Brown University, Providence, RI.
%
% All Rights Reserved
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
 
 
  p.dims = [3, 3];
  p.alpha = [1.201143e-01, 7.520515e-02, 9.078330e-02, 1.280545e-01, 6.276734e-02, 1.201840e-01, 1.092460e-01, 1.217102e-01];
  p.J = [1.359507e+00, 8.525110e-01, 2.002059e-01, -5.937472e-01, -2.325712e+01, 7.502941e-01, 1.233328e-01, -4.874199e+00; ...
         4.772056e+00, 1.361361e+00, 2.460155e+01, -6.766019e-02, -5.826954e-01, -3.316523e-01, -1.474663e-01, 7.793239e-01; ...
         -6.690177e-01, 6.026398e-01, -5.105003e+00, -4.109973e+00, 9.656851e-01, -4.186919e+00, -2.120063e+01, 4.745476e-01; ...
         1.943910e+00, -1.227122e+01, 1.042264e+01, 7.818959e-01, -4.940315e+00, -1.424995e+00, -1.004415e+01, -1.650005e+00; ...
         -1.050778e+00, -2.146662e+00, -1.256774e+00, -1.434304e+00, 1.455968e+00, -2.401311e+01, 8.438753e+00, 1.829643e-01; ...
         2.957102e+01, 7.639969e+00, -2.264681e+00, -2.922909e+00, -1.970511e+00, 9.113470e-01, 1.624417e-01, -5.807883e-01; ...
         -3.108021e+00, -3.945750e+00, 3.026307e-01, 2.343125e-01, 5.325069e-01, 2.187780e-01, -2.584377e-01, 2.931325e+01; ...
         -1.331707e+00, 1.828494e+01, -3.705114e-01, 2.913379e+01, -7.288777e-01, -5.627995e+00, -5.043575e+00, 7.468907e-01];
  p.basis = [1.398454e-02, 2.065362e-04, -1.400086e-02, 1.616972e-02, 5.170091e-05, -1.625187e-02, 1.396836e-02, -1.474055e-04, -1.401394e-02; ...
             1.492367e-02, 1.757808e-02, 1.487793e-02, -1.380950e-04, 2.190938e-05, 2.063829e-04, -1.498414e-02, -1.763298e-02, -1.486115e-02; ...
             -2.998559e-02, 2.270054e-02, -2.722440e-03, -9.887762e-03, 3.939620e-02, -9.649374e-03, -2.777473e-03, 2.256777e-02, -2.994718e-02; ...
             2.332423e-02, 8.093303e-03, -3.993632e-02, -1.693912e-03, 1.974521e-02, -1.491368e-03, -3.982216e-02, 8.283091e-03, 2.336171e-02; ...
             -1.408454e-02, -2.905109e-02, -8.821682e-03, 3.730378e-02, 2.846007e-02, 3.776222e-02, -8.717803e-03, -2.833641e-02, -1.470643e-02; ...
             -3.994405e-02, 6.108758e-02, -3.279410e-02, 5.985998e-03, 3.985209e-04, -5.208773e-03, 3.253787e-02, -6.191047e-02, 3.983567e-02; ...
             3.358739e-02, 6.142535e-03, -4.096458e-02, -6.460519e-02, -6.896593e-04, 6.434845e-02, 4.118725e-02, -5.500375e-03, -3.352551e-02; ...
             -3.923639e-02, 6.483810e-02, -3.836991e-02, 6.635343e-02, -1.063839e-01, 6.540974e-02, -3.862160e-02, 6.462672e-02, -3.872724e-02];
