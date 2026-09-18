 MediSistema

Descripcion General

Desarrollar una aplicación web interactiva que simule un sistema de gestión de recetas médicas para pacientes, empleando una API pública externa para la consulta de información clínica de medicamentos. El sistema debe permitir la gestión completa del ciclo de vida de los pacientes (CRUD), registrar consultas médicas, asociar recetas y generar análisis mediante inteligencia artificial (IA) utilizando un modelo LLM.

Problema

Diseñar e implementar un sistema que permita gestionar el ciclo de vida de recetas médicas asociadas a pacientes, integrando una API externa para consultar información oficial de medicamentos, registrar consultas médicas, asociar recetas y generar resúmenes automáticos mediante el consumo de un modelo de inteligencia artificial.

Consideraciones Principales

Gestion de pacientes: Registro, consulta y actualización, garantizando la persistencia de la información mediante almacenamiento local o en base de datos.

Gestion de recetas: Creación de recetas asociadas a pacientes y medicamentos, estableciendo dosis, vía de administración y duración.

Gestion de consultas: Almacenamiento de historiales de consultas médicas con fecha, motivo, diagnóstico y recetas recetadas.

Interfaz de usuario: Interfaz clara, intuitiva y funcional para la interacción eficiente con el sistema.

Requisitos del Modelo Logico y MVCC

Modelo logico: Estructura relacional de las entidades (Paciente, Consulta, Receta, Medicamento).

Modelo MVC (Modelo-Vista-Controlador): Arquitectura limpia que separa la lógica de negocio, la interfaz y el manejo de solicitudes.

Consumo de API externa: Consulta obligatoria a una API pública de medicamentos para obtener información oficial.

Consumo de inteligencia artificial: Integración opcional o requerida con un modelo de IA (por ejemplo, OpenAI, Gemini u otro) para generar un resumen inteligente del historial clínico del paciente.

Tecnologias y Herramientas

Base de datos: PostgreSQL, MySQL o SQLite para la persistencia de datos.

Arquitectura/Patron: Patron Modelo-Vista-Controlador (MVC) para la organización del código.

Inteligencia artificial: Consumo de API de IA (por ejemplo, Gemini, OpenAI) para procesar y generar resúmenes automáticos.

Recursos de Soporte

Se proporciona soporte para la implementación del proyecto, el cual incluye las siguientes herramientas y referencias:

Documentación de API externa: Referencias de APIs públicas para consultar información de medicamentos.

Documentación de Inteligencia Artificial: Guías y ejemplos para integrar modelos de lenguaje mediante APIs.

Estructuras base: Ejemplos de implementaciones previas o guías estructurales para el patrón MVC.
