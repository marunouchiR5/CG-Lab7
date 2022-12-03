#version 330

#define PI 3.1415926535897932384626433832795

// pass in the needed variables
uniform mat4 myModelviewMatrix;
uniform mat4 myProjectionMatrix;
in vec3 myNormal;
in vec3 myPosition;
uniform sampler2D myTexture;
uniform sampler2D myNormalMap;

uniform int useNormalMap;
out vec3 normal1;
out vec3 normal2;
out vec4 texColor;
out vec2 texCoord;

void main() {
	vec4 projectedPosition = myProjectionMatrix * myModelviewMatrix * vec4(myPosition, 1.0);
	gl_Position = projectedPosition;
	

    float u, v;
    float theta = atan(myPosition.z, -myPosition.x);
    if (theta < 0) { u = -theta / (2 * PI); }
    else { u = 1.0f - theta / (2 * PI); }

    float phi = asin(myPosition.y/(length(myPosition)));
    v = 0.5f - myPosition.y;

    // texCoord = vec2(projectedPosition.x, projectedPosition.y);
    texCoord = vec2(u, v);
	texColor = texture(myTexture, texCoord.xy);

    normal1 = myNormal;
    normal2 = vec3(1.0);

    // if (useNormalMap == 1) {
        normal2 = texture(myNormalMap, texCoord.xy).rgb;
        normal2 = normalize(normal2 * 2.0 - 1.0);
    // }
}
