function p = foe_5_24()
%foe_5_24?? 5x5 FoE model with 24 filters
%?? P = FOE_5_24() returns a?struct?P of an FoE model with 3 or 4 fields:
%?? - P.dims contains the size of the filters (e.g. [5, 5].)
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
 
 
  p.dims = [5, 5];
  p.alpha = [5.472286e-02, 6.425581e-02, 5.031088e-02, 5.989018e-02, 4.424956e-02, 5.119065e-02, 6.743059e-02, 2.339211e-02, 5.973362e-02, 6.281576e-02, 1.495131e-02, 5.693016e-02, 3.189429e-02, 7.672358e-02, 4.524088e-02, 3.681065e-02, 6.383650e-02, 4.347603e-02, 2.264134e-02, 2.561474e-02, 5.886950e-02, 4.114462e-02, 4.893348e-02, 5.834900e-02];
  p.J = [5.221464e+00, 3.217384e-01, 6.707321e-01, -1.070303e-02, 1.804574e+00, 3.289410e+00, 3.498840e-03, 2.104592e+01, 2.579228e-01, 1.321280e+00, 1.108934e+00, -4.875967e-02, 3.204257e+00, -2.143495e-01, -4.794155e-01, 8.107926e-01, 2.621105e+00, 1.317679e-01, -1.955369e+00, -1.514776e+00, -5.532252e+00, -5.867297e-01, 2.079566e+00, 8.067958e-01; ...
         2.203997e+00, -3.764794e-01, -1.556290e+00, -1.917030e+00, 8.507255e-01, -2.852238e-01, -1.104739e-01, 1.993870e+00, 8.376978e-01, 1.123188e+00, -6.098151e-02, -3.623763e-01, -2.278559e+01, 8.416750e-01, 6.062606e-01, 2.781582e+00, -6.423469e+00, 3.460383e-01, 2.451316e-01, -1.931146e+00, -1.800924e-01, 7.550999e-01, -1.347313e+00, -3.168569e-01; ...
         -3.953304e+00, 1.591096e+00, 2.130432e+00, -4.473612e+00, 1.274144e+00, 4.088570e+00, -2.637933e-01, -2.018905e+00, -2.378124e+00, 7.859289e-01, -7.859286e-01, 4.289382e-01, -9.305263e-01, 7.660539e-01, -2.949519e+00, -3.891350e+00, -8.861996e-01, -7.391218e-01, 1.419289e+01, 4.347115e-01, 2.779857e+00, -1.336767e+01, 4.635760e+00, -9.190666e-01; ...
         -2.067956e-01, -2.755266e+00, 2.432628e+00, -2.927065e+00, 5.091745e+00, -1.304264e+01, 1.223022e-01, 5.796227e+00, 2.111436e+00, 2.351201e-01, -1.410145e+00, 8.665373e-02, 2.144267e+00, -1.557378e+00, -1.556987e+01, 7.774189e+00, 3.868381e+00, 1.925225e+00, 8.352367e+00, 1.336599e+00, 1.595630e-01, -1.767083e+00, 2.827713e-01, 4.732787e-01; ...
         -1.763460e+00, -4.797087e+00, -1.760662e+00, 1.846656e+00, 5.881476e+00, -1.537463e+01, 6.315844e-01, -5.992539e+00, -1.428598e+00, 2.701297e+00, 1.078716e-01, 7.387027e-01, 3.373561e+00, -1.987832e+00, 6.879888e+00, -3.477293e+00, 5.247770e-01, -5.855011e-01, 1.468761e+00, 3.080017e-01, -3.272405e+00, -4.734041e+00, 1.696212e+00, 1.132709e-01; ...
         -1.868292e+01, -3.662443e-01, -2.918259e+00, 3.216978e+00, -1.400485e+00, -2.504553e+00, 4.752188e-01, 4.616930e+00, 2.924288e-01, 1.132258e-01, -4.747685e+00, 1.896025e+00, 2.441616e+00, 4.793724e-01, 9.634614e-01, 2.037798e+00, 1.790744e-01, 3.691880e+00, -3.329093e+00, -4.613257e-02, 3.146730e+00, -4.945457e+00, -6.226614e+00, 2.186653e+00; ...
         -1.742934e+01, 4.822098e-01, 5.493343e+00, 4.805174e-01, 1.015983e+00, 2.203223e+00, 4.523362e-03, -8.437589e-01, -4.851719e-01, 2.955412e+00, 9.673466e-01, 1.251805e+00, -8.092605e+00, 1.424926e+00, -3.693696e+00, -1.385040e+01, -1.188412e+00, -2.764964e+00, -2.387384e+00, 1.235793e+01, -6.121075e+00, -4.425636e+00, -4.449306e+00, -2.379878e+00; ...
         5.893694e+00, -3.268806e-02, 1.481818e+00, -2.339401e+00, -7.452547e+00, -1.548945e+01, -3.338751e-01, 1.955696e+00, 1.021897e+00, -1.203648e+00, 2.779382e+00, 8.576651e-01, -6.662797e+00, 5.636704e-01, 1.889028e+00, -5.631955e+00, 4.097600e+00, -6.962310e+00, 4.876786e-01, 9.180231e+00, 2.422506e+01, 1.034558e+00, 2.360107e+00, 2.361622e+00; ...
         -1.959194e-01, -2.177258e-01, -2.141734e+00, 1.469989e-01, 4.981121e+00, 4.321445e+00, -1.033473e+00, -3.054682e-01, -1.906755e+00, -3.282359e+00, -4.119240e-01, 1.978234e-01, -7.404922e+00, -4.517136e-01, 1.790008e+00, 2.664143e+00, 2.231022e+01, 4.324587e+00, -3.261022e-01, -1.880539e+00, -2.461873e+00, 7.548168e-01, -2.256426e-01, -3.724982e+00; ...
         -8.950384e-01, 3.203485e+00, -5.384507e+00, 1.060012e+01, -1.037194e+01, 8.249515e+00, -1.226181e+00, -9.226661e-01, 1.495377e+00, -4.013629e+00, -2.947736e-02, 1.130986e+00, -1.616398e+00, 5.753334e+00, 6.331544e+00, 1.264421e+01, -3.730370e+00, 2.559298e-01, 1.040442e+01, 2.341325e+00, -4.967246e+00, -2.373096e+00, -2.638897e-01, -2.538021e+00; ...
         2.857829e-01, 1.839158e+00, 1.244045e+01, -1.456123e+01, -5.569673e-01, 1.451007e+00, -9.380104e-02, -1.809523e-02, -2.649461e+00, -1.189717e+00, -6.672937e+00, -4.397952e-01, -7.945368e-01, 5.767449e-01, 7.640551e+00, 7.249056e-01, 3.528170e-01, 5.255235e+00, 5.614532e+00, -4.691667e-01, -3.514969e+00, -9.406307e+00, 6.326770e-01, 2.059758e+00; ...
         -7.589616e+00, 9.876728e-02, 3.107835e+00, -3.815792e+00, -1.062931e+01, 2.798262e+00, -1.414190e+00, 3.266164e+00, -7.286912e+00, 4.671843e+00, -7.508521e+00, 2.563060e-01, -1.828752e+00, -3.304760e+00, -1.587604e+01, 3.082886e+00, -6.304437e+00, 1.644527e+00, 1.092328e+00, -6.393645e+00, -3.868510e+00, 9.600317e+00, 1.134701e+01, 5.459571e-01; ...
         -1.068316e+01, 5.152722e+00, -2.833533e+00, -4.874512e-01, 6.012363e+00, -1.856010e-01, -1.182828e+00, 1.243175e+00, 5.480803e+00, -5.775991e+00, -2.138468e+00, -6.998115e-02, 1.032489e+00, -5.012644e+00, 1.273418e+01, 1.244560e+00, 4.724188e+00, -9.439543e-01, -4.054499e+00, 3.932279e+00, 1.315885e+00, 1.431831e+01, 1.701695e+01, 2.693421e-02; ...
         6.527182e-01, -2.717953e+01, -4.989953e-01, 5.510990e-01, -5.298719e+00, 4.358268e+00, 1.446010e+00, -9.558912e-03, 3.004938e+00, 4.786294e+00, 6.882231e-01, 5.378283e-01, -1.042213e+00, -7.783997e-02, 2.276228e+00, -1.540150e+00, -3.675159e+00, 2.873296e+00, -1.970212e+00, 3.860689e+00, -2.218943e+00, 3.133617e+00, 3.481925e+00, -2.267313e-02; ...
         1.208294e+01, 3.135551e+00, -6.252220e+00, 2.987008e+00, 5.822736e+00, 3.289865e+00, -7.112660e-01, -1.541510e+00, 1.883477e+00, 1.004571e+00, 5.965362e+00, -4.956324e+00, 6.513510e-01, 5.263246e+00, -1.916978e+00, -7.466087e+00, 2.089847e+00, 1.417098e+01, -1.016781e+00, 1.364409e+01, -1.493211e+01, 1.348230e+00, 5.601774e+00, 1.805701e+00; ...
         2.798636e+00, 4.181593e+00, -6.851054e+00, -3.710443e+00, -7.024798e+00, -4.153208e-01, 1.837862e+00, 4.319455e-01, 9.261622e-02, 1.357414e+01, -3.272369e+00, 4.019993e+00, 5.961750e+00, 2.663503e+00, 5.206058e+00, 3.638540e+00, -1.095436e+01, 1.730599e+01, 7.988672e-01, 7.823780e+00, 6.545484e+00, 2.005927e+00, -2.391534e+00, -1.378326e+01; ...
         -2.484955e+00, 2.202749e+00, 5.119689e+00, 2.200664e+01, 1.189101e-01, 3.628996e-01, -1.477704e+00, -2.463539e-01, -3.102893e-01, 4.326014e+00, -3.757544e+00, 1.319601e+00, -1.537705e+00, -8.034829e+00, -1.430464e+00, -1.349798e+00, -2.730741e+00, 4.860602e+00, -1.495675e+00, 1.261202e+00, 1.406611e+00, -3.610769e+00, 2.090758e+01, -4.275941e+00; ...
         1.608872e+00, -7.977864e-01, -7.963565e-01, 3.293220e-01, -2.213379e+00, -3.583083e+00, 6.091205e-01, 9.074634e-01, -7.472328e+00, -1.968091e+01, 3.730251e+00, -4.305578e+00, -2.789927e+00, 8.681331e-01, 5.681625e-01, -2.866054e+00, -1.905617e+01, -1.057018e+00, 5.584470e-01, -1.072438e+00, 7.837134e+00, 6.492566e-01, 9.110521e-01, -1.473740e+01; ...
         -3.144149e-01, -3.171619e+00, -2.433588e+01, 2.975512e+00, -4.958876e+00, -4.227159e-01, -8.305000e-01, -5.150069e-02, -1.445317e+01, 1.122753e+01, 1.201273e+01, -6.188231e+00, -1.974823e+00, 2.245062e+00, -6.978250e+00, 5.710733e+00, -1.134359e+00, -6.121166e+00, -1.646863e+00, -3.236188e+00, 8.177470e-01, 2.699629e+00, 2.266553e+00, 1.251698e+01; ...
         6.655746e+00, 1.044495e+00, -6.094938e+00, 5.402384e-01, -5.540678e+00, 1.189844e+00, 8.846120e+00, -8.883797e-01, 1.043760e+00, -2.576679e+00, 4.447324e+00, -9.698347e-01, -8.607403e-01, -3.358363e+01, 2.179591e+00, 7.362017e+00, -6.871183e-01, 4.453383e+00, 5.296010e+00, 8.370820e-01, -2.167610e+00, -7.807924e+00, -8.054458e+00, 7.587515e-01; ...
         -1.158305e+00, -1.494117e+01, -3.337515e+00, 8.186043e-01, -1.294221e+01, 1.825533e+00, 4.646260e+00, 1.107607e-01, 2.579929e+01, -7.233125e+00, -5.554356e+00, -4.473227e+00, -9.711123e-01, 3.655143e+00, 5.300028e-01, 2.735200e+00, 1.004317e+00, 2.375964e+00, 4.759095e+00, -4.425155e+00, -4.258783e+00, -8.294351e-02, 1.601315e+00, 5.000737e+00; ...
         1.247381e+00, 1.000433e+00, -4.622267e+00, -1.186049e+01, -1.926822e+00, 4.018993e-01, -1.231541e+01, 3.120180e-02, 2.409175e+00, 5.743554e+00, 3.557718e+00, 4.399913e-01, 1.461085e+00, 7.220209e+00, 3.402900e+00, 2.733450e+00, -1.778252e+00, 7.151149e+00, 4.640269e-01, 9.046487e-01, 2.902941e+00, 1.259700e+00, -9.101945e+00, -1.576574e+01; ...
         -2.726637e+00, -1.249681e-01, 3.024342e-02, 5.062623e-01, 1.772745e+00, -4.249940e-01, -2.221732e+00, 5.277249e-02, 1.054663e+00, -8.884916e+00, -9.364881e+00, -2.907320e+01, -9.223907e-01, -2.863472e+00, 9.200128e-01, 3.040185e+00, -4.799228e+00, -8.391235e+00, 2.302504e-01, -2.764791e+00, 6.645386e+00, -4.182395e-01, -6.075827e-01, -1.168477e+01; ...
         1.683774e+00, -4.973395e+00, -3.089712e+00, -8.618907e-02, -3.162610e+00, -1.129929e-01, -2.775093e+01, -3.240727e-01, 2.905908e+00, -2.083962e+00, -1.828368e+00, 1.304996e+00, -2.489774e-02, -7.821590e+00, -4.454941e-01, 2.545186e+00, 8.541247e-01, 7.173702e-01, 2.675082e+00, -3.887006e+00, -2.408244e+00, -1.889297e+00, -1.012204e+00, 4.814736e+00];
  p.basis = [5.304642e-03, 4.031201e-03, 7.539410e-04, -2.682436e-03, -4.389197e-03, 5.910445e-03, 4.459684e-03, 4.949992e-04, -3.554821e-03, -5.334201e-03, 5.786838e-03, 4.122754e-03, 1.702250e-05, -4.132951e-03, -5.875293e-03, 5.214901e-03, 3.441977e-03, -5.133576e-04, -4.377458e-03, -5.907371e-03, 4.373555e-03, 2.654505e-03, -7.340680e-04, -3.907603e-03, -5.229841e-03; ...
             -4.664354e-03, -5.698441e-03, -6.277791e-03, -6.449905e-03, -5.691822e-03, -3.019572e-03, -3.713650e-03, -4.367496e-03, -4.640636e-03, -4.139653e-03, 6.937845e-04, 5.855580e-04, 6.212178e-05, -4.900250e-04, -7.226438e-04, 4.300760e-03, 4.710513e-03, 4.359809e-03, 3.675484e-03, 2.847332e-03, 5.775305e-03, 6.453719e-03, 6.281515e-03, 5.640324e-03, 4.546607e-03; ...
             -9.029869e-03, -9.832401e-04, 6.197548e-03, 1.088198e-03, -7.033865e-03, -8.173016e-03, 2.699552e-03, 1.128986e-02, 4.222788e-03, -6.456201e-03, -6.342245e-03, 5.537484e-03, 1.370118e-02, 5.456771e-03, -6.133235e-03, -6.328541e-03, 4.293746e-03, 1.095996e-02, 2.821708e-03, -7.762056e-03, -6.824145e-03, 1.113112e-03, 5.607257e-03, -1.162076e-03, -9.074828e-03; ...
             -4.908049e-03, -1.183262e-03, 7.506822e-03, 1.346663e-02, 1.318255e-02, -9.239462e-03, -7.513214e-03, -9.916068e-04, 3.376785e-03, 4.274974e-03, -6.654818e-03, -7.434951e-03, -6.605225e-03, -7.457925e-03, -7.060675e-03, 4.431465e-03, 3.383032e-03, -8.448833e-04, -7.204602e-03, -9.625105e-03, 1.308862e-02, 1.294355e-02, 7.093552e-03, -9.770174e-04, -4.916933e-03; ...
             1.093353e-02, 1.310886e-02, 9.621896e-03, 1.364532e-03, -4.169171e-03, 1.776076e-03, 3.002595e-03, 8.205878e-04, -6.445610e-03, -1.031128e-02, -9.497359e-03, -8.136296e-03, -5.545537e-03, -7.845052e-03, -9.513181e-03, -1.053307e-02, -6.284621e-03, 1.344390e-03, 3.654081e-03, 1.779438e-03, -4.409727e-03, 1.504547e-03, 9.904580e-03, 1.317361e-02, 1.087331e-02; ...
             1.416520e-02, -9.542017e-03, -6.284926e-03, 7.659236e-03, -4.790519e-03, 1.240955e-02, -1.420930e-02, -4.795174e-03, 1.282206e-02, -5.484147e-03, 7.554456e-03, -1.608416e-02, 1.612661e-04, 1.664508e-02, -7.381240e-03, 5.273781e-03, -1.301700e-02, 4.794408e-03, 1.523052e-02, -1.247927e-02, 4.808498e-03, -7.821872e-03, 5.775066e-03, 9.494185e-03, -1.493536e-02; ...
             -1.259110e-02, -1.593883e-03, 1.710006e-02, 7.002066e-03, -1.772862e-02, -7.556910e-03, -9.654943e-04, 1.499238e-02, 8.370700e-03, -1.450990e-02, 3.396383e-03, -4.663191e-03, -7.148220e-04, 4.570165e-03, -3.603684e-03, 1.398982e-02, -8.478563e-03, -1.563941e-02, 1.688290e-03, 8.457824e-03, 1.780625e-02, -6.909082e-03, -1.702479e-02, 1.670254e-03, 1.289837e-02; ...
             1.236278e-02, 1.169363e-02, -1.031360e-03, -1.601684e-02, -1.680401e-02, -2.875307e-03, 1.524946e-03, 4.036423e-03, 4.095047e-03, 6.817995e-03, -2.020668e-02, -1.322946e-02, 3.608465e-04, 1.284843e-02, 2.044174e-02, -7.066388e-03, -4.021524e-03, -4.108643e-03, -3.429715e-03, 2.896868e-03, 1.694922e-02, 1.700605e-02, 1.498078e-03, -1.263512e-02, -1.114165e-02; ...
             -1.032035e-02, -1.375756e-02, -1.370370e-02, -8.830862e-03, -3.270427e-03, 1.366202e-02, 1.613791e-02, 1.621177e-02, 1.518118e-02, 1.255940e-02, 3.745453e-03, 3.085428e-03, 8.647682e-04, -3.416737e-03, -4.952646e-03, -1.216323e-02, -1.579992e-02, -1.512020e-02, -1.609827e-02, -1.499063e-02, 4.698005e-03, 7.441916e-03, 1.317079e-02, 1.499488e-02, 1.069447e-02; ...
             -2.644631e-02, 1.322882e-02, 2.017613e-02, -2.645754e-03, -1.466540e-02, -2.864667e-03, 1.074693e-02, -6.764644e-03, -2.735385e-03, 8.180536e-03, 2.077369e-02, -7.984271e-04, -3.151882e-02, -1.375577e-03, 2.143076e-02, 7.470669e-03, -4.400567e-03, -6.971455e-03, 9.246109e-03, -2.281812e-03, -1.383208e-02, -1.557822e-03, 2.141845e-02, 1.306685e-02, -2.703817e-02; ...
             9.461765e-03, -1.903961e-02, 9.259729e-03, 2.092081e-02, -2.616398e-02, 1.488194e-02, -2.000703e-02, -1.779715e-03, 1.944881e-02, -8.834809e-03, 1.111525e-02, -2.020299e-03, -9.824769e-03, -3.819426e-03, 9.369038e-03, -1.097681e-02, 1.779039e-02, -6.967509e-05, -2.072011e-02, 1.195655e-02, -2.472023e-02, 1.999051e-02, 9.103799e-03, -1.649611e-02, 1.116125e-02; ...
             -1.276378e-02, -2.239019e-02, 1.318031e-02, 4.854692e-03, 1.613770e-02, 2.366510e-02, 3.365517e-03, 1.185739e-02, -2.950364e-02, -1.504651e-02, 1.041257e-02, -1.035306e-02, 1.290006e-02, -1.052187e-02, 1.029922e-02, -1.487013e-02, -2.911387e-02, 1.158477e-02, 2.499629e-03, 2.391300e-02, 1.555695e-02, 4.892987e-03, 1.364795e-02, -2.125655e-02, -1.282274e-02; ...
             1.074149e-02, 2.515451e-03, 1.808746e-02, -2.229771e-02, -6.676172e-03, -9.759672e-03, -2.749826e-02, 1.421082e-02, -7.220009e-03, 2.151541e-02, 1.146701e-02, -1.450976e-02, 1.914997e-02, -1.505671e-02, 1.107719e-02, 2.192666e-02, -8.306328e-03, 1.781265e-02, -2.675174e-02, -1.080701e-02, -4.167049e-03, -2.581851e-02, 1.676959e-02, 1.318566e-03, 1.239647e-02; ...
             -8.649850e-03, -7.267295e-03, -9.820166e-03, -1.524562e-02, -2.070355e-03, 1.843075e-02, 1.953082e-02, 2.781963e-02, 2.161110e-02, 1.685639e-02, -1.567218e-02, -3.455568e-02, -2.519429e-02, -2.581476e-02, -2.203168e-02, 1.991439e-02, 1.908059e-02, 2.690127e-02, 1.993823e-02, 1.924662e-02, -8.386243e-03, -7.649443e-03, -6.769040e-03, -1.648981e-02, -3.790652e-03; ...
             -2.505853e-02, 3.093122e-02, 1.959405e-03, -2.588752e-02, 2.281194e-02, 2.805952e-03, -6.226672e-03, -5.810828e-03, 2.900400e-03, -8.254701e-03, 2.975774e-02, -2.983476e-02, 3.434614e-03, 3.916734e-02, -2.375198e-02, 2.519860e-03, -7.509202e-03, -2.428684e-03, -9.055903e-04, -7.662613e-03, -2.142447e-02, 2.812425e-02, 2.742375e-03, -2.887277e-02, 2.651838e-02; ...
             2.781379e-02, -8.964970e-03, -1.939298e-02, -1.116958e-02, 2.650008e-02, -2.812039e-02, -4.279436e-03, 4.101052e-02, -3.989397e-04, -2.774668e-02, 1.825550e-03, -5.334395e-04, 5.700419e-04, 1.309055e-03, 6.201706e-04, 2.785861e-02, 1.098559e-03, -4.154970e-02, -2.632117e-03, 2.667953e-02, -2.847731e-02, 1.065990e-02, 2.356430e-02, 7.821847e-03, -2.401990e-02; ...
             -7.289494e-03, 2.778949e-02, -4.076968e-02, 3.079947e-02, -8.361666e-03, -1.954803e-02, 2.683028e-02, -2.170881e-02, 2.596227e-02, -2.113141e-02, -2.248506e-03, 2.039973e-03, 9.568565e-04, -1.181266e-03, 2.621818e-03, 1.684004e-02, -2.512634e-02, 2.082577e-02, -2.749728e-02, 1.907832e-02, 9.927705e-03, -2.817837e-02, 3.863141e-02, -2.628288e-02, 7.011375e-03; ...
             1.254827e-02, 1.672526e-02, -2.055042e-05, -1.652167e-02, -1.190621e-02, -2.994405e-02, -3.073764e-02, -1.601395e-03, 3.047954e-02, 3.107949e-02, 3.684171e-02, 3.292144e-02, 1.226952e-03, -3.091271e-02, -3.968902e-02, -3.329961e-02, -2.769844e-02, -1.000951e-03, 2.649982e-02, 3.505511e-02, 1.617838e-02, 1.238091e-02, 1.346103e-03, -1.438129e-02, -1.554216e-02; ...
             -2.922237e-02, 2.843687e-02, 6.924440e-03, -3.508001e-02, 2.967470e-02, 3.908756e-02, -3.642191e-02, -5.664702e-03, 3.710068e-02, -3.391521e-02, -8.448735e-03, 1.946955e-03, 4.018432e-04, 6.017557e-03, -2.403557e-03, -2.973853e-02, 4.107572e-02, -3.610871e-03, -4.115102e-02, 3.478845e-02, 2.790016e-02, -3.597431e-02, 3.851896e-03, 3.367749e-02, -2.929631e-02; ...
             -2.406228e-02, 4.299794e-02, -4.224165e-02, 3.537140e-02, -1.739402e-02, 7.277841e-03, -9.078831e-03, 4.174041e-03, -5.139325e-03, 4.176376e-03, 2.086051e-02, -4.526647e-02, 5.630453e-02, -4.370253e-02, 1.837763e-02, 4.488923e-03, -4.534657e-03, 1.703257e-03, -7.727625e-03, 9.262645e-03, -1.886450e-02, 3.813441e-02, -4.382047e-02, 4.306430e-02, -2.442912e-02; ...
             -1.608210e-02, -4.282569e-03, 2.663023e-02, 4.877712e-03, -2.149002e-02, 3.929581e-02, 2.043959e-04, -4.830852e-02, -9.006454e-03, 4.324469e-02, -5.022578e-02, 8.890465e-03, 5.023499e-02, 1.038884e-02, -4.787126e-02, 4.509361e-02, -8.775488e-03, -4.790426e-02, -2.928270e-03, 3.783488e-02, -2.181993e-02, 2.773643e-03, 2.841240e-02, -3.759079e-03, -1.546060e-02; ...
             2.633624e-02, -4.802246e-02, 5.195981e-02, -4.499151e-02, 2.264600e-02, -3.117701e-02, 5.631380e-02, -5.991354e-02, 5.066377e-02, -2.458726e-02, 2.515153e-03, -4.009578e-03, 2.340818e-03, 2.941112e-04, -2.233013e-03, 2.536109e-02, -4.982257e-02, 5.722452e-02, -5.085479e-02, 2.656755e-02, -2.224313e-02, 4.427703e-02, -5.144907e-02, 4.499652e-02, -2.216760e-02; ...
             2.280561e-02, -2.437351e-02, -2.246376e-03, 2.768885e-02, -2.457791e-02, -4.647074e-02, 4.999924e-02, 3.809341e-03, -5.453615e-02, 4.916703e-02, 5.292266e-02, -5.991802e-02, -1.692827e-03, 6.129745e-02, -5.404578e-02, -4.706817e-02, 5.404050e-02, -1.354934e-03, -5.148060e-02, 4.605922e-02, 2.335897e-02, -2.817657e-02, 2.447655e-03, 2.445462e-02, -2.211332e-02; ...
             -1.769456e-02, 3.428693e-02, -3.736133e-02, 3.254479e-02, -1.696630e-02, 3.549940e-02, -6.760114e-02, 7.547888e-02, -6.461894e-02, 3.360068e-02, -4.157997e-02, 7.904993e-02, -9.067029e-02, 7.840430e-02, -4.049210e-02, 3.843412e-02, -7.125264e-02, 8.086111e-02, -7.028619e-02, 3.636470e-02, -1.997645e-02, 3.737547e-02, -4.145177e-02, 3.620549e-02, -1.826873e-02];
