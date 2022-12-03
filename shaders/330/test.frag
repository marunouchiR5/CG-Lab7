#version 330

in vec3 normal1;
in vec3 normal2;

in vec4 texColor;
in vec2 texCoord;

uniform vec3 lightPosition;
uniform int useNormalMap;

out vec4 outputColor; //this tells OpenGL that this variable is the output color
void main()
{
    float dot1 = 1;
    // if (useNormalMap == 1) {
	    dot1 = dot(normalize(normal2), normalize(lightPosition));
    // }
    float dot2 = dot(normalize(normal1), normalize(lightPosition));
    float outputDiffuse = dot1 * dot2;

    vec4 color = vec4(texColor.x, texColor.y, texColor.z, 1.0);
    
    color *= outputDiffuse;
    outputColor = color;
    // outputColor = texColor;
    //outputColor = vec4(texCoord.x, texCoord.y, 1.0, 1.0);
}
