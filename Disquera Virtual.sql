-- ==========================================
--  MODELO DISQUERA
--  Tablas: Disco, Cancion, DiscoCancion
-- ==========================================
create database disquera;

use disquera;
-- ================================
--  TABLA: DISCO
-- ================================
CREATE TABLE Disco (
    Id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador del disco
    Nombre VARCHAR(200) NOT NULL,        -- Nombre del disco
    Artista VARCHAR(200) NOT NULL,       -- Nombre del artista
    Anio INT NOT NULL,                   -- Año de publicación
    Duracion INT NOT NULL,               -- Duración total en segundos
    Ranking INT,                         -- Ranking dentro de la disquera
    Genero VARCHAR(100)                  -- Género musical
) ENGINE=InnoDB;

-- ================================
--  TABLA: CANCION
-- ================================
CREATE TABLE Cancion (
    Id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador de la canción
    Nombre VARCHAR(200) NOT NULL,        -- Nombre de la canción
    Duracion INT NOT NULL                -- Duración de la canción en segundos
) ENGINE=InnoDB;

-- ================================
--  TABLA: DISCO CANCION (relación N-N)
-- ================================
CREATE TABLE DiscoCancion (
    Id INT AUTO_INCREMENT PRIMARY KEY,   -- Identificador de la relación
    IdDisco INT NOT NULL,                -- FK al disco
    IdCancion INT NOT NULL,              -- FK a la canción

    -- Claves foráneas con cascada
    CONSTRAINT FK_DiscoCancion_Disco FOREIGN KEY (IdDisco)
        REFERENCES Disco(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT FK_DiscoCancion_Cancion FOREIGN KEY (IdCancion)
        REFERENCES Cancion(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;


-- ================================
--  TABLA: DISCO 20 Datos.
-- ================================
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Ecos del Viento','Luz Andina',2001,3600,1,'Folk');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Horizonte Azul','Marina Sol',2004,4200,2,'Pop');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Rutas del Norte','Los Viajeros',1999,3800,3,'Rock');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Latidos Urbanos','Beat Callejero',2010,4000,4,'Hip-Hop');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Cielos Rojizos','Amanecer',2015,4500,5,'Pop');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Sueños en Fuego','Noche Viva',2008,3900,6,'Rock');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Raíces Eternas','Pacha Sonora',1995,3700,7,'Folklore');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Constelación','Estelar',2018,4400,8,'Electro');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Melodías del Sur','Brisa Austral',2002,3500,9,'Balada');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Caminos Paralelos','Doble Horizonte',2011,3950,10,'Indie');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Siluetas','Luna Creciente',2013,4100,11,'Pop');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Vibraciones','Sistema Solar',2017,4300,12,'Electro');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Alma de Acero','Hierro Vivo',2005,3700,13,'Metal');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Sombras del Tiempo','Pasajeros',2009,4050,14,'Rock');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Reflejos','Espejo Interior',2012,4200,15,'Indie');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Ciclos','Ritmo Infinito',2016,4500,16,'Electro');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Notas del Mar','Olas Blancas',2003,3600,17,'Pop');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Luces de la Ciudad','Urbano',2007,3900,18,'Hip-Hop');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Senderos','Ruta Libre',2014,4000,19,'Rock');
INSERT INTO Disco (Nombre, Artista, Anio, Duracion, Ranking, Genero) VALUES ('Renacer','Nueva Era',2020,4600,20,'Indie');

-- ================================
--  TABLA: CANCION 72 Datos.
-- ================================
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Luz de Medianoche', 225);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Caminos Perdidos', 248);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Sombras del Alba', 178);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ecos del Tiempo', 213);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Voces en el Viento', 241);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Sueños de Cristal', 207);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Mar Eterno', 302);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Silencio Urbano', 169);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ríos de Tinta', 236);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Latidos del Sur', 254);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ciclos del Destino', 198);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Huellas en la Arena', 244);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Cenizas del Sol', 187);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Nubes Rojas', 175);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Espejos del Alma', 312);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('La Última Llamada', 222);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Montañas de Fuego', 267);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Versos Antiguos', 209);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Reloj de Arena', 231);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Sombras de Papel', 246);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ruta de las Estrellas', 177);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Canto del Bosque', 228);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Mariposa Eléctrica', 192);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Travesía del Norte', 279);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Brillo Infinito', 205);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Historias del Pasado', 304);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ciudad en Llamas', 251);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Azul Profundo', 173);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Amanecer Dorado', 239);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Susurros del Mar', 248);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Tormenta Silenciosa', 321);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Corazón de Acero', 216);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Cazador de Sueños', 247);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Puente de Sombras', 167);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Alas Negras', 234);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Flor del Desierto', 266);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Vértigo Lunar', 211);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Nueva Aurora', 242);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Grito del Silencio', 224);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ritmo Salvaje', 179);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Laberinto Azul', 197);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Noche de Ciudad', 275);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Caminante Nocturno', 203);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Palabras Quebradas', 238);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Sombras del Pasado', 259);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Llamas Eternas', 186);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Cruz del Sur', 300);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Vuelos Perdidos', 191);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Pacto de Hielo', 256);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Luz del Horizonte', 215);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Aliento de Fuego', 232);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Río Congelado', 258);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Voces de Titanes', 221);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Camino de Héroes', 243);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Eco Carmesí', 199);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('El Último Viajero', 247);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Diamante Negro', 194);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Arena Plateada', 284);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Viaje Estelar', 212);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('La Ruta del Dragón', 269);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Fuego Interior', 189);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Colores del Aire', 276);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Lamento Gris', 226);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Eterna Vigilia', 263);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Nexo Perdido', 201);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Canto Sideral', 315);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Sombras Luminosas', 208);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Origen del Trueno', 249);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Ecos Dorados', 234);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Mirada de Acero', 243);

INSERT INTO Cancion (Nombre, Duracion) VALUES ('Fragancia del Tiempo', 218);
INSERT INTO Cancion (Nombre, Duracion) VALUES ('Cielo Escarlata', 260);


-- ================================
--  TABLA: DISCOCANCION.
-- ================================
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (1, 1);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (1, 2);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (1, 3);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (1, 4);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (1, 5);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (2, 6);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (2, 7);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (2, 8);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (2, 9);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (2, 10);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (3, 11);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (3, 12);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (3, 13);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (3, 14);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (3, 15);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (4, 16);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (4, 17);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (4, 18);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (4, 19);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (4, 20);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (5, 21);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (5, 22);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (5, 23);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (5, 24);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (5, 25);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (6, 26);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (6, 27);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (6, 28);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (6, 29);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (6, 30);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (7, 31);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (7, 32);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (7, 33);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (7, 34);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (7, 35);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (8, 36);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (8, 37);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (8, 38);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (8, 39);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (8, 40);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (9, 41);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (9, 42);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (9, 43);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (9, 44);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (9, 45);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (10, 46);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (10, 47);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (10, 48);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (10, 49);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (10, 50);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (11, 51);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (11, 52);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (11, 53);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (11, 54);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (11, 55);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (12, 56);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (12, 57);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (12, 58);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (12, 59);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (12, 60);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (13, 61);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (13, 62);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (13, 63);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (13, 64);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (13, 65);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (14, 66);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (14, 67);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (14, 68);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (14, 69);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (14, 70);

INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (15, 71);
INSERT INTO DiscoCancion (IdDisco, IdCancion) VALUES (15, 72);

