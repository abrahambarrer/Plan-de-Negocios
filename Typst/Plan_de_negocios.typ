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

Swap es una aplicación móvil diseñada para revolucionar el trueque tradicional, convirtiéndolo en un proceso ágil, seguro y accesible. La plataforma elimina la barrera principal del intercambio directo (la necesidad de coincidencia perfecta entre dos personas) integrando un sistema de trueque directo (P2P).

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
  caption: [Destino de los artículos de segunda mano.]
) <grafica-3>

=== Percepción para generar confianza

En la @grafica-4 se observa que la identidad validada de los usuarios y el sistema de reputación comunitaria deben ser visibles desde el primer contacto en la plataforma. La combinación de interés (63.6%) y alto interés (29.5%) con la demanda explícita de perfiles verificados confirma que la propuesta de valor responde directamente a los dolores del consumidor.

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

En la @grafica-6 se visualiza la  preferencia del monto de tarifa por intercambio exitoso en el rango de \$11 a \$20 MXN se alinea con las expectativas de casi la mitad del mercado, permitiendo monetizar al segmento universitario. La @grafica-7 se ve que existe una alta aceptación por probar la suscripción tras un periodo gratuito (43.2%) sugiere implementar un modelo freemium con prueba de 30 días para maximizar la tasa de conversión a suscripciones de pago. Por último, la @grafica-8 indica que la mayor parte del público acepta el pago por envío bajo un precio razonable.

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

- *Justificación:* El 72.7% de los usuarios tiene como principal preocupación ser estafado o recibir artículos diferentes a lo prometido.

- *Estrategia:* Convertir la seguridad en la principal ventaja competitiva de marketing. Toda la publicidad inicial debe destacar el \"Perfil Verificado\" (el factor que da mayor confianza al 40.9% según la encuesta) y el sistema de entrega segura mediante validación presencial por código QR.
Mensaje clave: \"El trueque seguro. Sin sorpresas, sin estafas y con perfiles 100% verificados.\"

2. *Campaña de Adquisición Bivalente (Motivaciones de Uso)*

- *Justificación:* Las motivaciones para usar la app están perfectamente divididas en la región: Ahorrar dinero (27.3%) y Liberar espacio en casa (29.5%).
- *Estrategia:* Ejecutar campañas publicitarias dirigidas al segmento joven de Coatzacoalcos-Minatitlán (especialmente universitarios e independientes) abordando directamente ambos dolores.

  - *Mensaje A (Ahorro):* \"Renueva tu tecnología y tu clóset sin gastar un peso. Intercambia lo que ya no usas.\"

  - *Mensaje B (Espacio):* \"Dale un respiro a tu cuarto. Convierte las cosas que te estorban en las cosas que necesitas.\"

3. *Estrategia de Precios: Micro-pagos y Prueba Premium (Sampling)*

- *Justificación:* El 29.5% considera justa una tarifa de intercambio de entre \$11 a \$20. Además, el 43.2% pagaría una suscripción premium, pero solo después de probarla gratis.

- *Estrategia:* Fijar la comisión por trueque exitoso en un micro-pago accesible de \$15.00 MXN para no generar fricción. Lanzar la plataforma ofreciendo el \"Primer Mes de SWAP Premium Gratis\". Que los nuevos usuarios experimenten de inmediato los beneficios de envíos más baratos (aprovechando que el 70.5% pagaría el envío si es justo) y el sello de verificación, incrementando así la tasa de retención mensual posterior.

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
    [Proyección Anual (Año 1)], [Ingresos brutos estimados a 12 meses de operación], [\$692,952 MXN / año],
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
      image("../images/proceso.png", width: 110%),
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
  image("../images/diagrama_flujo_procesos.png", width: 2in),
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
- *Costo Total de Producción (Año 1):* \$471,450.00 MXN, monto que se amortiza y cubre holgadamente con la proyección de flujo de caja bruto anual estimado de \$692,952.00 MXN generado por las comisiones de trueque, membresías Premium y márgenes logísticos de la plataforma.

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

#set heading(numbering: none)

Con una inversión inicial de \$270,000 MXN, SWAP genera una utilidad neta de \$264,041 en el primer año, un VPN de \$981,228 y una TIR de 121.5 % a cinco años, y alcanza su punto de equilibrio con 686 usuarios activos mensuales, el 39 % de la meta de 1,762. Este capítulo integra los costos de inversión y operación del Estudio Técnico y los ingresos pronosticados en el Estudio de Mercado, siguiendo la estructura indicada por #cite(<alcaraz2011emprendedor>, form: "prose"). Todas las cifras están en pesos mexicanos (MXN).

== Fundamentos de la proyección financiera

Antes de presentar los estados financieros, se definen los objetivos del área financiera, el sistema contable que los respalda y los supuestos con los que se construyeron las proyecciones.

=== Objetivos del área financiera

El área de Administración y Finanzas de SWAP persigue un objetivo general: llevar ordenadamente las cuentas de la empresa, conocer su situación financiera y buscar opciones que reduzcan costos y gastos para aumentar el rendimiento. Este objetivo se concreta en metas por plazo:

- *Corto plazo (6 meses):* operar con flujo de efectivo positivo desde el primer mes y acumular utilidades retenidas por \$132,021 al cierre del mes 6.
- *Mediano plazo (12 meses):* alcanzar una utilidad neta anual de \$264,041, un saldo en caja y bancos de \$362,262 y la recuperación de la inversión inicial.
- *Largo plazo (5 años):* elaborar y actualizar las proyecciones financieras, reponer el equipo de cómputo y llegar a ingresos anuales superiores a \$1,000,000.

Estas metas se evalúan con los indicadores de las secciones de TIR y VPN, razones financieras y punto de equilibrio, y se revisan al cierre de cada trimestre.

=== Sistema contable

La contabilidad estará a cargo de los tres socios del Área de Administración y Finanzas: Estefany Gómez García (coordinación financiera y tesorería), José Oswaldo Martínez Velásquez (control de costos y presupuesto) y Verónica Fernández Martín (contabilidad fiscal y cumplimiento). Al ser socios, no generan un costo adicional de nómina ni de capacitación.

El registro se llevará en hoja de cálculo, con un catálogo de cuentas adaptado al de una empresa de servicios: Caja (100), Bancos (101), Cuentas por cobrar (102), Equipo de oficina (113), Depreciación acumulada (113-1), Impuestos por pagar (202), Capital social (300), Utilidades retenidas (301), Ingresos por servicios (400 y 401) y las cuentas de gastos de la serie 500. Los comprobantes fiscales de cada operación se conservarán como respaldo de los asientos de diario.

=== Supuestos de la proyección

Los supuestos de la @tab-supuestos se tomaron del Estudio de Mercado (@tab-proyeccion) y del Estudio Técnico (@activos, @mobiliario, @insumos-tecnologicos y @resumen-costos); los que no provienen de esos estudios se señalan como supuestos propios del análisis financiero.

#figure(
  table(
    columns: (1.2fr, 2.5fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Supuesto utilizado*],
    ),
    [Horizonte], [12 meses detallados (año 1) y proyección anual de los años 2 a 5],
    [Ingresos del año 1], [\$57,746 mensuales y \$692,952 anuales, con 1,762 usuarios activos mensuales (@tab-proyeccion)],
    [Naturaleza de los ingresos], [Se consideran netos de IVA y de las comisiones de pasarelas de pago y tiendas de aplicaciones],
    [Crecimiento de ingresos], [10 % anual del año 2 al 5],
    [Cobranza], [Comisiones y guías de envío de contado; suscripciones Premium cobradas a 30 días por las tiendas de aplicaciones],
    [Costos operativos], [\$20,000 mensuales (@insumos-tecnologicos), con incremento de 5 % anual desde el año 2],
    [Imprevistos], [5 %: \$22,450 en el año 1 (@resumen-costos) y 5 % de los costos operativos desde el año 2],
    [Depreciación], [Línea recta: 30 % anual en equipo de cómputo y 10 % anual en mobiliario; reposición del equipo de cómputo por \$162,000 al final del año 4],
    [Sueldos], [Los 9 socios fundadores no perciben sueldo en el horizonte; su retribución proviene de las utilidades],
    [Capital social], [\$270,000 en efectivo: nueve socios con \$30,000 cada uno; sin créditos],
    [Impuestos], [ISR de 30 % sobre la utilidad antes de impuestos, pagado en el mes siguiente; sin PTU, pues los socios no son trabajadores],
    [Dividendos], [No se reparten durante el horizonte; las utilidades se retienen],
    [Inventarios], [No existen inventarios físicos (sección 3.4.2)],
    [Tasa de descuento (TREMA)], [15 % anual],
  ),
  caption: [Supuestos utilizados en las proyecciones financieras de SWAP],
) <tab-supuestos>

El supuesto de mayor peso es que los socios no cobran sueldo y que los ingresos del año 1 se alcanzan desde el primer mes; ambos hacen que los resultados presentados en las secciones siguientes sean favorables, por lo que en el análisis de rentabilidad se incluye una evaluación de sensibilidad con ingresos menores.

#set heading(numbering: "1.1.")

== Estado de resultados del proyecto

SWAP genera una utilidad neta de \$22,003 al mes y de \$264,041 en el primer año, equivalente a un margen neto de 38.1 %. Como empresa de servicios, SWAP no registra costo de ventas ni inventarios, por lo que su estado de resultados sigue el formato de una empresa prestadora de servicios: ingresos, gastos, utilidad antes de impuestos e ISR.

Para elaborarlo, primero se clasifican los costos y gastos del Estudio Técnico en variables y fijos. La @tab-clasificacion-costos muestra esa clasificación; los costos variables son los que crecen con el número de usuarios (nube y consumo de APIs), mientras que el resto no cambia con el volumen de intercambios.

#figure(
  table(
    columns: (1.1fr, 2.2fr, 1.1fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 2 { right + horizon } else { left + horizon },
    table.header(
      [*Clasificación*],
      [*Concepto*],
      [*Monto mensual*],
    ),
    [Costo variable], [Infraestructura en la nube (AWS / GCP)], [\$4,500.00],
    [Costo variable], [Consumo de APIs externas], [\$1,800.00],
    [*Subtotal costos variables*], [(\$3.58 por usuario activo)], [*\$6,300.00*],
    [Costo fijo], [Renta de oficina], [\$8,000.00],
    [Costo fijo], [Servicios públicos e internet], [\$3,200.00],
    [Costo fijo], [Licencias de desarrollo y herramientas], [\$2,200.00],
    [Costo fijo], [Cuentas de desarrollador], [\$300.00],
    [*Subtotal costos fijos*], [], [*\$13,700.00*],
    [Gasto fijo], [Imprevistos (5 %)], [\$1,870.83],
    [Gasto fijo], [Depreciación de activos], [\$4,441.67],
    [*Subtotal gastos fijos*], [], [*\$6,312.50*],
    [*Total de costos y gastos*], [Sin gastos variables], [*\$26,312.50*],
  ),
  caption: [Clasificación de costos y gastos mensuales de SWAP (año 1)],
) <tab-clasificacion-costos>

Los costos operativos de \$20,000 mensuales provienen de la @insumos-tecnologicos; los imprevistos (\$22,450 anuales) de la @resumen-costos, y la depreciación se calcula sobre los activos de las @activos y @mobiliario: \$4,050 mensuales del equipo de cómputo y \$391.67 del mobiliario.

Con esa clasificación se obtiene el estado de resultados de la @tab-estado-resultados-1. Los ingresos se integran por comisiones (\$19,822 mensuales), suscripciones Premium (\$25,509) y margen logístico (\$12,414), conforme a la @tab-proyeccion.

#figure(
  table(
    columns: (2.3fr, 1.1fr, 1.1fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Mensual*],
      [*Año 1*],
    ),
    [*Ingresos por servicios*], [*\$57,746.00*], [*\$692,952.00*],
    [(–) Renta de oficina], [\$8,000.00], [\$96,000.00],
    [(–) Servicios públicos e internet], [\$3,200.00], [\$38,400.00],
    [(–) Nube, APIs, licencias y cuentas de desarrollador], [\$8,800.00], [\$105,600.00],
    [(–) Imprevistos], [\$1,870.83], [\$22,450.00],
    [(–) Depreciación], [\$4,441.67], [\$53,300.00],
    [\= Total de gastos], [\$26,312.50], [\$315,750.00],
    [\= Utilidad antes de financieros e impuestos], [\$31,433.50], [\$377,202.00],
    [(+/–) Costo integral de financiamiento], [\$0.00], [\$0.00],
    [Utilidad antes de ISR], [\$31,433.50], [\$377,202.00],
    [(–) ISR (30 %)], [\$9,430.05], [\$113,160.60],
    [*\= Utilidad neta*], [*\$22,003.45*], [*\$264,041.40*],
  ),
  caption: [Estado de resultados de SWAP, mensual y del año 1],
) <tab-estado-resultados-1>

_Nota:_ la suma de los tres renglones de ingreso es \$57,745; la @tab-proyeccion reporta \$57,746 por redondeo, y se conserva ese total.

El costo integral de financiamiento es cero porque SWAP no contrata créditos ni mantiene inversiones que generen intereses. Al no haber costo de ventas, la utilidad de operación equivale al 54.4 % de los ingresos, y el ISR absorbe 30 % de esa utilidad.

Para los años 2 a 5 se aplican los supuestos de crecimiento de la @tab-supuestos, con resultados que se resumen en la @tab-estado-resultados-5.

#figure(
  table(
    columns: (1.8fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Año 1*],
      [*Año 2*],
      [*Año 3*],
      [*Año 4*],
      [*Año 5*],
    ),
    [Ingresos], [\$692,952], [\$762,247], [\$838,472], [\$922,319], [\$1,014,551],
    [(–) Costos operativos], [\$240,000], [\$252,000], [\$264,600], [\$277,830], [\$291,722],
    [(–) Imprevistos], [\$22,450], [\$12,600], [\$13,230], [\$13,892], [\$14,586],
    [(–) Depreciación], [\$53,300], [\$53,300], [\$53,300], [\$20,900], [\$53,300],
    [\= Utilidad antes de ISR], [\$377,202], [\$444,347], [\$507,342], [\$609,698], [\$654,943],
    [(–) ISR (30 %)], [\$113,161], [\$133,304], [\$152,203], [\$182,909], [\$196,483],
    [*\= Utilidad neta*], [*\$264,041*], [*\$311,043*], [*\$355,139*], [*\$426,788*], [*\$458,460*],
    [Margen neto], [38.1 %], [40.8 %], [42.4 %], [46.3 %], [45.2 %],
  ),
  caption: [Estado de resultados proyectado de SWAP, años 1 a 5],
) <tab-estado-resultados-5>

La utilidad neta crece de \$264,041 a \$458,460 porque los ingresos aumentan 10 % anual y los costos solo 5 %. El margen del año 4 es el más alto porque el equipo de cómputo termina de depreciarse ese año, y baja en el año 5 al reiniciar la depreciación con el equipo repuesto.

== Capital de trabajo

SWAP requiere \$270,000 para iniciar operaciones: \$209,000 en activos y \$61,000 de capital de trabajo, que se financian por completo con aportaciones de los socios, sin créditos. El capital de trabajo es el dinero con que cuenta la empresa para operar después de cubrir sus deudas a corto plazo, y se calcula como activo circulante menos pasivo circulante.

=== Inversión inicial y capital social

La inversión inicial se compone de los activos del Estudio Técnico y de un fondo de efectivo para los primeros meses. La @tab-inversion-inicial muestra su destino.

#figure(
  table(
    columns: (2.3fr, 1.1fr, 1fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Monto*],
      [*% del total*],
    ),
    [Activo fijo tecnológico (@activos)], [\$162,000], [60.0 %],
    [Mobiliario y equipo de oficina (@mobiliario)], [\$47,000], [17.4 %],
    [Capital de trabajo inicial (efectivo)], [\$61,000], [22.6 %],
    [*Inversión inicial total*], [*\$270,000*], [*100.0 %*],
  ),
  caption: [Inversión inicial del proyecto SWAP],
) <tab-inversion-inicial>

El capital de trabajo inicial cubre cerca de 2.8 meses de egresos operativos (\$21,870.83 mensuales entre costos e imprevistos). Esa reserva es una medida de prudencia, porque el saldo de caja es positivo desde el primer mes.

El capital social de \$270,000 lo aportan en efectivo los nueve socios fundadores, a razón de \$30,000 cada uno, como se muestra en la @tab-capital-social.

#figure(
  table(
    columns: (1.8fr, 0.7fr, 1.1fr, 1.1fr, 1fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 1 { center + horizon } else if x >= 2 { right + horizon } else { left + horizon },
    table.header(
      [*Área de los socios*],
      [*Socios*],
      [*Aportación por socio*],
      [*Total aportado*],
      [*% de participación*],
    ),
    [Tecnología y Producto], [4], [\$30,000], [\$120,000], [44.4 %],
    [Administración y Finanzas], [3], [\$30,000], [\$90,000], [33.3 %],
    [Marketing y Comercialización], [2], [\$30,000], [\$60,000], [22.2 %],
    [*Total*], [*9*], [], [*\$270,000*], [*100.0 %*],
  ),
  caption: [Capital social de SWAP],
) <tab-capital-social>

Con aportaciones iguales, cada socio posee 11.1 % de la empresa, de modo que ningún área tiene control individual sobre las decisiones.

=== Sistema de financiamiento

Se analizaron las fuentes que sugiere el capítulo de finanzas: socios particulares, préstamos bancarios, aportaciones personales, sociedades de inversión y créditos de proveedores. SWAP opta por las aportaciones de los socios porque el proyecto genera flujo de efectivo positivo desde el primer mes y un préstamo solo sumaría intereses sin ser necesario. Además, evita comprometer pagos fijos antes de validar el número real de usuarios.

=== Cálculo del capital de trabajo

La @tab-capital-trabajo calcula el capital de trabajo en tres momentos del primer año, con los saldos de la @tab-balance.

#figure(
  table(
    columns: (2.2fr, 1fr, 1fr, 1fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Mes 1*],
      [*Mes 6*],
      [*Mes 12*],
    ),
    [Caja y bancos], [\$71,366], [\$203,592], [\$362,262],
    [Cuentas por cobrar], [\$25,509], [\$25,509], [\$25,509],
    [*Activo circulante*], [*\$96,875*], [*\$229,101*], [*\$387,771*],
    [(–) Impuestos por pagar (pasivo circulante)], [\$9,430], [\$9,430], [\$9,430],
    [*Capital de trabajo*], [*\$87,445*], [*\$219,671*], [*\$378,341*],
  ),
  caption: [Capital de trabajo de SWAP en el año 1],
) <tab-capital-trabajo>

El capital de trabajo crece de \$87,445 a \$378,341 porque la empresa no tiene deudas con terceros y retiene sus utilidades. El único pasivo a corto plazo es el ISR del último mes, que se paga el mes siguiente, de modo que SWAP puede cubrir sus obligaciones sin depender de nuevos aportes.

== Balance pro forma

Al cierre del año 1, SWAP tiene activos por \$543,471, un solo pasivo de \$9,430 y un capital contable de \$534,041, de modo que 98.3 % de sus activos es propiedad de los socios. El balance general muestra, a una fecha determinada, lo que la empresa tiene (activos), lo que debe (pasivos) y lo que pertenece a los socios (capital), bajo la ecuación activo = pasivo + capital.

La @tab-balance presenta el balance en los meses 1, 6 y 12 del primer año y al cierre de los años 2 a 5.

#[
  #set text(size: 10pt)
  #figure(
    table(
      columns: (1.9fr, 0.85fr, 0.9fr, 0.95fr, 0.9fr, 0.95fr, 0.95fr, 0.95fr),
      inset: 5pt,
      align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
      table.header(
        [*Concepto*],
        [*Mes 1*],
        [*Mes 6*],
        [*Mes 12 (año 1)*],
        [*Año 2*],
        [*Año 3*],
        [*Año 4*],
        [*Año 5*],
      ),
      [*ACTIVO*], [], [], [], [], [], [], [],
      [Caja y bancos], [\$71,366], [\$203,592], [\$362,262], [\$725,733], [\$1,132,941], [\$1,418,102], [\$1,927,598],
      [Cuentas por cobrar], [\$25,509], [\$25,509], [\$25,509], [\$28,060], [\$30,866], [\$33,952], [\$37,348],
      [*Total activo circulante*], [*\$96,875*], [*\$229,101*], [*\$387,771*], [*\$753,793*], [*\$1,163,807*], [*\$1,452,054*], [*\$1,964,946*],
      [Equipo de cómputo (neto)], [\$157,950], [\$137,700], [\$113,400], [\$64,800], [\$16,200], [\$162,000], [\$113,400],
      [Mobiliario y equipo de oficina (neto)], [\$46,608], [\$44,650], [\$42,300], [\$37,600], [\$32,900], [\$28,200], [\$23,500],
      [*Total activo fijo*], [*\$204,558*], [*\$182,350*], [*\$155,700*], [*\$102,400*], [*\$49,100*], [*\$190,200*], [*\$136,900*],
      [*TOTAL ACTIVOS*], [*\$301,434*], [*\$411,451*], [*\$543,471*], [*\$856,193*], [*\$1,212,907*], [*\$1,642,255*], [*\$2,101,846*],
      [*PASIVO*], [], [], [], [], [], [], [],
      [Impuestos por pagar], [\$9,430], [\$9,430], [\$9,430], [\$11,109], [\$12,684], [\$15,242], [\$16,374],
      [*Total pasivos*], [*\$9,430*], [*\$9,430*], [*\$9,430*], [*\$11,109*], [*\$12,684*], [*\$15,242*], [*\$16,374*],
      [*CAPITAL CONTABLE*], [], [], [], [], [], [], [],
      [Capital social], [\$270,000], [\$270,000], [\$270,000], [\$270,000], [\$270,000], [\$270,000], [\$270,000],
      [Utilidades retenidas], [\$22,003], [\$132,021], [\$264,041], [\$575,084], [\$930,224], [\$1,357,012], [\$1,815,473],
      [*Total capital contable*], [*\$292,003*], [*\$402,021*], [*\$534,041*], [*\$845,084*], [*\$1,200,224*], [*\$1,627,012*], [*\$2,085,473*],
      [*TOTAL PASIVO Y CAPITAL*], [*\$301,434*], [*\$411,451*], [*\$543,471*], [*\$856,193*], [*\$1,212,907*], [*\$1,642,255*], [*\$2,101,846*],
    ),
    caption: [Balance general proyectado de SWAP],
  ) <tab-balance>
]

Los activos fijos se presentan netos de depreciación acumulada. En el año 4 el equipo de cómputo aparece por su costo de reposición (\$162,000), pues el anterior quedó totalmente depreciado.

En todas las columnas el total de activos es igual al total de pasivo y capital, lo que confirma que el balance cuadra (diferencias de \$1 por redondeo). El activo crece sobre todo por la caja, que pasa de \$362,262 a \$1,927,598 en cinco años porque no se reparten dividendos; si los socios decidieran distribuir utilidades, esa caja se reduciría en la misma cantidad y el capital contable disminuiría de igual modo. La depreciación reduce el activo fijo cada año hasta la reposición del equipo en el año 4.

== Tasa Interna de Retorno (TIR) y Valor Presente Neto (VPN)

A cinco años y con una tasa de descuento de 15 %, SWAP tiene un VPN de \$981,228 y una TIR de 121.5 %, por lo que el proyecto es aceptable desde el punto de vista financiero. El VPN compara el valor presente de los flujos futuros con la inversión inicial: si es positivo, el proyecto se acepta. La TIR es la tasa que hace cero ese VPN, y el proyecto conviene cuando supera la tasa mínima aceptable (TREMA) de 15 %.

Los flujos netos de efectivo se toman de la proyección de la @tab-flujo-anual: utilidad neta más depreciación, ajustada por cuentas por cobrar e impuestos por pagar, menos la reposición del equipo en el año 4, más la recuperación del fondo de capital de trabajo de \$61,000 en el año 5. La @tab-vpn-tir muestra el cálculo.

#figure(
  table(
    columns: (2fr, 0.95fr, 0.95fr, 0.95fr, 0.95fr, 0.95fr, 0.95fr),
    inset: 6pt,
    align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Año 0*],
      [*Año 1*],
      [*Año 2*],
      [*Año 3*],
      [*Año 4*],
      [*Año 5*],
    ),
    [Inversión inicial], [(\$270,000)], [], [], [], [], [],
    [Flujo de operación], [], [\$301,262], [\$363,471], [\$407,208], [\$447,161], [\$509,496],
    [Reposición de equipo de cómputo], [], [], [], [], [(\$162,000)], [],
    [Recuperación de capital de trabajo], [], [], [], [], [], [\$61,000],
    [*Flujo neto de efectivo*], [*(\$270,000)*], [*\$301,262*], [*\$363,471*], [*\$407,208*], [*\$285,161*], [*\$570,496*],
    [Factor de descuento (15 %)], [1.0000], [0.8696], [0.7561], [0.6575], [0.5718], [0.4972],
    [Valor presente], [(\$270,000)], [\$261,967], [\$274,836], [\$267,746], [\$163,042], [\$283,637],
    [Flujo acumulado (sin descontar)], [(\$270,000)], [\$31,262], [\$394,733], [\$801,941], [\$1,087,102], [\$1,657,598],
  ),
  caption: [Flujos netos de efectivo, VPN y TIR del proyecto SWAP],
) <tab-vpn-tir>

La suma de los valores presentes de los años 1 a 5 es \$1,251,228; al restar la inversión inicial de \$270,000 se obtiene un VPN de \$981,228. El flujo acumulado se vuelve positivo dentro del primer año, y la inversión se recupera en el mes 11 de operación según el flujo de efectivo mensual (@tab-flujo-mensual).

Como la TIR es muy alta, se prueba qué pasa si los ingresos resultan menores a los pronosticados. La @tab-sensibilidad recalcula el proyecto con ingresos 20 % y 40 % por debajo del plan, manteniendo los mismos costos.

#figure(
  table(
    columns: (1.3fr, 1.2fr, 1.1fr, 0.9fr, 1.4fr),
    inset: 8pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 0 { left + horizon } else if x == 4 { center + horizon } else { right + horizon },
    table.header(
      [*Escenario*],
      [*Utilidad neta año 1*],
      [*VPN (15 %)*],
      [*TIR*],
      [*Recuperación de la inversión*],
    ),
    [Base (@tab-proyeccion)], [\$264,041], [\$981,228], [121.5 %], [11 meses],
    [Ingresos –20 %], [\$167,028], [\$596,437], [83.4 %], [15 meses],
    [Ingresos –40 %], [\$70,015], [\$211,645], [41.8 %], [25 meses],
  ),
  caption: [Análisis de sensibilidad del VPN y la TIR a los ingresos],
) <tab-sensibilidad>

En los tres escenarios el VPN es positivo y la TIR supera la TREMA de 15 %, por lo que la decisión de aceptar el proyecto no cambia aun con ingresos 40 % menores. Estos resultados dependen de que los socios no cobren sueldo; si se les pagara, el VPN bajaría en proporción al monto de la nómina.

== Principales razones financieras

Al cierre del año 1, SWAP cubre 41 veces sus deudas de corto plazo, financia 98 % de sus activos con capital propio y obtiene 38.1 centavos de utilidad neta por cada peso de ingresos. Las razones financieras se calculan con los estados proyectados y permiten juzgar la liquidez, el endeudamiento y la rentabilidad de la empresa.

La @tab-razones las presenta con los saldos del mes 12 (@tab-balance) y las ventas y utilidades anuales (@tab-estado-resultados-5).

#figure(
  table(
    columns: (1.5fr, 1.9fr, 1.3fr, 0.9fr),
    inset: 7pt,
    align: (x, y) => if y == 0 { center + horizon } else if x == 3 { right + horizon } else { left + horizon },
    table.header(
      [*Razón*],
      [*Fórmula*],
      [*Cálculo*],
      [*Resultado*],
    ),
    [*Liquidez*], [], [], [],
    [Prueba de liquidez], [Activo circulante / Pasivo circulante], [387,771 / 9,430], [41.12],
    [Prueba del ácido], [(Activo circulante – Inventario) / Pasivo circulante], [(387,771 – 0) / 9,430], [41.12],
    [Capital de trabajo], [Activo circulante – Pasivo circulante], [387,771 – 9,430], [\$378,341],
    [*Endeudamiento*], [], [], [],
    [Pasivos / Activos], [Pasivo total / Activo total], [9,430 / 543,471], [0.02],
    [Capital / Activos], [Capital contable / Activo total], [534,041 / 543,471], [0.98],
    [*Eficiencia*], [], [], [],
    [Rotación de activo total], [Ventas netas / Activo total], [692,952 / 543,471], [1.28],
    [*Rentabilidad*], [], [], [],
    [Rentabilidad sobre ventas], [(Utilidad neta / Ventas netas) × 100], [264,041 / 692,952], [38.1 %],
    [Utilidad de operación sobre ventas], [(Utilidad de operación / Ventas) × 100], [377,202 / 692,952], [54.4 %],
    [Rentabilidad sobre activo total], [(Utilidad neta / Activo) × 100], [264,041 / 543,471], [48.6 %],
    [Rentabilidad sobre capital], [(Utilidad neta / Capital) × 100], [264,041 / 534,041], [49.4 %],
  ),
  caption: [Principales razones financieras de SWAP al cierre del año 1],
) <tab-razones>

Las pruebas de liquidez y del ácido dan el mismo resultado porque SWAP no tiene inventarios; su único pasivo a corto plazo es el ISR del último mes, y la caja lo cubre con amplio margen. La razón de endeudamiento (0.02) indica que los acreedores no tienen casi derechos sobre los activos, que pertenecen a los socios en 98 %.

La rotación de activo total de 1.28 significa que los ingresos anuales superan en 28 % el valor de los activos. Los rendimientos sobre ventas (38.1 %), activo (48.6 %) y capital (49.4 %) son altos para el primer año, en parte porque los socios no cobran sueldo. Como la liquidez es mayor a la necesaria, los socios podrían destinar parte de la caja a marketing, a nuevas funciones de la aplicación o al reparto de utilidades.

== Punto de equilibrio

SWAP cubre todos sus costos y gastos con 686 usuarios activos mensuales y \$22,463 de ingresos al mes, es decir, con 38.9 % de la meta del primer año. El punto de equilibrio es el nivel de ingresos en el que la utilidad es cero; se calcula con los costos fijos ($"CF"$), los costos variables ($"CV"$) y los ingresos ($V$) de la @tab-clasificacion-costos:

$ "PE" = "CF" / (1 - "CV" / V) = (20,012.50) / (1 - (6,300) / (57,746)) = \$22,463 "mensuales" $

Los costos fijos de \$20,012.50 mensuales suman los costos fijos (\$13,700), los imprevistos (\$1,870.83) y la depreciación (\$4,441.67). La @tab-punto-equilibrio traduce el resultado a usuarios.

#figure(
  table(
    columns: (2.2fr, 1.5fr),
    inset: 8pt,
    align: (x, y) => if x == 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Valor*],
    ),
    [Costos y gastos fijos mensuales], [\$20,012.50],
    [Costo variable por usuario activo], [\$3.58],
    [Ingreso promedio por usuario activo], [\$32.77],
    [Margen de contribución por usuario], [\$29.20 (89.1 %)],
    [*Punto de equilibrio en usuarios activos mensuales*], [*686 usuarios*],
    [*Punto de equilibrio en ingresos*], [*\$22,463 mensuales / \$269,558 anuales*],
    [Meta de usuarios del año 1], [1,762 usuarios],
    [Punto de equilibrio como % de la meta], [38.9 %],
    [Margen de seguridad], [61.1 %],
  ),
  caption: [Punto de equilibrio de SWAP (año 1)],
) <tab-punto-equilibrio>

El margen de seguridad de 61.1 % indica que los ingresos podrían caer esa proporción antes de generar pérdidas. Si se toman todos los costos como fijos, el criterio más conservador, el equilibrio sube a \$26,313 mensuales (803 usuarios, 45.6 % de los ingresos planeados) y el margen de seguridad sigue siendo mayor a 54 %. La condición para lograrlo es el efecto de red descrito en el FODA: sin una masa crítica de usuarios locales, la oferta de artículos no alcanza para generar los intercambios que producen los ingresos.

== Flujo de efectivo

SWAP termina el año 1 con \$362,262 en caja y bancos y no tiene ningún mes con saldo negativo. El flujo de efectivo muestra cuánto dinero entra y sale de la empresa en cada periodo; a diferencia del estado de resultados, registra las fechas reales de cobro y pago, por lo que incluye la compra de activos y el cobro a 30 días de las suscripciones.

En el mes 1 entran \$270,000 de capital social y \$32,237 de ingresos cobrados de contado (comisiones y guías de envío); salen \$209,000 por activos y \$21,871 por costos operativos e imprevistos. Desde el mes 2 se suman los cobros de suscripciones del mes anterior y el pago del ISR. La @tab-flujo-mensual detalla los 12 meses.

#[
  #set text(size: 10pt)
  #figure(
    table(
      columns: (0.65fr, 0.9fr, 0.9fr, 0.95fr, 0.95fr, 0.85fr, 0.95fr, 0.9fr),
      inset: 5pt,
      align: (x, y) => if y == 0 { center + horizon } else if x == 0 { center + horizon } else { right + horizon },
      table.header(
        [*Mes*],
        [*Saldo inicial*],
        [*Capital social*],
        [*Cobros de ingresos*],
        [*Costos y gastos pagados*],
        [*ISR pagado*],
        [*Compra de activos*],
        [*Saldo final*],
      ),
      [1], [\$0], [\$270,000], [\$32,237], [\$21,871], [\$0], [\$209,000], [\$71,366],
      [2], [\$71,366], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$97,811],
      [3], [\$97,811], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$124,256],
      [4], [\$124,256], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$150,702],
      [5], [\$150,702], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$177,147],
      [6], [\$177,147], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$203,592],
      [7], [\$203,592], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$230,037],
      [8], [\$230,037], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$256,482],
      [9], [\$256,482], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$282,927],
      [10], [\$282,927], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$309,372],
      [11], [\$309,372], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$335,817],
      [12], [\$335,817], [\$0], [\$57,746], [\$21,871], [\$9,430], [\$0], [\$362,262],
      [*Total año 1*], [*\$0*], [*\$270,000*], [*\$667,443*], [*\$262,450*], [*\$103,731*], [*\$209,000*], [*\$362,262*],
    ),
    caption: [Flujo de efectivo mensual de SWAP, año 1],
  ) <tab-flujo-mensual>
]

Los cobros del mes 1 no incluyen suscripciones, que se cobran un mes después. Los \$25,509 de suscripciones del mes 12 quedan como cuentas por cobrar, y el ISR del mes 12 (\$9,430) se paga en el mes 13.

El saldo más bajo del año es \$71,366, al cierre del mes 1, después de comprar todos los activos; desde ahí la caja aumenta \$26,445 cada mes. Esto confirma que el fondo de \$61,000 de capital de trabajo no se llega a usar.

La @tab-flujo-anual extiende el flujo a cinco años con el formato anual del capítulo de finanzas.

#figure(
  table(
    columns: (2fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    align: (x, y) => if y == 0 { center + horizon } else if x >= 1 { right + horizon } else { left + horizon },
    table.header(
      [*Concepto*],
      [*Año 1*],
      [*Año 2*],
      [*Año 3*],
      [*Año 4*],
      [*Año 5*],
    ),
    [Saldo inicial de caja], [\$0], [\$362,262], [\$725,733], [\$1,132,941], [\$1,418,102],
    [(+) Cobros de ingresos], [\$667,443], [\$759,696], [\$835,666], [\$919,233], [\$1,011,156],
    [(–) Costos y gastos pagados], [\$262,450], [\$264,600], [\$277,830], [\$291,722], [\$306,308],
    [(–) ISR pagado], [\$103,731], [\$131,626], [\$150,628], [\$180,350], [\$195,352],
    [*= Flujo de efectivo de operación*], [*\$301,262*], [*\$363,471*], [*\$407,208*], [*\$447,161*], [*\$509,496*],
    [(+) Aportación de capital], [\$270,000], [\$0], [\$0], [\$0], [\$0],
    [(–) Adquisición de activos], [\$209,000], [\$0], [\$0], [\$162,000], [\$0],
    [*= Saldo final de caja*], [*\$362,262*], [*\$725,733*], [*\$1,132,941*], [*\$1,418,102*], [*\$1,927,598*],
  ),
  caption: [Flujo de efectivo proyectado de SWAP, años 1 a 5],
) <tab-flujo-anual>

El flujo de operación crece cada año y cubre sin dificultad la reposición del equipo de cómputo en el año 4. Por ser SWAP una empresa sin deuda, el flujo no incluye pagos de capital ni de intereses; la única decisión pendiente es el destino de la caja acumulada, que supera \$1.9 millones en el año 5 si no se distribuyen dividendos.
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

#set heading(numbering: none)

== Administración de sueldos y salarios

== Instrumento de investigación de mercado

A continuación se presenta el instrumento de investigación de mercado aplicado a la muestra de 44 personas de la población objetivo en la región Coatzacoalcos-Minatitlán para validar la viabilidad comercial de SWAP.

#let opciones(lista) = {
  set enum(numbering: "A.", spacing: 0.45em, indent: 1.2em)
  for op in lista [
    + #op
  ]
}

#let escala_likert(instruccion, filas) = {
  let azul-oscuro = rgb("#0f3d5e")
  let azul-claro = rgb("#eaf4f6")
  let borde = 0.6pt + rgb("#b8ccd4")

  block(above: 0.8em, below: 1em, inset: (left: 1.2em))[
    #text(style: "italic", size: 11pt)[#instruccion]
    #v(0.3em)
    #table(
      columns: (3.2fr, 0.45fr, 0.45fr, 0.45fr, 0.45fr, 0.45fr),
      inset: 6pt,
      stroke: borde,
      align: (x, y) => if x == 0 { left + horizon } else { center + horizon },
      fill: (x, y) => if y == 0 { azul-oscuro } else if calc.odd(y) { azul-claro } else { white },
      table.header(
        [#text(fill: white, weight: "bold")[Afirmación]],
        [#text(fill: white, weight: "bold")[1]],
        [#text(fill: white, weight: "bold")[2]],
        [#text(fill: white, weight: "bold")[3]],
        [#text(fill: white, weight: "bold")[4]],
        [#text(fill: white, weight: "bold")[5]],
      ),
      ..filas.map(f => ([#f], [$square.stroked$], [$square.stroked$], [$square.stroked$], [$square.stroked$], [$square.stroked$])).flatten()
    )
  ]
}

#set enum(numbering: "1.", spacing: 1.1em)

+ *Edad*
  #opciones((
    "18 a 24 años",
    "25 a 34 años",
    "35 a 44 años",
    "45 años o más",
  ))

+ *Ocupación principal*
  #opciones((
    "Estudio",
    "Trabajo",
    "Estudio y trabajo",
    "Hogar",
    "Otros",
  ))

+ *Municipio donde vives*
  #opciones((
    "Coatzacoalcos",
    "Minatitlán",
    "Cosoleacaque",
    "Nanchital",
    "Otros",
  ))

+ *¿Qué sueles hacer con los artículos en buen estado que ya no usas?*
  #opciones((
    "Los guardo",
    "Los regalo o dono",
    "Los vendo en redes o apps",
    "Los intercambio con conocidos",
    "Los tiro",
    "Otros",
  ))

+ *¿Qué tipo de artículos tienes guardados sin usar?*
  #opciones((
    "Ropa y accesorios",
    "Tecnología y electrónicos",
    "Libros o material escolar",
    "Coleccionables (videojuegos, cómics, figuras)",
    "Artículos del hogar",
    "Artículos de bebé o niños",
    "Utensilios de cocina o herramientas",
    "Otros",
  ))

+ *¿Cuántos artículos sin usar calculas que tienes guardados?*
  #opciones((
    "Ninguno",
    "1 a 5",
    "6 a 15",
    "Más de 15",
  ))

+ *En el último año, ¿qué has hecho con artículos de segunda mano?*
  #opciones((
    "Compré artículos",
    "Vendí artículos",
    "Intercambié artículos (trueque)",
    "Ninguna de estas",
  ))

+ *¿Dónde lo hiciste?*
  #opciones((
    "Facebook Marketplace",
    "Grupos de Facebook o WhatsApp",
    "Mercado Libre u otra app",
    "Tianguis o bazares",
    "Con amigos o familia",
    "No lo he hecho",
    "Otros",
  ))

+ *¿Cómo prefieres entregar o recibir un artículo?*
  #opciones((
    "En persona en un lugar público",
    "A domicilio",
    "Por paquetería",
    "No tengo preferencia",
  ))

+ *¿Alguna vez hiciste un trueque con alguien por internet?*
  #opciones((
    "Sí, y fue buena experiencia",
    "Sí, pero fue complicado o inseguro",
    "No, pero me interesaría",
    "No, no me llama la atención",
  ))

+ *Indica qué tan de acuerdo estás con cada afirmación.*
  #escala_likert(
    "(1 = Totalmente en desacuerdo, 2 = En desacuerdo, 3 = Neutral, 4 = De acuerdo, 5 = Totalmente de acuerdo)",
    (
      "Conozco personas que hacen intercambios por redes.",
      "He escuchado casos de estafas en compra/venta por redes.",
      "En mi entorno se ve bien usar artículos de segunda mano.",
      "Las publicaciones de venta en redes suelen tener poca información.",
    ),
  )

+ *Indica qué tan de acuerdo estás con cada afirmación.*
  #escala_likert(
    "(1 = Totalmente en desacuerdo, 2 = En desacuerdo, 3 = Neutral, 4 = De acuerdo, 5 = Totalmente de acuerdo)",
    (
      "Me da pena desperdiciar cosas que aún sirven.",
      "Me pone nervioso(a) verme con un desconocido para una entrega.",
      "Prefiero intercambiar que vender, porque obtengo algo que necesito.",
      "Me importa reducir mi impacto ambiental.",
      "Me frustra que no respondan o cancelen los tratos.",
    ),
  )

+ *Cuando quieres deshacerte de algo que ya no usas, ¿cómo te sientes?*
  #opciones((
    "Con ganas de que alguien más lo aproveche",
    "Con pena de tirarlo",
    "Frustrado(a) porque venderlo cuesta trabajo",
    "Indiferente, lo guardo o lo tiro",
    "Otros",
  ))

+ *¿Qué te preocupa más al intercambiar o comprar a un desconocido?*
  #opciones((
    "Que me estafen o el artículo no sea lo prometido",
    "Mi seguridad en la entrega",
    "La distancia o el envío",
    "El tiempo para ponerse de acuerdo",
    "No encontrar a alguien que tenga lo que quiero",
    "Que el otro artículo no valga lo mismo",
    "Que la otra persona no cumpla",
  ))

+ *¿Con qué frecuencia un trato de compra/venta o intercambio no se concretó?*
  #opciones((
    "Nunca",
    "Rara vez",
    "A veces",
    "Frecuentemente",
    "No he hecho tratos",
  ))

+ *¿Cuál ha sido tu peor experiencia al comprar, vender o intercambiar de segunda mano?*
  #opciones((
    "El artículo no era como en la foto",
    "La otra persona no llegó a la entrega",
    "Me estafaron con el pago",
    "Me sentí inseguro(a) en la entrega",
    "Perdí mucho tiempo negociando",
    "No he tenido malas experiencias",
    "Otros",
  ))

+ *¿Qué te daría más confianza para intercambiar con alguien?*
  #opciones((
    "Perfil verificado",
    "Calificaciones y reseñas",
    "Historial de intercambios",
    "Registro de la entrega (por ejemplo, código QR)",
    "Puntos de entrega seguros",
    "Protección si la otra persona no cumple",
    "Atención y mediación de la plataforma",
  ))

+ *¿Qué te motivaría más a intercambiar con frecuencia?*
  #opciones((
    "Ahorrar dinero",
    "Liberar espacio en casa",
    "Conseguir cosas que necesito sin comprarlas",
    "Reducir desperdicio",
    "Facilidad y rapidez",
  ))

+ *¿Qué tanto te interesa una app así?*
  #block(above: 0.6em, below: 0.8em, inset: (left: 1.2em))[
    #text(style: "italic", size: 11pt)[(1 = Nada, 2 = Poco, 3 = Neutral, 4 = De acuerdo, 5 = Mucho)]
    #v(0.3em)
    #table(
      columns: (1.2fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 0.5fr, 1.2fr),
      inset: 6pt,
      stroke: 0.6pt + rgb("#b8ccd4"),
      align: center + horizon,
      fill: (x, y) => if y == 0 { rgb("#0f3d5e") } else { rgb("#eaf4f6") },
      table.header(
        [],
        [#text(fill: white, weight: "bold")[1]],
        [#text(fill: white, weight: "bold")[2]],
        [#text(fill: white, weight: "bold")[3]],
        [#text(fill: white, weight: "bold")[4]],
        [#text(fill: white, weight: "bold")[5]],
        [],
      ),
      [*Nada*], [$square.stroked$], [$square.stroked$], [$square.stroked$], [$square.stroked$], [$square.stroked$], [*Mucho*],
    )
  ]

+ *¿Qué forma de intercambio te parece más útil?*
  #opciones((
    "Trueque",
    "Con créditos internos",
    "Ambas",
    "Ninguna",
  ))

+ *¿Pagarías el envío para recibir un artículo que quieres a cambio de algo que no usas?*
  #opciones((
    "Sí, si el costo es razonable",
    "Solo si el artículo vale mucho",
    "No, solo intercambios locales",
  ))

+ *Publicar sería gratis y solo se cobraría una tarifa al completar un intercambio. ¿Cuánto te parecería justo pagar por intercambio?*
  #opciones((
    "Nada, debería ser gratis",
    "Hasta $10",
    "$11 a $20",
    "$21 a $40",
    "Más de $40",
  ))

+ *¿Pagarías una suscripción mensual con envíos más baratos, sello de verificado y más visibilidad?*
  #opciones((
    "Sí",
    "Tal vez, después de probar la versión gratuita",
    "No",
  ))

+ *Si la otra persona no cumple el acuerdo, ¿qué esperarías de la app?*
  #opciones((
    "Cancelar sin penalización",
    "Reembolso del envío",
    "Penalizar a quien no cumplió",
    "Mediación para resolverlo",
  ))

+ *¿Hay algo más que quieras contarnos sobre intercambiar o vender lo que ya no usas?*
  #block(above: 0.8em, inset: (left: 1.2em))[
    #line(length: 100%, stroke: 0.6pt + rgb("#777777"))
    #v(1.2em)
    #line(length: 100%, stroke: 0.6pt + rgb("#777777"))
  ]

== Gráficas en base a las respuestas del cuestionario

== Formato de descripción de puestos

A continuación se presentan las fichas de descripción de puestos correspondientes a los 9 socios fundadores de SWAP, organizadas por dirección funcional (@puesto-1 a @puesto-9).

#let ficha_puesto(
  numero: "",
  nombre: "",
  departamento: "",
  puesto: "",
  titulo: "",
  area: "",
  objetivo: "",
  responsabilidades: (),
  habilidades: (),
  experiencia: "",
  evaluacion: [],
  horario: "",
  salario: "",
  etiqueta: none,
) = {
  let azul-oscuro = rgb("#0f3d5e")
  let azul-medio = rgb("#16697a")
  let azul-claro = rgb("#eaf4f6")
  let borde-suave = 0.6pt + rgb("#b8ccd4")

  let etiqueta_campo(titulo-campo, subtitulo: none) = {
    text(fill: azul-oscuro, weight: "bold")[#titulo-campo]
    if subtitulo != none [
      \ #text(size: 9pt, style: "italic", fill: rgb("#4a5c68"))[#subtitulo]
    ]
  }

  let filas-resp = responsabilidades.enumerate(start: 1).map(((i, item)) => (
    table.cell(
      stroke: if i < responsabilidades.len() { (bottom: borde-suave) } else { none }
    )[
      #text(fill: azul-oscuro, weight: "bold")[#i.] #item
    ],
  )).flatten()

  let num-filas-hab = calc.ceil(habilidades.len() / 2)
  let pares-hab = range(0, habilidades.len(), step: 2).enumerate().map(((fila-idx, i)) => {
    let es-ultima = (fila-idx == num-filas-hab - 1)
    let st-izq = if es-ultima { (right: borde-suave) } else { (bottom: borde-suave, right: borde-suave) }
    let st-der = if es-ultima { none } else { (bottom: borde-suave) }

    let izq = [#text(fill: azul-oscuro, weight: "bold")[#(i + 1).] #habilidades.at(i)]
    let der = if i + 1 < habilidades.len() {
      [#text(fill: azul-oscuro, weight: "bold")[#(i + 2).] #habilidades.at(i + 1)]
    } else []
    (
      table.cell(stroke: st-izq)[#izq],
      table.cell(stroke: st-der)[#der],
    )
  }).flatten()

  let fig = figure(
    table(
      columns: (1.55fr, 3.2fr),
      inset: 7pt,
      stroke: borde-suave,
      align: left + horizon,
      fill: (x, y) => {
        if y == 0 { azul-oscuro }
        else if y == 1 { azul-medio }
        else if x == 0 { azul-claro }
        else { white }
      },
      table.header(
        table.cell(colspan: 2)[
          #text(fill: white, weight: "bold", size: 11pt)[
            PLANILLA DE DESCRIPCIÓN DE PUESTOS #h(6pt) | #h(6pt) FICHA #numero DE 9
          ]
        ],
      ),
      table.cell(colspan: 2)[
        #text(fill: white, weight: "bold")[Datos del evaluado]
      ],
      [#etiqueta_campo("Nombre:")],
      [*#nombre*],

      [#etiqueta_campo("Departamento:")],
      [#departamento],

      [#etiqueta_campo("Puesto:")],
      [*#puesto*],

      [#etiqueta_campo("Título", subtitulo: "Describe en pocas palabras la naturaleza del rol.")],
      [#titulo],

      [#etiqueta_campo("Departamento", subtitulo: "Escribe el área a la que pertenece.")],
      [#area],

      [#etiqueta_campo("Objetivo", subtitulo: "En una frase, establece la finalidad del puesto de trabajo.")],
      [#objetivo],

      [#etiqueta_campo("Responsabilidades", subtitulo: "Detalla una lista de tareas y funciones que el profesional debe realizar durante su jornada laboral.")],
      table.cell(inset: 0pt)[
        #table(
          columns: (1fr,),
          inset: 7pt,
          stroke: none,
          align: left + horizon,
          ..filas-resp
        )
      ],

      [#etiqueta_campo("Habilidades y Competencias", subtitulo: "Selecciona y/o agrega los conocimientos y destrezas con las que debe contar el colaborador de acuerdo al área jerárquica.")],
      table.cell(inset: 0pt)[
        #table(
          columns: (1fr, 1fr),
          inset: 7pt,
          stroke: none,
          align: left + horizon,
          ..pares-hab
        )
      ],

      [#etiqueta_campo("Nivel de experiencia", subtitulo: "Escribe los años de experiencia deseados con los que debe contar el miembro del equipo.")],
      [#experiencia],

      [#etiqueta_campo("Evaluación", subtitulo: "Menciona las formas en las que se evaluará cada periodo y descríbelas brevemente.")],
      [#evaluacion],

      [#etiqueta_campo("Días y horario laboral", subtitulo: "Comparte los días de la semana que se labora y la hora de entrada y salida.")],
      [#horario],

      [#etiqueta_campo("Salario", subtitulo: "Escribe el sueldo a percibir o el rango en el que se encuentre el salario.")],
      [#salario],
    ),
    caption: [Descripción de puesto: #puesto (#nombre)],
  )
  if etiqueta != none [#fig #label(etiqueta)] else [#fig]
}

// ==========================================
// FICHA 1 DE 9
// ==========================================
#ficha_puesto(
  numero: "1",
  nombre: "Estefany Gómez García",
  departamento: "Administración y Finanzas",
  puesto: "Coordinación financiera y tesorería",
  titulo: "Coordinadora de finanzas corporativas, flujo de efectivo y tesorería estratégica de SWAP.",
  area: "Área de Administración y Finanzas (Junta Directiva - Socio Fundador).",
  objetivo: "Garantizar la liquidez, solvencia y sostenibilidad financiera de SWAP mediante la administración eficiente de la tesorería, el control del capital de trabajo y la proyección de indicadores de rentabilidad.",
  responsabilidades: (
    "Administrar el flujo de efectivo mensual y anual de la empresa, gestionando los ingresos provenientes de comisiones por intercambio ($15.00 MXN), suscripciones Premium ($49.00 MXN) y márgenes logísticos ($10.00 MXN).",
    "Elaborar, actualizar y monitorear los estados financieros pro forma, el estado de resultados, el balance general y el cálculo del punto de equilibrio del proyecto.",
    "Evaluar la viabilidad financiera y el retorno de inversión mediante el cálculo continuo de la Tasa Interna de Retorno (TIR), el Valor Presente Neto (VPN) y las principales razones financieras.",
    "Gestionar las cuentas bancarias corporativas, la dispersión de pagos a proveedores tecnológicos (servicios cloud AWS/GCP, APIs externas y paqueterías) y el resguardo del capital de trabajo.",
    "Presentar reportes financieros mensuales ante la Junta Directiva de los 9 socios fundadores para fundamentar decisiones de reinversión, expansión regional y distribución de utilidades.",
  ),
  habilidades: (
    "Pensamiento estratégico",
    "Toma de decisiones",
    "Comunicación efectiva",
    "Gestión del cambio",
    "Resolución de conflictos",
    "Planificación estratégica",
    "Atención al detalle",
    "Organización",
    "Gestión del tiempo",
    "Análisis financiero y tesorería",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos financieros equivalentes) en administración financiera, elaboración de presupuestos, modelado de flujo de caja, evaluación de proyectos de inversión (TIR/VPN) y gestión de tesorería en empresas tecnológicas o startups.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se medirá trimestralmente mediante la precisión en las proyecciones de flujo de efectivo (desviación menor al 5%), el cumplimiento del margen operativo proyectado (\$57,746 MXN/mes en el Año 1) y la disponibilidad oportuna de liquidez para la operación. \
    *Evaluaciones 360:* Retroalimentación semestral por parte de la Junta Directiva y los integrantes del Área de Administración y Finanzas (José Oswaldo Martínez Velásquez y Verónica Fernández Martín), así como de los líderes de Tecnología y Marketing.
  ],
  horario: "Lunes a viernes de 9:00 am a 5:00 pm bajo esquema remoto y de gestión estratégica (con disponibilidad para sesiones ejecutivas con la Junta Directiva).",
  salario: "$14,000 – $18,000 MXN mensuales (tabulador proyectado tras alcanzar punto de equilibrio) / Durante la etapa inicial de arranque opera bajo esquema de socio fundador mediante participación accionaria y reparto proporcional de utilidades netas.",
  etiqueta: "puesto-1",
)

// ==========================================
// FICHA 2 DE 9
// ==========================================
#ficha_puesto(
  numero: "2",
  nombre: "José Oswaldo Martínez Velásquez",
  departamento: "Administración y Finanzas",
  puesto: "Control de costos y presupuesto",
  titulo: "Especialista en planeación presupuestal, control de costos operativos y optimización de inversión tecnológica.",
  area: "Área de Administración y Finanzas (Junta Directiva - Socio Fundador).",
  objetivo: "Optimizar la asignación de recursos financieros de SWAP mediante el control riguroso de los costos de producción, gastos operativos e inversiones en infraestructura tecnológica.",
  responsabilidades: (
    "Controlar y auditar el ejercicio del presupuesto anual de producción ($471,450.00 MXN en el Año 1), supervisando la inversión en activo fijo tecnológico ($162,000.00 MXN) y mobiliario de oficina ($47,000.00 MXN).",
    "Monitorear mensualmente los gastos operativos fijos y variables ($20,000.00 MXN/mes), incluyendo infraestructura en la nube (AWS/GCP), licencias de desarrollo, consumo de APIs (Google Maps y SMS/OTP), renta y servicios públicos.",
    "Administrar y autorizar el uso del fondo de imprevistos (5% del presupuesto operativo) ante variaciones en el consumo de servidores o demandas de escalabilidad de usuarios.",
    "Analizar los costos unitarios por transacción (costo de emisión de guías logísticas y procesamiento de pagos) para preservar la rentabilidad de la tarifa de $15.00 MXN por intercambio.",
    "Elaborar comparativos mensuales de presupuesto contra gasto real (variaciones presupuestales) y proponer medidas de ahorro operativo sin comprometer la calidad del servicio.",
  ),
  habilidades: (
    "Atención al detalle",
    "Planificación estratégica",
    "Organización",
    "Gestión del tiempo",
    "Comunicación efectiva",
    "Toma de decisiones",
    "Pensamiento estratégico",
    "Trabajo en equipo",
    "Adaptabilidad",
    "Control presupuestal y costos",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos equivalentes) en contabilidad administrativa, presupuestos empresariales, control de costos operativos y evaluación financiera de activos tecnológicos.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se evaluará trimestralmente a través del cumplimiento del techo presupuestal mensual (\$20,000 MXN en insumos y operación), la reducción de desviaciones de gasto por debajo del 3% y la eficiencia en la adquisición de equipamiento. \
    *Evaluaciones 360:* Evaluación cruzada con los compañeros del Área de Administración y Finanzas (Estefany Gómez García y Verónica Fernández Martín) y los líderes técnicos que solicitan recursos de infraestructura y licenciamiento.
  ],
  horario: "Lunes a viernes de 9:00 am a 5:00 pm bajo esquema remoto y de gestión estratégica (con reuniones quincenales de seguimiento presupuestal).",
  salario: "$13,000 – $17,000 MXN mensuales (tabulador proyectado tras alcanzar punto de equilibrio) / En etapa de consolidación opera como socio fundador con participación accionaria y distribución de utilidades conforme a resultados.",
  etiqueta: "puesto-2",
)

// ==========================================
// FICHA 3 DE 9
// ==========================================
#ficha_puesto(
  numero: "3",
  nombre: "Verónica Fernández Martín",
  departamento: "Administración y Finanzas",
  puesto: "Contabilidad fiscal y cumplimiento",
  titulo: "Responsable de contabilidad general, obligaciones fiscales, cumplimiento normativo y trámites legales.",
  area: "Área de Administración y Finanzas (Junta Directiva - Socio Fundador).",
  objetivo: "Asegurar el cumplimiento integral de las obligaciones fiscales, contables, laborales y regulatorias de SWAP ante las autoridades mexicanas para garantizar una operación legalmente sólida y libre de riesgos.",
  responsabilidades: (
    "Gestionar los trámites de constitución legal de la sociedad mercantil, la inscripción ante la Secretaría de Hacienda y Crédito Público (SHCP/SAT) y el cumplimiento periódico de declaraciones fiscales y facturación electrónica (CFDI).",
    "Coordinar los registros y obligaciones patronales y de seguridad social ante el IMSS, INFONAVIT y AFORE conforme a la legislación laboral vigente.",
    "Tramitar y mantener vigentes los permisos municipales en Coatzacoalcos, las licencias de funcionamiento de la oficina central y las disposiciones de Protección Civil.",
    "Gestionar el registro y protección de la propiedad intelectual de SWAP (marca comercial y logotipo ante el IMPI, así como derechos de autor del código fuente ante INDAUTOR).",
    "Supervisar, en conjunto con el área de seguridad informática, el cumplimiento normativo del Aviso de Privacidad y la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP).",
  ),
  habilidades: (
    "Atención al detalle",
    "Organización",
    "Planificación estratégica",
    "Toma de decisiones",
    "Gestión del tiempo",
    "Resolución de conflictos",
    "Comunicación efectiva",
    "Trabajo en equipo",
    "Flexibilidad",
    "Normatividad fiscal y propiedad intelectual",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos equivalentes) en contabilidad fiscal en México, cumplimiento regulatorio (SAT, IMSS), constitución de empresas y gestión de propiedad intelectual (IMPI/INDAUTOR).",
  evaluacion: [
    *Evaluaciones por objetivos:* Se medirá trimestralmente mediante el cumplimiento al 100% en tiempo y forma de las declaraciones fiscales, cero multas o requerimientos regulatorios y la obtención oportuna de permisos y registros de marca. \
    *Evaluaciones 360:* Retroalimentación de los socios de Administración y Finanzas (Estefany Gómez García y José Oswaldo Martínez Velásquez) y de la Junta Directiva respecto a la asesoría legal y fiscal brindada.
  ],
  horario: "Lunes a viernes de 9:00 am a 5:00 pm bajo esquema remoto y de gestión estratégica (incluyendo gestiones presenciales ante dependencias gubernamentales cuando se requiera).",
  salario: "$13,000 – $17,000 MXN mensuales (tabulador proyectado tras alcanzar punto de equilibrio) / En etapa inicial opera como socio fundador con participación accionaria y reparto proporcional de utilidades.",
  etiqueta: "puesto-3",
)

// ==========================================
// FICHA 4 DE 9
// ==========================================
#ficha_puesto(
  numero: "4",
  nombre: "Abraham Giovanni Barrera Torres",
  departamento: "Tecnología y Producto",
  puesto: "Líder de desarrollo y arquitecto backend",
  titulo: "Líder técnico de ingeniería de software, arquitecto de sistemas backend y desarrollador del motor de matchmaking.",
  area: "Área de Tecnología y Producto (Célula Ágil de Desarrollo - Socio Fundador).",
  objetivo: "Diseñar, desarrollar y escalar la arquitectura backend y el motor inteligente de coincidencia multilateral de SWAP, garantizando alto rendimiento, integridad de datos y disponibilidad continua del servicio.",
  responsabilidades: (
    "Diseñar y mantener la arquitectura del servidor y las APIs RESTful en Python/Node.js, asegurando tiempos de respuesta inferiores a 2.0 segundos y una disponibilidad (uptime) mínima del 99.9%.",
    "Programar y optimizar el algoritmo inteligente de coincidencia (Matchmaking Engine) que elimina la restricción de coincidencia recíproca directa en los intercambios P2P.",
    "Administrar y optimizar las bases de datos relacionales y geoespaciales en PostgreSQL con extensión PostGIS y Firebase para el catálogo activo de artículos (3,524 a 5,286 ítems iniciales).",
    "Desarrollar la lógica transaccional del sistema de cobro de comisiones ($15.00 MXN por match), suscripciones Premium ($49.00 MXN/mes) e integración API con paqueterías para generación de guías.",
    "Liderar técnicamente las revisiones cruzadas de código (Code Review) y el cumplimiento de estándares de calidad de software bajo el marco normativo NMX-I-059-NYCE (MoProSoft).",
  ),
  habilidades: (
    "Pensamiento estratégico",
    "Toma de decisiones",
    "Innovación",
    "Planificación estratégica",
    "Comunicación efectiva",
    "Resolución de conflictos",
    "Trabajo en equipo",
    "Atención al detalle",
    "Organización",
    "Arquitectura backend, PostgreSQL y algoritmos",
  ),
  experiencia: "De 1 a 3 años de experiencia (o proyectos de ingeniería equivalentes) en desarrollo backend con Python, diseño de APIs RESTful, modelado y optimización en PostgreSQL/PostGIS, algoritmos de recomendación y liderazgo técnico bajo Scrum.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se medirá al cierre de cada Sprint y trimestre mediante la disponibilidad del sistema (objetivo 99.9%), latencia promedio de respuesta de APIs (< 2.0 s), precisión de recomendaciones del motor de matchmaking y deuda técnica controlada. \
    *Evaluaciones 360:* Retroalimentación de los compañeros de la célula técnica (Josué Eliel Rosaldo Santiago, Erick Yamil Rodríguez Castellanos y René Emiliano Sánchez Saucedo) y de la Junta Directiva.
  ],
  horario: "Lunes a viernes de 9:00 am a 6:00 pm de tiempo completo presencial en la oficina central de desarrollo (Av. Universidad km 7.5, Col. Santa Isabel, Coatzacoalcos, Ver.).",
  salario: "$16,000 – $22,000 MXN mensuales (tabulador proyectado de liderazgo técnico) / Durante la etapa de arranque opera bajo esquema de socio fundador con participación accionaria y distribución de utilidades por monetización de la plataforma.",
  etiqueta: "puesto-4",
)

// ==========================================
// FICHA 5 DE 9
// ==========================================
#ficha_puesto(
  numero: "5",
  nombre: "Erick Yamil Rodríguez Castellanos",
  departamento: "Tecnología y Producto",
  puesto: "Ingeniero de infraestructura, nube y seguridad",
  titulo: "Especialista en arquitectura Cloud, automatización DevOps (CI/CD), ciberseguridad y protección de datos.",
  area: "Área de Tecnología y Producto (Célula Ágil de Desarrollo - Socio Fundador).",
  objetivo: "Garantizar la disponibilidad, escalabilidad, automatización de despliegues y seguridad integral de la infraestructura tecnológica y de los datos personales de los usuarios de SWAP.",
  responsabilidades: (
    "Configurar, administrar y escalar la infraestructura en la nube (AWS / Google Cloud), incluyendo servidores de aplicaciones, bases de datos gestionadas PostgreSQL, almacenamiento S3 y balanceadores de carga.",
    "Implementar y mantener los pipelines de integración y despliegue continuo (CI/CD) mediante GitHub y GitHub Actions para automatizar pruebas y liberaciones en entornos Staging y Producción.",
    "Diseñar e implementar los protocolos de cifrado de comunicaciones (SSL/TLS), autenticación segura de usuarios (perfiles verificados y OTP) y generación de tokens criptográficos temporales para validación QR.",
    "Ejecutar pruebas de carga, estrés y penetración (pentesting), asegurando la resiliencia del sistema ante picos concurrentes de los 1,762+ usuarios activos mensuales proyectados.",
    "Auditar y garantizar el cumplimiento técnico de la Ley Federal de Protección de Datos Personales en Posesión de los Particulares (LFPDPPP) y administrar la red local empresarial (Wi-Fi 6, VLAN y respaldo UPS).",
  ),
  habilidades: (
    "Atención al detalle",
    "Resolución de conflictos",
    "Pensamiento estratégico",
    "Innovación",
    "Gestión del cambio",
    "Toma de decisiones",
    "Trabajo en equipo",
    "Organización",
    "Adaptabilidad",
    "Cloud (AWS/GCP), DevOps y ciberseguridad",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos equivalentes) en administración de servicios en la nube (AWS/GCP), automatización CI/CD con GitHub Actions, seguridad informática, cifrado de datos y pruebas de rendimiento.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se evaluará trimestralmente mediante el porcentaje de uptime de la nube (meta 99.9%), tasa de éxito en despliegues automatizados, cero incidentes críticos de seguridad o brechas de datos y optimización del gasto cloud (\$4,500 MXN/mes). \
    *Evaluaciones 360:* Retroalimentación de los integrantes de Tecnología y Producto (Abraham Giovanni Barrera Torres, Josué Eliel Rosaldo Santiago y René Emiliano Sánchez Saucedo) y de Administración y Finanzas.
  ],
  horario: "Lunes a viernes de 9:00 am a 6:00 pm de tiempo completo presencial en la oficina central de desarrollo (Av. Universidad km 7.5, Col. Santa Isabel, Coatzacoalcos, Ver.).",
  salario: "$15,000 – $20,000 MXN mensuales (tabulador proyectado de ingeniería especializada) / En etapa inicial opera como socio fundador con participación accionaria y reparto proporcional de utilidades.",
  etiqueta: "puesto-5",
)

// ==========================================
// FICHA 6 DE 9
// ==========================================
#ficha_puesto(
  numero: "6",
  nombre: "Josué Eliel Rosaldo Santiago",
  departamento: "Tecnología y Producto",
  puesto: "Desarrollador móvil y de interfaz (UI/UX)",
  titulo: "Ingeniero de desarrollo móvil multiplataforma (iOS/Android) y diseñador de experiencia e interfaz de usuario (UI/UX).",
  area: "Área de Tecnología y Producto (Célula Ágil de Desarrollo - Socio Fundador).",
  objetivo: "Construir y perfeccionar una aplicación móvil multiplataforma intuitiva, accesible y visualmente atractiva que maximice la facilidad de publicación, exploración e intercambio seguro de artículos en SWAP.",
  responsabilidades: (
    "Desarrollar y mantener la aplicación móvil de SWAP para Android e iOS utilizando TypeScript y React Native, garantizando compatibilidad multiplataforma y fluidez en las animaciones e interacciones.",
    "Diseñar prototipos interactivos y flujos de usuario (UI/UX) en Figma alineados con la identidad visual de SWAP (juventud consciente, seguridad y simplicidad), optimizando la conversión y retención.",
    "Implementar en el cliente móvil las funcionalidades de publicación rápida de artículos, exploración geolocalizada con Google Maps API, chat de negociación en tiempo real y visualización de reputación.",
    "Integrar el módulo nativo de cámara y escaneo cruzado de códigos QR dinámicos para la validación presencial segura de los intercambios locales.",
    "Gestionar el empaquetado, pruebas en dispositivos físicos (Android e iOS) y publicación continua de versiones en Google Play Store y Apple App Store.",
  ),
  habilidades: (
    "Creatividad",
    "Innovación",
    "Atención al detalle",
    "Organización",
    "Gestión del tiempo",
    "Trabajo en equipo",
    "Comunicación efectiva",
    "Flexibilidad",
    "Adaptabilidad",
    "Desarrollo móvil (React Native) y diseño UI/UX",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos equivalentes) en desarrollo móvil multiplataforma con React Native y TypeScript, diseño de interfaces UI/UX en Figma, consumo de APIs REST y despliegue en tiendas de aplicaciones.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se medirá por Sprint y trimestre mediante el cumplimiento de historias de usuario de interfaz entregadas, tasa de sesiones sin fallos (crash-free rate > 99.5%), facilidad de publicación (meta de 2 a 3 artículos por usuario) y calificación de usabilidad. \
    *Evaluaciones 360:* Retroalimentación de los compañeros del equipo técnico (Abraham Giovanni Barrera Torres, Erick Yamil Rodríguez Castellanos y René Emiliano Sánchez Saucedo) y del área de Marketing.
  ],
  horario: "Lunes a viernes de 9:00 am a 6:00 pm de tiempo completo presencial en la oficina central de desarrollo (Av. Universidad km 7.5, Col. Santa Isabel, Coatzacoalcos, Ver.).",
  salario: "$15,000 – $20,000 MXN mensuales (tabulador proyectado de ingeniería de desarrollo) / En etapa de arranque opera bajo esquema de socio fundador mediante participación accionaria y distribución de utilidades.",
  etiqueta: "puesto-6",
)

// ==========================================
// FICHA 7 DE 9
// ==========================================
#ficha_puesto(
  numero: "7",
  nombre: "René Emiliano Sánchez Saucedo",
  departamento: "Tecnología y Producto",
  puesto: "Dueño de producto y líder de calidad (QA)",
  titulo: "Product Owner bajo marco Scrum y líder de aseguramiento de calidad de software (QA).",
  area: "Área de Tecnología y Producto (Célula Ágil de Desarrollo - Socio Fundador).",
  objetivo: "Maximizar el valor funcional y comercial del producto SWAP mediante la gestión estratégica del Product Backlog y el aseguramiento riguroso de la calidad en cada incremento de software liberado.",
  responsabilidades: (
    "Gestionar, refinar y priorizar el Product Backlog, traduciendo las necesidades del mercado juvenil de Coatzacoalcos-Minatitlán y los objetivos de negocio en Historias de Usuario claras con criterios de aceptación.",
    "Facilitar y coordinar las ceremonias del marco ágil Scrum (Sprint Planning, Daily Standups, Sprint Review y Retrospectiva) a lo largo de los 26 Sprints anuales planificados.",
    "Diseñar y ejecutar planes de pruebas funcionales, unitarias, de integración y de regresión, validando reglas críticas como el cobro de $15.00 MXN por intercambio, beneficios Premium y expiración de tokens QR.",
    "Coordinar la integración funcional y validación operativa con proveedores externos de paquetería y APIs de servicios para asegurar una experiencia logística sin fricciones.",
    "Implementar el ciclo de mejora continua Planear-Hacer-Verificar-Actuar (PHVA) y documentar los puntos de control de calidad conforme a los estándares NMX-I-055 y MoProSoft.",
  ),
  habilidades: (
    "Planificación estratégica",
    "Comunicación efectiva",
    "Toma de decisiones",
    "Resolución de conflictos",
    "Pensamiento estratégico",
    "Atención al detalle",
    "Trabajo en equipo",
    "Organización",
    "Gestión del tiempo",
    "Metodologías ágiles (Scrum) y QA de software",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos equivalentes) desempeñando roles de Product Owner o Scrum Master, redacción de historias de usuario, diseño de casos de prueba (QA) y gestión de proyectos de software.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se evaluará al cierre de cada Sprint y trimestre a través de la velocidad y cumplimiento del Sprint Goal (> 90%), tasa de defectos detectados antes de producción, satisfacción del usuario final y cumplimiento del cronograma de liberaciones. \
    *Evaluaciones 360:* Retroalimentación directa de los 3 desarrolladores de la célula técnica (Abraham Giovanni Barrera Torres, Josué Eliel Rosaldo Santiago y Erick Yamil Rodríguez Castellanos) y de los socios de Marketing y Finanzas.
  ],
  horario: "Lunes a viernes de 9:00 am a 6:00 pm de tiempo completo presencial en la oficina central de desarrollo (Av. Universidad km 7.5, Col. Santa Isabel, Coatzacoalcos, Ver.).",
  salario: "$15,000 – $20,000 MXN mensuales (tabulador proyectado de gestión de producto y QA) / En etapa de consolidación opera como socio fundador con participación accionaria y reparto proporcional de utilidades.",
  etiqueta: "puesto-7",
)

// ==========================================
// FICHA 8 DE 9
// ==========================================
#ficha_puesto(
  numero: "8",
  nombre: "Israel Gómez Toled",
  departamento: "Marketing y Comercialización",
  puesto: "Estrategia comercial y crecimiento",
  titulo: "Coordinador de estrategia comercial, posicionamiento de marca, adquisición de usuarios y crecimiento (Growth).",
  area: "Área de Marketing y Comercialización (Junta Directiva - Socio Fundador).",
  objetivo: "Impulsar la adquisición, retención y monetización de usuarios en la región Coatzacoalcos-Minatitlán mediante estrategias digitales de alto impacto centradas en la seguridad y la economía circular.",
  responsabilidades: (
    "Diseñar y ejecutar las campañas digitales de adquisición bivalente en TikTok e Instagram geolocalizadas en Coatzacoalcos y Minatitlán, enfocadas en el ahorro económico y la liberación de espacio en el hogar.",
    "Posicionar la identidad corporativa de SWAP bajo el eje central de 'Seguridad y Confianza', destacando el sello de Perfil Verificado y la entrega segura con código QR frente a grupos informales de redes sociales.",
    "Implementar y optimizar el embudo de conversión Freemium ('Primer Mes de SWAP Premium Gratis') para alcanzar la meta del Año 1 de 1,762 Usuarios Activos Mensuales (MAU) y 521 suscriptores Premium ($49.00 MXN/mes).",
    "Establecer alianzas estratégicas con comunidades universitarias, bazares juveniles y comercios locales para acelerar el efecto de red y nutrir el catálogo inicial de 3,524 a 5,286 artículos.",
    "Monitorear métricas clave de crecimiento (CAC, tasa de conversión, retención mensual y volumen de matches) y ajustar las campañas publicitarias según el comportamiento del mercado.",
  ),
  habilidades: (
    "Creatividad",
    "Innovación",
    "Comunicación efectiva",
    "Planificación estratégica",
    "Gestión del cambio",
    "Pensamiento estratégico",
    "Toma de decisiones",
    "Adaptabilidad",
    "Flexibilidad",
    "Marketing digital, Growth y gestión de marca",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos comerciales equivalentes) en marketing digital, gestión de campañas en redes sociales (TikTok/Instagram Ads), estrategias de crecimiento (Growth) y posicionamiento de productos digitales.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se medirá mensual y trimestralmente mediante el alcance de la meta de 1,762 MAU al cierre del Año 1, el porcentaje de conversión a suscripciones Premium (meta 29.5%), el costo de adquisición por usuario (CAC) y el crecimiento del catálogo publicado. \
    *Evaluaciones 360:* Retroalimentación de su compañero de área (Alfonzo Felix Haziel), la Junta Directiva y el equipo de Tecnología y Producto respecto a la alineación entre producto y mercado.
  ],
  horario: "Lunes a viernes de 9:00 am a 5:00 pm bajo esquema remoto y de gestión estratégica (incluyendo activaciones presenciales en universidades y eventos juveniles de la región).",
  salario: "$13,000 – $17,000 MXN mensuales (tabulador proyectado tras alcanzar punto de equilibrio) / En etapa inicial opera como socio fundador con participación accionaria y comisiones/utilidades vinculadas al crecimiento de usuarios.",
  etiqueta: "puesto-8",
)

// ==========================================
// FICHA 9 DE 9
// ==========================================
#ficha_puesto(
  numero: "9",
  nombre: "Alfonzo Felix Haziel",
  departamento: "Marketing y Comercialización",
  puesto: "Operación logística y comunidad",
  titulo: "Coordinador de operaciones logísticas, puntos de entrega seguros, soporte y gestión de comunidad SWAP.",
  area: "Área de Marketing y Comercialización (Junta Directiva - Socio Fundador).",
  objetivo: "Garantizar una experiencia de intercambio segura, fluida y confiable mediante la gestión de la red logística, la validación de puntos de encuentro y la atención activa a la comunidad de usuarios.",
  responsabilidades: (
    "Supervisar y optimizar la operación de envíos regionales y nacionales a través de las paqueterías integradas en la app, asegurando el cumplimiento de la meta de 1,241 guías mensuales y un margen operativo de $10.00 MXN por guía.",
    "Gestionar y certificar la red de 'Puntos de Entrega Seguros' (plazas comerciales, cafeterías aliadas y espacios universitarios) en Coatzacoalcos y Minatitlán para los intercambios presenciales con código QR.",
    "Administrar los protocolos de verificación de identidad de usuarios ('Perfil Verificado') y supervisar el sistema de calificaciones, reseñas e historial de intercambios para prevenir fraudes.",
    "Brindar atención oportuna, mediación y resolución de disputas o incidencias entre usuarios durante los procesos de entrega local o envío por paquetería.",
    "Fomentar la participación comunitaria, programas de economía circular y campañas de reutilización responsable de ropa, tecnología y libros entre los jóvenes de la región.",
  ),
  habilidades: (
    "Resolución de conflictos",
    "Comunicación efectiva",
    "Trabajo en equipo",
    "Organización",
    "Toma de decisiones",
    "Atención al detalle",
    "Flexibilidad",
    "Adaptabilidad",
    "Gestión del tiempo",
    "Gestión logística y community management",
  ),
  experiencia: "De 1 a 2 años de experiencia (o proyectos equivalentes) en coordinación logística, atención y soporte a usuarios, mediación de conflictos, gestión de comunidades digitales y alianzas comerciales locales.",
  evaluacion: [
    *Evaluaciones por objetivos:* Se evaluará trimestralmente mediante el índice de satisfacción del usuario (CSAT > 90%), tiempo promedio de resolución de incidencias (< 24 horas), tasa de entregas exitosas sin reclamos (> 98%) y número de puntos seguros afiliados. \
    *Evaluaciones 360:* Retroalimentación de su compañero de dirección (Israel Gómez Toled), el líder de QA (René Emiliano Sánchez Saucedo) y los socios de la Junta Directiva.
  ],
  horario: "Lunes a viernes de 9:00 am a 5:00 pm bajo esquema remoto y de gestión estratégica (con supervisión operativa en campo para convenios con puntos de entrega seguros).",
  salario: "$12,000 – $16,000 MXN mensuales (tabulador proyectado tras alcanzar punto de equilibrio) / En etapa de arranque opera como socio fundador con participación accionaria y distribución proporcional de utilidades.",
  etiqueta: "puesto-9",
)

== Síntesis curricular de los integrantes

*Abraham Giovanni Barrera Torres*

_Líder de desarrollo y arquitecto backend_

Estudiante de Ingeniería de Software en la Universidad Veracruzana, con experiencia en desarrollo web y móvil, diseño de bases de datos y gestión ágil. Participó en el desarrollo full-stack de MiReporte (TypeScript, React, React Native, Python/Flask, PostgreSQL y Swagger), además de manejar MySQL (procedimientos almacenados y triggers) y especificaciones bajo el estándar IEEE 830. En SWAP, diseñará y mantendrá la arquitectura del servidor y APIs RESTful en Python/Node.js (uptime 99.9%), programará el motor inteligente de matchmaking, administrará PostgreSQL/PostGIS y Firebase, desarrollará la lógica transaccional de comisiones, suscripciones y paqueterías, y liderará las revisiones de código bajo NMX-I-059-NYCE (MoProSoft).

*Josué Eliel Rosaldo Santiago*

_Desarrollador móvil y de interfaz (UI/UX)_

Estudiante de Ingeniería de Software en la Universidad Veracruzana, especializado en diseño de interfaces, desarrollo multiplataforma y usabilidad. En MiReporte diseñó prototipos en Figma y desarrolló interfaces con TypeScript, React y React Native; en NewFriend realizó prototipos de alta fidelidad, arquitectura de información y evaluaciones heurísticas (Nielsen y Krug). Además, cuenta con experiencia en Java Swing, Python/Tkinter y Android con Apache Cordova. En SWAP, desarrollará la app móvil (iOS/Android) en TypeScript y React Native, diseñará flujos UI/UX en Figma, implementará publicación rápida, geolocalización con Google Maps API, chat en tiempo real y escaneo de códigos QR dinámicos, y gestionará el despliegue en Play Store y App Store.

*Erick Yamil Rodríguez Castellanos*

_Encargado de infraestructura, nube y seguridad_

Estudiante de Ingeniería de Software en la Universidad Veracruzana, técnico en Electricidad con experiencia en desarrollo web, móvil y servicios backend. En Shipment Tracker API implementó servicios REST con FastAPI, migraciones con SQLAlchemy/Alembic y contenerización con Docker y Docker Compose. Domina arquitecturas cliente-servidor, administración de MySQL y PostgreSQL, cifrado con bcrypt y control de versiones con Git. En SWAP, administrará y escalará la infraestructura en la nube (AWS/GCP), implementará pipelines CI/CD con GitHub Actions, diseñará protocolos de cifrado SSL/TLS, autenticación OTP y tokens QR temporales, ejecutará pruebas de estrés y pentesting, y auditará el cumplimiento técnico de la LFPDPPP.

*René Emiliano Sánchez Saucedo*

_Product Owner y líder de calidad (QA)_

Estudiante de Ingeniería de Software en la Universidad Veracruzana, con formación en arquitectura, bases de datos y aseguramiento de calidad. En SIGOMEI aplicó desarrollo guiado por pruebas (TDD) con Pytest y elaboró matrices de trazabilidad y registros de defectos; en Club Naval documentó requerimientos y métricas de calidad. Domina Pytest, Selenium WebDriver, Postman, Git, prototipado en Figma y accesibilidad WCAG 2.2. En SWAP, gestionará y priorizará el Product Backlog mediante Historias de Usuario, facilitará las ceremonias Scrum, ejecutará planes de pruebas (unitarias, integración y regresión) validando reglas de negocio e integraciones logísticas, e implementará el ciclo PHVA bajo los estándares NMX-I-055 y MoProSoft.

// Referencias
#pagebreak()

#bibliography("../references.bib", style: "apa")
