##  A large-scale atmospheric chemistry-transport model for massively parallel architectures

### Copyright
This work is licensed under a Creative Commons Attributions 3.0 License.
To view a copy of the license, go to:
http://creativecommons.org/licenses/by/3.0/

## Download
The final pdf is available [on Github](https://github.com/alexDarcy/thesis/releases/download/v1.0/manuscript_praga.pdf).

### Abstract
We present in this thesis the development of a large-scale bi-dimensional
atmospheric transport scheme designed for parallel architectures with
scalability in mind. The current version, named Pangolin, contains a
bi-dimensional advection and a simple linear chemistry scheme for stratospheric
ozone and will serve as a basis for a future CTM. For mass-preservation, a
van Leer finite-volume scheme was chosen for advection and extended to 2D with
operator splitting. To ensure mass preservation, winds are corrected in a
preprocessing step. We aim at addressing the "pole issue" of the traditional
regular latitude-longitude by presenting a new quasi-area-preserving grid
mapping the sphere uniformly. The parallelization of the model is based on the
advection operator and a custom domain-decomposition algorithm is presented here
to attain load-balancing in a message-passing context. To run efficiently on
current and future parallel architectures, algebraic features of the grid are
exploited in the advection scheme and parallelization algorithm to favor the
cheaper costs of flops versus data movement. The model is validated on algebraic
test cases and compared to other state-of-the-art schemes using a recent
benchmark. Pangolin is also compared to the CTM of Météo-France, MOCAGE,
using a linear ozone scheme and isentropic coordinates.


