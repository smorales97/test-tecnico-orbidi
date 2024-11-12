# prueba-tecnica-orbidi
En el siguiente readme se explicara brevemente como se trabajo en la implementación de la IaC y todo lo necesario para desplegar una aplicación FastApi.

Herramientas:

AWS
GitHub
GitHub Actions
Dockerfile
Terraform

Servicios Cloud:

- ECR: 
Como repositorio privado para las imagenes docker de la aplicación.

- ECS: 
Cluster donde se alojaran los servicios de la aplicación y escalara de manera autonoma con fargate.

- Load Balancer: 
Para el balanceo de cargas de los servicios.

- S3: 
Almacenamiento del estado de terraform

- DynamoDB: 
Para el bloqueo del estado.

Se tuvo en cuanta todas estas herramientas y servicios para la ejecución de la tarea, ya que de esta manera considero que cumplia todos los requisitos para dar con la solución, primero porque tenemos un cluster
que cumple con la funcion de tener alta disponibilidad, segundo porque tenemos menos gestion de mantenimiento hacerlo con un servicio como fargate, al ser un servicio tipo serverless, nos ahorramos tiempo en actualización 
y mantimiento, tercero, al alojar las imagenes en ECR nos permite tener una mayor seguridad en comparación con de otros repositorios y mas simple al tenerlo dentro de la misma nube.

# Variables necesarias.
AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_ACCOUNT_ID

AWS_REGION


Tener en cuenta que si tienes configurado el identity provider en AWS con github, podras ejecutar el pipeline con la variable y su respectivo valor del ARN del rol de AWS.

Configure AWS credentials oidc:

ROLE_AWS_GITHUB

En general mi perspectiva respecto a la prueba, estuvo retadora, me gusto en general, me genero algunos conflictos que me retrazo la entrega, pero me queda la satisfacción que di lo mejor para tenerla solucionada, faltaron muchas
mejoras, pero el tiempo fue un poco corto para todo lo que se podia hacer.

Muchas gracias, los saluda Santiago, espero poder estar en su equipo.
