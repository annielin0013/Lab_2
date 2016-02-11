;___________________________________________________________________________________________________
;                                                                                                   
;                                                 Week 1                                            
;       First 21-cm Line Measurement, Suitable Average/Median, Line Shape, Line Intensity,
;           Intensity vs. Frequency and Velocity Plots, and Choosing Reference Frame
;___________________________________________________________________________________________________

function getpico
  getpico, '1V', 1, 1, tseries, vmult=vmult
  return, tseries
end

pro histo
  volt = 1.
  n = 16000
  tseries = getpico()
  min = min(tseries)
  max = max(tseries)
  nbins = abs(min)+abs(max)+1
  histo_wrap, tseries, min(tseries), max(tseries), nbins, bin_edges, bin_cntrs, hx
  print, 'min'
  print, min
  print, 'max'
  print, max
  print, 'nbins'
  print, nbins
  print, 'bin edges'
  print, bin_edges
  print, 'bin centers'
  print, bin_cntrs
  print, 'histo'
  print, hx
  print, 'size tseries'
  print, size(tseries)
  plot, bin_cntrs, hx, psym=10
end
