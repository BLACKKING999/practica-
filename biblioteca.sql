SHOW PROCESSLIST;

SHOW DATABASES;
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS biblioteca_virtual
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

-- Usar la base de datos
USE biblioteca_virtual;

-- Tabla: usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100) UNIQUE,
    contrasena VARCHAR(255),
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Tabla: autores
CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_autor VARCHAR(100),
    nacionalidad VARCHAR(50)
);

-- Tabla: categorias
CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

-- Tabla: libros
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150),
    id_autor INT,
    id_categoria INT,
    anio_publicacion YEAR,
    disponible BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

-- Tabla: prestamos
CREATE TABLE prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_libro INT,
    fecha_prestamo DATE,
    fecha_devolucion DATE,
    devuelto BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

-- INSERTAR REGISTROS

-- Usuarios
INSERT INTO usuarios (nombre, correo, contrasena) VALUES
('Ana Torres', 'ana@example.com', 'clave123'),
('Carlos Ruiz', 'carlos@example.com', 'pass456'),
('Laura Gómez', 'laura@example.com', 'laura789'),
('Mario Vélez', 'mario@example.com', 'mario321'),
('Elena Paredes', 'elena@example.com', 'elena654');

-- Autores
INSERT INTO autores (nombre_autor, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiano'),
('Isabel Allende', 'Chilena'),
('Mario Vargas Llosa', 'Peruano'),
('J. K. Rowling', 'Británica'),
('George Orwell', 'Británico');

-- Categorías
INSERT INTO categorias (nombre_categoria) VALUES
('Novela'),
('Fantasía'),
('Ciencia Ficción'),
('Ensayo'),
('Clásicos');

-- Libros
INSERT INTO libros (titulo, id_autor, id_categoria, anio_publicacion) VALUES
('Cien años de soledad', 1, 1, 1967),
('La casa de los espíritus', 2, 1, 1982),
('Conversación en La Catedral', 3, 1, 1969),
('1984', 5, 3, 1949),
('Harry Potter y la piedra filosofal', 4, 2, 1997);

-- Préstamos
INSERT INTO prestamos (id_usuario, id_libro, fecha_prestamo, fecha_devolucion, devuelto) VALUES
(1, 1, '2025-04-01', '2025-04-15', TRUE),
(2, 2, '2025-04-05', '2025-04-19', TRUE),
(3, 3, '2025-04-10', '2025-04-24', FALSE),
(4, 4, '2025-04-15', '2025-04-29', FALSE),
(5, 5, '2025-04-17', '2025-05-01', FALSE);
