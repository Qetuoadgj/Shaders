// The following code gives me a completely black colored model, while it should be a model shaded in greyscale:

float4 SimplePixelShader(VertexShaderOutput input) : COLOR0
{
    //some lambertian shading done in the code I left out here

    return color;
}

sampler TextureSampler = sampler_state
{
    Texture = <ScreenTexture>;
};

float4 GrayscalePixelShader(float2 TextureCoordinate : TEXCOORD0) : COLOR0
{
    // Get the color.
    float4 color = tex2D(TextureSampler, TextureCoordinate); 

    // Turn pixel to grayscale.
    float grayscale = dot(color.rgb, float3(0.3, 0.59, 0.11));
    color.r = grayscale;
    color.g = grayscale;
    color.b = grayscale;
    color.a = 1.0f;

    // Return the result.
    return color;
}

technique Simple
{

    pass Pass0
    {
        VertexShader = compile vs_2_0 SimpleVertexShader();
        PixelShader  = compile ps_2_0 SimplePixelShader();
    }

    pass Pass1
    {
        PixelShader  = compile ps_2_0 GrayscalePixelShader();
    }
}