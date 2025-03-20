linterna(lint1). % el objeto lint1 tiene la propiedad de ser linterna
                 % lint1 es una linterna
                 % sintácticamente, 'linterna' es un predicado
linterna(lint2).
linterna(lint3).
martillo(m1).
encendida(lint1).
apunta(lint1,sala). % lint1 apunta a la sala
apunta(lint2,patio). % 'apunta' es un predicado

herramienta(X) :- linterna(X).
herramienta(X) :- martillo(X).

tiene_luz(X) :- linterna(L), encendida(L), apunta(L,X).

% que las linternas ahora tengan luces de colores
color_linterna(lint1,amarillo).
color_linterna(lint2,azul).
color_linterna(lint3,rojo).

% ahora modificamos el predicado tiene_luz para que exprese el color de la linterna
tiene_luz(X,C) :- linterna(L), encendida(L), apunta(L,X), color_linterna(L,C).

% agregar al programa que la linterna, además de estar encendida, debe estar con baterías para que pueda alumbrar (True or False)
baterias(lint1).
baterias(lint2).
baterias(lint3).

tiene_baterias(L) :- baterias(L).

tiene_luz(X,C) :- linterna(L), encendida(L), apunta(L,X), color_linterna(L,C), tiene_baterias(L).

% agrega a tu programa la capacidad de entender que algo tiene un color producto de la combinación de otros colores, 
% por ejemplo, que está verde si es alumbrado por amarillo y azul al mismo tiempo

combina(amarillo, azul, verde). % Combinaciones de colores
combina(azul, amarillo, verde).
combina(rojo, amarillo, naranja).
combina(amarillo, rojo, naranja).
combina(rojo, azul, morado).
combina(azul, rojo, morado).

apunta(lint1,patio). % como lint 1 (amarillo) apunta al patio y lint 2 (azul) apunta al patio, entonces el patio está verde
apunta(lint3,sala). % como lint 3 (rojo) apunta a la sala y lint 1 (amarillo) apunta a la sala, entonces la sala está naranja

encendida(lint2).
encendida(lint3).

linterna(lint4).
color_linterna(lint4,rosa).
encendida(lint4).
baterias(lint4).
apunta(lint4,pieza_1).

linterna(lint5).
color_linterna(lint5,rosa).
encendida(lint5).
baterias(lint5).
apunta(lint5,pieza_1).

% Ahora modificamos el predicado tiene_luz para que exprese los colores combinados
tiene_luz_final_combinado(X,Color) :- 
    linterna(L1), linterna(L2), 
    L1 != L2, 
    encendida(L1), encendida(L2),
    tiene_baterias(L1), tiene_baterias(L2),
    apunta(L1,X), apunta(L2,X), 
    color_linterna(L1,C1), color_linterna(L2,C2), 
    combina(C1,C2,Color).

tiene_luz_final_individual(X,C) :- 
    linterna(L1), 
    color_linterna(L1,C), 
    encendida(L1), 
    tiene_baterias(L1), 
    apunta(L1,X), 
    not tiene_luz_final_combinado(X,_).

