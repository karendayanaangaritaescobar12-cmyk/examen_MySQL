CREATE DATABASE IF NOT EXISTS medisitema;
USE medisistema;

-- Tabla base de Personas (Herencia / Personal)
CREATE TABLE persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni_nif VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(20),
    email VARCHAR(100)
) ENGINE=InnoDB;

-- Especialidades Médicas
CREATE TABLE especialidad (
    id_especialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- Médicos (Extensión de Persona)
CREATE TABLE medico (
    id_medico INT PRIMARY KEY,
    tipo ENUM('titular', 'interino', 'sustituto') NOT NULL,
    id_especialidad INT NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_especialidad) REFERENCES especialidad(id_especialidad)
) ENGINE=InnoDB;

-- Empleados No Médicos
CREATE TABLE empleado (
    id_empleado INT PRIMARY KEY,
    tipo_empleado ENUM('ATS', 'auxiliar_enfermeria', 'celador', 'administrativo') NOT NULL,
    id_supervisore INT NULL,
    FOREIGN KEY (id_empleado) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_supervisore) REFERENCES empleado(id_empleado)
) ENGINE=InnoDB;

-- Pacientes
CREATE TABLE paciente (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    dni_nif VARCHAR(20) UNIQUE NOT NULL,
    id_medico_asignado INT NOT NULL,
    FOREIGN KEY (id_medico_asignado) REFERENCES medico(id_medico)
) ENGINE=InnoDB;

-- Horarios de Consulta
CREATE TABLE horario_consulta (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    id_medico INT NOT NULL,
    dia_semana ENUM('Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo') NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Registro de Sustituciones
CREATE TABLE sustitucion (
    id_sustitucion INT AUTO_INCREMENT PRIMARY KEY,
    id_medico_titular INT NOT NULL,
    id_medico_sustituto INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    FOREIGN KEY (id_medico_titular) REFERENCES medico(id_medico),
    FOREIGN KEY (id_medico_sustituto) REFERENCES medico(id_medico)
) ENGINE=InnoDB;

-- Control de Vacaciones
CREATE TABLE vacacion (
    id_vacacion INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('planificada', 'disfrutada') NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Atenciones / Citas Realizadas
CREATE TABLE atencion_medica (
    id_atencion INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    fecha_atencion DATETIME NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES medico(id_medico)
) ENGINE=InnoDB;
USE medisitema;


-- =========================================
-- 1. ESPECIALIDADES
-- =========================================

INSERT INTO especialidad (nombre) VALUES
('Medicina General'),
('Cardiologia'),
('Pediatria'),
('Dermatologia'),
('Traumatologia'),
('Ginecologia');


-- =========================================
-- 2. PERSONAS
-- =========================================

INSERT INTO persona (nombre, apellido, dni_nif, telefono, email) VALUES
('Alejandro', 'Fernandez', '3003003001', '3101112233', 'alejandro.fernandez@gmail.com'),
('Lucia', 'Gomez', '3003003002', '3102223344', 'lucia.gomez@gmail.com'),
('Mateo', 'Perez', '3003003003', '3103334455', 'mateo.perez@gmail.com'),
('Carmen', 'Sanchez', '3003003004', '3104445566', 'carmen.sanchez@gmail.com'),
('David', 'Ramirez', '3003003005', '3105556677', 'david.ramirez@gmail.com'),
('Elena', 'Torres', '3003003006', '3106667788', 'elena.torres@gmail.com'),
('Javier', 'Diaz', '3003003007', '3107778899', 'javier.diaz@gmail.com'),
('Sara', 'Ruiz', '3003003008', '3108889900', 'sara.ruiz@gmail.com'),
('Adrian', 'Moreno', '3003003009', '3109990011', 'adrian.moreno@gmail.com'),
('Claudia', 'Alvarez', '3003003010', '3111112233', 'claudia.alvarez@gmail.com'),
('Gabriel', 'Romero', '3003003011', '3112223344', 'gabriel.romero@gmail.com'),
('Beatriz', 'Alonso', '3003003012', '3113334455', 'beatriz.alonso@gmail.com');


-- =========================================
-- 3. MEDICOS
-- =========================================

INSERT INTO medico (id_medico, tipo, id_especialidad) VALUES
(1, 'titular', 1),
(2, 'titular', 2),
(3, 'interino', 3),
(4, 'titular', 4),
(5, 'sustituto', 5),
(6, 'interino', 6);


-- =========================================
-- 4. EMPLEADOS NO MEDICOS
-- =========================================

INSERT INTO empleado (id_empleado, tipo_empleado, id_supervisore) VALUES
(7, 'ATS', NULL),
(8, 'auxiliar_enfermeria', 7),
(9, 'celador', 7),
(10, 'administrativo', NULL),
(11, 'ATS', 7),
(12, 'auxiliar_enfermeria', 7);


-- =========================================
-- 5. PACIENTES
-- =========================================

INSERT INTO paciente 
(nombre, apellido, dni_nif, id_medico_asignado) VALUES
('Martin', 'Blanco', '4004004001', 1),
('Valeria', 'Molina', '4004004002', 2),
('Lucas', 'Ortega', '4004004003', 3),
('Daniela', 'Castro', '4004004004', 4),
('Thiago', 'Rubio', '4004004005', 1),
('Martina', 'Sanz', '4004004006', 2),
('Bruno', 'Iglesias', '4004004007', 3),
('Valeria', 'Medina', '4004004008', 4),
('Alvaro', 'Cortes', '4004004009', 5),
('Jimena', 'Garrido', '4004004010', 6);


-- =========================================
-- 6. HORARIOS DE CONSULTA
-- =========================================

INSERT INTO horario_consulta 
(id_medico, dia_semana, hora_inicio, hora_fin) VALUES
(1, 'Lunes', '09:00:00', '14:00:00'),
(1, 'Martes', '09:00:00', '14:00:00'),
(1, 'Miercoles', '09:00:00', '14:00:00'),
(1, 'Jueves', '09:00:00', '14:00:00'),
(1, 'Viernes', '09:00:00', '14:00:00'),
(1, 'Sabado', '09:00:00', '13:00:00'),
(1, 'Domingo', '09:00:00', '13:00:00');


-- =========================================
-- 7. SUSTITUCIONES
-- =========================================

INSERT INTO sustitucion 
(id_medico_titular, id_medico_sustituto, fecha_inicio, fecha_fin) VALUES
(1, 5, '2026-05-01', '2026-05-15'),
(2, 5, '2026-06-03', '2026-06-10'),
(4, 5, '2026-07-01', '2026-07-15');


-- =========================================
-- 8. VACACIONES
-- =========================================

INSERT INTO vacacion 
(id_persona, fecha_inicio, fecha_fin, estado) VALUES
(1, '2026-02-01', '2026-02-10', 'disfrutada'),
(2, '2026-03-03', '2026-03-12', 'disfrutada'),
(3, '2026-04-15', '2026-04-20', 'planificada'),
(4, '2026-05-20', '2026-05-30', 'disfrutada'),
(5, '2026-06-05', '2026-06-15', 'planificada'),
(6, '2026-07-10', '2026-07-20', 'planificada'),
(7, '2026-01-01', '2026-01-10', 'disfrutada'),
(8, '2026-03-15', '2026-03-20', 'disfrutada'),
(9, '2026-04-01', '2026-04-05', 'disfrutada'),
(10, '2026-05-10', '2026-05-20', 'planificada'),
(11, '2026-06-05', '2026-06-12', 'disfrutada'),
(12, '2026-08-20', '2026-08-30', 'planificada');


-- =========================================
-- 9. ATENCIONES MEDICAS
-- =========================================

INSERT INTO atencion_medica 
(id_paciente, id_medico, fecha_atencion) VALUES
(1, 1, '2026-01-10 09:30:00'),
(2, 2, '2026-01-11 10:00:00'),
(3, 3, '2026-01-12 11:30:00'),
(4, 4, '2026-01-13 12:00:00'),
(5, 1, '2026-01-14 09:00:00'),
(6, 2, '2026-01-15 10:30:00'),
(7, 3, '2026-01-16 11:00:00'),
(8, 4, '2026-01-17 15:00:00'),
(9, 5, '2026-01-18 09:30:00'),
(10, 6, '2026-01-19 10:00:00'),
(1, 1, '2026-01-20 11:30:00'),
(3, 3, '2026-01-21 16:00:00');