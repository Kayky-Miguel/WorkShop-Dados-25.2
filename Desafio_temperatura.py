from _pydatetime import date

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

array = np.empty([7])

for i in range(0,7):

    array[i] = np.random.randint(20,36)

array_dias = np.array(['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'])

df = pd.DataFrame({"Temperatura": array, "Dias":array_dias})

print(df)

print(f'A média da semana foi de {df['Temperatura'].mean():.2f}°')

x = array_dias
y = array

plt.plot(x, y, label = "Temperatura em Graus")
plt.xlabel('Dias')
plt.ylabel('Temperatura')
plt.title('Clima')
plt.legend()
plt.show()
