%       Compute wavelet entropy (WE) of the input signal.
%       
%       [WE] = compute_WE( data, W_NAME, MAX_LVL )
%       Inputs:
%
%       data    = vector containing signal values. If data is a
%               matrix each row will be treated as a separate signal vector.
%       W_NAME  = name of the wavelet transform to be used. Look at
%               wfilters for a reference (default: 'db4').
%       MAX_LVL = maximum decomposition level of the wavelet transform
%               (default: 4).
%
%       Outputs:
%
%       WE      = computed value of wavelet transform for each row of data
%               matrix.
%
%       Example: Consider a 14 channel EEG data sampled @ 250Hz lasting 5
%       seconds. Data matrix (data) would be a 2-D matrix with each row
%       containing time samples for each channel (size(data) = [14 1250]).
%
%       numCh = 14;
%       eegData = rand(numCh, 1250);
%       W_NAME = 'db4';
%       MAX_LVL = 4;
%       WE = compute_WE(eegData, W_NAME, MAX_LVL);
%       figure; bar(1:numCh, WE);
%       xlabel('Channel #'); ylabel('Wavelet Entropy');
%--------------------------------------------------------------------------
%       Reference:
%       Rosso, O. A., Blanco, S., Yordanova, J., Kolev, V., Figliola, A.,
%       Schürmann, M., & Ba?ar, E. (2001).
%       Wavelet entropy: a new tool for analysis of short duration brain
%       electrical signals. Journal of neuroscience methods, 105(1), 65-75.
%--------------------------------------------------------------------------
%       Author: Pouya Bashivan, CVPIA Lab, University of Memphis, Dec 2014
%       Email: pbshivan@memphis.edu
%--------------------------------------------------------------------------

function [ WE ] = compute_WE( data, W_NAME, MAX_LVL )

if ndims(data) > 2
    error('data matrix can not have more than two dimensions.');
end
% Setting default parameter values
if ~exist('W_NAME', 'var')
    W_NAME = 'db4';
end
if ~exist('MAX_LVL', 'var')
    MAX_LVL = 4;
end

[nRow, ~] = size(data);
WE = zeros([1 size(data, 1)]);
for r = 1 : nRow
    clear C L D E P;
    [C, L] = wavedec(data(r, :), MAX_LVL, W_NAME);
    
    for k = 1 : MAX_LVL
        if k < MAX_LVL
            D(k).values = detcoef(C, L, k);
        else
            D(k).values = appcoef(C, L, W_NAME, k);
        end
    end
    
    for k = 1 : MAX_LVL
        E(k) = sum(D(k).values .^ 2) / size(D(k).values, 2);
    end
    
    P = E ./ sum(E);
    WE(r) = -sum(P .* log(P));
    
end

end