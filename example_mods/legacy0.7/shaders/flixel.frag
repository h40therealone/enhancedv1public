// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel


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

#pragma header

const float amount = 2.0;

    // GAUSSIAN BLUR SETTINGS
  	float dim = 1.8;
    float Directions = 16.0;
    float Quality = 8.0; 
    float Size = 8.0; 
    vec2 Radius = Size/openfl_TextureSize.xy;
void main(void)
{ 



	vec2 uv = openfl_TextureCoordv.xy ;

	vec2 pixel  = uv*openfl_TextureSize.xy ;

float Pi = 6.28318530718; // Pi*2
    
    

    vec4 Color = texture2D( bitmap, uv);
    
    for( float d=0.0; d<Pi; d+=Pi/Directions){
		for(float i=1.0/Quality; i<=1.0; i+=1.0/Quality){
			

float ex = (cos(d)*Size*i)/openfl_TextureSize.x;
float why = (sin(d)*Size*i)/openfl_TextureSize.y;

Color += flixel_texture2D( bitmap, uv+vec2(ex,why));	






	
        }
    }
    
    Color /= (dim * Quality) * Directions - 15.0;
  vec4 bloom =  (flixel_texture2D( bitmap, uv)/ dim)+Color;

if (pixel.y < 100 || pixel.y > openfl_TextureSize.y-100){

bloom = vec4(0.0,0.0,0.0,1.0);

}
gl_FragColor = bloom;

}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}