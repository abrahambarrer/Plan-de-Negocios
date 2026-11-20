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
#set heading(numbering: "1.1.")
#counter(heading).update(0) // Reiniciamos el contador a 0. El próximo será el 1.

#pagebreak()

= Resumen ejecutivo

SWAP es una empresa de base tecnológica especializada en el desarrollo de plataformas digitales orientadas a la economía colaborativa y circular. Nace con el propósito de transformar los hábitos de consumo tradicional de la comunidad juvenil e independiente, ofreciendo una solución móvil innovadora, intuitiva y segura para agilizar el intercambio directo de bienes en desuso.

A diferencia del trueque tradicional, que suele fracasar por la dificultad de lograr una coincidencia recíproca, SWAP integra algoritmos inteligentes de recomendación, herramientas de geolocalización y un robusto sistema de seguridad que incluye verificación local presencial mediante código QR y logística integrada con paqueterías para envíos regionales o nacionales. Esto permite a los usuarios convertir artículos que ya no utilizan en valor real para adquirir lo que necesitan sin tener un desembolso monetario directo.  

Buscando consolidarse como la plataforma tecnológica líder en economía colaborativa a nivel regional, el proyecto se sustenta en seis pilares estratégicos: desarrollo e innovación tecnológica, seguridad y confianza comunitaria, crecimiento regional, sostenibilidad ambiental, experiencia de usuario superior y un modelo de negocio financieramente viable. Su esquema de monetización es de bajo impacto y totalmente transparente, operando bajo un formato gratuito para la publicación de artículos y generando ingresos a través de comisiones por intercambios exitosos, márgenes logísticos y membresías opcionales Premium.  

SWAP se posiciona como una respuesta moderna y sustentable al sobreconsumo, extendiendo la vida útil de los objetos y generando un impacto ambiental positivo.

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

=== Personalidad de marca

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

#image("../images/logo_swap.png", width: 2in)

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

== investigación de Mercado

== Estrategias de Comercialización

== Pronóstico de Ventas

= Estudio Técnico

= Estudio Financiero

// Referencias
// #pagebreak()

// #bibliography("../references.bib", style: "apa")
