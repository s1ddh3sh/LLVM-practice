extern "C"
{
    void vector_add(const int *public_vec, const int *secret_vec, int *result, int size)
    {
        for (int i = 0; i < size; ++i)
        {
            result[i] = public_vec[i] + secret_vec[i];
        }
    }
}