defmodule WebWorkerWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use WebWorkerWeb, :controller` and
  `use WebWorkerWeb, :live_view`.
  """
  use WebWorkerWeb, :html

  embed_templates "layouts/*"
end
