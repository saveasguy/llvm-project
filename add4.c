void add4(int *restrict dst, int *src) {
    if (*dst < 0) {
        dst[0] += src[0];
        dst[1] += src[1];
        dst[2] += src[2];
        dst[3] += src[3];
    }
    else {
        dst[0] -= src[0];
        dst[1] -= src[1];
        dst[2] -= src[2];
        dst[3] -= src[3];
    }
}