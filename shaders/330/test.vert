#version 330

#define PI 3.1415926535897932384626433832795

// pass in the needed variables
uniform mat4 myModelviewMatrix;
uniform mat4 myProjectionMatrix;

in vec3 myPosition;
in vec3 myNormal;

// out vec3 normal1;
// out vec3 normal2;
// out vec4 texColor;
out vec2 texCoord;
out vec3 outPosition;
out vec3 outNormal;
out vec3 outWorldPos;
out vec3 outWorldNormal;

void main() {
	vec4 projectedPosition = myProjectionMatrix * myModelviewMatrix * vec4(myPosition, 1.0);
	gl_Position = projectedPosition;

    float u, v;
    float theta = atan(myPosition.z, myPosition.x);
    if (theta < 0) { u = -theta / (2 * PI); }
    else { u = 1 - theta / (2 * PI); }

    // float phi = asin(myPosition.y/(length(myPosition)));
    // v = 0.5f - myPosition.y;
    float phi = asin(myPosition.y / 0.5f);
    v = myPosition.y + 0.5f;

    texCoord = vec2(3 * u, 3 * v);
    //texCoord = vec2(u, v);

    outNormal = myNormal;
    outWorldPos = (myModelviewMatrix * vec4(myPosition, 1.0)).xyz;
    outWorldNormal = (myModelviewMatrix * vec4(myNormal, 0.0)).xyz;
}
