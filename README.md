# CP-ABE PoC for accessing data in the cloud

PoC status: 🛠

![alt text](./image/img1.PNG)

**Fase de registro del dato**:
-	Postman: 
    o	Para envío de atributo
-	Contenedor Master Authority: 
    o	Genera el par de claves
    o	Es un servidor que está a la escucha de la solicitud para el envío de la clave pública
-	Contenedor Registration Authority:
    o	Es un server que está a la escucha del postman
    o	Cuando recibe el request via postman, recupera la clave pública.
    o	Solicita NetworkID, el ContainerID y CollectionID al contenedor verifier para crear la policy
    o	Lleva a cabo el cifrado usando AES
    o	Envía el criptograma y la firma al contenedor verifier.
-	Contenedor verifier
    o	Es un server que está a la escucha del RA.
    o	Encargado de interactuar con el MongoDB
    o	Responde a la solicitud de Networkid, Containerid y CollectionID
    o	Asocia en el Contenedor Redis el CollectionID con el Access Token
-	Contenedor Redis
    o	Mantiene la relación CollectionID – Access Token.
-	Contenedor MongoDB
    o	Almacena el dato

**Fase de recuperación del dato**:
-	Postman:
    o	Para envío de Access Token, ID Token
-	Contenedor Master Authority: 
    o	Genera la clave usando MSK, A y el Access Token
    o	Es un servidor que escucha la solicitud del Contenedor Registration Authority para el envío de la clave para hacer el descifrado.
-	Contenedor Registration Authority:
    o	Es un server que está a la escucha del postman
    o	Cuando recibe el request del Access Token, ID Token se verifica, que simplemente será verificar de un JSON.
    o	Solicita la clave privada asociada al Token ID.
    o	Le envía el Access Token al Contenedor verifier 
    o	Espera a recibir CP
    o	Aplica el descifrado usando SkA,i y CP.
    o	Retorna el dato al postman.
-	Contenedor verifier
    o	Es un server que está a la escucha del RA.
    o	Verifica el Access Token
    o	Consulta el Collection asociada al Access Token en la DB de Redis.
    o	Recupera el dato asociado al Access Token.
-	Contenedor Redis
    o	Mantiene la relación CollectionID – Access Token.
-	Contenedor MongoDB
    o	Almacena el dato
