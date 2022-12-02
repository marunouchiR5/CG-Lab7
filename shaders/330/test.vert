#version 330

// pass in the needed variables
uniform mat4 myModelviewMatrix;
uniform mat4 myProjectionMatrix;
in vec3 myNormal;
in vec3 myPosition;
uniform sampler2D myTexture;
uniform sampler2D myNormalMap;

// pass out the needed variables
out vec3 normal1;

void main() {
	vec4 projectedPosition = myProjectionMatrix * myModelviewMatrix * vec4(myPosition, 1.0);
	gl_Position = projectedPosition;
	normal1 = myNormal;
	//vec4 texColor = texture(myTexture, texCoord.xy);
}
