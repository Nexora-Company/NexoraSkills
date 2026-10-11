---
name: production-readiness
description: Audita, completa y valida el sitio web de Nexora para producción. Úsala al finalizar funcionalidades, revisar calidad, corregir problemas, preparar el lanzamiento o comprobar si una implementación está realmente lista para producción.
license: Apache-2.0
compatibility: opencode, claude-code
---

# Nexora — Production Readiness

## Objetivo

Llevar el sitio web de Nexora a un estado profesional, seguro, accesible, rápido, coherente con la identidad de marca y preparado para producción.

El objetivo no es agregar funcionalidades por agregar. Es garantizar que las funcionalidades necesarias existan, funcionen correctamente, estén verificadas y no introduzcan riesgos innecesarios.

## Principios obligatorios

1. Inspeccionar el proyecto antes de modificarlo.
2. Reutilizar la arquitectura, los componentes y las funcionalidades existentes.
3. No reconstruir, duplicar ni eliminar elementos que ya funcionen correctamente.
4. No inventar datos corporativos, políticas legales, precios, productos, integraciones ni credenciales.
5. No presentar una integración simulada como una funcionalidad real.
6. No marcar una tarea como completada sin evidencia verificable.
7. Priorizar seguridad, integridad de los datos, accesibilidad y funcionamiento sobre detalles cosméticos.
8. Mantener la identidad visual de Nexora: minimalista, premium, precisa y tecnológicamente sofisticada.
9. Aplicar cambios pequeños, coherentes y mantenibles.
10. Si una tarea requiere credenciales, decisiones legales, datos del propietario o acceso externo, preparar lo necesario y documentar el bloqueo sin inventar resultados.

## Estados de cada requisito

- `VERIFIED`: implementado y comprobado mediante una prueba adecuada.
- `IMPLEMENTED`: implementado, pero pendiente de verificación suficiente.
- `PARTIAL`: existe, pero tiene limitaciones o defectos.
- `BLOCKED`: requiere información, credenciales, servicios o decisiones externas.
- `MISSING`: no existe y debe implementarse.
- `NOT_APPLICABLE`: no corresponde al alcance actual, con justificación.

No utilizar `VERIFIED` basándose únicamente en inspección visual o en la existencia de código.

## 1. Inspección inicial

Antes de desarrollar:

- Identificar framework, lenguaje, gestor de paquetes y estructura del proyecto.
- Revisar rutas, páginas, componentes compartidos y sistema de estilos.
- Revisar las variantes de Header, Footer, Hero, vitrinas de productos y selector de idioma.
- Localizar las páginas legales y comprobar su contenido y accesibilidad.
- Identificar formularios, búsquedas, botones, enlaces, integraciones y estados de carga.
- Revisar variables de entorno, configuración de compilación, pruebas y despliegue.
- Ejecutar las comprobaciones existentes para conocer el estado inicial.
- Registrar funcionalidades completas, incompletas, duplicadas y ausentes.

No modificar archivos hasta comprender el contexto de cada cambio.

## 2. Funcionalidad y experiencia de usuario

Comprobar:

- Todas las rutas previstas cargan correctamente.
- La navegación funciona con ratón, teclado y pantalla táctil.
- Header y Footer son consistentes en las páginas.
- El selector Español/Inglés funciona y conserva la ruta equivalente cuando existe.
- Formularios validan datos, muestran errores comprensibles y confirman los envíos reales.
- Botones y enlaces ejecutan acciones reales; no hay controles decorativos que aparenten funcionar.
- Las páginas 404 y los errores recuperables ofrecen una salida clara.
- Los buscadores y filtros funcionan si forman parte del alcance.
- Los estados de carga, vacío, éxito y error están definidos donde se necesitan.
- No hay enlaces rotos, errores de consola ni contenido de demostración accidental.
- Las tablas, menús, modales y componentes complejos funcionan en pantallas pequeñas.

Implementar un carrito y un checkout únicamente si la tienda está dentro del alcance comercial actual. Si lo está, validar inventario cuando corresponda, totales, moneda, impuestos, envío, pagos, confirmación del proveedor y prevención de pedidos duplicados.

## 3. Legal y privacidad

Comprobar que existan y sean accesibles los documentos necesarios según el negocio y los mercados donde opera Nexora:

- Información corporativa y datos de contacto.
- Política de privacidad.
- Términos y condiciones.
- Política de cookies y mecanismo de consentimiento, cuando corresponda.
- Políticas de envíos, devoluciones, reembolsos y garantías para los productos comercializados.
- Información sobre tratamiento de datos, retención, terceros y ejercicio de derechos.

No asumir que una política genérica satisface la legislación aplicable. Considerar Colombia como jurisdicción inicial si se confirma que el negocio opera desde allí, y evaluar las obligaciones adicionales de los mercados atendidos.

No inventar NIT, domicilio fiscal, representante legal, garantías comerciales ni condiciones de venta.

Cuando sea necesario consentimiento para analítica o marketing, impedir que las tecnologías no esenciales se activen antes de obtenerlo. Proporcionar opciones claras para aceptar, rechazar y modificar preferencias, según los requisitos aplicables.

Marcar las cuestiones que requieran revisión jurídica profesional.

## 4. Accesibilidad e internacionalización

Usar WCAG 2.2 nivel AA como objetivo de implementación, sin ignorar requisitos legales específicos.

Comprobar:

- Contraste de texto y componentes interactivos.
- Navegación por teclado y foco visible.
- Jerarquía correcta de encabezados y estructura semántica.
- Etiquetas y mensajes de error accesibles en formularios.
- Nombres accesibles para controles sin texto visible.
- Texto alternativo apropiado para imágenes informativas.
- Subtítulos o alternativas para contenido multimedia cuando corresponda.
- Compatibilidad razonable con lectores de pantalla.
- Respeto por la preferencia de movimiento reducido.
- Traducciones completas y consistentes.
- Metadatos, idioma del documento y enlaces equivalentes por idioma.

No utilizar `aria-label` indiscriminadamente ni sustituir HTML semántico por elementos personalizados cuando no sea necesario.

## 5. Rendimiento y SEO

Comprobar:

- Títulos y descripciones únicos por ruta.
- URLs canónicas correctas.
- Open Graph y metadatos para compartir enlaces.
- Sitemap XML y robots.txt adecuados al entorno.
- Exclusión de páginas privadas, de prueba o no indexables.
- Imágenes optimizadas, dimensiones declaradas y carga diferida cuando corresponda.
- Fuentes, scripts y recursos sin carga innecesaria.
- Ausencia de errores de hidratación, recursos fallidos y cambios visuales evitables.
- Métricas Core Web Vitals cuando existan datos de laboratorio o de usuarios reales.

Objetivos de Core Web Vitals en el percentil 75, cuando haya datos representativos:

- LCP: 2,5 segundos o menos.
- INP: 200 milisegundos o menos.
- CLS: 0,1 o menos.

No declarar estas métricas aprobadas sin mediciones.

Comprobar que los entornos de staging y producción tengan configuraciones SEO diferentes cuando sea necesario.

## 6. Seguridad e integridad

Comprobar:

- HTTPS en el dominio de producción.
- Secretos y credenciales fuera del repositorio y del código del cliente.
- Variables de entorno documentadas y validadas.
- Validación de entradas en el servidor cuando corresponda.
- Protección de formularios contra abuso y spam.
- Autorización correcta para operaciones privadas.
- Política CSP y cabeceras de seguridad compatibles con la aplicación.
- Dependencias y vulnerabilidades relevantes.
- Tratamiento seguro de errores, registros y datos personales.
- Ausencia de información sensible en logs o respuestas públicas.
- Límites de solicitudes, protección CSRF y controles de sesión cuando correspondan.

No añadir cabeceras o restricciones que rompan funcionalidades sin probarlas. No confiar únicamente en la validación del cliente.

## 7. Integraciones comerciales

Determinar primero si el lanzamiento incluye ventas, cuentas de usuario o suscripciones.

Si corresponde, verificar:

- Proveedor de pagos y entorno correcto.
- Confirmación de pagos mediante mecanismos autenticados del proveedor.
- Verificación de firmas de webhooks.
- Idempotencia y tratamiento de pagos duplicados.
- Gestión de estados pendientes, rechazados, reembolsados y completados.
- Correos transaccionales de pedidos, pagos y otros eventos pertinentes.
- Gestión de errores y registro de operaciones.
- Política de reembolsos y atención al cliente.
- Protección de datos de pago y cumplimiento de las obligaciones aplicables.

Nunca guardar datos completos de tarjetas en la aplicación si no existe una arquitectura y autorización adecuadas. Preferir páginas alojadas o componentes seguros del proveedor de pagos.

Si la tienda todavía no está habilitada, no crear un checkout falso. Documentar el alcance comercial y preparar los puntos de integración.

## 8. Analítica y observabilidad

Comprobar:

- Herramienta de analítica seleccionada y correctamente configurada.
- Eventos relevantes definidos sin recopilar datos innecesarios.
- Consentimiento y configuración de privacidad cuando sean exigibles.
- Separación entre datos de desarrollo y producción.
- Registro de errores del cliente y del servidor con información no sensible.
- Monitorización de disponibilidad y alertas, si están disponibles.
- Ausencia de eventos duplicados y datos de prueba en producción.

No introducir identificadores, cuentas o credenciales ficticias para simular una integración terminada.

## 9. Pruebas obligatorias

Ejecutar las pruebas disponibles y añadir las necesarias según la arquitectura:

- Linter y comprobación de tipos.
- Compilación de producción.
- Pruebas unitarias de lógica crítica.
- Pruebas de integración de formularios y servicios.
- Pruebas de navegación de las rutas principales.
- Pruebas responsive en distintos tamaños de pantalla.
- Comprobaciones de accesibilidad automatizadas y manuales.
- Verificación de enlaces, traducciones y metadatos.
- Pruebas de seguridad relevantes para la aplicación.
- Pruebas de pago en sandbox, si existe comercio electrónico.
- Pruebas del despliegue y de los flujos de recuperación, cuando sea posible.

Las pruebas automatizadas no sustituyen las comprobaciones manuales de experiencia de usuario, accesibilidad y operación real.

## 10. Despliegue y lanzamiento

Verificar:

- Comando de compilación y artefactos correctos.
- Variables de entorno de producción completas.
- Dominio y DNS configurados.
- Certificado HTTPS válido y redirecciones correctas.
- Migraciones y servicios externos preparados.
- Secretos almacenados de forma segura.
- Páginas de error y monitorización operativas.
- Sitemap, indexación y metadatos de producción.
- Procedimiento de reversión o recuperación.
- Comprobación final de rutas, formularios y funciones críticas en el dominio real.

No afirmar que DNS, SSL, correos, pagos o servicios externos funcionan si no se han probado en su entorno real.

## Método de trabajo

Para cada ciclo de trabajo:

1. Inspeccionar el estado actual.
2. Identificar los problemas y su impacto.
3. Priorizar bloqueos críticos, errores funcionales y riesgos de seguridad.
4. Implementar los cambios compatibles con el alcance confirmado.
5. Ejecutar las pruebas pertinentes.
6. Revisar regresiones y consistencia visual.
7. Actualizar el registro de requisitos con estado y evidencia.
8. Informar los bloqueos que requieran intervención humana.

Evitar cambios masivos que dificulten la revisión. No introducir nuevas dependencias si una solución existente es suficiente.

## Criterios de lanzamiento

El sitio solo puede declararse listo para producción cuando:

- Las funciones críticas del alcance están verificadas.
- No quedan errores críticos conocidos de seguridad o integridad.
- La compilación y las pruebas esenciales pasan.
- Las rutas públicas y los flujos principales funcionan.
- Los requisitos legales aplicables han sido revisados y la información corporativa es correcta.
- Accesibilidad, responsive, SEO y rendimiento han sido evaluados con evidencia.
- Las integraciones necesarias para el lanzamiento funcionan en el entorno correspondiente.
- El dominio, HTTPS, correo y monitorización están verificados cuando forman parte del alcance.
- Los bloqueos restantes están documentados y no comprometen el lanzamiento.

Distinguir siempre entre preparación técnica, cumplimiento legal y verificación del entorno real.

## Informe final obligatorio

Entregar un resumen con:

- Estado general: `READY`, `NOT READY` o `READY WITH ACCEPTED LIMITATIONS`.
- Funcionalidades verificadas.
- Problemas corregidos.
- Pruebas ejecutadas y resultados.
- Requisitos pendientes y sus riesgos.
- Bloqueos que requieren datos, credenciales o decisiones humanas.
- Cambios realizados en archivos.
- Próximos pasos ordenados por prioridad.

No declarar `READY` si existen bloqueos críticos. No ocultar limitaciones ni presentar tareas pendientes como terminadas.

