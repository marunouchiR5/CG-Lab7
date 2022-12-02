#version 330

in vec3 normal1;

uniform vec3 lightPosition;

out vec4 outputColor; //this tells OpenGL that this variable is the output color
void main()
{
	float outputDiffuse = dot(normalize(normal1), normalize(lightPosition));
	outputColor = vec4(1.0, 1.0, 1.0, 1.0);
}
