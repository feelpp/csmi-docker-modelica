
import numpy as np
from fmpy import *
fmu = 'lorenz.fmu'
#dump(fmu)

start_values={'x0': 5.0, 'y0': 5.0, 'z0': 5.0,
               'sigma': 10, 'beta': 8/3, 'r': 20
        }
result = simulate_fmu(filename=fmu,start_values=start_values, stop_time=15,fmi_call_logger=print)
#print(result)

import plotly.io as pio
pio.renderers.default = "notebook"
#pio.renderers.default = "vscode"

import plotly.graph_objects as go
fig = go.Figure()
fig.add_trace(go.Scatter3d(x=result['x'], y=result['y'], z=result['z'], mode='lines'))