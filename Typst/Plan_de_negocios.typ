#let formato_apa(
  titulo: "",
  autor: "",
  afiliacion: "",
  curso: "",
  instructor: "",
  fecha: "",
  cuerpo,
) = {
  // 1. Configuración de página inicial (Sin número de página para Portada e Índice)
  set page(
    paper: "us-letter",
    margin: 1in,
  )

  // 2. Configuración de texto
  set text(
    font: "Times New Roman",
    size: 12pt,
    lang: "es",
  )

  // 3. Configuración de párrafo
  set par(
    leading: 9pt,
    first-line-indent: 0.5in,
    justify: true,
  )

  // 4. Configuración de Títulos

  show heading: set block(above: 24pt, below: 15pt)

  show heading: it => {
    set text(font: "Gill Sans MT", size: 15pt, weight: "bold")
    set align(left)
    it
  }

  set enum(spacing: 1.5em)

  // --- PORTADA ---
  // --- PORTADA INSTITUCIONAL (UV) ---

  // 1. Gráfico inferior izquierdo (Ignoramos los márgenes con dx y dy)
  place(bottom + left, dx: -1in, dy: 1in)[
    // Descomenta la siguiente línea cuando tengas tu imagen lista:
    #image("../images/background.png", width: 4.5in)
  ]

  // 2. Contenido alineado a la derecha
  align(right)[

    // Logotipo UV
    #image("../images/logo_uv.png", width: 1in)

    // Encabezado
    #text(font: "Gill Sans MT", size: 14pt, weight: "bold")[Universidad Veracruzana] \
    // Línea separadora adaptada al texto
    #align(right)[#line(length: 150pt, stroke: 0.7pt)]
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Facultad de Contaduría y Administración] \
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Región Coatzacoalcos-Minatitlán] \

    #v(2em)

    // Programa educativo
    #text(font: "Gill Sans MT", size: 12pt, weight: "bold")[Programa educativo] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[Ingeniería de Software] \

    // Experiencia Educativa
    #text(font: "Gill Sans MT", size: 12pt, weight: "bold")[Experiencia Educativa] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[#curso] \

    #v(1em)

    // Título
    #text(font: "Gill Sans MT", size: 16pt, weight: "bold")[Plan de negocios] \
    #v(0.5em)
    #text(font: "Gill Sans MT", size: 13pt, fill: rgb("#777777"))[#titulo] \

    #v(2em)

    // Presentan
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Presentan:] \
    #text(font: "Gill Sans MT", size: 11pt, weight: "bold", fill: rgb("#777777"))[#autor] \

    #v(2em)

    // Grupo
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Grupo:] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[LIS-701] \

    #v(2em)

    // Docente
    #text(font: "Gill Sans MT", size: 10pt, weight: "bold")[Docente:] \
    #text(font: "Gill Sans MT", size: 11pt, fill: rgb("#777777"))[#instructor] \

    #v(4em)

    // Fecha y Lema
    #text(font: "Gill Sans MT", size: 10pt)[Coatzacoalcos, Ver., #text(fill: rgb("#777777"))[#fecha]] \
    #v(1em)
    #text(font: "Gill Sans MT", size: 10pt)[“Lis de Veracruz: Arte, Ciencia, Luz”]
  ]

  // Salto de página sin el símbolo #
  pagebreak()

  // --- ÍNDICE ---
  outline(
    title: "Índice",
    indent: auto,
  )

  pagebreak()

// --- ÍNDICE DE FIGURAS ---

  outline(
  title: [Índice de Tablas y Figuras],
  target: figure,
)

  // --- CONFIGURACIÓN DEL CONTENIDO PRINCIPAL ---
  // A partir de aquí encendemos el encabezado.
  set page(
    header: context align(right)[#counter(page).display()],
  )

  // Inyectamos el texto del documento
  cuerpo
}

// ==========================================
// APLICACIÓN DE LA PLANTILLA Y TU CONTENIDO
// ==========================================

#show: formato_apa.with(
  titulo: "SWAP",
  autor: "Abraham Giovani Barrera Torres\nErick Yamil Rodríguez Castellanos\n Josué Eliel Rosaldo Santiado\n René Emiliano Sánchez Saucedo",
  afiliacion: "Facultad de Contaduría y Administración, Universidad Veracruzana",
  curso: "Desarrollo de Empresas Tecnológicas",
  instructor: [Mtro.~Arturo Estudillo Quilantan],
  fecha: "9 de noviembre de 2026",
)

// Primeros títulos sin numeración
// #set heading(numbering: none)

// = Introducción

// El presente trabajo es un reporte de revisión sistemática de la literatura (RSL) desarrollado bajo las directrices metodológicas de Kitchenham y Charters. La investigación aborda la transformación de la ingeniería de software ante la integración de agentes de codificación y modelos de inteligencia artificial generativa en el ciclo de vida del desarrollo. Se examinarán las metodologías propuestas que integran IA en el desarrollo de proyecto de software y cómo cambian las dinámicas de trabajo y las competencias de trabajo..

// ==========================================
// ENCENDEMOS LA NUMERACIÓN PARA EL RESTO DEL TEXTO
// ==========================================
#set heading(numbering: none)

= Resumen ejecutivo

SWAP es una empresa de base tecnológica especializada en el desarrollo de plataformas digitales orientadas a la economía colaborativa y circular. Nace con el propósito de transformar los hábitos de consumo tradicional de la comunidad juvenil e independiente, ofreciendo una solución móvil innovadora, intuitiva y segura para agilizar el intercambio directo de bienes en desuso.

A diferencia del trueque tradicional, que suele fracasar por la dificultad de lograr una coincidencia recíproca, SWAP integra algoritmos inteligentes de recomendación, herramientas de geolocalización y un robusto sistema de seguridad que incluye verificación local presencial mediante código QR y logística integrada con paqueterías para envíos regionales o nacionales. Esto permite a los usuarios convertir artículos que ya no utilizan en valor real para adquirir lo que necesitan sin tener un desembolso monetario directo.  

Buscando consolidarse como la plataforma tecnológica líder en economía colaborativa a nivel regional, el proyecto se sustenta en seis pilares estratégicos: desarrollo e innovación tecnológica, seguridad y confianza comunitaria, crecimiento regional, sostenibilidad ambiental, experiencia de usuario superior y un modelo de negocio financieramente viable. Su esquema de monetización es de bajo impacto y totalmente transparente, operando bajo un formato gratuito para la publicación de artículos y generando ingresos a través de comisiones por intercambios exitosos, márgenes logísticos y membresías opcionales Premium.  

SWAP se posiciona como una respuesta moderna y sustentable al sobreconsumo, extendiendo la vida útil de los objetos y generando un impacto ambiental positivo.

#pagebreak()

#set heading(numbering: "1.1.")
#counter(heading).update(0) // Reiniciamos el contador a 0. El próximo será el 1.

= Administración Organizacional

== Descripción de la empresa

Swap es una aplicación móvil diseñada para revolucionar el trueque tradicional, convirtiéndolo en un proceso ágil, seguro y accesible. La plataforma elimina la barrera principal del intercambio directo (la necesidad de coincidencia perfecta entre dos personas) integrando un sistema híbrido de trueque directo (P2P).

Swap fomenta la economía circular, permitiendo a los usuarios convertir objetos que ya no utilizan (ropa, tecnología, libros, artículos del hogar) en bienes o servicios que realmente necesitan, minimizando el gasto de dinero y reduciendo el impacto ambiental del consumo masivo.

SWAP es una empresa de base tecnológica especializada en el diseño y desarrollo de plataformas digitales orientadas a la economía colaborativa y circular. Nace con el propósito de transformar los hábitos de consumo tradicional mediante soluciones móviles intuitivas, seguras y escalables que facilitan el intercambio directo de bienes en desuso entre comunidades locales y regionales.

A través del aprovechamiento de herramientas modernas de geolocalización, algoritmos de coincidencia inteligente (matchmaking) y sistemas de reputación comunitaria, la empresa busca reducir la huella de carbono asociada al sobreconsumo y extender la vida útil de los objetos. SWAP opera bajo estándares ágiles de ingeniería de software, priorizando la privacidad del usuario, la accesibilidad multiplataforma y una experiencia de usuario (UX) centrada en la confianza y la sostenibilidad.

== Misión y visión

#set heading(numbering: none)

=== Misión

Proporcionar soluciones de software de alta calidad en sistemas complejos priorizando la arquitectura, diseño y seguridad, transformando los desafíos tecnológicos en soluciones innovadoras, confiables y escalables, comprometiéndonos con actuar con ética y transparencia para satisfacer las necesidades de nuestros clientes. 

Conectar a personas y comunidades mediante soluciones tecnológicas innovadoras que faciliten el intercambio justo, seguro y sostenible de bienes en desuso, promoviendo la reducción del desperdicio y redefiniendo el valor de los objetos a través de la economía circular. 

=== Visión

Para 2035 encabezar la industria del desarrollo de sistemas de software, distinguiendo la innovación y creatividad para superar las barreras entre clientes y la tecnología. 

Consolidarnos para 2030 como la plataforma tecnológica líder en economía colaborativa e intercambio de bienes a nivel regional, siendo el referente principal en consumo responsable, impacto ambiental positivo y generación de comunidades digitales de confianza mutua. 

#set heading(numbering: "1.1.")

== Objetivos Estratégicos

+ *Desarrollo e innovación tecnológica:* Desarrollar y consolidar una plataforma móvil intuitiva, escalable y de alto rendimiento que integre mecanismos de trueque directo y sistemas inteligentes de coincidencia, facilitando el intercambio de bienes entre usuarios de manera eficiente.

+ *Seguridad y confianza comunitaria:* Establecer mecanismos de seguridad digital, protección de datos personales, verificación de usuarios y sistemas de reputación que promuevan intercambios confiables, transparentes y seguros dentro de la comunidad SWAP.

+ *Crecimiento y posicionamiento regional:* Incrementar progresivamente la cantidad de usuarios activos y el volumen de intercambios exitosos, fortaleciendo la presencia de SWAP en comunidades locales y regionales para consolidarla como una alternativa reconocida frente al consumo tradicional.

+ *Sostenibilidad e impacto ambiental:* Promover la economía circular mediante el intercambio y la reutilización de bienes en desuso, fomentando hábitos de consumo responsable y estableciendo indicadores que permitan evaluar la contribución de la plataforma a la reducción del desperdicio.

+ *Experiencia y satisfacción del usuario:* Optimizar continuamente la experiencia de usuario mediante interfaces accesibles, procesos de intercambio sencillos y herramientas de comunicación eficaces, con el propósito de incrementar la satisfacción, la retención y la participación activa de la comunidad.

+ *Viabilidad y sostenibilidad empresarial:* Definir un modelo de negocio viable que permita financiar el mantenimiento, la evolución y la expansión de SWAP, mediante estrategias de monetización compatibles con el acceso a la plataforma, la transparencia comercial y los principios de la economía colaborativa.

== Imagen Corporativa

#set heading(numbering: none)

Queremos que el público perciba a SWAP como un proyecto creado por una generación joven que busca consumir de manera diferente, pero que aborda ese propósito con seriedad, responsabilidad y capacidad tecnológica.

La imagen corporativa de SWAP se construirá alrededor de tres atributos principales:

+ *Juventud consciente:* SWAP debe sentirse como una iniciativa nacida de una generación creativa, dinámica y preocupada por el futuro. La comunicación será cercana, contemporánea y optimista, sin caer en una imagen infantil ni excesivamente informal.

+ *Seguridad y confianza:* La plataforma debe transmitir orden, transparencia y profesionalismo. Los perfiles claros, las valoraciones, las condiciones visibles de cada intercambio y los controles de privacidad deben reforzar la sensación de que las personas pueden utilizarla con tranquilidad.

+ *Utilidad e innovación:* La marca debe comunicar que intercambiar es sencillo y práctico. El diseño tiene que facilitar la publicación de objetos, la búsqueda de coincidencias y la coordinación de los intercambios, sin hacer que la sustentabilidad parezca más importante que la funcionalidad.

=== Personalidad de la Marca

#figure(
  table(
    columns: (auto, 1fr),
    align: (left, left),
    inset: 8pt,
    [*Atributo*], [*¿Cómo debe manifestarse?*],
    [Joven], [Lenguaje actual, diseños dinámicos y referencias visuales contemporáneas.],
    [Sustentable], [Promoción de la reutilización, la circularidad y el consumo responsable, sin exagerar los beneficios ambientales.],
    [Confiable], [Información clara, reglas transparentes, protección de datos y comunicación honesta.],
    [Simple], [Mensajes directos, procesos sencillos y una aplicación fácil de comprender.],
    [Comunitaria], [Historias reales de usuarios, colaboración local y reconocimiento de los intercambios exitosos.],
  ),
  caption: [Atributos de la marca y su manifestación],
)

=== Propuesta de identidad visual para proyectar esa imagen

Aunque la identidad visual forma parte de la identidad corporativa, es uno de los principales recursos que SWAP puede utilizar para influir en su imagen pública.

#figure(
  image("../images/logo_swap.png", width: 2in),
  caption: [Logo de SWAP]
)

#set heading(numbering: "1.1.")

== Ventajas Competitivas y Análisis FODA

1. Diferenciación por Seguridad y Logística Integrada

- *Sistema de verificación presencial por código QR:* SWAP resuelve la coordinación informal de intercambios mediante un mecanismo de entrega local con escaneo QR, garantizando la validación en tiempo real del trueque.
- *Logística integrada con paqueterías:* Para intercambios regionales o nacionales, la aplicación genera guías automáticas, eliminando la necesidad de realizar encuentro en la vía pública.

2. Innovación Tecnológica en el Modelo P2P

- *Eliminación de la coincidencia directa obligatoria:* El trueque tradicional suele fallar por la dificultad de encontrar a dos personas que deseen recíprocamente sus artículos. SWAP resuelve esta barrera integrando algoritmos inteligentes para hacer recomendaciones según los intereses de los usuarios.

3. Economía Circular

- *Foco en jóvenes:* La solución responde directamente al perfil de jóvenes e independientes de la región Coatzacoalcos-Minatitlán que buscan renovar tecnología, libros, ropa y artículos del hogar optimizando su presupuesto.
- *Impacto ambiental y consumo responsable:* Fomenta la economía circular al extender la vida útil de bienes en desuso.

4. Propuesta de Valor Asequible y Ahorro Directo

- *Obtención de bienes sin desembolso monetario directo:* Permite a los usuarios convertir productos en desuso en valor real para adquirir artículos sin gastar dinero en la compra de nuevos productos.
- *Modelo de monetización transparente de bajo impacto:* La publicación de artículos y el uso básico de la plataforma son totalmente gratuitos; la empresa solo percibe ingresos por comisiones de intercambio exitoso, margen en guías de envío o suscripciones opcionales Premium.

#figure(
  table(
    columns: (1fr, 1fr),
    align: (left, left),
    inset: 8pt,
    [*Fortalezas*], [*Oportunidades*],
    [
      1. *Tecnología de Coincidencia Inteligente:* Algoritmo de matcheo que elimina las dificultades del trueque tradicional.
      2. *Seguridad Logística:* Verificación local presencial mediante *código QR* y generación de guías integradas con paqueterías.
      3. *Modelo de Monetización:* Gratuito para publicar; cobro por comisión sobre trueque exitoso, margen logístico y membresías Premium opcionales.
    ],
    [
      1. *Concentración Local:* Enfocada a un público juvenil que opta por optimizar su presupuesto en tecnología, libros y ropa.
      2. *Crecimiento de la Economía Circular:* Consumo sostenible y reutilización de bienes.
      3. *Insatisfacción con Métodos Informales:* Falta de seguridad en grupos informales de redes sociales o Marketplace local.
    ],
    [*Debilidades*], [*Amenazas*],
    [
      1. *Dependencia del Efecto de Red:* Requiere alcanzar rápidamente una masa crítica de usuarios locales para garantizar suficiente oferta de artículos de manera local.
      2. *Etapa Inicial de Reconocimiento:* Al ser una plataforma nueva, exige esfuerzos de difusión para posicionar la marca.
      3. *Costo de Envío Nacional:* Los costos de guía para intercambios fuera de la región pueden desincentivar objetos de bajo valor monetario.
    ],
    [
      1. *Competencia Informal Gratuita:* Existencia de grupos locales en Facebook o WhatsApp donde el trueque no cobra comisiones.
      2. *Desconfianza Inicial al Trueque Digital:* Resistencia o temor de los usuarios a entregar artículos sin recibir dinero en efectivo inmediato.
      3. *Condiciones de Seguridad Urbana:* Riesgos asociados a encuentros presenciales en la vía pública si no se realizan en puntos verificados.
    ],
  ),
  caption: [Análisis FODA del proyecto],
)

#set heading(numbering: none)

=== Justificación de la oportunidad

Existe una oportunidad en el segmento joven e independiente (ej. región Coatzacoalcos-Minatitlán), un público que posee múltiples artículos sin usar y muestra interés en alternativas al consumo tradicional para maximizar su capacidad económica.

SWAP aborda el escenario actual al eliminar la obligatoriedad de la coincidencia recíproca directa gracias a recomendaciones algorítmicas, resolviendo simultáneamente las preocupaciones de seguridad mediante la validación por código QR en puntos locales o el envío por paquetería. Se alinea el impacto ambiental positivo con un esquema financiero viable y transparente: acceso y publicación gratuitos, monetizados a través de comisiones sobre intercambios exitosos, margen en guías logísticas y membresías Premium opcionales.

Este contexto proporciona el marco justificativo para dar paso a la investigación cuantitativa y cualitativa, donde se analizarán con detalle las dinámicas de uso, la cantidad de objetos almacenados, las mayores preocupaciones de seguridad y la disposición a pagar por servicios dentro de la plataforma.

#set heading(numbering: "1.1.")

= Estudio de Mercado

El presente estudio de mercado permite determinar las condiciones reales de viabilidad y aceptación comercial de la plataforma SWAP en la región de Coatzacoalcos-Minatitlán. Se llevó a cabo esta investigación con el propósito de evaluar las prácticas actuales de consumo, acumulación e intercambio de bienes de segunda mano en el segmento juvenil.

== Antecedentes

Con el desarrollo del proyecto SWAP, se pretende transformar los hábitos de consumo tradicional de la comunidad juvenil e independiente. En la actualidad, la rápida adopción de bienes han generado que una gran cantidad de artículos en perfecto estado queden almacenados en desuso. Además, las vías informales de trueque o venta de segunda mano (redes sociales o tianguis) presentan barreras críticas de inseguridad, desconfianza e ineficiencia.

SWAP responde a esta problemática mediante el aprovechamiento de las Tecnologías de la Información y la Comunicación (TIC), integrando algoritmos inteligentes de coincidencia (matchmaking), geolocalización y protocolos de seguridad digital. Al sustituir la coincidencia recíproca directa obligatoria y el intercambio informal por un ecosistema verificado y automatizado, se ofrece a los usuarios la posibilidad de convertir sus bienes en desuso en valor real para adquirir lo que necesitan sin desembolsar dinero en efectivo.

== Investigación de Mercado

Para respaldar el diseño del concepto comercial, se realizó una encuesta a 44 personas de la población objetivo regional. El instrumento constó de 25 reactivos estructurados para evaluar la frecuencia de acumulación de artículos, las principales barreras de seguridad en tratos con desconocidos, la preferencia de modalidades de trueque y la disposición al pago de comisiones y servicios de envío.

Los datos obtenidos revelan hallazgos clave sobre la oferta acumulada y la demanda potencial en la región de Coatzacoalcos-Minatitlán.

=== Datos demográficos

Como se observa en la @grafica-1, el público interesado se concentra en jóvenes universitarios de la región Coatzacoalcos-Minatitlán. Al ser estudiantes con ingresos monetarios limitados o dependientes de presupuestos escolares, la propuesta de adquirir bienes mediante trueque sin desembolso monetario directo resulta atractiva. Los datos se distribuyen de la siguiente manera:

- *Edad:* El 81.8% (36 de 44 encuestados) pertenece al rango de 18 a 24 años, mientras que los rangos de 25 a 34 años y 45 años o más representan un 9.1% cada uno.
- *Ocupación:* El 54.5% únicamente estudia, el 20.5% estudia y trabaja, el 18.2% trabaja y el 6.8% se dedica al hogar.
- *Ubicación:* La mayor concentración se ubica en Coatzacoalcos (47.7%) y Minatitlán (18.2%), seguidos de Cosoleacaque (6.8%) y Nanchital (6.8%).

#figure(
  image("../images/edad_ocupacion.png", width: 6in),
  caption: [Edad por ocupación]
) <grafica-1>

=== Artículos en desuso

La @grafica-2 muestra una importante masa crítica de bienes inactivos en las casas de los usuarios. Más del 60% de la muestra cuenta con al menos 6 objetos listos para intercambiar. La ropa y la tecnología representan más del 72% de los bienes estancados. Enfocar las campañas iniciales en estas dos categorías garantizará coincidencias rápidas (matches) en la aplicación.

#figure(
  image("../images/categorias_articulos.png", width: 6in),
  caption: [Edad por ocupación.]
) <grafica-2>

=== Destino de artículos en desuso

La @grafica-3 indica que la acumulación (40.9%) o regalar (47.7%) son las salidas predominantes debido a que la venta informal en redes sociales genera desconfianza o requiere un esfuerzo de negociación desproporcionado. La app SWAP puede captar ese 88.6% de usuarios que actualmente regalan o guardan sus artículos, ofreciéndoles una vía estructurada para obtener valor real a cambio de sus pertenecias sin los riesgos del comercio informal en redes.

#figure(
  image("../images/canales_utilizados.png", width: 6in),
  caption: [Cantidad y categorías de artículos en desuso.]
) <grafica-3>

=== Percepción para generar confianza

En la @grafica-4 se observa que la identidad validada de los usuarios y el sistema de reputación comunitaria deben ser visibles desde el primer contacto en la plataforma. La combinación de una alta intención de uso (63.6%) con la demanda explícita de perfiles verificados confirma que la propuesta de valor responde directamente a los dolores del consumidor.

#figure(
  image("../images/generar_confianza.png", width: 6in),
  caption: [Elementos para generar confianza.]
) <grafica-4>

=== Preocupación en los encuentros de intercambio

De la @grafica-5 se interpreta que el temor a ser engañado con el estado real del producto es el principal obstáculo del mercado informal de segunda mano. Los datos justifican la integración obligatoria de herramientas de verificación de estado y puntos de encuentro seguros para reducir la fricción en la adopción.

#figure(
  image("../images/preocupaciones.png", width: 6in),
  caption: [Principales preocupaciones en un encuentro físico.]
) <grafica-5>

=== Medios de monetización

En la @grafica-6 se visualiza la  preferencia del monto de tarifa por intercambio exitoso en el rango de \$10 a \$20 MXN se alinea con las expectativas de casi la mitad del mercado, permitiendo monetizar al segmento universitario. La @grafica-7 se ve que existe una alta aceptación por probar la suscripción tras un periodo gratuito (43.2%) sugiere implementar un modelo freemium con prueba de 30 días para maximizar la tasa de conversión a suscripciones de pago. Por último, la @grafica-8 indica que la mayor parte del público acepta el pago por envío bajo un precio razonable.

#figure(
  image("../images/intercambio.png", width: 6in),
  caption: [Preferencia de la tarifa por intercambio.]
) <grafica-6>

#figure(
  image("../images/aceptacion_suscripcion.png", width: 6in),
  caption: [Aceptación de la suscripción a un plan premium.]
) <grafica-7>

#figure(
  image("../images/pago_envio.png", width: 6in),
  caption: [Aceptación del pago de envío.]
) <grafica-8>

== Estrategias de Comercialización

== Pronóstico de Ventas

Al ser SWAP una plataforma tecnológica de economía colaborativa, el forecast proyecta el volumen de transacciones y captación de suscripciones a partir del mercado objetivo de Coatzacoalcos y Minatitlán y de las preferencias identificadas en la encuesta.

De la población objetivo se recuperan los siguientes datos:

- Mercado Potencial (63.6% de interés positivo según encuesta): 35,242 personas interesadas.
- Meta de Captación Año 1 (Estimando captar el 5% del mercado potencial): 1,762 Usuarios Activos Mensuales (MAU).

De esta manera, basado en 1,762 MAU con un promedio de actividad de 1 intercambio al mes (1,762 matches mensuales) se proyectan los siguientes ingresos en el primer año:

- Comisiones por match: \$19,822 MXN mensuales (1,322 matches sujetos a tarifa, con un costo de \$15 MXN por match).
- Suscripciones Premium: \$25,509 MXN mensuales (Considerando una conversión del 29.5% de los MAU a una suscripción de \$49 MXN/mes).
- Intermediación Logística: \$12,414 MXN mensuales (Considerando que el 70.5% de los intercambios utiliza envío, con un margen operativo de \$10 MXN por guía).
- Ingreso Total Proyectado: 57,746MXN mensuales (692,947 MXN anuales).


El flujo de ingresos brutos proyectado de aproximadamente \$57,746 MXN mensuales permitirá financiar gradualmente las actividades de captación de usuarios, publicidad hiperlocal, infraestructura en la nube, consumo de APIs y operación del equipo de desarrollo. La asignación de estos recursos deberá realizarse conforme al presupuesto operativo de SWAP.

Por otro lado, la métrica comercial crítica será incentivar a los 1,762 usuarios activos a publicar al menos 2 a 3 artículos durante su registro. Esto permitiría contar con un catálogo inicial aproximado de 3,524 a 5,286 artículos para facilitar las coincidencias entre usuarios. La plataforma ofrecerá alternativas de entrega en persona, a domicilio y por paquetería, de acuerdo con las preferencias registradas en la encuesta.

#figure(
  table(
    columns: (1fr, 1.3fr, 1fr),
    align: (left, left, center),
    inset: 8pt,
    stroke: 0.5pt + black,

    // Encabezados
    [*Concepto Comercial*], [*Supuesto / Métrica de Conversión*], [*Volumen / Monto Proyectado*],

    // Filas de datos
    [Población Objetivo (18-29 años)], [Jóvenes en Coatzacoalcos y Minatitlán], [55,380 personas],
    [Mercado Potencial], [63.6% con interés positivo en la app (según encuesta)], [35,242 personas],
    [Usuarios Activos (MAU)], [Captación del 5% sobre el mercado potencial], [1,762 usuarios al mes],
    [Volumen de Matches], [Promedio de 1 match mensual por usuario], [1,762 matches al mes],
    [Suscripciones Premium], [Conversión del 29.5% de los MAU a \$49 MXN], [521 suscriptores al mes],
    [Guías de Envío], [70.5% de los matches utilizan logística integrada], [1,241 guías al mes],
    [Ingresos por Comisiones], [Costo de \$15 MXN por match sujeto a tarifa], [\$19,822 MXN / mes],
    [Ingresos por Suscripción], [Membresías activas de \$49 MXN al mes], [\$25,509 MXN / mes],
    [Ingresos por Logística], [Margen de intermediación de \$10 MXN por guía], [\$12,414 MXN / mes],
    [Ingresos Totales Mensuales], [Flujo de ingresos brutos mensuales (suma de líneas)], [\$57,746 MXN / mes],
    [Proyección Anual (Año 1)], [Ingresos brutos estimados a 12 meses de operación], [\$692,947 MXN / año],
  ),
  caption: [Proyección comercial y financiera mensual y anual (Año 1).],
) <tab-proyeccion>


= Estudio Técnico

== Especificaciones del producto (materia prima e insumos)

== Proceso de producción

== Tecnología (equipo e instalaciones)

== Capacidad instalada, inventarios, ubicación y diseño de planta y oficina

== Mano de obra requerida

== Procedimiento de mejora continua

== Costo de producción

= Responsabilidad Social

== Programas de beneficio a la comunidad

== Clasificación de desperdicios y reciclaje

== Bajo consumo de agua, luz y gas

== Cuidado y desarrollo de una cultura ecológica

= Aspectos legales

== Constitución legal

== Trámites laborales (IMSS, INFONAVIT, AFORE, entre otros)

== Régimen Fiscal (SHCP)

== Permisos Delegación o Municipio, Protección Civil, Otros Permisos

= Estudio Financiero

== Estado de resultados del proyecto

== Capital de trabajo

== Balance pro forma

== Tasa Interna de Retorno (TIR) y Valor Presente Neto (VPN)

== Principales razones financieras

== Punto de equilibrio

== Flujo de efectivo

#pagebreak()

#set heading(numbering: none)

= Anexos

+ Organigrama
+ Análisis y descripción de puestos
+ Administración de sueldos y salarios

// Referencias
#pagebreak()

#bibliography("../references.bib", style: "apa")
