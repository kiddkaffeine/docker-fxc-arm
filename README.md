# docker-fxc-arm
Docker image with Microsoft FXC shader compiler

Hub: https://hub.docker.com/r/kiddkaffeine/fxc-arm/

## Usage
```
$ docker run --rm kiddkaffeine/fxc-arm /help
```

```
$ docker run --rm -v $(pwd):$(pwd) -w $(pwd) kiddkaffeine/fxc-arm /T <target> <input-hlsl-file> /Fo <output-file-name>
```

## Example
```
% docker run --rm -v $(pwd):$(pwd) -w $(pwd) kiddkaffeine/fxc-arm /T fx_2_0 ColorShader.fx /Fo ColorShader.fxb
```
