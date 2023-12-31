{{/*
Expand the name of the chart.
*/}}
{{- define "segway-sys-dest-logscale.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "segway-sys-dest-logscale.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "segway-sys-dest-logscale.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "segway-sys-dest-logscale.labels" -}}
helm.sh/chart: {{ include "segway-sys-dest-logscale.chart" . }}
{{ include "segway-sys-dest-logscale.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/component: dest-logscale
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: segway
{{- end }}

{{/*
Selector labels
*/}}
{{- define "segway-sys-dest-logscale.selectorLabels" -}}
app.kubernetes.io/name: {{ include "segway-sys-dest-logscale.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "segway-sys-dest-logscale.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "segway-sys-dest-logscale.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the secret to use
*/}}
{{- define "segway-sys-dest-logscale.secretname" -}}
{{- if .Values.secret.create }}
{{- default (include "segway-sys-dest-logscale.fullname" .) .Values.secret.name }}
{{- else }}
{{- default "default" .Values.secret.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the configmap to use
*/}}
{{- define "segway-sys-dest-logscale.configmapname" -}}
{{- if .Values.secret.create }}
{{- default (include "segway-sys-dest-logscale.fullname" .) .Values.secret.name }}
{{- else }}
{{- default "default" .Values.config.name }}
{{- end }}
{{- end }}

