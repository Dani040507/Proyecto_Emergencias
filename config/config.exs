import Config

# Carpeta donde se guardan los archivos de texto plano.
# Las pruebas usan una carpeta distinta para no borrar los datos reales.
if config_env() == :test do
  config :emergencias, directorio_datos: "datos_test"
  config :logger, level: :warning
else
  config :emergencias, directorio_datos: "datos"
end

# ---------------------------------------------------------------
# Interfaz web (opcional, Phoenix LiveView)
# ---------------------------------------------------------------
# El servidor web NO escucha por defecto, así la consola, los guiones y las
# pruebas no ocupan el puerto. (No se pone `server: false`: esa opción tendría
# prioridad incluso sobre `mix phx.server`). Se activa con:
#
#     mix phx.server
#     iex --sname servidor@localhost -S mix phx.server
#
# Las claves de abajo son de desarrollo (proyecto académico). Para publicar
# el sistema se deben generar nuevas con `mix phx.gen.secret`.
config :emergencias, EmergenciasWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  http: [ip: {127, 0, 0, 1}, port: if(config_env() == :test, do: 4002, else: 4000)],
  render_errors: [formats: [html: EmergenciasWeb.ErrorHTML], layout: false],
  pubsub_server: Emergencias.PubSub,
  live_view: [signing_salt: "Qm8xVb3kLr2PzT6w"],
  secret_key_base: "kX3v9Lq2Wm7Rz1Tp8Yb4Nc6Hd0Fg5Js2Ua7Ve3Xi9Ko1Lw4Qy8Zr6Mt2Sn5Pb0Ch7Dj3Fk9Gl1Hm4Ex6"

config :phoenix, :json_library, Jason
config :phoenix, :plug_init_mode, :runtime
