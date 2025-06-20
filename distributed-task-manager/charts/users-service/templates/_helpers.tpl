{{- define "users-service.name" -}}
users-service
{{- end }}

{{- define "users-service.fullname" -}}
{{ .Release.Name }}-uaera-service
{{- end }}
