-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 13-06-2018 a las 12:25:26
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `db_evaluacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agente`
--

CREATE TABLE IF NOT EXISTS `agente` (
  `idAgente` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `sector` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `idCargo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idAgente`),
  KEY `idCargo` (`idCargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `agente`
--

INSERT INTO `agente` (`idAgente`, `apellido`, `nombre`, `sector`, `idCargo`) VALUES
(1, 'vasquez', 'juan', 'informatica', 1),
(2, 'bertran', 'daniel', 'informatica', 1),
(3, 'cavaliere', 'silvio', 'informatica', 1),
(4, 'ortega', 'mara', 'informatica', 1),
(5, 'domina', 'gustavo', 'informatica', 1),
(6, 'heine', 'vilma', 'informatica', 1),
(7, 'braian', 'herrera', 'informatica', 1),
(8, 'fabre', 'daniel', 'informatica', 2),
(9, 'marifil', 'juan', 'comunicacion', 1),
(10, 'delaloye', 'fabian', 'comunicacion', 1),
(11, 'lazzaletta', 'florencia', 'comunicacion', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `idCargo` int(11) NOT NULL,
  `nombre` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`idCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idCargo`, `nombre`) VALUES
(1, 'base'),
(2, 'jefe'),
(3, 'supervisor'),
(4, 'director');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compuesta`
--

CREATE TABLE IF NOT EXISTS `compuesta` (
  `nroFicha` int(11) NOT NULL,
  `tipoItem` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nroItem` int(11) NOT NULL,
  `puntaje` int(11) NOT NULL DEFAULT '1' COMMENT 'Puntaje entre 1 y 4',
  PRIMARY KEY (`nroFicha`,`tipoItem`,`nroItem`),
  KEY `tipoItem` (`tipoItem`,`nroItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eleccion`
--

CREATE TABLE IF NOT EXISTS `eleccion` (
  `tipoItem` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `nroItem` int(11) NOT NULL,
  `nroEleccion` int(11) NOT NULL,
  `descripcion` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tipoItem`,`nroItem`,`nroEleccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `eleccion`
--

INSERT INTO `eleccion` (`tipoItem`, `nroItem`, `nroEleccion`, `descripcion`) VALUES
('A', 1, 1, 'Requiere que le demanden institucionalmente participación en procesos de la comunicación de información.'),
('A', 1, 2, 'Responde a necesidades de capacitación y comunicación de información cuando le son solicitadas por lo interesados'),
('A', 1, 3, 'Percibe en los demás necesidades de capacitación para el trabajo y actúa en consecuencia.'),
('A', 1, 4, 'Es reconocido por su actitud docente y habilita espacios de manera espontánea.'),
('A', 2, 1, 'Requiere ser motivado para buscar información.'),
('A', 2, 2, 'Se interesa por buscar información cuando la necesita en su práctica cotidiana.'),
('A', 2, 3, 'Se esfuerza por adquirir mayor información y nuevos conocimientos para resolver problemas.'),
('A', 2, 4, 'Comparte su conocimiento y experiencia actuando como agente de cambio y propagador de nuevas ideas y tecnologías.'),
('A', 3, 1, 'Ocasionalmente diferencia entre el carácter público y/o privado de la información de la gestión institucional.'),
('A', 3, 2, 'Comprende el carácter privado y/o público de la información de su dominio.'),
('A', 3, 3, 'Gestiona la información de acuerdo a su carácter privado y/o público.'),
('A', 3, 4, 'Gestiona la información según criterios institucionales y de acuerdo a su carácter privado y/o público.'),
('A', 4, 1, 'Ocasionalmente modifica sus objetivos o acciones para responder a los cambios organizacionales o de prioridad.'),
('A', 4, 2, 'Modifica su comportamiento para adaptarse a la situación o a las personas, no de forma acomodaticia sino para beneficiar la calidad de su tarea o favorecer la calidad del proceso.'),
('A', 4, 3, 'Reconoce que los puntos de vista de los demás son tan válidos como los suyos. Es capaz de cambiar su opinión ante nuevos argumentos o evidencias.'),
('A', 4, 4, 'Reconoce y busca otros puntos de vista para el logro de los fines institucionales.'),
('A', 5, 1, 'Requiere supervisión para alcanzar los estándares establecidos.'),
('A', 5, 2, 'Alcanza básicamente los estándares establecidos.'),
('A', 5, 3, 'Alcanza los estándares definidos por niveles superiores, en los tiempos provistos y con los recursos que se le asignen.'),
('A', 5, 4, 'Fija objetivos para su área en concordancia con los objetivos estratégicos de la organización.'),
('A', 6, 1, 'Muestra escaso interés en atender con rapidez y/o satisfacer las necesidades de los usuarios.'),
('A', 6, 2, 'Actúa a partir de pedidos de los usuarios ofreciendo respuestas a su demanda. Atiende con rapidez.'),
('A', 6, 3, 'Identifica las necesidades de los usuarios, se anticipa a ellas, aportando soluciones a la medida de sus requerimientos.'),
('A', 6, 4, 'Se muestra proactivo para atender con rapidez a los usuarios y su trato es muy cortés. Muestra inquietud por conocer con exactitud el punto de vista y las necesidades del mismo.'),
('A', 7, 1, 'Realiza algunos intentos por resolver la tarea antes de darse por vencido.'),
('A', 7, 2, 'Tiene una actitud positiva frente a situaciones adversas. Pide ayuda para solucionar temas difíciles sin desanimarse.'),
('A', 7, 3, 'Nunca se rinde ante las negativas, identifica o crea caminos alternativos para alcanzar metas.'),
('A', 7, 4, 'Lo motivas las situaciones difíciles en que es previsible la posibilidad de obstáculos'),
('A', 8, 1, 'Ejecuta órdenes.'),
('A', 8, 2, 'Trabaja sin supervisión constante y no se amilana frente a los problemas.'),
('A', 8, 3, 'Introduce cambios en la manera de trabajar produciendo mejoras significativas en los resultados.'),
('A', 8, 4, 'Consigue comprometer a otros en tareas inusuales, actúa anticipadamente para crear oportunidades o para evitar problemas.'),
('A', 9, 1, 'tiene cierta dificultad para percibir la producción de los demás como aportes a la organización'),
('A', 9, 2, 'Acepta el trabajo de los demás enfatizando su propia perspectiva en el resultado final.'),
('A', 9, 3, 'Acepta el trabajo de los demás para lograr mejores resultados.'),
('A', 9, 4, 'Acepta y estimula los aportes de los demás compartiéndolos con el resto para lograr los mejores resultados en beneficio de la organización.'),
('A', 10, 1, 'Cumple los plazos o alcanza la calidad, pero difícilmente ambas cosas a la vez.'),
('A', 10, 2, 'Cumple los plazos tomando los márgenes de tolerancia previstos y la calidad mínima necesaria para cumplir el objetivo.'),
('A', 10, 3, 'Cumple con los plazos preestablecidos en la calidad requerida, preocupándose de lograrlo sin necesidad de recordatorios o consignas especiales.'),
('A', 10, 4, 'Desempeña las tareas con dedicación, cuidando cumplir tanto con los plazos como con la calidad requerida y aspirando a alcanzar el mejor resultado posible.'),
('A', 11, 1, 'Tiene cierta dificultad para comprender y percibir los estados de ánimo, demuestra incomprensión o sorpresa ante las acciones o emociones de los demás.'),
('A', 11, 2, 'Toma en cuenta los indicios de emociones o pensamientos de los demás para acompañar la situación.'),
('A', 11, 3, 'Comprende los problemas, sentimientos y preocupaciones subyacentes de los demás.'),
('A', 11, 4, 'Comprende los intereses de los demás modificando su propia conducta dentro de las normas de la organización y los ayuda a resolver problemas que le plantean o él mismo observa.'),
('A', 12, 1, 'S/D.'),
('A', 12, 2, 'S/D.'),
('A', 12, 3, 'S/D.'),
('A', 12, 4, 'S/D.'),
('C', 1, 1, 'Nociones básicas sobre componentes de la estrategia, programas y actividades.'),
('C', 1, 2, 'Aplica los conocimientos básicos de APS en su práctica diaria.'),
('C', 1, 3, 'Posee sólidos conocimientos sobre la estrategia de APS y tiende a aplicarlos en su práctica diaria.'),
('C', 1, 4, 'Aplica la estrategia de APS en su práctica diaria.'),
('C', 2, 1, 'Nociones básicas sobre normas de seguridad y bioseguridad de la institución.'),
('C', 2, 2, 'Conoce las normas de seguridad y bioseguridad y aplica las que corresponden a su ámbito de trabajo.'),
('C', 2, 3, 'Conoce y aplica las normas de seguridad y bioseguridad de la institución observando su aplicación.'),
('C', 2, 4, 'Da a conocer normas de seguridad y bioseguridad de la institución y de su ámbito de trabajo.'),
('C', 3, 1, 'Posee conocimientos básicos para su puesto de trabajo.'),
('C', 3, 2, 'Posee los conocimientos requeridos para su puesto de trabajo.'),
('C', 3, 3, 'Adquiere nuevos conocimientos en forma permanente para su puesto de trabajo.'),
('C', 3, 4, 'Es reconocido y consultado por sus conocimientos.'),
('C', 4, 1, 'Nociones básicas sobre derechos y deberes de los usuarios externos.'),
('C', 4, 2, 'Conoce los derechos y deberes de los usuarios externos.'),
('C', 4, 3, 'Aplica en su práctica diaria conocimientos sobre los derechos y deberes de los usuarios externos.'),
('C', 4, 4, 'Es reconocido por sus conocimientos sobre los derechos y deberes de los usuarios externos.'),
('C', 5, 1, 'Reconoce lo diferente tipos de registros y documentación de su puesto de trabajo.'),
('C', 5, 2, 'Conoce y utiliza los registros y documentación.'),
('C', 5, 3, 'Documenta y registra en forma completa en su práctica diaria.'),
('C', 5, 4, 'Es reconocido por la documentación y el registro que realiza en su práctica diaria.'),
('C', 6, 1, 'Conceptos epidemiológicos básicos: medidas de frecuencia de eventos en el proceso de salud enfermedad.'),
('C', 6, 2, 'Manejo de indicadores de salud en la práctica cotidiana (categoría hospitalaria, calidad, producción, impacto y efectividad): definiciones y construcción.'),
('C', 6, 3, 'Herramientas básicas para la investigación epidemiológica.'),
('C', 6, 4, 'Posee conocimientos avanzados sobre epidemiología de sistemas y servicios de salud y los aplica en su práctica cotidiana.'),
('C', 7, 1, 'Conocimientos básicos de la legislación y normativas vigentes relacionadas con su puesto de trabajo.'),
('C', 7, 2, 'Conoce y aplica la legislación y aplica las normativas vigentes relacionadas con su puesto de trabajo.'),
('C', 7, 3, 'Conoce y aplica la legislación y normativas vigentes relacionadas con su puesto de trabajo observando su apliación.'),
('C', 7, 4, 'Es consultado con respecto a la legislación y normativas vigentes relacionadas con su puesto de trabajo.'),
('C', 8, 1, 'Estadística descriptiva: conceptos generales.'),
('C', 8, 2, 'Estadística descriptiva: conceptos generales. Y conceptos generales de sistemas de información en salud, terminología médica y clasificación internacional de las enfermedades.'),
('C', 8, 3, 'Estadística descriptiva: conceptos generales. Conceptos generales de los sistemas de información en salud, terminología médica y clasificación internacional de las enfermedades. medidas de tendencia central.'),
('C', 8, 4, 'Estadística descriptiva: conceptos generales. Conceptos generales de los sistemas de información en salud, terminología médica y clasificación internacional de las enfermedades. medidas de tendencia central. Estadística inferencial.'),
('C', 9, 1, 'Conocimientos del EPCAPP y de las funciones de su puesto de trabajo, procedimientos administrativos necesarios en su tarea habitual.'),
('C', 9, 2, 'Procedimientos administrativos vigentes en la organización para las tramitaciones necesarias (expedientes, normas legales, etc.): inicio e interpretación.'),
('C', 9, 3, 'Procedimientos administrativos vigentes en la organización para las tramitaciones necesarias (expedientes, normas legales, etc.): propuestas y confección.'),
('C', 9, 4, 'Procedimientos administrativos vigentes en la organización para las tramitaciones complejas: propuestas y confección.'),
('C', 10, 1, 'Conoce rutinas y procedimientos de su sector de trabajo.'),
('C', 10, 2, 'Conoce y aplica rutinas y procedimientos de su sector de trabajo.'),
('C', 10, 3, 'Conoce y aplica rutinas y procedimientos de su sector de trabajo y las interrelaciones con los otros sectores.'),
('C', 10, 4, 'Conoce y aplica cotidianamente las rutinas y procedimientos de la organización y los procedimientos de atención vigentes.'),
('C', 11, 1, 'Sistema de gestión hospitalaria. Llenado según corresponda a su establecimiento y sector.'),
('C', 11, 2, 'Sistema de gestión hospitalario y codificaciones varias vigentes (CIE 10, geográficas, etc.)'),
('C', 11, 3, 'Sistema de gestión hospitalario y codificaciones varias vigentes (CIE 10, geográficas, etc.). EPI INFO nivel básico y cargado de estadísticas viatales.'),
('C', 11, 4, 'Sistema de gestión hospitalario y codificaciones varias vigentes (CIE 10, geográficas, etc.) EPI INFO nivel avanzado y cargado de estadísticas vitales.'),
('C', 12, 1, 'Conoce la complejidad de su establecimiento y su relación con otros de mayor y menor complejidad.'),
('C', 12, 2, 'Conoce y utiliza en su práctica habitual la red de establecimientos de su zona sanitaria, sus complejidades e interrelaciones.'),
('C', 12, 3, 'Conoce los establecimientos de su zona sanitaria, sus complejidades e interrelaciones incluso con otros establecimientos de diferentes zonas.'),
('C', 12, 4, 'Conoce y utiliza en su práctica habitual toda la red de establecimientos de la organización sus complejidades e interrelaciones.'),
('C', 13, 1, 'Conoce herramientas simples de presentación y comunicación de la información: carteleras, reportes, circulares, etc.'),
('C', 13, 2, 'Conoce y utiliza habitualmente herramientas simples de la presentación y comunicación de la información: carteleras, reportes, circulares, etc.'),
('C', 13, 3, 'Conoce herramientas complejas de presentación y comunicación de la información: publicaciones, informes con tablas y gráficos, recursos informáticos como power point.'),
('C', 13, 4, 'Conoce y utiliza frecuentemente herramientas complejas de presentación y comunicación de la información: publicaciones, informes con tablas y gráficos, recursos informáticos como power point.'),
('C', 14, 1, 'Presenta escaso o nulo conocimiento sobre temas relacionados con gestión de calidad.'),
('C', 14, 2, 'Conoce parcialmente aspectos relacionados con gestión de calidad (niveles, modelos, herramientas) pero no los aplica en su tarea habitual.'),
('C', 14, 3, 'Conoce en forma parcial o general aspectos relacionados con gestión de calidad (modelos, niveles, herramientas) sugiere implementarlos o los aplica en su lugar de trabajo siempre que tiene oportunidad.'),
('C', 14, 4, 'Conoce y aplica en forma parcial o general conocimientos sobre gestión de calidad (niveles, modelos, herramientas), promueve su utilización en la organización y los aplica en su lugar de trabajo siempre que tiene oportunidad.'),
('H', 1, 1, 'En ocasiones usa en forma adecuada los recursos, antepone objetivos personales.'),
('H', 1, 2, 'Usa adecuadamente los recursos en la mayoría de los casos, aunque a veces requiere que se le recuerde la pertinencia de su tarea.'),
('H', 1, 3, 'Se esfuerza por realizar un uso racional de los recursos logrando los objetivos con eficiencia y eficacia.'),
('H', 1, 4, 'Se preocupa porque todo su equipo de trabajo utilice adecuadamente los recursos.'),
('H', 2, 1, 'Organiza el trabajo y administra adecuadamente los tiempos.'),
('H', 2, 2, 'Establece objetivos y plazos para la realización de la tarea, define prioridades y controla la calidad del trabajo. Verifica que las acciones se hayan ejecutado como estaban previstas.'),
('H', 2, 3, 'Puede administrar diversos proyectos simples simultáneamente estableciendo mecanismos de coordinación y control de la información.'),
('H', 2, 4, 'Anticipa los puntos críticos de una situación problemática con un gran número de variables estableciendo controles y mecanismos de coordinación y agregando información para asegurar el cumplimiento de los procesos. Puede administrar diversos proyectos complejos simultáneamente.'),
('H', 3, 1, 'Usa criterios básicos, ligados a la experiencia, para la identificación y resolución de problemas.'),
('H', 3, 2, 'Es capaz de analizar situaciones problemáticas, descomponerlas en sus partes y establecer relaciones y prioridades entre ellas para resolverlas.'),
('H', 3, 3, 'Apela a conocimientos teóricos y experimentales para valorar la situación e identificar varias soluciones.'),
('H', 3, 4, 'Reconoce metodológicamente posibles causas de un hecho o varias consecuencias de una acción, comunicándolos mediante conceptos claros y simples y anticipando los obstáculos con una planificación viable.'),
('H', 4, 1, 'Comunica información sin considerar las inquietudes del destinatario.'),
('H', 4, 2, 'Transmite conocimientos teniendo en cuenta las necesidades de aprendizaje del destinatario.'),
('H', 4, 3, 'Realiza actividades de enseñanza sistemáticamente considerando las necesidades de la organización.'),
('H', 4, 4, 'Es reconocido por su destreza en la comunicación de conocimientos propios de su área de trabajo.'),
('H', 5, 1, 'Ocasionalmente delega tareas simples en el resto del equipo.'),
('H', 5, 2, 'Habitualmente delega tareas simples y evalúa la competencia del personal para realizar tareas más complejas.'),
('H', 5, 3, 'Delega tareas complejas y supervisa personalmente su realización.'),
('H', 5, 4, 'Deposita con plena confianza la realización de tareas complejas en personal competente de su sector.'),
('H', 6, 1, 'Desarrolla una propuesta estándar a los requerimientos del usuario sobre la base de su adecuada comprensión.'),
('H', 6, 2, 'Desarrolla una propuesta sobre la base de su conocimiento, experiencia y disponibilidad de recursos.'),
('H', 6, 3, 'Desarrolla una solución compleja incorporando a terceros y demostrando creatividad en el diseño de la misma.'),
('H', 6, 4, 'Desarrolla una solución innovadora sobre la base de un enfoque no tradicional para resolver problemas y una profunda comprensión de los objetivos institucionales.'),
('H', 7, 1, 'Utiliza ocasionalmente y parcialmente herramientas de intervención grupal.'),
('H', 7, 2, 'Utiliza las herramientas de intervención grupal requiriendo de un acompañamiento en la tarea.'),
('H', 7, 3, 'Utiliza las herramientas de intervención grupal adecuándolas al grupo y la situación.'),
('H', 7, 4, 'Posee una gran solvencia en el manejo de herramientas de intervención grupal.'),
('H', 8, 1, 'Los mensajes no siempre son transmitidos o comprendidos con claridad, no tiene interés por conocer el punto de vista o las inquietudes de otras personas.'),
('H', 8, 2, 'Los mensajes son claros a partir de escuchar e interesarse por los puntos de vista de los demás.'),
('H', 8, 3, 'Demuestra seguridad para expresar sus opiniones con claridad y precisión.'),
('H', 8, 4, 'Comprende temas complejos y se comunica con claridad y precisión posibilitando el acceso de los demás a la información.'),
('H', 9, 1, 'Comprende adecuadamente los requisitos del usuario demostrando conocimientos de su área.'),
('H', 9, 2, 'Resuelve los problemas del usuario relacionados con los aspectos técnicos de la situación.'),
('H', 9, 3, 'Logra demostrar una visión estratégica sobre las tendencias integrando diferentes ámbitos de discusión. Goza de mucha credibilidad y esto lo convierte en uno de los referente técnicos de la organización.'),
('H', 9, 4, 'Es considerado el referente teórico clave en los diferentes medios donde actúa y lo consultan para la toma de decisiones en la organización.'),
('H', 10, 1, 'Selecciona y organiza la información a comunicar.'),
('H', 10, 2, 'Jerarquiza la información a comunicar seleccionando los medios y materiales más adecuados para su presentación.'),
('H', 10, 3, 'Elabora reportes y presentaciones operando herramientas simples.'),
('H', 10, 4, 'Realiza reportes y presentaciones complejas comunicando claramente la información en función del público destinatario.'),
('H', 11, 1, 'Organiza el trabajo de otros asignando tareas a partir de la identificación de loq eu cada uno es capaz de hacer.'),
('H', 11, 2, 'Organiza equipos de trabajo definiendo pautas generales de la actividad y delegando algunas a los integrantes del mismo. Ocasionalmente medía en situaciones de conflicto.'),
('H', 11, 3, 'Asigna objetivos claros a mediano plazo, mostrándose disponible para brindar apoyo o ayuda cuando el equipo lo considera necesario. Retiene a la gente con talento y logra eficaz comunicación vertical y horizontal en el equipo.'),
('H', 11, 4, 'Exige alto rendimiento estableciendo estándares consensuados con sus colaboradores. Logra que el equipo se fije objetivos posibles en relación con los lineamientos de la organización y la competencia de sus integrantes.'),
('H', 12, 1, 'Aplica básicamente las técnicas y procedimientos de su puesto de trabajo.'),
('H', 12, 2, 'Aplica adecuadamente las técnicas y procedimientos de su puesto de trabajo.'),
('H', 12, 3, 'Aplica con solvencia las técnicas y procedimientos de su puesto de trabajo.'),
('H', 12, 4, 'Es reconocido y consultado por su solvencia técnica por usuarios internos y/o externos.'),
('H', 13, 1, 'Puede orientar la acción del grupo inspirando confianza.'),
('H', 13, 2, 'Orienta la acción del grupo motivando e inspirando confianza y realiza un adecuado seguimiento de lo encomendado.'),
('H', 13, 3, 'El grupo lo percibe como líder, fija objetivos, realiza el seguimiento de las acciones y da feedback sobre su avance, escucha a los demás y es escuchado.'),
('H', 13, 4, 'Orienta la acción de su grupo en una dirección determinada, inspirando valores de acción y anticipando escenarios, fija objetivos, realiza su seguimiento y da feedback sobre su avance integrando diferentes opiniones.'),
('H', 14, 1, 'Realiza algunos acuerdos satisfactorios para la organización centrándose en los problemas.'),
('H', 14, 2, 'Atiende los objetivos de la organización y logra acuerdos satisfactorios centrando la negociación en la persona que la realiza.'),
('H', 14, 3, 'Llega a acuerdos satisfactorios en el mayor número de las negociaciones a su cargo en concordancia con los objetivos de la organización.'),
('H', 14, 4, 'Es reconocido por su habilidad para llegar a acuerdos satisfactorios para todos. Utiliza herramientas y metodologías para diseñar y preparar la estrategia de cada negociación.'),
('H', 15, 1, 'Word. Excel básico. Correo electrónico. De acuerdo a recursos y necesidades de servicio.'),
('H', 15, 2, 'Word. Excel avanzado. Correo electrónico.'),
('H', 15, 3, 'Word. Excel avanzado. Correo electrónico. Internet.'),
('H', 15, 4, 'Word. Excel avanzado. Correo electrónico. Internet. Power Point.'),
('H', 16, 1, 'Se relaciona informalmente con distintas personas.'),
('H', 16, 2, 'Establece y mantiene relaciones cordiales con los usuarios y/o compañeros de trabajo.'),
('H', 16, 3, 'Muestra permanente motivación para incrementar sus relaciones y formar grupos de intereses comunes.'),
('H', 16, 4, 'Planifica y desarrolla redes de relaciones a las que acude para mantenerse informado e identificar oportunidades.'),
('H', 17, 1, 'Su desempeño se deteriora en situaciones de mucha presión, ya sea por tiempos o situaciones imprevistas o desacuerdos.'),
('H', 17, 2, 'Alcanza los objetivos aunque esté presionado, su desempeño disminuye en situaciones de mucha exigencia.'),
('H', 17, 3, 'Habitualmente alcanza los objetivos aunque esté presionado por el tiempo y su desempeño es bueno en situaciones de mucha exigencia.'),
('H', 17, 4, 'Alcanza los objetivos previstos en situaciones de presión y de tiempo, inconvenientes imprevistos, desacuerdos, oposición y diversidad. Su desempeño es alto en situaciones de mucha exigencia.'),
('H', 18, 1, 'Prioriza los objetivos personales por encima del propio equipo, tiene dificultades para involucrarse, participa solo cuando le interesa o preocupa el tema.'),
('H', 18, 2, 'Se compromete en la búsqueda de logros compartidos, privilegia el interés del grupo.'),
('H', 18, 3, 'Crea buen clima de trabajo, comprende el funcionamiento, interviene para destrabar conflictos interpersonales, trata las necesidades de otros sectores como trataría a las del propio sector.'),
('H', 18, 4, 'Promueve el trabajo en equipo dentro de la organización: La organización es un solo equipo, coopera incluso anónimamente para el logro de los objetivos organizacionales.'),
('H', 19, 1, 'Requiere recordatorios frecuentes acerca de la importancia de su tarea para la continuidad de los procesos.'),
('H', 19, 2, 'Acelera la gestión de procesos cuando detecta que beneficia el funcionamiento del sector en que se desempeña.'),
('H', 19, 3, 'Ajusta espontáneamente su tarea habitual a efectos de optimizar el funcionamiento de la organización.'),
('H', 19, 4, 'Ajusta espontáneamente su tarea habitual y estimula a otros a hacerlo, en beneficio del óptimo funcionamiento de la organización.'),
('T', 1, 1, 'Es impuntual y no cumple con los horarios.'),
('T', 1, 2, 'Es habitualmente impuntual.'),
('T', 1, 3, 'Es generalmente puntual y cumple con su horario.'),
('T', 1, 4, 'Siempre es puntual y permanece en su puesto de trabajo.'),
('T', 2, 1, 'No asiste regularmente a trabajar y posee muchas faltas injustificadas.'),
('T', 2, 2, 'Su asistencia registra alto ausentismo justificado y poco injustificado.'),
('T', 2, 3, 'Asiste regularmente a su trabajo aunque por excepción se ausenta por causa justa.'),
('T', 2, 4, 'Tiene asistencia perfecta.'),
('T', 3, 1, 'Presenta sumarios o sanciones por inconductas reiteradas.'),
('T', 3, 2, 'Recibe llamados de atención y puede registrar alguna sanción.'),
('T', 3, 3, 'En general tiene buena conducta.'),
('T', 3, 4, 'Su conducta es ejemplar y es reconocido por sus compañeros.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE IF NOT EXISTS `evaluacion` (
  `idAgenteEvaluador` int(11) NOT NULL COMMENT 'Evaluador',
  `idAgenteEvaluado` int(11) NOT NULL COMMENT 'Evaluado',
  `nroFicha` int(11) NOT NULL,
  PRIMARY KEY (`idAgenteEvaluador`,`idAgenteEvaluado`),
  KEY `idAgenteEvaluado` (`idAgenteEvaluado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ficha`
--

CREATE TABLE IF NOT EXISTS `ficha` (
  `nroFicha` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ficha',
  `tipo` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`nroFicha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Ficha Asociada a los Agentes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `item`
--

CREATE TABLE IF NOT EXISTS `item` (
  `tipoItem` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'H' COMMENT 'H: Habilidades C: Conocimientos A:Actitudes',
  `nroItem` int(11) NOT NULL COMMENT 'Numeros que dependen del tipoItem',
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`tipoItem`,`nroItem`),
  KEY `tipoItem` (`tipoItem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci COMMENT='Se trata de los ítems a evaluar';

--
-- Volcado de datos para la tabla `item`
--

INSERT INTO `item` (`tipoItem`, `nroItem`, `nombre`, `descripcion`) VALUES
('A', 1, 'Actitud Docente', 'Predisposición a compartir conocimientos, experiencias y habilidades en los diferentes contextos laborales.'),
('A', 2, 'Aprendizaje y mejora continua', 'Busca y comparte información útil para la resolución de situaciones utilizando todo el potencial propio y la experiencia de otros.'),
('A', 3, 'Discreción', 'Comprende la importancia de la confidencialidad en el manejo de la información pública y/o privada en relación a la gestión institucional.'),
('A', 4, 'Flexible, adaptable al cambio', 'Versatilidad para adecuarse a variadas situaciones con personas y grupos internos/externos. Supone entender y valorar posturas distintas adaptando su propio enfoque a medida que la situación cambie.'),
('A', 5, 'Orientación a resultados', 'Es la tendencia al logro de resultados manteniendo altos niveles de rendimiento, en el marco de las estrategias de la organización.'),
('A', 6, 'Orientación al usuario', 'Implica reconocer al otro como sujeto pleno de derechos.'),
('A', 7, 'Positivo', 'Predisposición a mantenerse optimista frente a la adversidad en el intento de resolver la tarea.'),
('A', 8, 'Proactivo', 'Predisposición a emprender acciones, crear oportunidades y mejorar resultados sin necesidad de un requerimiento externo que lo empuje.'),
('A', 9, 'Respeto y valoración del trabajo de los demás', 'Aceptación de la producción de los demás como aporte constructivo y ajustado a los criterios de la organización.'),
('A', 10, 'Responsabilidad y compromiso', 'Compromiso con que las personas realizan las tareas encomendadas, su preocupación por el cumplimiento de que lo asignado está por encima de sus propios intereses.'),
('A', 11, 'Sensibilidad a las necesidades de los demás', 'Escuchar activamente, comprender y responder a sentimientos o intereses de los demás aunque estos no los hayan expresado o solo lo hayan hecho parcialmente.'),
('A', 12, 'Establecer vínculos beneficiosos y duraderos con los pacientes', 'Adherencia.'),
('C', 1, 'Atención primaria de la salud', 'Conocimiento sobre la estrategia de APS, programas y actividades.'),
('C', 2, 'Bioseguridad', 'Conocimientos sobre las normas de seguridad y bioseguridad de la institución.'),
('C', 3, 'Conocimientos propios de su área de desempeño', 'Conocimientos específicos requeridos para su puesto de trabajo.'),
('C', 4, 'Derechos y deberes de los usuarios externos', 'Conocimiento sobre los derechos y deberes que tienen los usuarios externos en relación con la utilización de los servicios de salud.'),
('C', 5, 'Documentación y registros', 'Conocimiento sobre la confección y/o llenado de documentación y registros relacionados con su puesto de trabajo.'),
('C', 6, 'Epidemiología', 'Conceptos epidemiológicos necesarios para desarrollar las actividades del área de desempeño.'),
('C', 7, 'Legislación y normativas oficiales sobre su área de desempeño', 'Normas vigentes relacionadas con su puesto de trabajo.'),
('C', 8, 'Métodos estadísticos', 'Conocimientos sobre sistemas y procedimientos estadísticos.'),
('C', 9, 'Procedimientos de la administración Pública Provincial', 'Derechos y obligaciones del empleado de salud, procedimientos administrativos.'),
('C', 10, 'Procesos de atención', 'Funcionamiento del proceso de atención en el establecimiento. Incluye el conocimiento de normas y procedimientos escritos o no.'),
('C', 11, 'Programas informáticos de estadística', 'Programas informáticos y bases de datos necesarias para el desarrollo de las actividades de su área.'),
('C', 12, 'Red de establecimientos de salud provincial', 'Conocimientos sobre la distribución de los establecimientos, su complejidad y las interrelaciones en los procesos administrativos y de atención entre ellos vinculadas con su área de desempeño.'),
('C', 13, 'Tecnologías para la información y las comunicaciones', 'Herramientas para la presentación y comunicación de la información.'),
('C', 14, 'Modelos y herramientas básicas sobre gestión de calidad', 'Conocimientos sobre los niveles, modelos y herramientas de la calidad vigentes en la organización sanitaria/establecimiento/sector donde se desempeña.'),
('H', 1, 'Adecuada utilización de recursos disponibles', 'Capacidad para elegir y utilizar el recurso adecuado en términos de eficiencia para lograr los objetivos de su tarea.'),
('H', 2, 'Planificación', 'Capacidad de determinar eficazmente las metas y prioridades de la tarea o proyecto priorizando acciones, plazos y recursos requeridos. Incluye instrumentación de mecanismos de seguimiento y verificación de la información.'),
('H', 3, 'Aplicación de razonamientos complejos al proceso de trabajo', 'Habilidad para analizar, explicar y elaborar soluciones a situaciones problemáticas que se presentan en la práctica profesional.'),
('H', 4, 'Capacidad docente', 'Habilidad para transmitir los conocimientos propios de su área de trabajo.'),
('H', 5, 'Capacidad para delegar', 'Transferir responsabilidades y/o tareas propias del área de trabajo, de acuerdo a la importancia de la misma y a los desempeños de la persona en la cual delega.'),
('H', 6, 'Capacidad para ofrecer soluciones alternativas - resolver problemas', 'Capacidad de idear la solución que dará a una clara satisfacción del problema atendiendo a los objetivos institucionales y a la factibilidad interna de resolución.'),
('H', 7, 'Capacidad para trabajar en grupos de cuidados de salud', 'Habilidad para la utilización de herramientas de intervención grupal.'),
('H', 8, 'Comunicación oral y escrita', 'Capacidad de expresarse y de escuchar activamente, asegurando una comunicación calara que facilite la compresión de la información.'),
('H', 9, 'Credibilidad Técnica', 'Capacidad necesaria para generar credibilidad sobre la base de los conocimientos técnicos de su especialidad.'),
('H', 10, 'Destreza para organizar reportes y presentaciones', 'Capacidad de comunicar información a través de los medios y materiales más adecuados al público destinatario.'),
('H', 11, 'Gestión de Equipos de Trabajo', 'Capacidad de desarrollar, consolidar y conducir equipos de trabajo alentando a sus miembros a trabajar con autonomía y responsabilidad.'),
('H', 12, 'Habilidad en técnicas y procedimientos propios de su puesto', 'Capacidad para realizar las tareas inherentes a su puesto de trabajo que requieran destreza en su ejecución.'),
('H', 13, 'Liderazgo', 'Habilidad de orientar la acción de los grupos humanos en una dirección determinada, inspirando valores de acción y anticipando escenarios de desarrollo de la acción de ese grupo.'),
('H', 14, 'Negociación', 'Actuar para crear un ambiente propicio para la colaboración y el logro de compromisos duraderos que fortalezcan la relación. Capacidad para controlar una discusión centrándose en el problema y no en la persona, planificando alternativas para mejores acuerdos.'),
('H', 15, 'Operación de programas informáticos básicos', 'Habilidad para utilizar en su tarea habitual las herramientas informáticas básicas. Nivel Usuario.'),
('H', 16, 'Relación Interpersonal', 'Actuar para establecer y mantener relaciones cordiales y recíprocas y/o redes de contacto con distintas personas para lograr mejores resultados en el trabajo. (favoreciendo la construcción de climas laborales saludables).'),
('H', 17, 'Tolerancia a la presión', 'Habilidad para seguir actuando con la eficacia en situaciones de presión de tiempo y de desacuerdo, oposición y diversidad. Se trata de responder y trabajar con alto desempeño en situaciones de mucha exigencia.'),
('H', 18, 'Trabajo en equipo', 'Capacidad de participar activamente en la prosecución de una meta común subordinando los intereses personales a los objetivos del equipo.'),
('H', 19, 'Visión continua e integral de los procesos', 'Capacidad para identificar y comprender las relaciones complejas derivadas del funcionamiento de la organización a fin de ajustar su trabajo en consecuencia.'),
('T', 1, 'Puntualidad', 'Es puntual y cumple con los horarios.'),
('T', 2, 'Asistencia', 'Asiste regularmente a su lugar de trabajo (Ausentismo a considerar Artic. 80-81-84-61-62-78F-94).'),
('T', 3, 'Conducta', 'Su conducta es adecuada.');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agente`
--
ALTER TABLE `agente`
  ADD CONSTRAINT `agente_ibfk_1` FOREIGN KEY (`idCargo`) REFERENCES `cargo` (`idCargo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `compuesta`
--
ALTER TABLE `compuesta`
  ADD CONSTRAINT `compuesta_ibfk_2` FOREIGN KEY (`tipoItem`, `nroItem`) REFERENCES `item` (`tipoItem`, `nroItem`) ON UPDATE CASCADE,
  ADD CONSTRAINT `compuesta_ibfk_1` FOREIGN KEY (`nroFicha`) REFERENCES `ficha` (`nroFicha`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `eleccion`
--
ALTER TABLE `eleccion`
  ADD CONSTRAINT `eleccion_ibfk_4` FOREIGN KEY (`tipoItem`, `nroItem`) REFERENCES `item` (`tipoItem`, `nroItem`),
  ADD CONSTRAINT `eleccion_ibfk_1` FOREIGN KEY (`tipoItem`) REFERENCES `item` (`tipoItem`),
  ADD CONSTRAINT `eleccion_ibfk_2` FOREIGN KEY (`tipoItem`, `nroItem`) REFERENCES `item` (`tipoItem`, `nroItem`),
  ADD CONSTRAINT `eleccion_ibfk_3` FOREIGN KEY (`tipoItem`, `nroItem`) REFERENCES `item` (`tipoItem`, `nroItem`);

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`idAgenteEvaluador`) REFERENCES `agente` (`idAgente`),
  ADD CONSTRAINT `evaluacion_ibfk_2` FOREIGN KEY (`idAgenteEvaluado`) REFERENCES `agente` (`idAgente`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
