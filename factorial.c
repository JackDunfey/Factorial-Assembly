int factorial(int n){
    if(n < 3)
        return n;
    return n * factorial(n - 1);
}

int main(){
    factorial(5);
    return 0;
}