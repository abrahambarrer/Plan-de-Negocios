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

  // 5. Configuracion de figuras
  show figure.caption: it => {
    set text(font: "Gill Sans MT", weight: "bold", size: 10pt)
    set par(leading: 12pt - 10pt) // O directamente leading: 12pt si buscas espacio adicional entre líneas
    it
  }

  // 6. Configuración de listas anidadas

  set list(marker: ([•], [◦], [▪]))

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
  autor: "Abraham Giovani Barrera Torres - S23017343\nErick Yamil Rodríguez Castellanos - S23017379\n Josué Eliel Rosaldo Santiago - S23017357\n René Emiliano Sánchez Saucedo - S23017381",
  afiliacion: "Facultad de Contaduría y Administración, Universidad Veracruzana",
  curso: "Desarrollo de Empresas Tecnológicas",
  instructor: [Mtro.~Arturo Estudillo Quilantan],
  fecha: "22 de noviembre de 2026",
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

Conectar a personas y comunidades mediante soluciones tecnológicas innovadoras que faciliten el intercambio justo, seguro y sostenible de bienes en desuso, promoviendo la reducción del desperdicio y redefiniendo el valor de los objetos a través de la economía circular. 

=== Visión

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

Con el desarrollo del proyecto SWAP, se pretende transformar los hábitos de consumo tradicional de la comunidad juvenil e independiente. En la actualidad, la rápida adopción de bienes ha generado que una gran cantidad de artículos en perfecto estado queden almacenados en desuso. Además, las vías informales de trueque o venta de segunda mano (redes sociales o tianguis) presentan barreras críticas de inseguridad, desconfianza e ineficiencia.

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
  caption: [Cantidad y categorías de artículos en desuso.]
) <grafica-2>

=== Destino de artículos en desuso

La @grafica-3 indica que la acumulación (40.9%) o regalar (47.7%) son las salidas predominantes debido a que la venta informal en redes sociales genera desconfianza o requiere un esfuerzo de negociación desproporcionado. La app SWAP puede captar ese 88.6% de usuarios que actualmente regalan o guardan sus artículos, ofreciéndoles una vía estructurada para obtener valor real a cambio de sus pertenencias sin los riesgos del comercio informal en redes.

#figure(
  image("../images/canales_utilizados.png", width: 6in),
  caption: [Canales utilizados para el intercambio.]
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

Basado en los resultados obtenidos en la encuesta de validación, se plantean las siguientes estrategias de comercialización óptimas para garantizar la penetración de mercado y la rentabilidad de la plataforma.

1. *Posicionamiento de Marca: \"Seguridad como Eje Central\"*

- *Justificación:* El 63.5% de los usuarios tiene como principal preocupación ser estafado o recibir artículos diferentes a lo prometido.

- *Estrategia:* Convertir la seguridad en la principal ventaja competitiva de marketing. Toda la publicidad inicial debe destacar el \"Perfil Verificado\" (el factor que da mayor confianza al 65.4% según la encuesta) y el sistema de entrega segura mediante validación presencial por código QR.
Mensaje clave: \"El trueque seguro. Sin sorpresas, sin estafas y con perfiles 100% verificados.\"

2. *Campaña de Adquisición Bivalente (Motivaciones de Uso)*

- *Justificación:* Las motivaciones para usar la app están perfectamente divididas en la región: Ahorrar dinero (34.6%) y Liberar espacio en casa (34.6%).
- *Estrategia:* Ejecutar campañas publicitarias dirigidas al segmento joven de Coatzacoalcos-Minatitlán (especialmente universitarios e independientes) abordando directamente ambos dolores.

  - *Mensaje A (Ahorro):* \"Renueva tu tecnología y tu clóset sin gastar un peso. Intercambia lo que ya no usas.\"

  - *Mensaje B (Espacio):* \"Dale un respiro a tu cuarto. Convierte las cosas que te estorban en las cosas que necesitas.\"

3. *Estrategia de Precios: Micro-pagos y Prueba Premium (Sampling)*

- *Justificación:* El 36.5% considera justa una tarifa de intercambio de entre \$11 a \$20. Además, el 44.2% pagaría una suscripción premium, pero solo después de probarla gratis.

- *Estrategia:* Fijar la comisión por trueque exitoso en un micro-pago accesible de \$15.00 MXN para no generar fricción. Lanzar la plataforma ofreciendo el \"Primer Mes de SWAP Premium Gratis\". Que los nuevos usuarios experimenten de inmediato los beneficios de envíos más baratos (aprovechando que el 78.8% pagaría el envío si es justo) y el sello de verificación, incrementando así la tasa de retención mensual posterior.

4. *Distribución: Canales de Acceso y Logística*

- *Distribución Digital:* Lanzamiento en las principales tiendas de aplicaciones (Google Play y Apple App Store) con optimización para términos como \"trueque\", \"ahorro\" y \"segunda mano\".

- *Distribución Logística:* Integración API de servicios de envío dentro de la app para cubrir la distribución de los artículos a nivel regional y nacional de manera automatizada.

5. *Promoción: Comunicación y Ofertas*

- *Publicidad Digital:* Campañas pagadas en plataformas como TikTok e Instagram geolocalizadas en la región, mostrando casos de éxito visuales y dinámicos (ej. \"Cambié mi consola por esta bici\").

En la @competidores se muestran los principales competidores del proyecto en conjunto con su giro y propuesta, ventajas o puntos mejorables y su recibimiento.

#show figure.where(kind: table): set block(breakable: true)

#figure(
    table(
      columns: (1.2fr, 2fr, 2.5fr, 2fr),
      inset: 8pt,
      align: horizon,
      table.header(
        [*Competidor*],
        [*Giro y Propuesta*],
        [*Principales Desventajas o Puntos Mejorables*],
        [*Impacto y Recibimiento*],
      ),
      [*Cambalache*],
      [
        *Categoría:* Utilidades. App orientada a reinventar el trueque, facilitando el intercambio de bienes (ropa, libros) y servicios (habilidades profesionales) entre personas de una comunidad.
      ],
      [
        - Exclusiva para iOS (iOS 15.0 o posterior).
        - Alto consumo de batería por uso de ubicación en segundo plano.
        - No registrada como comerciante en el Espacio Económico Europeo.
        - Sin prestaciones de accesibilidad indicadas.
      ],
      [
        - Sin calificaciones ni reseñas suficientes en la App Store para mostrar un promedio.
        - Ha introducido _Cambalache Premium_ y filtros internacionales (Bogotá, CDMX, Barcelona y Mendoza).
      ],

      [*Trueque Loco*],
      [
        *Categoría:* Redes Sociales. Plataforma de comunidad para trocar, vender o comprar artículos y servicios sin intermediarios ni fronteras.
      ],
      [
        - Inestabilidades de usabilidad (fallos recurrentes en filtros, búsquedas, imágenes y notificaciones).
        - Proveedor no registrado como comerciante para el Espacio Económico Europeo.
        - Sin especificaciones de accesibilidad.
      ],
      [
        - Sin volumen suficiente de reseñas en la App Store para calificación pública.
        - Incentiva interacción con \"Truequinder\" (matchmaking), match parcial y ferias/ventas de garaje.
      ],

      [*Grupos Informales* \ (Facebook Marketplace / WhatsApp)],
      [
        *Canal informal de intercambio y comercio de segunda mano:* Espacios en redes sociales utilizados de manera directa entre usuarios locales sin intermediación tecnológica especializada ni cobro de comisiones.
      ],
      [
        - Ausencia de filtros de seguridad y falta de verificación de identidad.
        - Vulnerabilidad ante fraudes, estafas o entrega de artículos distintos a lo prometido.
        - Alta tasa de cancelaciones de última hora y tratos inconclusos.
        - Inseguridad logística y temor a encuentros con desconocidos en la vía pública.
      ],
      [
        - Constituyen el canal de mayor uso actual en la región para transacciones de segunda mano.
        - Generan insatisfacción recurrente debido a la falta de información en publicaciones y desconfianza en los tratos.
      ],
    ),
    caption: [Principales competidores de SWAP],
  ) <competidores>

== Pronóstico de Ventas

Al ser SWAP una plataforma tecnológica de economía colaborativa, el forecast proyecta el volumen de transacciones y captación de suscripciones a partir del mercado objetivo de Coatzacoalcos y Minatitlán y de las preferencias identificadas en la encuesta. De la población objetivo se recuperan los siguientes datos:

- *Mercado Potencial (63.6% de interés positivo según encuesta):* 35,242 personas interesadas.
- *Meta de Captación Año 1 (Estimando captar el 5% del mercado potencial):* 1,762 Usuarios Activos Mensuales (MAU).

De esta manera, basado en 1,762 MAU con un promedio de actividad de 1 intercambio al mes (1,762 matches mensuales) se proyectan los siguientes ingresos en el primer año:

- *Comisiones por match:* \$19,822 MXN mensuales (1,322 matches sujetos a tarifa, con un costo de \$15 MXN por match).
- *Suscripciones Premium:* \$25,509 MXN mensuales (Considerando una conversión del 29.5% de los MAU a una suscripción de \$49 MXN/mes).
- *Intermediación Logística:* \$12,414 MXN mensuales (Considerando que el 70.5% de los intercambios utiliza envío, con un margen operativo de \$10 MXN por guía).
- *Ingreso Total Proyectado:* \$57,746 MXN mensuales (\$692,952 MXN anuales).


El flujo de ingresos brutos proyectado de aproximadamente \$57,746 MXN mensuales permitirá financiar gradualmente las actividades de captación de usuarios, publicidad hiperlocal, infraestructura en la nube, consumo de APIs y operación del equipo de desarrollo. La asignación de estos recursos deberá realizarse conforme al presupuesto operativo de SWAP.

Por otro lado, la métrica comercial crítica será incentivar a los 1,762 usuarios activos a publicar al menos 2 a 3 artículos durante su registro. Esto permitiría contar con un catálogo inicial aproximado de 3,524 a 5,286 artículos para facilitar las coincidencias entre usuarios. La plataforma ofrecerá alternativas de entrega en persona, a domicilio y por paquetería, de acuerdo con las preferencias registradas en la encuesta. En la @tab-proyeccion se muestran los conceptos comerciales en detalle.

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

El producto ofrecido por SWAP consiste en una suite digital multiplataforma orientada al trueque inteligente P2P (Peer-to-Peer). Para asegurar la robustez, mantenibilidad y escalabilidad del sistema, se han seleccionado insumos tecnológicos y lenguajes de programación de vanguardia que atienden tanto el frontend móvil como la arquitectura del backend en la nube.

=== Componentes de Software y Arquitectura del Producto

La arquitectura del sistema SWAP se desglosa en los siguientes módulos integrados:

- *SWAP App Móvil (Android / iOS):* Cliente móvil nativo o híbrido de alto rendimiento que proporciona la interfaz de usuario para la publicación de artículos, exploración geolocalizada de bienes, chat de negociación en tiempo real y gestión de perfiles.
- *Algoritmo Matchmaking Engine:* Motor lógico residente en el servidor encargado de procesar algoritmos de recomendación e intercambio multilateral, eliminando la necesidad de coincidencia recíproca obligatoria.
- *Módulo de Verificación Bilateral QR:* Sistema de autenticación en tiempo real para encuentros físicos presenciales, el cual valida la entrega mediante el escaneo cruzado de códigos QR dinámicos.
- *Módulo de Intermediación Logística:* Integración vía API con empresas de paquetería para la generación automática de guías de envío y rastreo de paquetes en trueques regionales o nacionales.
- *Sistema de Reputación y Perfiles Verificados:* Módulo de seguridad comunitaria que almacena valoraciones, historial de transacciones e insignias de verificación basadas en la autenticación de identidad.

=== Materia Prima 

En la industria del software, la materia prima está representada por las herramientas de desarrollo, librerías, entornos de ejecución y servicios de infraestructura que alimentan el proceso de construcción. La @stack resume la especificación técnica de los insumos seleccionados:

#figure(
  table(
    columns: (1.2fr, 1.5fr, 2.3fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
    table.header(
      [*Categoría Tecnológica*],
      [*Tecnología / Herramienta Seleccionada*],
      [*Función en el Proyecto SWAP*],
    ),
    [Lenguaje Frontend Móvil],
    [TypeScript (Framework React Native)],
    [Desarrollo de la aplicación móvil multiplataforma para Android y iOS.],

    [Lenguaje Backend],
    [Python],
    [Construcción de APIs RESTful y servicios del motor de matchmaking.],

    [Gestión de Base de Datos],
    [PostgreSQL con extensión PostGIS / Firebase],
    [Almacenamiento relacional de datos, perfiles, transacciones y datos geoespaciales.],

    [Servicios de Geolocalización],
    [Google Maps API],
    [Asignación de ubicación de artículos y cálculo de distancias de entrega local.],

    [Generación y Validación QR],
    [Librería qrcode],
    [Generación de códigos QR encriptados con token temporal para entregas presenciales.],

    [Control de Versiones y CI/CD],
    [GitHub / GitHub Actions],
    [Repositorio centralizado de código fuente y automatización de pruebas y despliegue.],

    [Infraestructura Nube (Cloud)],
    [Amazon Web Services (AWS) / Google Cloud],
    [Hospedaje de servicios API, bases de datos gestionadas, almacenamiento S3 y balanceadores.],
  ),
  caption: [Especificación técnica de insumos y stack tecnológico de SWAP],
) <stack>

== Proceso de producción

El proceso de producción en SWAP corresponde al ciclo de vida del desarrollo de software. A diferencia de las metodologías secuenciales o rígidas (como RUP), el proyecto adopta una metodología ágil basada en el marco Scrum, estructurada en iteraciones cortas denominadas Sprints de dos semanas de duración. Esta modalidad permite responder rápidamente a los hallazgos de uso del mercado juvenil de la región Coatzacoalcos-Minatitlán y garantiza entregas continuas de valor funcional.

=== Fases del Ciclo de Producción Ágil
El desarrollo de cada incremento funcional de software sigue una secuencia estructurada dentro del marco Scrum:

+ *Gestión del Product Backlog (Planificación de Requerimientos):* El equipo analiza los requerimientos funcionales y no funcionales derivados de la visión de negocio y retroalimentación de usuarios. Las funcionalidades se traducen en Historias de Usuario (User Stories) priorizadas por valor comercial y complejidad técnica.
+ *Sprint Planning (Planificación de la Iteración):* Al inicio de cada Sprint de 14 días, los 4 ingenieros definen el objetivo del Sprint (Sprint Goal) y seleccionan el conjunto de Historias de Usuario que se desarrollarán, asignando tareas específicas a cada integrante.
+ *Ejecución del Sprint y Standups Diarios:* Desarrollo activo del código fuente. Se realizan reuniones diarias de sincronización (Daily meeting) de 15 minutos para monitorear avances, identificar bloqueos técnicos y ajustar la carga de trabajo.
+ *Integración Continua y Pruebas (CI/QA):* Cada componente programado se integra al repositorio central en GitHub. Se ejecutan pruebas unitarias y de integración automáticas para validar la lógica del matchmaking, el encriptado de códigos QR y el correcto cálculo de comisiones.
+ *Sprint Review y Despliegue de Incrementos:* Presentación del prototipo ejecutable al final del Sprint. Tras la aprobación interna de calidad, el incremento se despliega en el entorno de pruebas (Staging) o producción (Release en Google Play y App Store).
+ *Retrospectiva del Sprint:* Evaluación interna del proceso de trabajo para identificar áreas de mejora operacional, optimización de código y ajustes en la estimación de esfuerzos.

En la @proceso se muestra un diagrama de flujo del proceso de Scrum.

#[
  #set page(flipped: true)
  #align(center + horizon)[
    #figure(
      image("../images/proceso.jpeg", width: 120%),
      caption: [Marco de trabajo ágil Scrum.]
    ) <proceso>
  ]
]
=== Flujo Principal de Operación del Negocio

Más allá de la programación del sistema, el proceso productivo de SWAP se materializa en el flujo mediante el cual la aplicación genera valor para los usuarios y captura ingresos para la empresa. Como se muestra en la @flujo-procesos, el ciclo operativo del negocio se ejecuta en cuatro momentos clave:

- *Activación de oferta y demanda (Publicación y Match):* El usuario alimenta el inventario digital al publicar sus artículos en desuso y explora el catálogo hasta lograr una coincidencia (match) gracias al algoritmo de recomendación. Este paso es gratuito para eliminar barreras de entrada y fomentar el efecto de red.   
- *Conversión y monetización directa (Acuerdo y Comisión):* Una vez que ambas partes confirman el interés en el intercambio, el sistema formaliza el trato mediante el cobro de la tarifa por servicio (\$15.00 MXN por intercambio exitoso), activando el primer flujo de ingresos del modelo de negocio.   
  - *Ejecución logística:* El flujo se divide según la modalidad elegida para concretar el trueque:   Modalidad Local (Presencial): Se habilita la coordinación de un punto seguro y la validación física mediante el escaneo cruzado de códigos QR, garantizando la seguridad de la entrega sin costos adicionales de transporte.   
  - *Modalidad Regional o Nacional:* El sistema genera automáticamente una guía de paquetería con rastreo integrado, activando la segunda fuente de ingresos del negocio a través del margen de intermediación logística (\$10.00 MXN por guía).   
- *Cierre de ciclo y retención (Confirmación y Reputación):* Tras verificar la recepción del artículo, los usuarios califican la transacción. Esto alimenta el sistema de reputación y confianza comunitaria, incentivando la recurrencia de uso dentro de la plataforma.

#figure(
  image("../images/diagrama_flujo_procesos.jpeg", width: 2in),
  caption: [Flujo de intercambio.]
) <flujo-procesos>

== Tecnología (equipo e instalaciones)

La selección de equipo de cómputo e infraestructura de trabajo se calibró para brindar a los 4 desarrolladores el entorno óptimo de alto rendimiento necesario para compilar aplicaciones móviles, simular entornos multiservicio en contenedores y ejecutar bases de datos locales sin cuellos de botella.

=== Equipo de Cómputo Óptimo de Desarrollo

Para el desarrollo del proyecto SWAP, cada uno de los 4 integrantes del equipo contará con una estación de trabajo móvil/escritorio de alta gama. Las especificaciones mínimas requeridas se detallan a continuación:

- *Estaciones de Trabajo de Desarrollo (4 unidades):*
  - Procesador: Apple M2/M3 Pro o Intel Core i5/i7 de 13ª generación (mínimo 8 núcleos).
  - Memoria RAM: 16 GB DDR5 o Memoria Unificada (indispensable para la ejecución simultánea de emuladores de Android Studio, Xcode y Docker).
  - Almacenamiento: SSD NVMe M.2 de 1TB (velocidad de lectura/escritura superior a 3500 MB/s).
  - Pantalla secundaria: Monitor de 27 pulgadas 4K IPS con soporte ergonómico para trabajo multipantalla.
  - Periféricos: Teclado, ratón de precisión y diadema para reuniones virtuales.
- *Dispositivos de Prueba Físicos (2 unidades):*
  - Un smartphone Android gama media-alta (ej. Samsung Galaxy S series o Google Pixel) para validación de cámara/código QR y geolocalización.
  - Un smartphone iOS (iPhone 13 o posterior) para pruebas de despliegue en la App Store y compatibilidad visual.
- *Infraestructura de Red y Servidor Local:*
  - Router Empresarial Wi-Fi 6 de triple banda con soporte para redes VLAN.
  - Switch Administrable Gigabit de 8 puertos.
  - Unidad de Respaldo de Energía (UPS) de 1500 VA / 900 W para mantener encendidos los equipos y la red ante cortes de energía eléctrica.

=== Instalaciones Climáticas y ambientales

Debido a que el desarrollo del proyecto SWAP se realiza en la región geográfica de Coatzacoalcos-Minatitlán, caracterizada por un clima cálido-húmedo con temperaturas promedio superiores a los 30°C y elevada humedad relativa, las instalaciones de oficina requieren condiciones ambientales estrictamente controladas:

- *Climatización:* Se especifica la instalación de un sistema de aire acondicionado tipo MiniSplit de 24,000 BTU Inverter, manteniendo una temperatura de 21°C a 23°C para prevenir el sobrecalentamiento del equipo y garantizar el bienestar del personal.
- *Iluminación:* Luz blanca neutra distribuida de manera uniforme sobre el área de trabajo para evitar la fatiga visual durante prolongadas jornadas de programación.

== Capacidad instalada, inventarios, ubicación y diseño de planta y oficina

=== Capacidad Instalada y Proyección de Usuarios

En una empresa de software como SWAP, la capacidad instalada no se mide en unidades físicas fabricadas por maquinaria, sino en la  capacidad del equipo de desarrollo para liberar incrementos de software  y en la  capacidad de la infraestructura cloud para procesar transacciones concurrentes.

- *Capacidad de Desarrollo:*  Basado en la metodología ágil con 4 ingenieros dedicados, la capacidad de producción estimada es de  26 Sprints al año , lo que representa la liberación de 12 a 15 actualizaciones mayores de la aplicación y el mantenimiento continuo del motor de coincidencia.
- *Capacidad de Infraestructura Digital:*  La arquitectura en la nube de SWAP está dimensionada y calibrada estrictamente para responder a la meta operativa del Año 1 proyectada en el estudio de mercado: una base de  1,762 Usuarios Activos Mensuales (MAU)  (calculada al captar el 5% del mercado potencial de 35,242 jóvenes interesados en Coatzacoalcos y Minatitlán). La plataforma está optimizada para procesar un volumen promedio de  1,762 matches o intercambios mensuales  (21,144 intercambios anuales) y  1,241 guías logísticas automatizadas al mes  (14,892 guías al año), manteniendo una disponibilidad del servicio ( uptime ) del 99.9%.

=== Inventarios

SWAP no mantiene inventarios físicos de bienes de consumo, ya que los artículos intercambiados pertenecen a los usuarios y no ingresan a los almacenes de la empresa. La gestión de inventario en SWAP es  100% digital:
- *Inventario Digital de Artículos:*  Base de datos estructurada con el catálogo activo de objetos publicados por los usuarios. Conforme a las métricas comerciales del proyecto, se establece como meta crítica incentivar a los 1,762 usuarios activos a publicar entre 2 y 3 artículos durante su registro, consolidando un catálogo activo inicial estimado de  3,524 a 5,286 artículos o bienes en inventario digital  para facilitar las coincidencias del algoritmo.
- *Inventario de Licencias y Dominios:*  Resguardo de claves criptográficas, certificados SSL/TLS, tokens de acceso a APIs de paquetería y registros de marca ante el IMPI e INDAUTOR.

=== Ubicación de la Oficina

La ubicación física del centro de desarrollo de SWAP se define de manera estratégica dentro del núcleo urbano de la región Coatzacoalcos-Minatitlán, garantizando acceso a servicios de fibra óptica de alta velocidad y cercanía con el segmento objetivo universitario.

- *Dirección / Ubicación:* Av. Universidad km 7.5, Col. Santa Isabel, C.P. 96538, Coatzacoalcos, Veracruz. 

=== Diseño de Planta y Distribución de la Oficina

La oficina de desarrollo de SWAP está diseñada bajo un concepto de espacio colaborativo ágil sobre una superficie de *45 m² (6.5 m x 7.0 m)*, optimizada para la interacción del equipo. La @oficina muestra los detalles de la oficina de trabajo.

#figure(
  table(
    columns: (1.5fr, 0.9fr, 2.8fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
    table.header(
      [*Área Funcional*],
      [*Dimensión Aproximada*],
      [*Equipamiento e Instalaciones*],
    ),
    [*Área de Desarrollo Ágil*],
    [24 m#super[2]],
    [Ensamble central de 4 escritorios ergonómicos enfrentados, canaletas ocultas para cableado estructurado y sillas ejecutivas de malla.],

    [*Área de Daily Standup y Planificación*],
    [12 m#super[2]],
    [Pizarrón de cristal templado para diagramación y tablero Kanban, complementado con pantalla Smart TV de 45" para revisiones de código.],

    [*SITE y Comunicaciones*],
    [3 m#super[2]],
    [Módem de fibra óptica simétrica, router Wi-Fi 6, switch de 8 puertos y UPS de 1500 VA.],

    [*Servicios e Hidratación*],
    [6 m#super[2]],
    [Sanitarios privados y estación de cafetería/agua para el personal.],
  ),
  caption: [Distribución de planta y equipamiento de la oficina de desarrollo SWAP],
) <oficina>

En la @croquis y @vista-3D se muestra el croquis y una vista simulada de la oficina respectivamente.

#figure(
  image("../images/croquis.png", width: 5in),
  caption: [Croquis de la oficina.]
) <croquis>

#figure(
  image("../images/oficina.png", width: 5in),
  caption: [Visualización de la oficina.]
) <vista-3D>

== Mano de obra requerida

El recurso humano de SWAP está conformado integralmente por el equipo de 4 ingenieros de software. Al tratarse de una célula de desarrollo ágil reducida, se adopta un esquema de roles polivalentes, donde cada integrante asume responsabilidades clave acordes a sus fortalezas técnicas, garantizando la cobertura total del ciclo de vida del software.

=== Matriz de Roles y Asignación de Funciones

La distribución de responsabilidades entre los 4 integrantes del equipo se estructura formalmente como se presenta en la @roles:

#figure(
  table(
    columns: (1.2fr, 1.1fr, 3.2fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
    table.header(
      [*Integrante del Equipo*],
      [*Rol Principal en Scrum*],
      [*Responsabilidades Técnicas y Operativas*],
    ),
    [*Abraham Giovani Barrera Torres*],
    [Lead Developer & Backend Architect],
    [Diseño de la arquitectura de backend en Node.js/Python, desarrollo del motor algorítmico de matchmaking, gestión de bases de datos PostgreSQL y optimización de consultas.],

    [*Josué Eliel Rosaldo Santiago*],
    [Frontend & Mobile Developer],
    [Desarrollo de la aplicación móvil en React Native/Flutter, implementación de la interfaz de usuario (UI/UX), integración del lector de código QR y animaciones.],

    [*Erick Yamil Rodríguez Castellanos*],
    [DevOps & Security Engineer],
    [Configuración de infraestructura en la nube (AWS), automatización de pipelines CI/CD, gestión de seguridad de datos (LFPDPPP), cifrado de comunicaciones y pruebas de penetración.],

    [*René Emiliano Sánchez Saucedo*],
    [Product Owner & QA Lead],
    [Gestión del Product Backlog, especificación de historias de usuario, coordinación con paqueterías/APIs externas, diseño de pruebas funcionales y aseguramiento de la calidad.],
  ),
  caption: [Matriz de roles y asignación de funciones del equipo SWAP],
) <roles>

== Procedimiento de mejora continua

Para garantizar que la plataforma SWAP cumpla con elevados estándares de confiabilidad, rendimiento y seguridad digital, el proyecto adopta el marco de calidad normativo mexicano para la industria del software, haciendo referencia a la norma NMX-I-059-NYCE (MoProSoft) y estándares de la serie NMX-I-055 (Modelo de Calidad de Software).

=== Puntos de Control y Pruebas de Calidad

El plan de calidad establece puntos de verificación obligatorios en cada fase del desarrollo:
+ *Revisión de Código (Code Review):* Ningún código se integra a la rama principal de producción sin la revisión cruzada y aprobación de al menos dos desarrolladores del equipo.
+ *Pruebas Automáticas Unitarias y de Integración:* Verificación automática de funciones críticas, como el cálculo exacto de la tarifa de \$15 MXN por intercambio, el descuento del 20% en guías para usuarios Premium y la expiración de tokens QR.
+ *Pruebas de Carga y Estrés:* Simulación de accesos concurrentes para asegurar que la plataforma mantenga tiempos de respuesta inferiores a 2.0 segundos ante picos de tráfico regional.
+ *Auditoría de Seguridad y Privacidad:* Verificación del cumplimiento del Aviso de Privacidad y encriptación de datos sensibles bajo la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP).

=== Mejora Continua

La mejora continua en SWAP se formaliza mediante la aplicación del ciclo Planear-Hacer-Verificar-Actuar (PHVA):

+ *Planear:* Análisis de métricas operacionales (tasa de error en la app, tiempo de respuesta en coincidencia de trueques) y retroalimentación de las encuestas de usuarios.
+ *Hacer:* Implementación de parches de optimización y nuevas funcionalidades en los Sprints ágiles.
+ *Verificar:* Evaluación cuatrimestral del desempeño del servicio mediante indicadores clave de rendimiento (KPIs), comparando la disponibilidad real contra el objetivo del 99.9%.
+ *Actuar:* Refactorización de componentes lógicos que presenten cuellos de botella y actualización periódica del plan de seguridad informática.

== Costo de producción

A continuación se detalla la inversión requerida para habilitar la infraestructura técnica, el equipamiento, las herramientas de desarrollo y los costos operativos del proyecto SWAP.

=== Inversión en Activo Fijo

Los gastos en activo fijo se muestran en la @activos.

#figure(
  table(
    columns: (0.7fr, 2.8fr, 1.2fr, 1.2fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 0 { center + horizon } else if x >= 2 { right + horizon } else { left + horizon },
    table.header(
      [*Cantidad*],
      [*Concepto / Descripción*],
      [*Precio Unitario (MXN)*],
      [*Costo Total (MXN)*],
    ),
    [4],
    [Estación de trabajo de desarrollo (Laptop Asus Tuf A16 Ryzen 7 16 GB RAM)],
    [\$25,000.00],
    [\$100,000.00],

    [4],
    [Monitor profesional 27" 4K IPS],
    [\$3,500.00],
    [\$14,000.00],

    [2],
    [Dispositivos de prueba móvil (1 Android gama alta / 1 iPhone)],
    [\$15,000.00],
    [\$30,000.00],

    [1],
    [Kit de Red Empresarial (Router Wi-Fi 6, Switch 8p, Rack)],
    [\$12,000.00],
    [\$12,000.00],

    [1],
    [No-Break / UPS Empresarial 1500 VA],
    [\$6,000.00],
    [\$6,000.00],

    [*Total*],
    [*Activo Fijo Tecnológico*],
    [],
    [*\$162,000.00*],
  ),
  caption: [Inversión en activo fijo tecnológico del proyecto SWAP],
) <activos>

=== Inversión en Mobiliario y Equipo de Oficina

En la @mobiliario se muestran los gastos en mobiliario y equipo de la oficina.

#figure(
  table(
    columns: (0.7fr, 2.8fr, 1.2fr, 1.2fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 0 { center + horizon } else if x >= 2 { right + horizon } else { left + horizon },
    table.header(
      [*Cantidad*],
      [*Concepto / Descripción*],
      [*Precio Unitario (MXN)*],
      [*Costo Total (MXN)*],
    ),
    [4],
    [Escritorio ejecutivo ergonómico],
    [\$3,500.00],
    [\$14,000.00],

    [4],
    [Silla ergonómica de malla de alta densidad (tipo gerencial)],
    [\$1,500.00],
    [\$6,000.00],

    [1],
    [Pintarrón de cristal templado 2.0 m x 1.2 m],
    [\$2,000.00],
    [\$2,000.00],

    [1],
    [Pantalla Smart TV 45" para revisiones de código],
    [\$7,000.00],
    [\$7,000.00],

    [1],
    [Minisplit 24,000 BTU Inverter (Aire Acondicionado)],
    [\$14,000.00],
    [\$14,000.00],

    [1],
    [Juego de estantes y archivero de seguridad],
    [\$4,000.00],
    [\$4,000.00],

    [*Total*],
    [*Mobiliario y Equipamiento de Oficina*],
    [],
    [*\$47,000.00*],
  ),
  caption: [Inversión en mobiliario y equipamiento de oficina del proyecto SWAP],
) <mobiliario>

=== Insumos Tecnológicos y Gastos Operativos Mensuales

En la @insumos-tecnologicos se proyectan los gastos en insumos tecnológicos. Para la estimación final se contemplan los gastos a 1 año.

#figure(
  table(
    columns: (1.5fr, 2.8fr, 1.2fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 2 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto / Servicio*],
      [*Descripción del Servicio*],
      [*Costo Mensual (MXN)*],
    ),
    [Infraestructura Nube (AWS / GCP)],
    [Servidores de aplicaciones, base de datos gestionada PostgreSQL y almacenamiento S3],
    [\$4,500.00],

    [Licencias de Desarrollo y Herramientas],
    [IDEs (VS Code), Docker Pro, GitHub Enterprise, Figma],
    [\$2,200.00],

    [Consumo de APIs Externas],
    [Google Maps Platform, servicios de envío de SMS/OTP],
    [\$1,800.00],

    [Cuentas de Desarrollador],
    [Cuota prorrateada de Google Play Console],
    [\$300.00],

    [Servicios Públicos e Internet],
    [Fibra óptica simétrica empresarial 300 Mbps y energía eléctrica comercial],
    [\$3,200.00],

    [Renta de Oficina (45 m#super[2])],
    [Arrendamiento de espacio comercial en Coatzacoalcos-Minatitlán],
    [\$8,000.00],

    [*Total*],
    [*Costo Operativo Mensual de Desarrollo*],
    [*\$20,000.00*],
  ),
  caption: [Insumos tecnológicos y gastos operativos mensuales del proyecto SWAP],
) <insumos-tecnologicos>

=== Resumen de Costos de Producción

El costo total de la etapa de desarrollo y puesta en marcha del proyecto SWAP combina la inversión inicial en infraestructura con el costo operativo de mano de obra durante el primer año:

- *Inversión Inicial en Activos (Fijo + Mobiliario):* \$209,000.00 MXN.
- *Costo Operativo Anual de Insumos y Servicios:* \$240,000.00MXN (20,000.00 MXN mensuales).
- *Costos de Imprevistos:* \$22,450.00 MXN.
- *Costo Total de Producción (Año 1):* \$471,450.00 MXN, monto que se amortiza y cubre holgadamente con la proyección de flujo de caja bruto anual estimado de \$692,947.00 MXN generado por las comisiones de trueque, membresías Premium y márgenes logísticos de la plataforma.

La @resumen-costos muestra el resumen de costos de producción.

#figure(
  table(
    columns: (2.2fr, 1.5fr),
    inset: 8pt,
    align: (x, y) => if x == 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Costo en pesos*],
    ),
    [Inversión en activos fijos],
    [\$162,000.00 MXN],

    [Inversión en mobiliario],
    [\$47,000.00 MXN],

    [Insumos tecnológicos (costo anual)],
    [\$240,000.00 MXN],

    [Imprevistos (5%)],
    [\$22,450.00 MXN],

    [*Total*],
    [*\$471,450.00 MXN*],
  ),
  caption: [Resumen de costos de producción (Año 1) de SWAP],
) <resumen-costos>

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

#[
  #set page(flipped: true)

  #set heading(numbering: none)

  = Anexos

  == Organigrama
  Con el propósito de garantizar una operación integral que respalde tanto el desarrollo continuo de la plataforma como su viabilidad comercial y administrativa, SWAP adopta una estructura organizacional funcional encabezada por los 9 socios fundadores. Los 4 integrantes del área técnica operan de tiempo completo en la oficina central de desarrollo, mientras que los 5 socios encargados de las funciones administrativas, financieras y comerciales desempeñan sus labores bajo un esquema remoto y de gestión estratégica.

  Como se muestra en la @organigrama, la empresa distribuye sus responsabilidades estratégicas y operativas en tres grandes direcciones: el Área de Administración y Finanzas, el Área de Tecnología y Producto y el Área de Marketing y Comercialización.
  #align(center + horizon)[
    #figure(
      image("../images/organigrama.png", width: 100%),
      caption: [Estructura organizacional de SWAP.]
    ) <organigrama>
  ]
]

#pagebreak()
+ Análisis y descripción de puestos
+ Administración de sueldos y salarios

// Referencias
#pagebreak()

#bibliography("../references.bib", style: "apa")
