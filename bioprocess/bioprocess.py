import numpy as np
from fmpy import *
import os
fmu = os.getcwd() + '/bioprocess.fmu'
#dump(fmu)

start_values={
        'VCC_init': 1., 
        'c_glc_init': 3, 
        'c_asn_init': 1.0,
        'DCC_init': 0.1, 
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
#print(result)

import plotly.io as pio
#pio.renderers.default = "notebook"
#pio.renderers.default = "vscode"

import plotly.graph_objects as go
fig = go.Figure()
fig.add_trace(go.Scatter(x=result['time'], y=result['VCC'], mode='lines', name='VCC'))
fig.add_trace(go.Scatter(x=result['time'], y=result['DCC'], mode='lines', name='DCC'))
fig.add_trace(go.Scatter(x=result['time'], y=result['c_glc'], mode='lines', name='c_glc'))
fig.add_trace(go.Scatter(x=result['time'], y=result['c_asn'], mode='lines', name='c_asn'))
fig.add_trace(go.Scatter(x=result['time'], y=result['cp'], mode='lines', name='cp'))
fig.update_layout(legend_title_text = "Bio Process")
fig.update_xaxes(title_text="time (s)")

fig.show()