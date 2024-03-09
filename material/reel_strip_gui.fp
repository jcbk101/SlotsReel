varying mediump vec2 var_texcoord0;
varying lowp vec4 var_color;

uniform lowp sampler2D texture_sampler;
varying lowp float var_strip;

void main()
{        
    vec2 strips = vec2(mod(var_strip, 0.9375), 0);
    // Horizontal   
    lowp vec2 uv = vec2(var_texcoord0.x - strips.x, var_texcoord0.y);

    // Repeating horizontally 
    uv = vec2(mod(uv.x, 0.9375), uv.y);
    
    gl_FragColor = texture2D(texture_sampler, uv) * vec4(var_color.xyz, 1.0);
}
