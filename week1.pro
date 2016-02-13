;___________________________________________________________________________________________________
;                                                                                                   
;                                                 Week 1                                            
;       First 21-cm Line Measurement, Suitable Average/Median, Line Shape, Line Intensity,
;           Intensity vs. Frequency and Velocity Plots, and Choosing Reference Frame
;___________________________________________________________________________________________________

;function getpico
;  getpico, '1V', 1, 1, tseries, vmult=vmult
;  return, tseries
;end

pro get_6_2_1
;sample and save data for v_lo=615*2MHz=1230MHz, v_sample=62.5MHz
  !p.multi=[0,1,3]
  N = 16000
  v_sample = (62.5e6)/50 ;Hz
  time = (findgen(N)/v_sample) ;sec
  getpico, '1V', 50, 1, tseries, vmult=vmult
  tseries2 = tseries*vmult
  min = min(tseries2)
  max = max(tseries2)
  histo_wrap, tseries2, min, max, 64, bin_edges, bin_cntrs, hx

  print, 'min'
  print, min
  print, 'max'
  print, max
  print, 'bin edges'
  print, bin_edges
  print, 'bin centers'
  print, bin_cntrs
  print, 'histo'
  print, hx
  print, 'size tseries'
  print, size(tseries2)
  
  plot, time*1e6, tseries2, psym=-4, charsize=3, title='Voltage vs. Time', xtitle='Time(microseconds)', ytitle='Voltage (V)'
  plot, bin_cntrs, hx, psym=10, charsize=3, title='Histogram of Tseries', xtitle='Bin Centers', ytitle='Histogram'

;Create power spectrum of tseries
  xinput = time
  yinput = tseries2
  xoutput = ((findgen(N) - (N/2.))*v_sample/N) ;set and center output frequencies
  dft, xinput, yinput, xoutput, youtput
  power = (abs(youtput))^2
  plot, xoutput/1e6, power*1e6, psym = -4, charsize = 3, title = 'Power Spectrum', xtitle= 'Frequency (MHz)', ytitle = textoidl('Power (10^{-6})')

  save, time, tseries2, vmult, min, max, bin_edges, bin_cntrs, hx, xoutput, youtput, power, filename='week_1_6_2_1.sav'
end

pro restore_6_2_1
;restore and plot voltage vs. time, histogram of tseries, and power
;spectrum for 
  !p.multi=[0,1,3]
  restore, 'week_1_6_2_1.sav'
  plot, time*1e6, tseries2, psym=-4, charsize=3, title='Voltage vs. Time', xtitle='Time(microseconds)', ytitle='Voltage (V)'
  plot, bin_cntrs, hx, psym=10, charsize=3, title='Histogram of Tseries', xtitle='Bin Centers', ytitle='Histogram'
  plot, xoutput/1e6, power*1e6, psym = -4, charsize = 3, title = 'Power Spectrum', xtitle= 'Frequency (MHz)', ytitle = textoidl('Power (10^{-6})')
end


pro get_6_2_3_USB
;sample and save data for v_lo=615*2MHz=1230MHz, v_sample=62.5MHz
  !p.multi=[0,1,3]
  N = 8000
  v_sample = (62.5e6)/50 ;Hz
  time = (findgen(N)/v_sample) ;sec
  getpico, '2V', 50, 1, tseries, vmult=vmult, dual=1
  tseries2 = tseries*vmult
  min = min(tseries2)
  max = max(tseries2)
  histo_wrap, tseries2, min, max, 64, bin_edges, bin_cntrs, hx
  real = tseries2[*,0]
  imaginary = tseries2[*,1]
  tseries2 = complex(real, imaginary)
  plot, time*1e6, tseries2, psym=-4, charsize=3, title='Voltage vs. Time', xtitle='Time(microseconds)', ytitle='Voltage (V)'
  plot, bin_cntrs, hx, psym=10, charsize=3, title='Histogram of Tseries', xtitle='Bin Centers', ytitle='Histogram'

;Create power spectrum of tseries
  xinput = time
  yinput = tseries2
  xoutput = ((findgen(N) - (N/2.))*v_sample/N) ;set and center output frequencies
  dft, xinput, yinput, xoutput, youtput
  power = (abs(youtput))^2
  plot, xoutput/1e6, power*1e6, psym = -4, charsize = 3, title = 'Power Spectrum for USB', xtitle= 'Frequency (MHz)', ytitle = textoidl('Power (10^{-6})')

  save, time, tseries2, vmult, min, max, bin_edges, bin_cntrs, hx, xoutput, youtput, power, filename='week_1_6_2_2_USB.sav'
end

pro restore_6_2_3_USB
  restore, 'week_1_6_2_2_USB.sav'
end

pro get_6_2_3_LSB
;sample and save data for v_lo=615*2MHz=1230MHz, v_sample=62.5MHz
  !p.multi=[0,1,3]
  N = 8000
  v_sample = (62.5e6)/50 ;Hz
  time = (findgen(N)/v_sample) ;sec
  getpico, '2V', 50, 1, tseries, vmult=vmult, dual=1
  tseries2 = tseries*vmult
  min = min(tseries2)
  max = max(tseries2)
  histo_wrap, tseries2, min, max, 64, bin_edges, bin_cntrs, hx
  real = tseries2[*,0]
  imaginary = tseries2[*,1]
  tseries2 = complex(real, imaginary)
  plot, time*1e6, tseries2, psym=-4, charsize=3, title='Voltage vs. Time', xtitle='Time(microseconds)', ytitle='Voltage (V)'
  plot, bin_cntrs, hx, psym=10, charsize=3, title='Histogram of Tseries', xtitle='Bin Centers', ytitle='Histogram'

;Create power spectrum of tseries
  xinput = time
  yinput = tseries2
  xoutput = ((findgen(N) - (N/2.))*v_sample/N) ;set and center output frequencies
  dft, xinput, yinput, xoutput, youtput
  power = (abs(youtput))^2
  plot, xoutput/1e6, power*1e6, psym = -4, charsize = 3, title = 'Power Spectrum for USB', xtitle= 'Frequency (MHz)', ytitle = textoidl('Power (10^{-6})')

  save, time, tseries2, tseries3, vmult, min, max, bin_edges, bin_cntrs, hx, xoutput, youtput, power, filename='week_1_6_2_2_LSB.sav'
end
