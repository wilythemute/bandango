# encoding: utf-8
comprobantes = [
  { codigo: 1,
    tipo: "Factura",
    codigo_secuenciales: [1, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] },
  { codigo: 2,
    tipo: "Nota o boleta de venta",
    codigo_secuenciales: [1],
    sustento_tributario: [2, 4, 5, 7, 8, 9, 0] },
  { codigo: 3,
    tipo: "Liquidación de compra de Bienes o Prestación de servicios",
    codigo_secuenciales: [2, 3],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8] },
  { codigo: 4,
    tipo: "Nota de crédito",
    codigo_secuenciales: [1, 2, 3, 4, 5, 6, 7, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] },
  { codigo: 5,
    tipo: "Nota de débito",
    codigo_secuenciales: [1, 2, 3, 4, 5, 6, 7, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] },
  { codigo: 7,
    tipo: "Comprobante de Retención" },
  { codigo: 8,
    tipo: "Boletos o entradas a espectáculos públicos",
    codigo_secuenciales: [1] },
  { codigo: 9,
    tipo: "Tiquetes o vales emitidos por máquinas registradoras",
    codigo_secuenciales: [1] },
  { codigo: 11,
    tipo: "Pasajes expedidos por empresas de aviación",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 5] },
  { codigo: 12,
    tipo: "Documentos emitidos por instituciones financieras",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 5] },
  { codigo: 15,
    tipo: "Comprobante de venta emitido en el Exterior",
    codigo_secuenciales: [3],
    sustento_tributario: [2, 4, 5, 7] },
  { codigo: 16,
    tipo: "Formulario Único de Exportación (FUE) o Declaración Aduanera Única (DAU) o Declaración Andina de Valor (DAV)",
    codigo_secuenciales: [9] },
  { codigo: 18,
    tipo: "Documentos autorizados utilizados en ventas excepto N/C N/D ",
    codigo_secuenciales: [4, 5, 6, 7] },
  { codigo: 19,
    tipo: "Comprobantes de Pago de Cuotas o Aportes",
    codigo_secuenciales: [1, 2],
    sustento_tributario: [2] },
  { codigo: 20,
    tipo: "Documentos por Servicios Administrativos emitidos por Inst. del Estado",
    codigo_secuenciales: [1],
    sustento_tributario: [2] },
  { codigo: 21,
    tipo: "Carta de Porte Aéreo",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 8] },
  { codigo: 22,
    tipo: "RECAP",
    codigo_secuenciales: [10, 11] },
  { codigo: 23,
    tipo: "Nota de Crédito TC",
    codigo_secuenciales: [10, 11] },
  { codigo: 24,
    tipo: "Nota de Débito TC",
    codigo_secuenciales: [10, 11] },
  { codigo: 41,
    tipo: "Comprobante de venta emitido por reembolso",
    codigo_secuenciales: [1, 4, 5, 6, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7] },
  { codigo: 42,
    tipo: "Documento agente de retención Presuntiva",
    codigo_secuenciales: [1],
    sustento_tributario: [0] },
  { codigo: 43,
    tipo: "Liquidacion para Explotacion y Exploracion de Hidrocarburos",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 6, 7] },
  { codigo: 44,
    tipo: "Comprobante de Contribuciones y Aportes",
    codigo_secuenciales: [4, 5, 6] },
  { codigo: 45,
    tipo: "Liquidación por reclamos de aseguradoras",
    codigo_secuenciales: [1, 3],
    sustento_tributario: [9] },
  { codigo: 47,
    tipo: "Nota de Crédito por Reembolso Emitida por Intermediario",
    codigo_secuenciales: [1, 4, 5, 6, 9],
    sustento_tributario: [1, 2, 3, 4, 6, 7] },
  { codigo: 48,
    tipo: "Nota de Débito por Reembolso Emitida por Intermediario",
    codigo_secuenciales: [1, 4, 5, 6, 9],
    sustento_tributario: [1, 2, 3, 4, 6, 7] },
  { codigo: 49,
    tipo: "Proveedor Directo de Exportador Bajo Régimen Especial",
    codigo_secuenciales: [4] },
  { codigo: 50,
    tipo: "A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta",
    codigo_secuenciales: [4] },
  { codigo: 51,
    tipo: "N/C A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta",
    codigo_secuenciales: [4] },
  { codigo: 52,
    tipo: "N/D A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta",
    codigo_secuenciales: [4] }
].each do |comprobante|
  Comprobante.where(codigo: comprobante[:codigo]).first_or_initialize.tap do |c|
    c.update_attributes! comprobante
  end
end
if Category.count == 0
  Category.where(id: 1).first_or_initialize.tap do |c|
    c.update_attributes! nombre: "General"
  end
end
sustento_comprobantes = [
  { codigo: 0,
    tipo: "No aplica",
    codigo_tipo_comprobantes: [1, 2, 4, 5, 42] },
  { codigo: 1,
    tipo: "Crédito Tributario para declaración de IVA (servicios y bienes distintos de inventarios y activos fijos)",
    codigo_tipo_comprobantes: [1, 3, 4, 5, 11, 12, 21, 41, 43, 47, 48] },
  { codigo: 2,
    tipo: "Costo o Gasto para declaración de IR (servicios y bienes distintos de inventarios y activos fijos)",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 11, 12, 15, 19, 20, 21, 41, 43, 47, 48] },
  { codigo: 3,
    tipo: "Activo Fijo - Crédito Tributario para declaración de IVA",
    codigo_tipo_comprobantes: [1, 3, 4, 5, 41, 47, 48] },
  { codigo: 4,
    tipo: "Activo Fijo - Costo o Gasto para declaración de IR",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 15, 41, 47, 48] },
  { codigo: 5,
    tipo: "Liquidación Gastos de Viaje, hospedaje y alimentación Gastos IR (a nombre de empleados y no de la empresa)",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 11] },
  { codigo: 6,
    tipo: "Inventario - Crédito Tributario para declaración de IVA",
    codigo_tipo_comprobantes: [1, 3, 4, 5, 41, 43, 47, 48] },
  { codigo: 7,
    tipo: "Inventario - Costo o Gasto para declaración de IR",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 15, 41, 43, 47, 48] },
  { codigo: 8,
    tipo: "Valor pagado para solicitar Reembolso de Gasto (intermediario)",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 21] },
  { codigo: 9,
    tipo: "Reembolso por Siniestros",
    codigo_tipo_comprobantes: [45, 4, 5] }
].each do |sustento|
  SustentoComprobante.where(codigo: sustento[:codigo]).first_or_initialize.tap do |s|
    s.update_attributes! sustento
  end
end
concepto_retencion_fuentes = [
  { codigo: 303,
    concepto: "Honorarios profesionales" },
  { codigo: 304,
    concepto: "Servicios predomina el intelecto" },
  { codigo: 307,
    concepto: "Servicios predomina la mano de obra" },
  { codigo: 308,
    concepto: "Servicios entre sociedades" },
  { codigo: 309,
    concepto: "Servicios publicidad y comunicación" },
  { codigo: 310,
    concepto: "Servicio transporte privado de pasajeros o servicio público o privado de carga" },
  { codigo: 312,
    concepto: "Transferencia de bienes muebles de naturaleza corporal" },
  { codigo: 319,
    concepto: "Arrendamiento mercantil" },
  { codigo: 320,
    concepto: "Arrendamiento bienes inmuebles" },
  { codigo: 322,
    concepto: "Seguros y reaseguros (primas y cesiones)" },
  { codigo: 323,
    concepto: "Por rendimientos financieros (No aplica para IFIs)" },
  { codigo: "323A",
    concepto: "Por RF: depósitos Cta Corriente" },
  { codigo: "323B1",
    concepto: "Por RF:  depósitos Cta Ahorros Sociedades" },
  { codigo: "323B2",
    concepto: "Por RF:  depósitos Cta Ahorros Persona Natural" },
  { codigo: "323C",
    concepto: "Por rendimientos financieros:  depósitos en cuentas exentas" },
  { codigo: "323D",
    concepto: "Por rendimientos financieros: compra, cancelación o redención de mini bem´s y bem´s" },
  { codigo: "323E",
    concepto: "Por RF: depósito a plazo" },
  { codigo: "323F",
    concepto: "Por rendimientos financieros: operaciones de reporto - repos" },
  { codigo: "323G",
    concepto: "Por RF: inversiones (captaciones)" },
  { codigo: "323H",
    concepto: "Por RF: obligaciones" },
  { codigo: "323I",
    concepto: "Por RF: bonos convertible en acciones" },
  { codigo: "323J",
    concepto: "Por RF: bonos de organismos y gobiernos extranjeros" },
  { codigo: "323K",
    concepto: "Por RF: entre IFI's" },
  { codigo: 325,
    concepto: "Por loterías, rifas, apuestas y similares" },
  { codigo: 327,
    concepto: "Por venta de combustibles a comercializadoras " },
  { codigo: 328,
    concepto: "Por venta de combustibles a distribuidores" },
  { codigo: 332,
    concepto: "Otras compras de bienes y servicios no sujetas a retención" },
  { codigo: 333,
    concepto: "Convenio de Débito o Recaudación" },
  { codigo: 334,
    concepto: "Por compras con tarjeta de crédito" },
  { codigo: 340,
    concepto: "Otras retenciones aplicables el 1%" },
  { codigo: 341,
    concepto: "Otras retenciones aplicables el 2%" },
  { codigo: 342,
    concepto: "Otras retenciones aplicables el 8%" },
  { codigo: 343,
    concepto: "Otras retenciones aplicables el 25%" },
  { codigo: 344,
    concepto: "Otras retenciones aplicables hasta el 10%" },
  { codigo: 403,
    concepto: "Sin convenio de doble tributación intereses por financiamiento de proveedores externos" },
  { codigo: 405,
    concepto: "Sin convenio de doble tributación intereses de créditos externos" },
  { codigo: 421,
    concepto: "Sin convenio de doble tributación por otros conceptos" },
  { codigo: 427,
    concepto: "Pagos al exterior no sujetos a retención" },
  { codigo: 401,
    concepto: "Con convenio de doble tributación" },
  { codigo: "401AA",
    concepto: "Con convenio de doble tributación: Alemania - Rentas Inmobiliarias" },
  { codigo: "401AB",
    concepto: "Con convenio de doble tributación: Alemania - Beneficios empresariales" },
  { codigo: "401AC",
    concepto: "Con convenio de doble tributación: Alemania - Navegación Marítima y/o aérea" },
  { codigo: "401AD",
    concepto: "Con convenio de doble tributación: Alemania- Empresas Asociadas" },
  { codigo: "401AE",
    concepto: "Con convenio de doble tributación: Alemania - Dividendos" },
  { codigo: "401AF",
    concepto: "Con convenio de doble tributación: Alemania - Intereses" },
  { codigo: "401AG",
    concepto: "Con convenio de doble tributación: Alemania - Cánones o regalías" },
  { codigo: "401AH",
    concepto: "Con convenio de doble tributación: Alemania - Ganancias de capital" },
  { codigo: "401AI",
    concepto: "Con convenio de doble tributación: Alemania - Servicios profesionales independientes" },
  { codigo: "401AJ",
    concepto: "Con convenio de doble tributación: Alemania - Servicios profesionales dependientes" },
  { codigo: "401AK",
    concepto: "Con convenio de doble tributación: Alemania - Participación de consejeros" },
  { codigo: "401AL",
    concepto: "Con convenio de doble tributación: Alemania- Artistas y deportistas" },
  { codigo: "401AM",
    concepto: "Con convenio de doble tributación: Alemania - Pensiones" },
  { codigo: "401AN",
    concepto: "Con convenio de doble tributación: Alemania - Reembolso de Gastos" },
  { codigo: "401AO",
    concepto: "Con convenio de doble tributación: Alemania - otros" },
  { codigo: "401BA",
    concepto: "Con convenio de doble tributación: Argentina - Rentas Inmobiliarias" },
  { codigo: "401BB",
    concepto: "Con convenio de doble tributación:  Argentina - Beneficios empresariales" },
  { codigo: "401BC",
    concepto: "Con convenio de doble tributación:  Argentina - Navegación Marítima y/o aérea" },
  { codigo: "401BD",
    concepto: "Con convenio de doble tributación:  Argentina- Empresas Asociadas" },
  { codigo: "401BE",
    concepto: "Con convenio de doble tributación:  Argentina - Dividendos" },
  { codigo: "401BF",
    concepto: "Con convenio de doble tributación:  Argentina - Intereses" },
  { codigo: "401BG",
    concepto: "Con convenio de doble tributación:  Argentina - Cánones o regalías" },
  { codigo: "401BH",
    concepto: "Con convenio de doble tributación:  Argentina - Ganancias de capital" },
  { codigo: "401BI",
    concepto: "Con convenio de doble tributación:  Argentina - Servicios profesionales independientes" },
  { codigo: "401BJ",
    concepto: "Con convenio de doble tributación:  Argentina - Servicios profesionales dependientes" },
  { codigo: "401BK",
    concepto: "Con convenio de doble tributación:  Argentina - Participación de consejeros" },
  { codigo: "401BL",
    concepto: "Con convenio de doble tributación:  Argentina- Artistas y deportistas" },
  { codigo: "401BM",
    concepto: "Con convenio de doble tributación:  Argentina - Pensiones" },
  { codigo: "401BN",
    concepto: "Con convenio de doble tributación: Argentina -  Reembolso de Gastos" },
  { codigo: "401BO",
    concepto: "Con convenio de doble tributación:  Argentina - otros" },
  { codigo: "401CA",
    concepto: "Con convenio de doble tributación: Bélgica - Rentas Inmobiliarias" },
  { codigo: "401CB",
    concepto: "Con convenio de doble tributación:  Bélgica - Beneficios empresariales" },
  { codigo: "401CC",
    concepto: "Con convenio de doble tributación:  Bélgica- Navegación Marítima y/o aérea" },
  { codigo: "401CD",
    concepto: "Con convenio de doble tributación:  Bélgica- Empresas Asociadas" },
  { codigo: "401CE",
    concepto: "Con convenio de doble tributación:  Bélgica - Dividendos" },
  { codigo: "401CF",
    concepto: "Con convenio de doble tributación:  Bélgica - Intereses" },
  { codigo: "401CG",
    concepto: "Con convenio de doble tributación:  Bélgica - Cánones o regalías" },
  { codigo: "401CH",
    concepto: "Con convenio de doble tributación:  Bélgica - Ganancias de capital" },
  { codigo: "401CI",
    concepto: "Con convenio de doble tributación:  Bélgica - Servicios profesionales independientes" },
  { codigo: "401CJ",
    concepto: "Con convenio de doble tributación:  Bélgica - Servicios profesionales dependientes" },
  { codigo: "401CK",
    concepto: "Con convenio de doble tributación:  Bélgica - Participación de consejeros" },
  { codigo: "401CL",
    concepto: "Con convenio de doble tributación:  Bélgica - Artistas y deportistas" },
  { codigo: "401CM",
    concepto: "Con convenio de doble tributación:  Bélgica - Pensiones" },
  { codigo: "401CN",
    concepto: "Con convenio de doble tributación: Bélgica - Reembolso de Gastos" },
  { codigo: "401CO",
    concepto: "Con convenio de doble tributación:  Bélgica - otros" },
  { codigo: "401DA",
    concepto: "Con convenio de doble tributación: Bolivia - Rentas Inmobiliarias" },
  { codigo: "401DB",
    concepto: "Con convenio de doble tributación:  Bolivia - Beneficios empresariales" },
  { codigo: "401DC",
    concepto: "Con convenio de doble tributación:  Bolivia- Navegación Marítima y/o aérea" },
  { codigo: "401DD",
    concepto: "Con convenio de doble tributación:  Bolivia- Empresas Asociadas" },
  { codigo: "401DE",
    concepto: "Con convenio de doble tributación:  Bolivia - Dividendos"},
  { codigo: "401DF",
    concepto: "Con convenio de doble tributación:  Bolivia - Intereses" },
  { codigo: "401DG",
    concepto: "Con convenio de doble tributación:  Bolivia - Cánones o regalías" },
  { codigo: "401DH",
    concepto: "Con convenio de doble tributación:  Bolivia - Ganancias de capital" },
  { codigo: "401DI",
    concepto: "Con convenio de doble tributación:  Bolivia- Servicios profesionales independientes" },
  { codigo: "401DJ",
    concepto: "Con convenio de doble tributación:  Bolivia - Servicios profesionales dependientes" },
  { codigo: "401DK",
    concepto: "Con convenio de doble tributación:  Bolivia - Participación de consejeros" },
  { codigo: "401DL",
    concepto: "Con convenio de doble tributación:  Bolivia - Artistas y deportistas" },
  { codigo: "401DM",
    concepto: "Con convenio de doble tributación:  Bolivia - Pensiones" },
  { codigo: "401DN",
    concepto: "Con convenio de doble tributación: Bolivia - Reembolso de Gastos" },
  { codigo: "401DO",
    concepto: "Con convenio de doble tributación:  Bolivia - otros" },
  { codigo: "401EA",
    concepto: "Con convenio de doble tributación: Brasil - Rentas Inmobiliarias" },
  { codigo: "401EB",
    concepto: "Con convenio de doble tributación:  Brasil - Beneficios empresariales" },
  { codigo: "401EC",
    concepto: "Con convenio de doble tributación:  Brasil - Navegación Marítima y/o aérea" },
  { codigo: "401ED",
    concepto: "Con convenio de doble tributación:  Brasil - Empresas Asociadas" },
  { codigo: "401EE",
    concepto: "Con convenio de doble tributación:  Brasil - Dividendos" },
  { codigo: "401EF",
    concepto: "Con convenio de doble tributación:  Brasil - Intereses" },
  { codigo: "401EG",
    concepto: "Con convenio de doble tributación:  Brasil - Cánones o regalías" },
  { codigo: "401EH",
    concepto: "Con convenio de doble tributación:  Brasil- Ganancias de capital" },
  { codigo: "401EI",
    concepto: "Con convenio de doble tributación:  Brasil - Servicios profesionales independientes" },
  { codigo: "401EJ",
    concepto: "Con convenio de doble tributación:  Brasil - Servicios profesionales dependientes" },
  { codigo: "401EK",
    concepto: "Con convenio de doble tributación:  Brasil - Participación de consejeros" },
  { codigo: "401EL",
    concepto: "Con convenio de doble tributación:  Brasil - Artistas y deportistas" },
  { codigo: "401EM",
    concepto: "Con convenio de doble tributación:  Brasil - Pensiones" },
  { codigo: "401EN",
    concepto: "Con convenio de doble tributación: Brasil - Reembolso de Gastos" },
  { codigo: "401EO",
    concepto: "Con convenio de doble tributación:  Brasil - otros" },
  { codigo: "401FA",
    concepto: "Con convenio de doble tributación: Canadá - Rentas Inmobiliarias" },
  { codigo: "401FB",
    concepto: "Con convenio de doble tributación:  Canadá - Beneficios empresariales" },
  { codigo: "401FC",
    concepto: "Con convenio de doble tributación:  Canadá - Navegación Marítima y/o aérea" },
  { codigo: "401FD",
    concepto: "Con convenio de doble tributación:  Canadá - Empresas Asociadas" },
  { codigo: "401FE",
    concepto: "Con convenio de doble tributación:  Canadá - Dividendos" },
  { codigo: "401FF",
    concepto: "Con convenio de doble tributación:  Canadá - Intereses" },
  { codigo: "401FG",
    concepto: "Con convenio de doble tributación:  Canadá - Cánones o regalías" },
  { codigo: "401FH",
    concepto: "Con convenio de doble tributación:  Canadá- Ganancias de capital" },
  { codigo: "401FI",
    concepto: "Con convenio de doble tributación: Canadá - Servicios profesionales independientes" },
  { codigo: "401FJ",
    concepto: "Con convenio de doble tributación: Canadá - Servicios profesionales dependientes" },
  { codigo: "401FK",
    concepto: "Con convenio de doble tributación:  Canadá - Participación de consejeros" },
  { codigo: "401FL",
    concepto: "Con convenio de doble tributación:  Canadá - Artistas y deportistas" },
  { codigo: "401FM",
    concepto: "Con convenio de doble tributación:  Canadá - Pensiones" },
  { codigo: "401FN",
    concepto: "Con convenio de doble tributación: Canadá - Reembolso de Gastos" },
  { codigo: "401FO",
    concepto: "Con convenio de doble tributación:  Canadá - otros" },
  { codigo: "401GA",
    concepto: "Con convenio de doble tributación: Chile - Rentas Inmobiliarias" },
  { codigo: "401GB",
    concepto: "Con convenio de doble tributación:  Chile - Beneficios empresariales" },
  { codigo: "401GC",
    concepto: "Con convenio de doble tributación:  Chile - Navegación Marítima y/o aérea" },
  { codigo: "401GD",
    concepto: "Con convenio de doble tributación:  Chile - Empresas Asociadas" },
  { codigo: "401GE",
    concepto: "Con convenio de doble tributación:  Chile - Dividendos" },
  { codigo: "401GF",
    concepto: "Con convenio de doble tributación:  Chile - Intereses" },
  { codigo: "401GG",
    concepto: "Con convenio de doble tributación:  Chile - Cánones o regalías" },
  { codigo: "401GH",
    concepto: "Con convenio de doble tributación:  Chile - Ganancias de capital" },
  { codigo: "401GI",
    concepto: "Con convenio de doble tributación: Chile - Servicios profesionales independientes" },
  { codigo: "401GJ",
    concepto: "Con convenio de doble tributación: Chile - Servicios profesionales dependientes" },
  { codigo: "401GK",
    concepto: "Con convenio de doble tributación:  Chile - Participación de consejeros" },
  { codigo: "401GL",
    concepto: "Con convenio de doble tributación:  Chile - Artistas y deportistas" },
  { codigo: "401GM",
    concepto: "Con convenio de doble tributación:  Chile - Pensiones" },
  { codigo: "401GN",
    concepto: "Con convenio de doble tributación: Chile - Reembolso de Gastos" },
  { codigo: "401GO",
    concepto: "Con convenio de doble tributación:  Chile - otros" },
  { codigo: "401HA",
    concepto: "Con convenio de doble tributación: Colombia - Rentas Inmobiliarias" },
  { codigo: "401HB",
    concepto: "Con convenio de doble tributación:  Colombia - Beneficios empresariales" },
  { codigo: "401HC",
    concepto: "Con convenio de doble tributación:  Colombia - Navegación Marítima y/o aérea" },
  { codigo: "401HD",
    concepto: "Con convenio de doble tributación:  Colombia - Empresas Asociadas" },
  { codigo: "401HE",
    concepto: "Con convenio de doble tributación:  Colombia - Dividendos" },
  { codigo: "401HF",
    concepto: "Con convenio de doble tributación:  Colombia - Intereses" },
  { codigo: "401HG",
    concepto: "Con convenio de doble tributación:  Colombia - Cánones o regalías" },
  { codigo: "401HH",
    concepto: "Con convenio de doble tributación:  Colombia - Ganancias de capital" },
  { codigo: "401HI",
    concepto: "Con convenio de doble tributación: Colombia - Servicios profesionales independientes" },
  { codigo: "401HJ",
    concepto: "Con convenio de doble tributación: Colombia - Servicios profesionales dependientes" },
  { codigo: "401HK",
    concepto: "Con convenio de doble tributación:  Colombia - Participación de consejeros" },
  { codigo: "401HL",
    concepto: "Con convenio de doble tributación:  Colombia - Artistas y deportistas" },
  { codigo: "401HM",
    concepto: "Con convenio de doble tributación:  Colombia - Pensiones" },
  { codigo: "401HN",
    concepto: "Con convenio de doble tributación: Colombia - Reembolso de Gastos" },
  { codigo: "401HO",
    concepto: "Con convenio de doble tributación:  Colombia - otros" },
  { codigo: "401IA",
    concepto: "Con convenio de doble tributación: España - Rentas Inmobiliarias" },
  { codigo: "401IB",
    concepto: "Con convenio de doble tributación:  España - Beneficios empresariales" },
  { codigo: "401IC",
    concepto: "Con convenio de doble tributación:  España - Navegación Marítima y/o aérea" },
  { codigo: "401ID",
    concepto: "Con convenio de doble tributación:  España - Empresas Asociadas" },
  { codigo: "401IE",
    concepto: "Con convenio de doble tributación:  España - Dividendos" },
  { codigo: "401IF",
    concepto: "Con convenio de doble tributación:  España - Intereses" },
  { codigo: "401IG",
    concepto: "Con convenio de doble tributación:  España - Cánones o regalías" },
  { codigo: "401IH",
    concepto: "Con convenio de doble tributación:  España - Ganancias de capital" },
  { codigo: "401II",
    concepto: "Con convenio de doble tributación: España - Servicios profesionales independientes" },
  { codigo: "401IJ",
    concepto: "Con convenio de doble tributación: España - Servicios profesionales dependientes" },
  { codigo: "401IK",
    concepto: "Con convenio de doble tributación:  España - Participación de consejeros" },
  { codigo: "401IL",
    concepto: "Con convenio de doble tributación:  España - Artistas y deportistas" },
  { codigo: "401IM",
    concepto: "Con convenio de doble tributación:  España - Pensiones" },
  { codigo: "401IN",
    concepto: "Con convenio de doble tributación: España - Reembolso de Gastos" },
  { codigo: "401IO",
    concepto: "Con convenio de doble tributación:  España - otros" },
  { codigo: "401JA",
    concepto: "Con convenio de doble tributación: Francia - Rentas Inmobiliarias" },
  { codigo: "401JB",
    concepto: "Con convenio de doble tributación:  Francia - Beneficios empresariales" },
  { codigo: "401JC",
    concepto: "Con convenio de doble tributación:   Francia - Navegación Marítima y/o aérea" },
  { codigo: "401JD",
    concepto: "Con convenio de doble tributación:   Francia - Empresas Asociadas" },
  { codigo: "401JE",
    concepto: "Con convenio de doble tributación:  Francia - Dividendos" },
  { codigo: "401JF",
    concepto: "Con convenio de doble tributación:   Francia - Intereses" },
  { codigo: "401JG",
    concepto: "Con convenio de doble tributación:   Francia - Cánones o regalías" },
  { codigo: "401JH",
    concepto: "Con convenio de doble tributación:   Francia - Ganancias de capital" },
  { codigo: "401JI",
    concepto: "Con convenio de doble tributación:  Francia - Servicios profesionales independientes" },
  { codigo: "401JJ",
    concepto: "Con convenio de doble tributación:  Francia - Servicios profesionales dependientes" },
  { codigo: "401JK",
    concepto: "Con convenio de doble tributación:   Francia - Participación de consejeros" },
  { codigo: "401JL",
    concepto: "Con convenio de doble tributación:   Francia - Artistas y deportistas" },
  { codigo: "401JM",
    concepto: "Con convenio de doble tributación:   Francia - Pensiones" },
  { codigo: "401JN",
    concepto: "Con convenio de doble tributación:  Francia - Reembolso de Gastos" },
  { codigo: "401JO",
    concepto: "Con convenio de doble tributación:   Francia - otros" },
  { codigo: "401KA",
    concepto: "Con convenio de doble tributación: Italia - Rentas Inmobiliarias" },
  { codigo: "401KB",
    concepto: "Con convenio de doble tributación:  Italia - Beneficios empresariales" },
  { codigo: "401KC",
    concepto: "Con convenio de doble tributación:   Italia - Navegación Marítima y/o aérea" },
  { codigo: "401KD",
    concepto: "Con convenio de doble tributación:   Italia - Empresas Asociadas" },
  { codigo: "401KE",
    concepto: "Con convenio de doble tributación:  Italia - Dividendos" },
  { codigo: "401KF",
    concepto: "Con convenio de doble tributación:   Italia - Intereses" },
  { codigo: "401KG",
    concepto: "Con convenio de doble tributación:   Italia - Cánones o regalías" },
  { codigo: "401KH",
    concepto: "Con convenio de doble tributación:   Italia - Ganancias de capital" },
  { codigo: "401KI",
    concepto: "Con convenio de doble tributación:  Italia - Servicios profesionales independientes" },
  { codigo: "401KJ",
    concepto: "Con convenio de doble tributación:  Italia - Servicios profesionales dependientes" },
  { codigo: "401KK",
    concepto: "Con convenio de doble tributación:   Italia - Participación de consejeros" },
  { codigo: "401KL",
    concepto: "Con convenio de doble tributación:   Italia - Artistas y deportistas" },
  { codigo: "401KM",
    concepto: "Con convenio de doble tributación:   Italia - Pensiones" },
  { codigo: "401KN",
    concepto: "Con convenio de doble tributación:  Italia - Reembolso de Gastos" },
  { codigo: "401KO",
    concepto: "Con convenio de doble tributación:   Italia - otros" },
  { codigo: "401LA",
    concepto: "Con convenio de doble tributación: México - Rentas Inmobiliarias" },
  { codigo: "401LB",
    concepto: "Con convenio de doble tributación:  México - Beneficios empresariales" },
  { codigo: "410LC",
    concepto: "Con convenio de doble tributación:   México - Navegación Marítima y/o aérea" },
  { codigo: "401LD",
    concepto: "Con convenio de doble tributación:   México - Empresas Asociadas" },
  { codigo: "401LE",
    concepto: "Con convenio de doble tributación:  México - Dividendos" },
  { codigo: "401LF",
    concepto: "Con convenio de doble tributación:   México - Intereses" },
  { codigo: "401LG",
    concepto: "Con convenio de doble tributación:   México - Cánones o regalías" },
  { codigo: "401LH",
    concepto: "Con convenio de doble tributación:   México - Ganancias de capital" },
  { codigo: "401LI",
    concepto: "Con convenio de doble tributación:  México - Servicios profesionales independientes" },
  { codigo: "401LJ",
    concepto: "Con convenio de doble tributación:  México - Servicios profesionales dependientes" },
  { codigo: "401LK",
    concepto: "Con convenio de doble tributación:  México - Participación de consejeros" },
  { codigo: "401LL",
    concepto: "Con convenio de doble tributación:  México - Artistas y deportistas" },
  { codigo: "401LM",
    concepto: "Con convenio de doble tributación:   México - Pensiones" },
  { codigo: "401LN",
    concepto: "Con convenio de doble tributación: México - Reembolso de Gastos" },
  { codigo: "401LO",
    concepto: "Con convenio de doble tributación:   México - otros" },
  { codigo: "401MA",
    concepto: "Con convenio de doble tributación: Perú - Rentas Inmobiliarias" },
  { codigo: "401MB",
    concepto: "Con convenio de doble tributación:  Perú - Beneficios empresariales" },
  { codigo: "401MC",
    concepto: "Con convenio de doble tributación:   Perú - Navegación Marítima y/o aérea" },
  { codigo: "401MD",
    concepto: "Con convenio de doble tributación:   Perú - Empresas Asociadas" },
  { codigo: "401ME",
    concepto: "Con convenio de doble tributación:  Perú - Dividendos" },
  { codigo: "401MF",
    concepto: "Con convenio de doble tributación:   Perú - Intereses" },
  { codigo: "401MG",
    concepto: "Con convenio de doble tributación:   Perú - Cánones o regalías" },
  { codigo: "401MH",
    concepto: "Con convenio de doble tributación:   Perú - Ganancias de capital" },
  { codigo: "401MI",
    concepto: "Con convenio de doble tributación:  Perú - Servicios profesionales independientes" },
  { codigo: "401MJ",
    concepto: "Con convenio de doble tributación:  Perú - Servicios profesionales dependientes" },
  { codigo: "401MK",
    concepto: "Con convenio de doble tributación:  Perú - Participación de consejeros" },
  { codigo: "401ML",
    concepto: "Con convenio de doble tributación:  Perú - Artistas y deportistas" },
  { codigo: "401MM",
    concepto: "Con convenio de doble tributación:   Perú - Pensiones" },
  { codigo: "401MN",
    concepto: "Con convenio de doble tributación: Perú - Reembolso de Gastos" },
  { codigo: "401MO",
    concepto: "Con convenio de doble tributación:   Perú - otros" },
  { codigo: "401NA",
    concepto: "Con convenio de doble tributación: Rumania - Rentas Inmobiliarias" },
  { codigo: "401NB",
    concepto: "Con convenio de doble tributación:  Rumania - Beneficios empresariales" },
  { codigo: "401NC",
    concepto: "Con convenio de doble tributación:   Rumania - Navegación Marítima y/o aérea" },
  { codigo: "401ND",
    concepto: "Con convenio de doble tributación:   Rumania - Empresas Asociadas" },
  { codigo: "401NE",
    concepto: "Con convenio de doble tributación:  Rumania - Dividendos" },
  { codigo: "401NF",
    concepto: "Con convenio de doble tributación:   Rumania - Intereses" },
  { codigo: "401NG",
    concepto: "Con convenio de doble tributación:   Rumania - Cánones o regalías" },
  { codigo: "401NH",
    concepto: "Con convenio de doble tributación:   Rumania - Ganancias de capital" },
  { codigo: "401NI",
    concepto: "Con convenio de doble tributación:  Rumania - Servicios profesionales independientes" },
  { codigo: "401NJ",
    concepto: "Con convenio de doble tributación:  Rumania - Servicios profesionales dependientes" },
  { codigo: "401NK",
    concepto: "Con convenio de doble tributación:  Rumania - Participación de consejeros" },
  { codigo: "401NL",
    concepto: "Con convenio de doble tributación:  Rumania - Artistas y deportistas" },
  { codigo: "401NM",
    concepto: "Con convenio de doble tributación:   Rumania - Pensiones" },
  { codigo: "401NN",
    concepto: "Con convenio de doble tributación: Rumania - Reembolso de Gastos" },
  { codigo: "401NO",
    concepto: "Con convenio de doble tributación:   Rumania - otros" },
  { codigo: "401OA",
    concepto: "Con convenio de doble tributación: Suiza - Rentas Inmobiliarias" },
  { codigo: "401OB",
    concepto: "Con convenio de doble tributación:  Suiza - Beneficios empresariales" },
  { codigo: "401OC",
    concepto: "Con convenio de doble tributación:   Suiza - Navegación Marítima y/o aérea" },
  { codigo: "401OD",
    concepto: "Con convenio de doble tributación:   Suiza - Empresas Asociadas" },
  { codigo: "401OE",
    concepto: "Con convenio de doble tributación:  Suiza - Dividendos" },
  { codigo: "401OF",
    concepto: "Con convenio de doble tributación:   Suiza - Intereses" },
  { codigo: "401OG",
    concepto: "Con convenio de doble tributación:   Suiza - Cánones o regalías" },
  { codigo: "401OH",
    concepto: "Con convenio de doble tributación:   Suiza - Ganancias de capital" },
  { codigo: "401OI",
    concepto: "Con convenio de doble tributación:  Suiza - Servicios profesionales independientes" },
  { codigo: "401OJ",
    concepto: "Con convenio de doble tributación:  Suiza - Servicios profesionales dependientes" },
  { codigo: "401OK",
    concepto: "Con convenio de doble tributación:  Suiza - Participación de consejeros" },
  { codigo: "401OL",
    concepto: "Con convenio de doble tributación:  Suiza - Artistas y deportistas" },
  { codigo: "401OM",
    concepto: "Con convenio de doble tributación:  Suiza - Pensiones" },
  { codigo: "401ON",
    concepto: "Con convenio de doble tributación: Suiza - Reembolso de Gastos" },
  { codigo: "401OO",
    concepto: "Con convenio de doble tributación:   Suiza - otros" },
  { codigo: "401PA",
    concepto: "Con convenio de doble tributación: Venezuela - Rentas Inmobiliarias" },
  { codigo: "401PB",
    concepto: "Con convenio de doble tributación:  Venezuela - Beneficios empresariales" },
  { codigo: "401PC",
    concepto: "Con convenio de doble tributación:   Venezuela - Navegación Marítima y/o aérea" },
  { codigo: "401PD",
    concepto: "Con convenio de doble tributación:   Venezuela - Empresas Asociadas" },
  { codigo: "401PE",
    concepto: "Con convenio de doble tributación:  Venezuela - Dividendos" },
  { codigo: "401PF",
    concepto: "Con convenio de doble tributación:   Venezuela - Intereses" },
  { codigo: "401PG",
    concepto: "Con convenio de doble tributación:   Venezuela - Cánones o regalías" },
  { codigo: "401PH",
    concepto: "Con convenio de doble tributación:   Venezuela - Ganancias de capital" },
  { codigo: "401PI",
    concepto: "Con convenio de doble tributación:  Venezuela - Servicios profesionales independientes" },
  { codigo: "401PJ",
    concepto: "Con convenio de doble tributación:  Venezuela - Servicios profesionales dependientes" },
  { codigo: "401PK",
    concepto: "Con convenio de doble tributación:  Venezuela - Participación de consejeros" },
  { codigo: "401PL",
    concepto: "Con convenio de doble tributación:  Venezuela - Artistas y deportistas" },
  { codigo: "401PM",
    concepto: "Con convenio de doble tributación:  Venezuela - Pensiones" },
  { codigo: "401PN",
    concepto: "Con convenio de doble tributación: Venezuela - Reembolso de Gastos" },
  { codigo: "401PO",
    concepto: "Con convenio de doble tributación:   Venezuela - otros" }
].each do |concepto|
  ConceptoRetencionFuente.where(codigo: concepto[:codigo]).first_or_initialize.tap do |c|
    c.update_attributes! concepto
  end
end
