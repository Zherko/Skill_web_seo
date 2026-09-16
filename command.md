---
description: Audita y mejora SEO técnico, on-page, structured data, Core Web Vitals y citabilidad IA (skill-web-seo)
---

Activa la skill `skill-web-seo` con la herramienta `skill` — workflow **SEO & AI Citability**.

Petición: $ARGUMENTS

Carga la skill con `skill({ name: "skill-web-seo" })` y sigue EXACTAMENTE su SKILL.md. No atajes pasos. Si la skill no carga con ese nombre, prueba el alias legacy `skill_web_seo` (mismo contenido, nombre antiguo con guiones bajos).

0. **Intake:** identifica URL(s)/páginas objetivo, tipo de auditoría (técnica / on-page / structured data / CWV / keyword mapping / AI citability) y objetivo de negocio. Si faltan, pregunta.
1. **Diagnóstico:** revisa crawlability, indexability, canónicos, sitemap/robots, titles/meta/headings, OG/Twitter, hreflang, schema, imágenes (alt, width/height, filenames), internal linking y, si aplica, llms.txt + permisos AI crawlers.
2. **Plan priorizado:** lista hallazgos con severidad [HIGH/MED/LOW], ubicación exacta (fichero/línea) y fix accionable.
3. **Implementación:** aplica fixes página a página, verifica checklist "Quick SEO Audit Checklist" y "AI SEO Audit Checklist" del SKILL.md.
4. **Validación:** comprueba con Rich Results Test / previsualización OG / chequeo llms.txt y robots.txt antes de cerrar.

Si $ARGUMENTS está vacío, pide la URL o el alcance de la auditoría SEO.

> Aliases: `/skill_web_seo` (legacy), `/seo` (obsoleto) → mismo workflow.
