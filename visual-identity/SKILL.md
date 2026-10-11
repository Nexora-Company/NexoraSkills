---
name: visual-identity
description: Define and maintain the official Nexora visual identity across hardware, software, interfaces, websites, packaging, and marketing
license: Apache-2.0
compatibility: opencode, claude-code
metadata:
  audience: designers
  workflow: nexora-visual-identity
---

# Nexora Visual Identity

## 1. Propósito

Esta skill establece la **fuente única de verdad para la identidad visual de Nexora**.

Su objetivo es garantizar que todos los productos y puntos de contacto de Nexora compartan una identidad reconocible: minimalista, prémium, precisa, moderna y tecnológicamente sofisticada.

Debe aplicarse a:

- Sistema operativo y aplicaciones de Nexora.
- Sitios web, landing pages y paneles de administración.
- Interfaces móviles, de escritorio, tabletas y dispositivos domésticos.
- Diseño industrial y representación visual del hardware.
- Empaques, documentación y materiales comerciales.
- Presentaciones, anuncios y contenido para redes sociales.
- Iconografía, ilustraciones, animaciones y recursos gráficos.

La identidad debe ser coherente sin obligar a todos los productos a tener interfaces idénticas.

---

## 2. Esencia de marca

### Posicionamiento

Nexora es una marca tecnológica orientada a crear un ecosistema integrado de hardware, software y servicios.

### Atributos visuales

- Minimalista.
- Prémium.
- Precisa.
- Sobria.
- Contemporánea.
- Funcional.
- Tecnológicamente avanzada.
- Reconocible sin depender de adornos excesivos.

### Principios de diseño

**Claridad sobre decoración.** Cada elemento visual debe tener una función concreta.

**Consistencia sin monotonía.** Los productos deben compartir un lenguaje visual, pero conservar una identidad funcional propia.

**Calidad percibida.** La composición, los espacios, la tipografía y los materiales deben transmitir cuidado y precisión.

**Color con intención.** El rojo de Nexora se reserva principalmente para acciones importantes, identidad de marca y estados que necesiten énfasis.

**Interfaz al servicio del usuario.** La estética nunca debe perjudicar la legibilidad, la accesibilidad o la facilidad de uso.

---

## 3. Paleta cromática oficial

### 3.1. Colores neutros

| Token | HEX | Uso |
|---|---|---|
| `white` | `#FFFFFF` | Fondos blancos y superficies limpias |
| `neutral-50` | `#FBFBFD` | Fondo claro principal |
| `neutral-100` | `#F5F5F7` | Superficies secundarias |
| `neutral-200` | `#F0F0F3` | Bordes suaves y divisores claros |
| `neutral-500` | `#6B6B74` | Texto secundario |
| `neutral-700` | `#42424A` | Texto de apoyo y elementos discretos |
| `neutral-900` | `#16161A` | Texto principal en modo claro |

### 3.2. Colores oscuros

| Token | HEX | Uso |
|---|---|---|
| `dark-950` | `#0D0D0F` | Fondo oscuro profundo |
| `dark-900` | `#131317` | Fondo principal oscuro |
| `dark-850` | `#191A1E` | Superficies elevadas |
| `dark-800` | `#1F2024` | Tarjetas y paneles |
| `dark-750` | `#26272C` | Superficies interactivas y separaciones |

### 3.3. Rojo de marca

| Token | HEX | Uso |
|---|---|---|
| `brand-red` | `#A50021` | Color de marca principal |
| `brand-red-deep` | `#8E001C` | Estados activos y variantes profundas |
| `brand-red-light` | `#FF8497` | Acentos sobre fondos oscuros |
| `brand-red-soft` | `#FF9DB0` | Acentos suaves sobre fondos oscuros |

### 3.4. Reglas de aplicación del color

- Los neutros constituyen la mayor parte de la composición.
- El rojo es un acento identificador, no un color de fondo universal.
- Los fondos claros deben priorizar `#FBFBFD` y `#F5F5F7`.
- Los fondos oscuros deben priorizar `#0D0D0F` y `#131317`.
- Las superficies deben distinguirse mediante diferencias sutiles de luminosidad, bordes o profundidad.
- El rojo claro debe reservarse para elementos que necesiten contraste sobre fondos oscuros.
- No utilizar el rojo como único indicador de error, éxito o advertencia.
- No introducir colores de marca adicionales sin aprobación formal.

### 3.5. Brillos y transparencias

Se permite utilizar brillos rojos translúcidos para destacar elementos importantes, ilustraciones tecnológicas o escenas promocionales.

Ejemplo conceptual de resplandor:

`rgba(165, 0, 33, 0.20)`

Reglas:

- Mantener el brillo localizado y discreto.
- Evitar grandes áreas de rojo luminoso.
- No utilizar resplandores en todos los componentes de interfaz.
- No comprometer la legibilidad del texto.
- No aplicar el brillo como sustituto de una jerarquía visual clara.

---

## 4. Tipografía

### Principios

La tipografía debe ser moderna, altamente legible y neutral. Se priorizan las familias sans serif, con buena representación de caracteres españoles e ingleses.

### Familias recomendadas

- **Inter:** opción principal para interfaces y documentación digital.
- **SF Pro:** referencia visual para estudiar proporciones y jerarquía; no implica autorización para distribuirla.
- **Geist:** alternativa para productos web y herramientas para desarrolladores.
- **Manrope:** alternativa para titulares y piezas de marketing.

La selección definitiva depende de la licencia y de la disponibilidad técnica de cada fuente.

### Jerarquía tipográfica

| Token | Uso | Tamaño orientativo |
|---|---|---:|
| `display` | Titulares de campañas | 48–72 px |
| `h1` | Encabezados principales | 36–48 px |
| `h2` | Secciones | 28–36 px |
| `h3` | Subsecciones | 22–28 px |
| `body-lg` | Texto destacado | 18 px |
| `body` | Texto general | 16 px |
| `body-sm` | Texto secundario | 14 px |
| `caption` | Metadatos | 12 px |

Los tamaños deben adaptarse a la densidad de información, el tamaño de pantalla y la distancia de visualización.

### Reglas tipográficas

- Utilizar pesos regulares y semibold como base.
- Reservar los pesos bold para énfasis justificado.
- Evitar el uso generalizado de mayúsculas.
- No utilizar más de dos familias tipográficas en una misma interfaz sin una razón clara.
- Mantener interlineado suficiente para lectura prolongada.
- Evitar textos excesivamente pequeños en dispositivos físicos.
- No usar tipografía ultraligera sobre fondos de bajo contraste.

---

## 5. Logotipo y marca denominativa

### Marca principal

La denominación oficial es `Nexora`.

La representación principal debe utilizar una marca denominativa limpia, sin efectos innecesarios ni elementos decorativos que dificulten su reproducción.

### Reglas

- Respetar la escritura `Nexora`.
- No alterar arbitrariamente las proporciones del logotipo.
- No inclinar, estirar ni deformar la marca.
- No aplicar contornos, sombras o degradados no aprobados.
- Mantener un área de protección alrededor del logotipo.
- Garantizar una versión legible sobre fondos claros y oscuros.
- Utilizar el rojo de marca cuando el contexto lo permita; las versiones monocromáticas pueden emplearse cuando la reproducción lo requiera.

### Símbolo

Un símbolo independiente para Nexora podrá definirse en una especificación posterior.

Hasta que exista un diseño aprobado, no inventar ni presentar como oficial un isotipo, monograma o símbolo.

---

## 6. Diseño de interfaces

### Principios generales

Las interfaces de Nexora deben sentirse claras, rápidas, consistentes y fáciles de aprender.

- Priorizar la jerarquía visual.
- Mantener navegación predecible.
- Reducir pasos innecesarios.
- Evitar paneles, etiquetas y controles redundantes.
- Utilizar espacios en blanco para separar contenidos.
- Mantener estados interactivos claramente diferenciados.
- Evitar animaciones que retrasen tareas frecuentes.

### Fondos y superficies

En modo claro:

- Fondo general: `#FBFBFD`.
- Superficie secundaria: `#F5F5F7`.
- Superficie elevada: `#FFFFFF`.
- Texto principal: `#16161A`.
- Texto secundario: `#6B6B74`.

En modo oscuro:

- Fondo general: `#0D0D0F`.
- Superficie principal: `#131317`.
- Superficie elevada: `#191A1E`.
- Superficie interactiva: `#1F2024`.
- Texto principal: blanco o un neutro claro validado.
- Texto secundario: utilizar un gris claro que cumpla los requisitos de contraste.

### Bordes y radios

- Preferir bordes sutiles a contornos pesados.
- Utilizar radios consistentes dentro de cada familia de componentes.
- Reservar las formas muy redondeadas para controles que lo justifiquen.
- Evitar mezclar tarjetas excesivamente redondeadas con paneles rígidos sin un criterio de diseño.

Los valores exactos deben definirse en los tokens del sistema de diseño.

### Sombras

- Utilizar sombras suaves para indicar elevación.
- Evitar sombras negras intensas en interfaces claras.
- Evitar efectos de profundidad innecesarios en interfaces oscuras.
- No usar sombras como sustituto de una jerarquía estructural correcta.

### Botones

Los botones deben distinguir claramente entre acción principal, acción secundaria y acción discreta.

- **Primario:** fondo rojo de marca cuando corresponda, con texto de contraste verificado.
- **Secundario:** superficie neutra y borde o contraste suficiente.
- **Terciario:** estilo discreto para acciones de menor prioridad.
- **Destructivo:** estilo de advertencia inequívoco, acompañado de texto claro.

El rojo de marca no debe aplicarse automáticamente a todos los botones primarios si perjudica la jerarquía o la coherencia del producto.

---

## 7. Accesibilidad y contraste

La identidad visual debe cumplir las pautas de accesibilidad aplicables, tomando WCAG 2.2 AA como referencia para productos digitales.

- El texto normal debe alcanzar una relación de contraste de al menos 4.5:1.
- El texto grande debe alcanzar al menos 3:1.
- Los componentes gráficos esenciales y estados visuales relevantes deben mantener un contraste suficiente.
- No comunicar información únicamente mediante color.
- Proporcionar estados de foco visibles para navegación por teclado.
- Respetar las preferencias de reducción de movimiento.
- Mantener objetivos táctiles apropiados para cada plataforma.
- Comprobar las combinaciones reales de color antes de aprobar componentes.

Los colores definidos en esta paleta no garantizan por sí solos el cumplimiento de contraste en todas las combinaciones.

---

## 8. Iconografía e ilustración

### Iconografía

- Preferir iconos simples, reconocibles y consistentes.
- Mantener grosores de trazo uniformes dentro de un mismo sistema.
- Evitar combinar estilos lineales, sólidos y tridimensionales sin un criterio explícito.
- Utilizar iconos acompañados de texto cuando su significado no sea evidente.
- No crear metáforas visuales difíciles de entender.

### Ilustraciones

- Favorecer composiciones geométricas limpias.
- Utilizar el rojo como acento, no como relleno universal.
- Mantener fondos y elementos secundarios discretos.
- Evitar ilustraciones excesivamente recargadas o genéricas de ciencia ficción.
- Priorizar representaciones que expliquen una función real del producto.

---

## 9. Identidad visual del hardware

Los productos físicos deben transmitir precisión, durabilidad y coherencia.

### Materiales y acabados

Las representaciones conceptuales pueden explorar:

- Aluminio anodizado.
- Vidrio tratado.
- Polímeros de acabado mate.
- Acabados oscuros y plateados.
- Detalles discretos en rojo.

Estas referencias no constituyen especificaciones obligatorias de fabricación.

### Diseño industrial

- Priorizar geometrías limpias y proporciones equilibradas.
- Reducir elementos decorativos innecesarios.
- Mantener una colocación consistente de logotipos.
- Evitar grandes superficies de marca sobre el dispositivo.
- Utilizar el rojo en detalles selectivos cuando aporte identidad.
- Considerar ergonomía, reparación, refrigeración y fabricación desde las primeras fases del diseño.

### Representación de productos

En renders y fotografías:

- Usar iluminación controlada.
- Mantener fondos neutros cuando el producto sea el protagonista.
- Mostrar proporciones y materiales de manera creíble.
- Evitar reflejos que oculten la forma.
- No presentar características inexistentes como si fueran reales.
- Distinguir los conceptos visuales de los productos comerciales definitivos.

---

## 10. Marketing y dirección de arte

### Sitios web y campañas

La comunicación visual debe priorizar el producto, su utilidad y sus atributos diferenciales.

- Composiciones amplias y ordenadas.
- Titulares breves.
- Espacios negativos generosos.
- Fotografías y renders de alta calidad.
- Paleta reducida.
- Animaciones funcionales y moderadas.
- Uso intencional del rojo de marca.

### Fondos

Se permiten fondos blancos, gris claro, negro profundo y escenas ambientales sobrias.

Los fondos con brillo rojo deben reservarse para campañas o elementos protagonistas y no convertirse en una plantilla universal.

### Evitar

- Degradados multicolor sin función.
- Neón excesivo.
- Estética de videojuegos aplicada a todos los productos.
- Exceso de paneles flotantes.
- Efectos de vidrio en cada superficie.
- Composiciones saturadas de texto.
- Recursos visuales genéricos que no aporten reconocimiento de marca.

---

## 11. Empaques y documentación

### Empaques

- Diseño exterior limpio.
- Logotipo discreto.
- Información del producto clara y precisa.
- Jerarquía tipográfica consistente.
- Uso limitado del rojo.
- Prioridad a materiales reciclables y soluciones de embalaje eficientes cuando sea viable.

### Documentación

- Mantener una estructura editorial consistente.
- Usar diagramas claros y etiquetados.
- Separar instrucciones, advertencias y notas.
- No depender del color para diferenciar estados críticos.
- Mantener consistencia entre documentación técnica, ayuda integrada e interfaces.

---

## 12. Tokens y sistema de diseño

Los colores y decisiones visuales deben implementarse mediante tokens centralizados.

Ejemplo conceptual:

```css
:root {
  --nx-color-white: #FFFFFF;
  --nx-color-neutral-50: #FBFBFD;
  --nx-color-neutral-100: #F5F5F7;
  --nx-color-neutral-200: #F0F0F3;
  --nx-color-neutral-500: #6B6B74;
  --nx-color-neutral-700: #42424A;
  --nx-color-neutral-900: #16161A;

  --nx-color-dark-950: #0D0D0F;
  --nx-color-dark-900: #131317;
  --nx-color-dark-850: #191A1E;
  --nx-color-dark-800: #1F2024;
  --nx-color-dark-750: #26272C;

  --nx-color-brand-red: #A50021;
  --nx-color-brand-red-deep: #8E001C;
  --nx-color-brand-red-light: #FF8497;
  --nx-color-brand-red-soft: #FF9DB0;
}
```

Este ejemplo constituye una referencia inicial, no un sistema de diseño completo. Los tokens semánticos de texto, superficie, borde, foco, éxito, advertencia y error deben definirse y validarse por separado.

No duplicar valores de color en componentes cuando exista un token apropiado.

---

## 13. Gobernanza de la identidad

1. Esta skill es la referencia oficial de identidad visual de Nexora.
2. Los colores de marca no deben modificarse sin aprobación.
3. Las nuevas familias de componentes deben reutilizar los tokens existentes cuando sea apropiado.
4. Las excepciones deben justificarse por necesidades funcionales, técnicas o de accesibilidad.
5. Las interfaces deben probarse en distintos tamaños de pantalla y condiciones de iluminación.
6. Las representaciones de hardware deben diferenciar conceptos, prototipos y productos reales.
7. Las nuevas versiones de la identidad deben documentarse y versionarse.
8. No presentar símbolos, tipografías o recursos como oficiales si todavía no han sido aprobados.
9. Las decisiones estéticas nunca deben justificar una pérdida de accesibilidad o claridad.
10. Todo cambio global debe revisarse en los productos afectados antes de su publicación.

---

## 14. Criterio de aprobación

Una pieza visual de Nexora está lista para aprobarse cuando:

- Respeta la paleta y la jerarquía de marca.
- Mantiene una composición clara y consistente.
- Tiene tipografía legible.
- Cumple los requisitos de accesibilidad pertinentes.
- Utiliza los elementos de marca de forma correcta.
- Representa fielmente las capacidades del producto.
- Evita adornos que no aportan valor.
- Funciona dentro de su plataforma y contexto de uso.

**Principio rector:** Nexora debe reconocerse por la precisión de su diseño, la claridad de sus interfaces y la coherencia de su ecosistema, no por la cantidad de efectos visuales que utiliza.

