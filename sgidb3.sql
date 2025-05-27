CREATE DATABASE  IF NOT EXISTS `sgidb3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sgidb3`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Comentario` text NOT NULL,
  `IdEvidenciaCargada` int(11) NOT NULL,
  `Fecha` datetime NOT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `IdDepartamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fkevi_idx` (`IdEvidenciaCargada`),
  KEY `fkus_idx` (`IdUsuario`),
  KEY `fkdepto_idx` (`IdDepartamento`),
  CONSTRAINT `fk1` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`Id`),
  CONSTRAINT `fk2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`Id`),
  CONSTRAINT `fkevi` FOREIGN KEY (`IdEvidenciaCargada`) REFERENCES `evidenciascargadas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=285 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuraciones`
--

DROP TABLE IF EXISTS `configuraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuraciones` (
  `Id` int(11) NOT NULL,
  `NombreTecnologico` varchar(200) DEFAULT NULL,
  `PrimerPeriodo` varchar(45) NOT NULL,
  `SegundoPeriodo` varchar(45) DEFAULT NULL,
  `TiposArchivo` varchar(200) DEFAULT NULL,
  `SMTPServer` varchar(100) DEFAULT NULL,
  `SMTPPort` int(11) DEFAULT NULL,
  `SMTPSSL` bit(1) DEFAULT NULL,
  `SMTPUser` varchar(100) DEFAULT NULL,
  `SMTPPassword` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuraciones`
--

LOCK TABLES `configuraciones` WRITE;
/*!40000 ALTER TABLE `configuraciones` DISABLE KEYS */;
INSERT INTO `configuraciones` VALUES (1,NULL,'ENE-JUN','AGO-DIC','.xlsx,.xls,.jpg,.jpeg,.zip,.doc,.docx,.ppt,.pptx,.txt,.pdf',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `configuraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Clave` varchar(45) DEFAULT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Contraseña` varchar(45) DEFAULT NULL,
  `IdSuperior` int(11) DEFAULT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `deptosuper_idx` (`IdSuperior`),
  CONSTRAINT `deptosuper` FOREIGN KEY (`IdSuperior`) REFERENCES `departamentos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (16,'RD','RD-ADMINISTRADOR','RD',NULL,NULL,'\0');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidenciahistorial`
--

DROP TABLE IF EXISTS `evidenciahistorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidenciahistorial` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEvidencia` int(11) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Fecha` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fkhist_idx` (`IdEvidencia`),
  CONSTRAINT `fkhist` FOREIGN KEY (`IdEvidencia`) REFERENCES `evidenciascargadas` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8841 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidenciahistorial`
--

LOCK TABLES `evidenciahistorial` WRITE;
/*!40000 ALTER TABLE `evidenciahistorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidenciahistorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencias`
--

DROP TABLE IF EXISTS `evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidencias` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProceso` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fkeviproc_idx` (`IdProceso`),
  CONSTRAINT `fkeviproc` FOREIGN KEY (`IdProceso`) REFERENCES `procesooperativo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1039 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencias`
--

LOCK TABLES `evidencias` WRITE;
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
INSERT INTO `evidencias` VALUES (914,6,'PIID del ITES','\0'),(915,12,'Reporte semestral','\0'),(916,12,'Bitacora de canalizaciones','\0'),(917,12,'Trayectoria académica','\0'),(918,12,'Expediente de tutorado que integre los Anexos del Manual del Tutor del SNIT aplicables (Confidencial)','\0'),(919,13,'Portafolio de evidencias','\0'),(920,13,'Liberación de actividades','\0'),(921,13,'Reporte de proyectos individuales','\0'),(922,13,'Listas de calificaciones parciales y Actas de calificaciones finales','\0'),(923,13,'Reporte parcial y final','\0'),(924,13,'Instrumentación Didáctica para la Formación y Desarrollo de Competencias Profesionales','\0'),(925,33,'Carga académica','\0'),(926,33,'Solicitud de reinscripción y carga académica','\0'),(927,14,'Expediente del alumno','\0'),(928,14,'Contrato con el alumno','\0'),(929,14,'Carga Académica','\0'),(930,14,'Lista de aspirantes aceptados','\0'),(931,14,'Alumno matriculado','\0'),(932,15,'Acta de acuerdos y compromisos de la H. Junta Directiva ','\0'),(933,15,'Minuta de la sesión de la H. Junta Directiva.','\0'),(934,15,'Informe del director de la H. Junta Directiva','\0'),(935,15,'Implementación de acciones eficaces','\0'),(936,15,'Informe de resultados de las Encuestas de Servicios','\0'),(937,15,'Minuta de acuerdos','\0'),(938,15,'Informe de auditoría','\0'),(939,15,'Programa / Plan de auditoria','\0'),(940,16,'Medios de difusión que cada ITD determine.','\0'),(941,16,'Listas de asistencia a inducción y capacitación.','\0'),(942,12,'Reporte final de acreditación (Si aplica)','\0'),(943,11,'Anexo XVI Constancia de cumplimiento de actividad complementaria','\0'),(944,11,'Anexo XVII Formato de evaluación al desempeño de la actividad complementaria ','\0'),(945,10,'Resultado de evaluación docente','\0'),(946,32,'ANEXO XXXIII. Formato de liberación de proyecto para la titulación integral.','\0'),(947,32,'ANEXO XXXII. Formato de registro de proyecto para la titulación integral.','\0'),(948,32,'ANEXO XXXI. Formato de solicitud del estudiante para la titulación integral.','\0'),(949,18,'ANEXO XXX. Formato de evaluación de reporte de residencia de profesional.','\0'),(950,18,'ANEXO XXIX. Formato de evaluación y seguimiento de residencia profesional','\0'),(951,18,'ANEXO XXVIII. Estructura del reporte final de residencia profesional','\0'),(952,18,'ANEXO XXVII. Estructura del reporte preliminar de residencia profesional','\0'),(953,7,'ANEXO XXXVII. Carta de Liberación de Actividades Académicas','\0'),(954,7,'Constancia de cumplimento de actividades asignadas','\0'),(955,7,'Plan de trabajo','\0'),(956,7,'Minutas de academia','\0'),(957,8,'Difusión de convocatorias abiertas a través de diferentes medios de comunicación interna.','\0'),(958,8,'Base de Datos de alumnos becarios.','\0'),(959,17,'Matriz de peligros y riesgos.','\0'),(960,8,'Expediente de Becarios aceptados.','\0'),(961,9,'Cuerpos académicos en formación, en consolidación y/o consolidados. (Según aplique)','\0'),(962,9,'Proyectos incubados o de desarrollo tecnológico. (Según aplique)','\0'),(963,9,'Posgrados autorizados. (Según aplique)','\0'),(964,9,'Perfil deseable docente. (Según aplique)','\0'),(965,9,'Registros de propiedad industrial e intelectual. (Según aplique)','\0'),(966,9,'Artículos de investigación científica y tecnológica. (Según aplique)','\0'),(967,9,'Productos de divulgación, ponencias, citas, reseñas, libros, informes técnicos de investigación, publicaciones científicas indexadas y no indexadas. (Según aplique)','\0'),(968,9,'Registro formal de líneas y proyectos de investigación. (Según aplique)','\0'),(969,10,'Acciones implementadas para mejorar el desempeño docente','\0'),(970,10,'Listas de alumnos por materia','\0'),(971,10,'Calendario de aplicación','\0'),(972,10,'Horarios','\0'),(973,10,'Encuesta (Software)','\0'),(974,8,'Expediente de solicitudes.','\0'),(975,32,'Acta de Titulación.','\0'),(976,17,'Matriz de aspectos e impactos.','\0'),(977,17,'Política del SGI.','\0'),(978,24,'Solicitud de mantenimiento','\0'),(979,24,'Lista de Verificación de Infraestructura y equipo','\0'),(980,24,'Requisiciones de bienes y servicios','\0'),(981,24,'Acciones para tener una infraestructura adecuada para la operación','\0'),(982,25,'Acciones para alcanzar el ambiente de trabajo adecuado','\0'),(983,25,'Minutas de acuerdos ','\0'),(984,25,'Cuestionario de clima laboral y no discriminación','\0'),(985,26,'Acciones para alcanzar la competencia del personal','\0'),(986,27,'Constancia de nombramiento','\0'),(987,27,'Minutas, actas y dictámenes de sesiones de la Comisión Dictaminadora','\0'),(988,27,'Dos copias de los documentos que certifiquen los requisitos académicos establecidos en la convocatoria y de acuerdo a la categoría académica a concursar o el perfil de puesto vacante.','\0'),(989,27,'Currículum vitae','\0'),(990,27,'Solicitud de ingreso','\0'),(991,27,'Contrato','\0'),(992,27,'Convocatoria','\0'),(993,28,'Recibos','\0'),(994,28,'Oficios de Gestión de Solicitud','\0'),(995,28,'Información financiera','\0'),(996,29,'Informe/Actas/Minutas de H. Junta Directiva','\0'),(997,29,'Estadística','\0'),(998,29,'Informe de rendición de cuentas anual','\0'),(999,29,'Reportes del seguimiento de metas','\0'),(1000,30,'Captación de ingresos propios','\0'),(1001,30,'Formatos emitidos por el TecNM y/o Gobierno del Estado','\0'),(1002,30,'POA / REPOA /PTA','\0'),(1003,30,'Autorización de la H. Junta Directiva','\0'),(1004,6,'Oficio de entrega del PIID','\0'),(1005,24,'Programa de mantenimiento preventivo','\0'),(1006,24,'Orden de trabajo de mantenimiento','\0'),(1007,23,'Programa de promoción y difusión.','\0'),(1008,23,'Lista de alumnos que solicitaron ficha de ingreso .','\0'),(1009,17,'Alcance del SGI.','\0'),(1010,17,'Manual del Sistema de Gestión Integral:','\0'),(1011,19,'Acciones implementadas','\0'),(1012,19,'Análisis de resultados','\0'),(1013,19,'Encuesta aplicada','\0'),(1014,31,'Acta constitutiva de las empresas incubadas.','\0'),(1015,31,'Constancias de los alumnos que participación  en proyectos.','\0'),(1016,31,'Registros de proyectos aceptados.','\0'),(1017,31,'Banco de proyectos.','\0'),(1018,20,'Formatos requeridos por cada Estado (Si aplica)','\0'),(1019,20,'Anexo XXVI Constancia de terminación de servicio social ','\0'),(1020,20,'Anexo XXV Formato de evaluación de las actividades por el prestador de servicio social','\0'),(1021,20,'Anexo XXIV Formato de autoevaluación cualitativa del prestador de servicio social','\0'),(1022,17,'Objetivos del SGI.','\0'),(1023,20,'Anexo XXIII Formato de evaluación cualitativa del prestador de servicio social','\0'),(1024,20,'Anexo XXI Carta de presentación para la realización del servicio social','\0'),(1025,20,'Anexo XX Carta compromiso de servicio social','\0'),(1026,20,'Anexo XIX Carta de terminación de servicio social','\0'),(1027,20,'Anexo XVIII Solicitud de servicio social','\0'),(1028,21,'Cédula de inscripción de actividades culturales, deportivas y recreativa','\0'),(1029,21,'Constancia de cumplimiento de actividad complementaria.','\0'),(1030,21,'Cédula de resultados de actividades culturales, deportivas y recreativas o Anexo XVI ','\0'),(1031,22,'Reporte de resultados e incidentes en visita.','\0'),(1032,22,'Carta de presentación y agradecimiento de visitas a empresas.','\0'),(1033,22,'Oficio de comisión del docente.','\0'),(1034,22,'Programa de visitas aceptadas a empresas.','\0'),(1035,22,'Oficio de solicitud de visitas.','\0'),(1036,22,'Solicitud de visitas a empresas (por parte del area academica).','\0'),(1037,20,'Anexo XXII Reporte bimestral de servicio social','\0'),(1038,17,'Matriz de energía.','\0');
/*!40000 ALTER TABLE `evidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidenciascargadas`
--

DROP TABLE IF EXISTS `evidenciascargadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evidenciascargadas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Periodo` int(11) NOT NULL,
  `IdEvidencia` int(11) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Url` varchar(500) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Usuario` int(11) DEFAULT NULL,
  `Departamento` int(11) DEFAULT NULL,
  `IdDeptoAsigno` int(11) DEFAULT NULL,
  `FechaProgramada` date NOT NULL,
  `Llave` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fkusuario_idx` (`Usuario`),
  KEY `fkdepto_idx` (`Departamento`),
  KEY `fkperiodo_idx` (`Periodo`),
  KEY `fkevidencia_idx` (`IdEvidencia`),
  KEY `fkllave` (`Llave`),
  KEY `fkdeptoasigno_idx` (`IdDeptoAsigno`),
  CONSTRAINT `fkdepto` FOREIGN KEY (`Departamento`) REFERENCES `departamentos` (`Id`),
  CONSTRAINT `fkdeptoasigno` FOREIGN KEY (`IdDeptoAsigno`) REFERENCES `departamentos` (`Id`),
  CONSTRAINT `fkevidencia` FOREIGN KEY (`IdEvidencia`) REFERENCES `evidencias` (`Id`),
  CONSTRAINT `fkperiodo` FOREIGN KEY (`Periodo`) REFERENCES `periodos` (`Id`),
  CONSTRAINT `fkusuario` FOREIGN KEY (`Usuario`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6660 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidenciascargadas`
--

LOCK TABLES `evidenciascargadas` WRITE;
/*!40000 ALTER TABLE `evidenciascargadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `evidenciascargadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodos`
--

DROP TABLE IF EXISTS `periodos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periodos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) DEFAULT NULL,
  `Año` int(11) NOT NULL,
  `Inicio` date NOT NULL,
  `Final` date NOT NULL,
  `ToleranciaCargaDias` int(11) NOT NULL,
  `ToleranciaAutorizacionDias` int(11) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodos`
--

LOCK TABLES `periodos` WRITE;
/*!40000 ALTER TABLE `periodos` DISABLE KEYS */;
INSERT INTO `periodos` VALUES (20,'AGO-DIC',2021,'2021-08-01','2022-01-30',0,0,'\0');
/*!40000 ALTER TABLE `periodos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedimientos`
--

DROP TABLE IF EXISTS `procedimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedimientos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProceso` int(11) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Archivo` varchar(500) DEFAULT NULL,
  `FechaModificacion` date NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `pr_idx` (`IdProceso`),
  CONSTRAINT `pr` FOREIGN KEY (`IdProceso`) REFERENCES `procesooperativo` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedimientos`
--

LOCK TABLES `procedimientos` WRITE;
/*!40000 ALTER TABLE `procedimientos` DISABLE KEYS */;
INSERT INTO `procedimientos` VALUES (89,6,'Guía Técnica para la Elaboración del PIID de los Institutos, Unidades y Centros pertenecientes al TecNM','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Guia_para_elaboracion_del_PIID_2013-2018.pdf','2020-08-19','\0'),(90,15,'Procedimiento de Auditoría Interna.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/AUDITORIAS_INTERNAS_-_JUL2017.zip','2020-08-19','\0'),(91,15,'PIID.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/PIID_2013_2018_ITESRC.pdf','2020-08-19','\0'),(92,15,'Encuestas de servicio ','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/ENCUESTA_A_LOS_SERVICIOS_NOV2019.pdf','2020-08-19','\0'),(93,14,'Procedimiento para la Inscripción','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/INSCRIPCION_-_JUL2017.zip','2020-08-19','\0'),(94,33,'Procedimiento para la reinscripción','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/REINSCRIPCION_-_JUL2017.zip','2020-08-19','\0'),(95,13,'Procedimiento para la Gestión del Curso','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/GESTION_DEL_CURSO_-_JUL2017.zip','2020-08-19','\0'),(96,13,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015, Capítulo 5. Lineamiento para el Proceso de Evaluación y Acreditación de Asignaturas ','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap05AcreditaciondeAsignaturas.pdf','2020-08-19','\0'),(97,16,'PIID','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/PIID_2013_2018_ITESRC.pdf','2020-08-19','\0'),(98,12,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015, Capitulo 15. Lineamiento para la operación del programa institucional de tutoria.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap15Tutorias.pdf','2020-08-19','\0'),(99,10,'Evaluación al desempeño docente con enfoque de competencias (Evaluación por estudiantes)','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/EVALUACION_DOCENTE_-_JUL2017.zip','2020-08-19','\0'),(100,10,'Procedimiento de evaluación docente','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/EVALUACION_DOCENTE_-_JUL2017.zip','2020-08-19','\0'),(101,9,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015, Capítulo 20. Lineamiento para la Operación de la Investigación Educativa.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap20InvestigacionEducativa.pdf','2020-08-19','\0'),(102,9,'Lineamientos Básicos para el Desarrollo de la Investigación en el SNEST 2013.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Lineamientos_Investigacion_2006_(2).pdf','2020-08-19','\0'),(103,7,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015, Capítulo 18. Lineamiento para la integración y operación de las academias.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap18OperaciondeAcademias.pdf','2020-08-19','\0'),(104,7,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015, Capítulo 19. Lineamiento para la integración de especialidades.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap19IntegraciondeEspecialidades.pdf','2020-08-19','\0'),(105,18,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015. Capítulo 12. Lineamiento para la operación y acreditación de la Residencia Profesional.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap12ResidenciaProfesional.pdf','2020-08-19','\0'),(106,11,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015, Capítulo 10 Lineamiento para el cumplimiento de actividades complementarias.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap10ActividadesComplementarias.pdf','2020-08-19','\0'),(107,16,'Matriz de peligros y riesgos','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MATRICES_DE_SEGURIDAD_JULIO_2020.zip','2020-08-19','\0'),(108,16,'Matriz de Aspectos e Impactos','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MATRIZ_AMBIENTAL_2020.xlsx','2020-08-19','\0'),(109,16,'Objetivos del SGI','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MANUAL_DEL_SGI_DIC_19.xlsx','2020-08-19','\0'),(110,30,'Normatividad vigente aplicable en cada estado para planeación y gestión presupuestal.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Ley_de_ingresos_para_el_Estado_de_Coahuila_de_Zaragoza_para_el_ejercicio_fiscal_2018.pdf','2020-08-19','\0'),(111,29,'Normatividad vigente aplicable en cada estado para planeación y gestión presupuestal','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Ley_de_ingresos_para_el_Estado_de_Coahuila_de_Zaragoza_para_el_ejercicio_fiscal_2018.pdf','2020-08-19','\0'),(112,29,'Calendario de Juntas Directivas','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/25_Calendario_de_juntas.PDF','2020-08-19','\0'),(113,27,'Lineamiento que establecen los requisitos y condiciones que debe reunir el personal academico que imparten planes y programas de estudios en los ITD','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Lineamiento_del_personal_academico.pdf','2020-08-19','\0'),(114,27,'Procedimiento de reclutamiento, selección y contratación de personal (Sistema de gestión de iIgualdad de género y no discriminación)','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/PROCEDIMIENTO_RECLUTAMIENTO__SELECCION_Y_CONTRATACION_DE_PERSONAL.pdf','2020-08-19','\0'),(115,27,'Manual de Organización','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MANUAL_DE_ORGANIZACION.pdf','2020-08-19','\0'),(116,27,'Perfil de puestos','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MANUAL_DE_ORGANIZACION.pdf','2020-08-19','\0'),(117,26,'Procedimiento de evaluación docente','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/EVALUACION_DOCENTE_-_JUL2017.zip','2020-08-19','\0'),(118,26,'Procedimiento de formación y actualización del capital humano (Sistema de gestión de iIgualdad de género y no discriminación)','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/M00PR11_MANUAL_DE_PROCEDIMIENTO_DE_FORMACION_Y_ACTUALIZACION_DEL_CH_V0_17112016.pdf','2020-08-19','\0'),(119,24,'Procedimiento de Matenimiento','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MANTENIMIENTO_-_JUL2017.zip','2020-08-19','\0'),(120,22,'Procedimiento de Visitas a Empresas.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/VISITA_A_EMPRESAS_-_JUL2017.zip','2020-08-19','\0'),(121,21,'Procedimiento para promoción cultural, deportiva y recreativa','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/PROMOCION_-_JUL2017.zip','2020-08-19','\0'),(122,20,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015. Capítulo 11 Lineamiento para la operación y cumplimiento del Servicio Social.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap11ServicioSocial.pdf','2020-08-19','\0'),(123,31,'Manual del Facilitador V 1.0 Talento Emprendedor Tecológico Nacional de México\r\n','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Manual_del_facilitador_v_1_0.pdf','2020-08-19','\0'),(124,19,'Disposiciones técnicas y administrativas para el seguimiento de egresados. Versión 2.0','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Seguimiento_de_egresados_v_2_0.pdf','2020-08-19','\0'),(125,16,'Manual del Sistema de Gestión Integral:','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MANUAL_DEL_SGI_DIC_19.xlsx','2020-08-19','\0'),(126,16,'Politica del SGI','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/MANUAL_DEL_SGI_DIC_19.xlsx','2020-08-19','\0'),(127,32,'Manual de Lineamientos Académico- Administrativos del TecNM, versión octubre 2015. Capítulo 14. Lineamiento para la titulación integral.','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Cap14Titulacion.pdf','2020-08-19','\0'),(128,16,'Matríz de energía','https://meet.tec-carbonifera.edu.mx/sgi2/documentos/Matriz_Base_2019-2020.xlsx','2020-08-19','\0');
/*!40000 ALTER TABLE `procedimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesooperativo`
--

DROP TABLE IF EXISTS `procesooperativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procesooperativo` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdProcesoEstrategico` int(11) NOT NULL,
  `Entrada` text NOT NULL,
  `Proceso` text NOT NULL,
  `Salida` text NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fkpo_idx` (`IdProcesoEstrategico`),
  CONSTRAINT `fkpo` FOREIGN KEY (`IdProcesoEstrategico`) REFERENCES `procesosestrategicos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesooperativo`
--

LOCK TABLES `procesooperativo` WRITE;
/*!40000 ALTER TABLE `procesooperativo` DISABLE KEYS */;
INSERT INTO `procesooperativo` VALUES (6,5,'Diagnóstico, históricos, PIID del TecNM y Plan Estatal de Desarrollo','Planeación','Dirección estratégica de los ITD a mediano y largo plazo.','\0'),(7,9,'PIID del PE\r\n<br /><br />\r\nIndicadores academicos\r\n<br /><br />\r\nAnálisis de pertinencia de los programas educativos \r\n<br /><br />\r\nPlanes y programas de estudio\r\n<br /><br />\r\nDocentes adscritos al programa','Academias','Garantizar la vigencia, pertinencia y actualuzación de los contenidos de los programas de asignatura de los PE.\r\n\r\nProyectos del ambito de docencia, investigación, vinculación y gestión académica.\r\n\r\nPropuestas e innovaciones para el diseño y desarrollo de proyectos.\r\n\r\nPropuestas para la formación y actualización docente.','\0'),(8,9,'Convocatorias Abierta\r\n','Becas','Apoyo economico para prevenir la deserción','\0'),(9,9,'Convocatorias para el desarrollo de investigación. <br /><br />\r\nProtocolos de investigación','Investigación','Fortalecimiento de la formación  docente y alumnado en procesos de investigación y desarrollo tecnológico que contribuya a mejorar la calidad de vida de la sociedad','\0'),(10,9,'Alumnos inscritos\r\n<br /><br />\r\nDocentes adscritos\r\n<br /><br />\r\nInstrumento de evaluación\r\n<br /><br />\r\nCarga académica\r\n','Evaluación docente','Fortalecer del desempeño docente en el aula','\0'),(11,9,'Lista de alumnos inscritos\r\n<br /><br />\r\nCatalogo de actividades complementarias validadas por cada ITS','Actividades complementarias','Fortalecer la formación integral de las competencias profesionales de los alumnos','\0'),(12,9,'PIT Programa Institucional de Tutorias\r\n<br /><br />\r\nPAT Plan de Acción Tutorial\r\n<br /><br />\r\nManual de Tutor','Tutorias','Apoyo en la Formación integral de los alumnos\r\n\r\nApoyo en la disminución en los indices de reprobación y deserción\r\n\r\nApoyo para la eficiencia terminal','\0'),(13,9,'Calendario Escolar\r\n<br /><br />\r\nPlanes y programas de estudio \r\n<br /><br />\r\nCarga horaria ','Gestión del Curso','Asegurar que las asignaturas de cualquier plan de estudios de nivel licenciatura cumplen con la formación y desarrollo de competencias profesionales.','\0'),(14,9,'Aspirantes aceptados. Pago de inscripción.','Inscripción.','Alumno de nuevo ingreso inscrito en el ITSTR.','\0'),(15,8,'Resultados (Información) de cada proceso','Seguimiento y evaluación del SGI','Implementación eficaz de acciones. ','\0'),(16,8,'SGI Estructurado','Implementación del SGI','SGI implementado.\r\nInformación de cada proceso.\r\nToma de conciencia del personal.','\0'),(17,8,'PIID','Planificación del Sistema de Gestión Integral','SGI estructurado','\0'),(18,9,'Solicitud del estudiante\r\n<br /><br />\r\nEstructura del reporte preliminar de residencia profesional (Anexo XXVII)','Residencia Profesional','Fortalecimiento al desarrollo de las competencias profesionales en el ámbito profesional.','\0'),(19,7,'Egresados ','Seguimiento de Egresados','Programas Educativos Pertinentes','\0'),(20,7,'Solicitud del estudiante','Servicio Social ','Fortalecer los conocimientos del alumno con formación integral y compromiso de servicio ante la sociedad.','\0'),(21,7,'Lista de alumnos inscritos\r\n<br /><br />\r\nCatalogo de actividades culturales, deportivas y recreativas validadas por cada ITS',' Actividades extraescolares','Fortalecer la formación integral de las competencias profesionales de los alumnos','\0'),(22,7,'Necesidad de visitas a empresas para complementar los objetivos académicos','Visitas a Empresas','Cumplir el objetivo académico de la visita solicitada.','\0'),(23,7,'Listado de bachilleratos\r\n<br /><br />\r\nOferta educativa de cada ITD','Promoción de la oferta educativa','Captación de alumnos nuevo ingreso.','\0'),(24,6,'Matriz de aspectos ambientales e impactos\r\n<br /><br />\r\nNecesidad de compra o adquisición de bienes o servicios\r\n<br /><br />\r\nNecesidad de mantenimiento\r\n<br /><br />\r\nMatriz de peligros y riesgos','Gestión  Recursos Materiales','Infraestructura adecuada para la operación','\0'),(25,6,'Matriz de peligros y riesgos\r\n<br /><br />\r\nCuestionario de percepción de clima laboral y no discrimación','Gestión Recursos Humanos','Ambiente de trabajo adecuado','\0'),(26,6,'Perfil de puesto requerido','Gestión Recursos Humanos','Personal Competente','\0'),(27,6,'Necesidad del personal ','Gestión Recursos Humanos','Plantilla Completa','\0'),(28,6,'Presupuesto Inicial autorizado\r\n<br /><br />\r\nPresupuesto modificado (Incremento Salarial, Proceso de Programación Detallada, Prestaciones Socio-Economicas, etc.)','Gestión del Recurso Financiero','Ministración del recurso asignado conforme a POA','\0'),(29,5,'POA / REPOA / PTA','Seguimiento / Evaluación','Avance de la dirección estratégica a corto plazo y toma de decisiones','\0'),(30,5,'PIID de cada ITD, Presupuesto de Egresos del Estado y Asignación Presupuestal del TecNM','Presupuestación','Normativa vigente aplicable en cada estado para planeación y gestión presupuestal.','\0'),(31,7,'Convocatorias para el desarrollo de Emprendurismo e incubación de empresas\r\n<br /><br />\r\nNecesidades para atender los programas de estudio de cada ITD','Emprendurismo e incubación de empresas','Planes de negocio.\r\n\r\nModelo de Negocio viable.\r\n\r\nCultura del emprendiento de base tecnológica a los estudiantes.\r\n\r\nProyectos.','\0'),(32,9,'Solicitud de aprobación del proyecto de titulación\r\n<br /><br />\r\nConstancia de no inconveniencia\r\n<br /><br />\r\nLiberación del proyecto de titulación integral\r\n<br /><br />\r\nConstancia de acreditación de lengua extranjera\r\n<br /><br />\r\nConstacia de no adeudo','Titulación','Alumno titulado.','\0'),(33,9,'Calendario Escolar\r\n<br /><br />\r\nPago de reinscripción\r\n<br /><br />\r\nHorarios de clases','Reinscripción','Alumno reinscrito para el siguiente semestre','\0');
/*!40000 ALTER TABLE `procesooperativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procesosestrategicos`
--

DROP TABLE IF EXISTS `procesosestrategicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procesosestrategicos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Alcance` text NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procesosestrategicos`
--

LOCK TABLES `procesosestrategicos` WRITE;
/*!40000 ALTER TABLE `procesosestrategicos` DISABLE KEYS */;
INSERT INTO `procesosestrategicos` VALUES (5,'PLANEACIÓN','Desde la elaboración de PIID hasta el seguimiento de metas.','\0'),(6,'ADMINISTRACIÓN DE LOS RECURSOS','Desde la administración del recurso hasta la rendición de cuentas','\0'),(7,'VINCULACIÓN','Desde la promoción de los planes y programas de estudio hasta el seguimiento de egresados','\0'),(8,'INNOVACIÓN Y CALIDAD','Desde la planificación del sistema hasta la implementación eficaz de acciones.','\0'),(9,'ACADÉMICO','Desde Inscripción hasta Titulación','\0');
/*!40000 ALTER TABLE `procesosestrategicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsables`
--

DROP TABLE IF EXISTS `responsables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `responsables` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdEvidencia` int(11) NOT NULL,
  `IdDepartamento` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `evdepto_idx` (`IdDepartamento`),
  KEY `evev_idx` (`IdEvidencia`),
  CONSTRAINT `evdepto` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`Id`),
  CONSTRAINT `evev` FOREIGN KEY (`IdEvidencia`) REFERENCES `evidencias` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsables`
--

LOCK TABLES `responsables` WRITE;
/*!40000 ALTER TABLE `responsables` DISABLE KEYS */;
/*!40000 ALTER TABLE `responsables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) NOT NULL,
  `Clave` varchar(10) NOT NULL,
  `Contraseña` varchar(36) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `IdDepartamento` int(11) NOT NULL,
  `Eliminado` bit(1) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `deptous_idx` (`IdDepartamento`),
  KEY `user` (`Clave`,`Contraseña`),
  KEY `deptoeliminado` (`IdDepartamento`,`Eliminado`),
  CONSTRAINT `deptous` FOREIGN KEY (`IdDepartamento`) REFERENCES `departamentos` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-11  8:28:10
