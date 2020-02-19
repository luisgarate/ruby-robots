# Mejuri Robot Challenge

- Generación de datos con la gema [Faker]([https://github.com/stympy/faker](https://github.com/stympy/faker))
- 3 Robots solicitados con la funcionalidad correspondiente
- 1 Robot Broker para consultar por el stock de la fábrica a la hora de vender un auto en la tienda
- Los 4 robots son POROS como servicios (`./app/services/`), llamados en tareas rakes que luego serán ejecutadas en un crontab con la ayuda de la gema [Whenever]([https://github.com/javan/whenever](https://github.com/javan/whenever))
- Front-end con bootstrap y un template de dashboard

### Notas
- En localhost:3000 está la única vista con datos del back-end
- En el file `schedule.rb` hay una configuración de templates y output
	> Localmente utilizo **zsh** como shell, tuve algunos inconvenientes para hacer andar los jobs, por eso use esa configuración, si ustedes usan bash seguramente tengan que cambiar esas lineas.
- Para actualizar la lista de jobs ejecutar `whenever --update-crontab`
- Los jobs están comentados, por lo tanto si se quiere probar el proyecto de manera local hay que descomentarlos.
  > Lineas `11..33` en `schedule.rb`.
