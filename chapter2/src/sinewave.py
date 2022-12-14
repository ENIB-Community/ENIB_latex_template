import numpy as np 
import matplotlib.pyplot as plt

Fe = 100
f0 = 5
t = np.arange(0, 1, 1/Fe)
x = np.sin(2*np.pi*f0*t)
plt.plot(t, x)
plt.grid()
plt.xlabel("temps [s]")
plt.ylabel("s(t)")
plt.savefig('../figures/sinewave.pdf')  