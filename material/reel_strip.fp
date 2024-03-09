varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;
uniform mediump vec4 strip;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    //    gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy) * tint_pm;

    //lowp vec2 uv = vec2(var_texcoord0.x - var_strip_position, var_texcoord0.y);     // Horizontal   
    vec2 strips = vec2(mod(strip.x, 0.9375), 0);
    lowp vec2 uv = vec2(var_texcoord0.x - strips.x, var_texcoord0.y);     // Horizontal   
    uv = vec2(mod(uv.x, 0.9375), uv.y);   // Repeating horizontally    


    if (strips.x > 1 && strips.x < 2)
    {
        tint_pm.y = 0;
        tint_pm.z = 0;
        gl_FragColor = texture2D(texture_sampler, uv) * tint_pm;
    }
    else if (strips.x > 2)
    {
        tint_pm.x = 0;
        tint_pm.z = 0;
        gl_FragColor = texture2D(texture_sampler, uv) * tint_pm;
    }
    else
    {
        gl_FragColor = texture2D(texture_sampler, uv) * tint_pm;
    }
}
