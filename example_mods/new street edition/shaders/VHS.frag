// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

//	Choose one of these to change the style of the crt
//#define X_ONLY
#define Y_ONLY
//#define X_AND_Y

// Will return a value of 1 if the 'x' is < 'value'
float Less(float x, float value)
{
	return 1.0 - step(value, x);
}

// Will return a value of 1 if the 'x' is >= 'lower' && < 'upper'
float Between(float x, float  lower, float upper)
{
    return step(lower, x) * (1.0 - step(upper, x));
}

//	Will return a value of 1 if 'x' is >= value
float GEqual(float x, float value)
{
    return step(value, x);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    float brightness = 1.25;
	vec2 uv = fragCoord.xy / iResolution.xy;
    uv.y = -uv.y;
    //uv = uv * 0.05;
    
    vec2 uvStep;
    uvStep.x = uv.x / (1.0 / iResolution.x);
    uvStep.x = mod(uvStep.x, 3.0);
    uvStep.y = uv.y / (1.0 / iResolution.y);
    uvStep.y = mod(uvStep.y, 3.0);
    
    vec4 newColour = texture(iChannel0, uv);
    
#ifdef X_ONLY
    newColour.r = newColour.r * Less(uvStep.x, 1.0);
    newColour.g = newColour.g * Between(uvStep.x, 1.0, 2.0);
    newColour.b = newColour.b * GEqual(uvStep.x, 2.0);
#endif
    
#ifdef Y_ONLY
    newColour.r = newColour.r * Less(uvStep.y, 1.0);
    newColour.g = newColour.g * Between(uvStep.y, 1.0, 2.0);
    newColour.b = newColour.b * GEqual(uvStep.y, 2.0);
#endif
    
#ifdef X_AND_Y
    newColour.r = newColour.r * step(1.0, (Less(uvStep.x, 1.0) + Less(uvStep.y, 1.0)));
    newColour.g = newColour.g * step(1.0, (Between(uvStep.x, 1.0, 2.0) + Between(uvStep.y, 1.0, 2.0)));
    newColour.b = newColour.b * step(1.0, (GEqual(uvStep.x, 2.0) + GEqual(uvStep.y, 2.0)));
#endif
    
    fragColor = newColour * brightness;

    // Set the alpha component to 0.5 to make the shader semi-transparent
    fragColor.a = 0.5;
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}