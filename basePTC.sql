Create table Usuarios (
idUsuario NUMBER not null,
contrase?aUsuario VARCHAR2(50)not null,
fechaRegistro date,
edadU NUMBER not NULL,
CONSTRAINT pk_Usuarios PRIMARY KEY (idUsuario)
);

CREATE SEQUENCE Usua
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER TrigUsua
BEFORE INSERT ON Usuarios
for EACH ROW 
BEGIN 
SELECT Usua.NEXTVAL INTO : NEW.idUsuario from DUAL;
END;

create table rangos (
idRango number not null,
nombreRango VARCHAR2(50)not NULL,
CONSTRAINT pk_rangos PRIMARY KEY (idRango)
);

CREATE SEQUENCE Rang
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER TrigRang
BEFORE INSERT ON  rangos
for EACH ROW 
BEGIN 
SELECT Rang.NEXTVAL INTO : NEW.idRango from DUAL;
END;


create table Visitas(
idVisita numeric not null,
fechaVisita DATE,
nombreVisita VARCHAR2(100),
CONSTRAINT pk_Visitas primary key (idVisita)
);

CREATE SEQUENCE Vis
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER TrigVis
BEFORE INSERT ON Visitas
for EACH ROW 
BEGIN 
SELECT Vis.NEXTVAL INTO : NEW.idVisita from DUAL;
END;

create table Pacientes(
idPaciente NUMBER not NULL,
nombrePaciente VARCHAR2(100) not NULL,
condicionPaciente VARCHAR2(100) not null,
fechaVisita number not null,
estaturaPaciente NUMBER(1,2) not null,
tratamiento VARCHAR2(100),
edadP NUMBER not NULL,
rangoP number not null,
idUsuarioP NUMBER NOT NULL,
CONSTRAINT pk_Pacientes primary KEY (idPaciente),
FOREIGN KEY(rangoP) references rangos(idRango),
FOREIGN KEY(edadP) references Usuarios(idUsuario),
FOREIGN KEY(idUsuarioP) references Usuarios(idUsuario),
FOREIGN KEY(fechaVisita)REFERENCES Visita(idVisita)
);


create table doctor(
idDoctor NUMBER not null,
nombreDoctor VARCHAR2(100) not null,
idEmpleado number not null,
rangoD number not null ,
idUsuarioD number not NULL,
edadD number not null,
CONSTRAINT pk_doctor primary key (idDoctor),
FOREIGN KEY(edadD) references empleado(idEmpleado),
FOREIGN KEY(rangoD) references rango(idRango),
FOREIGN KEY(idUsuarioD) references empleado(idEmpleado),
FOREIGN KEY (idEmpleado) REFERENCES empleado(idEmpleado)
);

create table enfermera(
idEnfermera NUMBER not null,
nombreEnfermera VARCHAR2(100) not null,
idEmpleado number not null,
rangoEa number not null ,
idUsuarioEa number not NULL,
edadEa number not null,
CONSTRAINT pk_enfermera primary key (idEnfermera),
FOREIGN KEY(edadEa) references empleado(idEmpleado),
FOREIGN KEY(rangoEa) references rango(idRango),
FOREIGN KEY(idUsuarioEa) references empleado(idEmpleado)
);


create table receta(
idReceta numeric not null,
medicamento VARCHAR2(100),
CONSTRAINT pk_receta primary key (idReceta)
);

create table tratamiento(
idTratamiento numeric not null,
medicamento numeric,
fechaConsultaDoctor date,
CONSTRAINT pk_tratamiento PRIMARY KEY(idTratamiento),
foreign key (medicamento)REFERENCES receta(idReceta)
);

create table expediente(
idExpediente numeric not null,
idPaciente numeric not NULL,
nombrePaciente numeric not NULL,
condicionPaciente numeric not null,
estaturaPaciente numeric not null,
tratamiento numeric not null,
receta numeric not null,
nombreDoctor numeric not null,
idDoctor numeric not null,
constraint pk_expediente primary key (idExpediente),
FOREIGN KEY (idPaciente) references paciente(idPaciente),
FOREIGN KEY (nombrePaciente) references paciente(idPaciente),
FOREIGN KEY (condicionPaciente) references paciente(idPaciente),
FOREIGN KEY (estaturaPaciente) references paciente(idPaciente),
FOREIGN KEY (tratamiento) references tratamiento(idTratamiento),
FOREIGN KEY (receta) references tratamiento(idTratamiento),
FOREIGN KEY (nombreDoctor) references doctor(idDoctor),
FOREIGN KEY (idDoctor) references doctor(idDoctor)
);
