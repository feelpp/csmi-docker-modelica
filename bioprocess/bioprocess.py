
import numpy as np
from fmpy import *
fmu = 'bioprocess.fmu'
#dump(fmu)

start_values={
        'VCC_init': 1., 
        'c_glc_init': 1, 
        'c_asn_init': 1.0,
        'DCC_init': 0, 
        'c_p_init': 0, 
        'mu_max': 20,
        'k_d': 0.002,
        'ms': 0.023,
        'k_asn': 1.91,
        'Gamma_VCC_glc': 0.39,
        'Gamma_VCC_asn': 1.75,
        'qp': 1e-3,
        }
result = simulate_fmu(filename=fmu,start_values=start_values, stop_time=15,fmi_call_logger=print)
print(result)

import plotly.io as pio
pio.renderers.default = "notebook"
#pio.renderers.default = "vscode"

import plotly.graph_objects as go
fig = go.Figure()
fig.add_trace(go.Scatter3d(x=result['time'], y=result['VCC'], mode='lines'))