#pragma header

uniform int u_radius;
uniform bool u_horizontal;

void main() {
	if (u_radius <= 0) {
		gl_FragColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
		return;
	}
	
	gl_FragColor = vec4(0.0);
	vec2 texel = (u_horizontal ? vec2(1.0, 0.0) : vec2(0.0, 1.0)) / openfl_TextureSize;
	for (int i = -u_radius; i <= u_radius; ++i) {
		gl_FragColor += flixel_texture2D(bitmap, clamp(openfl_TextureCoordv + float(i) * texel, vec2(0.0), vec2(1.0)));
	}
	
	gl_FragColor /= float(u_radius * 2 + 1);
}
