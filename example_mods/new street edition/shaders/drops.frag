#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

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

#define DEBUG 0

//some basic controls
const int COUNT = 256;
const float GRAVITY = 0.01;
const float DROPSIZE = 0.5;
const float DROPJITTER = 0.2;
const int LIFETIME = 300;

float saturate(float x)
{
    return clamp(x, 0., 1.);
}

uint baseHash(uint p)
{
    p = 1103515245U*((p >> 1U)^(p));
    uint h32 = 1103515245U*((p)^(p>>3U));
    return h32^(h32 >> 16);
}

vec2 hash21(int x)
{
    uint n = baseHash(uint(x));
    uvec2 rz = uvec2(n, n*48271U); //see: http://random.mat.sbg.ac.at/results/karl/server/node4.html
    return vec2((rz.xy >> 1) & uvec2(0x7fffffffU))/float(0x7fffffff);
}

vec2 hash21f(float p)
{
	vec3 p3 = fract(vec3(p) * vec3(.1031, .1030, .0973));
	p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx+p3.yz)*p3.zy);
}

float hash11(int x)
{
    uint n = baseHash(uint(x));
    return float(n)*(1.0/float(0xffffffffU));
}

vec3 buildnormalz(vec2 normal)
{
    return vec3(normal, sqrt(1. - normal.x*normal.x - normal.y*normal.y));
}

vec4 multisample( sampler2D tex, vec2 uv, float mip, float offset)
{
	vec4 outcol;
    outcol += texture( tex, uv + vec2(    0.0, 0.0), mip);
    outcol += texture( tex, uv + vec2( offset, offset), mip);
    outcol += texture( tex, uv + vec2(-offset, offset), mip);
    outcol += texture( tex, uv + vec2( offset,-offset), mip);
    outcol += texture( tex, uv + vec2(-offset,-offset), mip);
    return outcol * 0.2;
}

/*
vec4 multisample( sampler2D tex, vec2 uv, float mip, float offset)
{
	vec4 outcol;
    outcol += texture( tex, uv + vec2(    0.0, 0.0), mip);
    outcol += texture( tex, uv + vec2( offset, 0.0), mip);
    outcol += texture( tex, uv + vec2(-offset, 0.0), mip);
    outcol += texture( tex, uv + vec2( 0.0, offset), mip);
    outcol += texture( tex, uv + vec2( 0.0,-offset), mip);
    return outcol * 0.2;
}
*/



}
}