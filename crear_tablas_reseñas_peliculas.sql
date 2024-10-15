-- Tabla Usuarios
CREATE TABLE usuarios (
    id_usuario INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL
);

-- Tabla Películas/Series
CREATE TABLE peliculas_series (
    id_pelicula INT IDENTITY(1,1) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT NOT NULL,
    tipo VARCHAR(50) NOT NULL, -- Puede ser 'pelicula' o 'serie'
    fecha_estreno DATE,
    calificacion_promedio FLOAT DEFAULT 0,
    genero VARCHAR(100)
);

-- Tabla Comentarios
CREATE TABLE comentarios (
    id_comentario INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT,
    id_pelicula INT,
    comentario TEXT NOT NULL,
    fecha_comentario DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas_series(id_pelicula)
);

-- T-- Tabla Reseñas/Calificaciones
CREATE TABLE reseñas (
    id_reseña INT IDENTITY(1,1) PRIMARY KEY,
    id_usuario INT,
    id_pelicula INT,
    calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
    reseña TEXT,
    fecha_reseña DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas_series(id_pelicula)
);
