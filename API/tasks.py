from apscheduler.schedulers.background import BackgroundScheduler
from django.core.mail import EmailMessage
from django.conf import settings

import pandas as pd
import requests
import os

scheduler = BackgroundScheduler()
scheduler.start()


def generar_reporte_y_enviar_correo():

    response = requests.get('http://localhost:8000/api/asistenciaActividades')

    # Ruta y nombre del archivo Excel a generar
    archivo = os.path.join(settings.BASE_DIR, 'reportes/reporte.xlsx')
    data = response.json()

    # Convertir el JSON a DataFrame
    df = pd.DataFrame(data)

    # Guardar el DataFrame en un archivo Excel
    df.to_excel(archivo, index=False)

    # Crea un objeto EmailMessage con el asunto, cuerpo y dirección de correo electrónico
    mensaje = EmailMessage(
        subject='Correo con archivo adjunto',
        body='Adjunto encontrará el archivo que solicitó.',
        from_email=settings.EMAIL_HOST_USER,
        to=['camilost1408@gmail.com'],
    )

    # Adjunta el archivo al correo electrónico
    mensaje.attach_file(archivo)

    # Envía el correo electrónico
    mensaje.send()


def programar_tarea(dia, hora, minuto):

    global scheduler

    task = scheduler.add_job(generar_reporte_y_enviar_correo,
                             'cron', day_of_week=dia, hour=hora, minute=minuto)
    # task = scheduler.add_job(generar_reporte_y_enviar_correo, 'interval', seconds=10)

    return task.id


def remove_tarea(id):

    global scheduler

    scheduler.remove_job(id)
