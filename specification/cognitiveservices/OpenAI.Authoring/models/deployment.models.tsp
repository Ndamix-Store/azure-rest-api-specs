import "@typespec/rest";
import "@typespec/http";

using TypeSpec.Rest;
using TypeSpec.Rest.Resource;

namespace Azure.OpenAI;

@doc("""
Deployments manage the reserved quota for Azure OpenAI models and make them
available for inference requests.
""")
@resource("deployments")
model Deployment {
  @doc("Defines the type of an object.")
  @visibility("read")
  object?: TypeDiscriminator;

  @doc("The state of a job or item.")
  @visibility("read")
  status: State;

  @doc("A timestamp when this job or item was created (in unix epochs).")
  @visibility("read")
  created_at: int32;

  @doc("A timestamp when this job or item was modified last (in unix epochs).")
  @visibility("read")
  updated_at: int32;

  @doc("The identifier of the deployment")
  @key("deploymentId")
  @visibility("read")
  id: string;

  @doc("The OpenAI model to deploy. Can be a base model or a fine tune.")
  "model": string;

  @doc("""
The owner of this deployment. For Azure OpenAI only \"organization-owner\" is
supported.
""")
  @visibility("read")
  owner?: string;

  @doc("""
The scale settings of a deployment. It defines the modes for scaling and the
reserved capacity.
""")
  scale_settings: ScaleSettings;
}

@doc("""
The scale settings of a deployment. It defines the modes for scaling and the
reserved capacity.
""")
@discriminator("scale_type")
model ScaleSettings {}
