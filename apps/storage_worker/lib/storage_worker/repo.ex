defmodule StorageWorker.Repo do
  use Ecto.Repo,
    otp_app: :storage_worker,
    adapter: Ecto.Adapters.Postgres
end
