; ModuleID = 'example_mayo.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.mayo_params_t = type { i32, i32, i32, i32, i32, ptr, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr }
%struct.sk_t = type { [113103 x i64], [2414 x i8] }

@MAYO_1 = external constant %struct.mayo_params_t, align 8
@MAYO_2 = external constant %struct.mayo_params_t, align 8
@MAYO_3 = external constant %struct.mayo_params_t, align 8
@MAYO_5 = external constant %struct.mayo_params_t, align 8
@__const.main.params = private unnamed_addr constant [4 x ptr] [ptr @MAYO_1, ptr @MAYO_2, ptr @MAYO_3, ptr @MAYO_5], align 16
@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 16
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1
@.str.4 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1
@.str.6 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1
@.str.7 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1
@.str.8 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1
@.str.9 = private unnamed_addr constant [39 x i8] c"mayo_open (with altered signature) -> \00", align 1
@.str.10 = private unnamed_addr constant [41 x i8] c"mayo_verify (with altered signature) -> \00", align 1
@unsigned_char_blocker = external global i8, align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x ptr], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.params, i64 32, i1 false)
  store i32 4, ptr %3, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %18, %0
  %6 = load i32, ptr %4, align 4
  %7 = load i32, ptr %3, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %21

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [4 x ptr], ptr %2, i64 0, i64 %11
  %13 = load ptr, ptr %12, align 8
  %14 = call i32 @example_mayo(ptr noundef %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %9
  store i32 -1, ptr %1, align 4
  br label %21

17:                                               ; preds = %9
  br label %18

18:                                               ; preds = %17
  %19 = load i32, ptr %4, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %4, align 4
  br label %5, !llvm.loop !6

21:                                               ; preds = %16, %5
  %22 = load i32, ptr %1, align 4
  ret i32 %22
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @example_mayo(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca [32 x i8], align 16
  %11 = alloca [32 x i8], align 16
  %12 = alloca i32, align 4
  store ptr %0, ptr %2, align 8
  store i64 32, ptr %3, align 8
  %13 = load ptr, ptr %2, align 8
  %14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 16
  %15 = load i32, ptr %14, align 8
  %16 = sext i32 %15 to i64
  %17 = load i64, ptr %3, align 8
  %18 = add i64 %16, %17
  store i64 %18, ptr %4, align 8
  %19 = load ptr, ptr %2, align 8
  %20 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 15
  %21 = load i32, ptr %20, align 4
  %22 = sext i32 %21 to i64
  %23 = call noalias ptr @calloc(i64 noundef %22, i64 noundef 1) #7
  store ptr %23, ptr %5, align 8
  %24 = load ptr, ptr %2, align 8
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 14
  %26 = load i32, ptr %25, align 8
  %27 = sext i32 %26 to i64
  %28 = call noalias ptr @calloc(i64 noundef %27, i64 noundef 1) #7
  store ptr %28, ptr %6, align 8
  %29 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 915840) #7
  store ptr %29, ptr %7, align 8
  %30 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 907240) #7
  store ptr %30, ptr %8, align 8
  %31 = load ptr, ptr %2, align 8
  %32 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 16
  %33 = load i32, ptr %32, align 8
  %34 = sext i32 %33 to i64
  %35 = load i64, ptr %3, align 8
  %36 = add i64 %34, %35
  %37 = call noalias ptr @calloc(i64 noundef %36, i64 noundef 1) #7
  store ptr %37, ptr %9, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %10, ptr align 16 @__const.example_mayo.msg, i64 32, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %11, i8 0, i64 32, i1 false)
  %38 = load ptr, ptr %2, align 8
  %39 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %38, i32 0, i32 22
  %40 = load ptr, ptr %39, align 8
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %40)
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %43 = load ptr, ptr %2, align 8
  %44 = load ptr, ptr %5, align 8
  %45 = load ptr, ptr %6, align 8
  %46 = call i32 @mayo_keypair(ptr noundef %43, ptr noundef %44, ptr noundef %45)
  store i32 %46, ptr %12, align 4
  %47 = load i32, ptr %12, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %51

49:                                               ; preds = %1
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

51:                                               ; preds = %1
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %53

53:                                               ; preds = %51
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %55 = load ptr, ptr %2, align 8
  %56 = load ptr, ptr %6, align 8
  %57 = load ptr, ptr %8, align 8
  %58 = call i32 @mayo_expand_sk(ptr noundef %55, ptr noundef %56, ptr noundef %57)
  store i32 %58, ptr %12, align 4
  %59 = load i32, ptr %12, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %63

61:                                               ; preds = %53
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

63:                                               ; preds = %53
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %65

65:                                               ; preds = %63
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %67 = load ptr, ptr %2, align 8
  %68 = load ptr, ptr %5, align 8
  %69 = load ptr, ptr %7, align 8
  %70 = call i32 @mayo_expand_pk(ptr noundef %67, ptr noundef %68, ptr noundef %69)
  store i32 %70, ptr %12, align 4
  %71 = load i32, ptr %12, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %75

73:                                               ; preds = %65
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

75:                                               ; preds = %65
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %77

77:                                               ; preds = %75
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %79 = load ptr, ptr %2, align 8
  %80 = load ptr, ptr %9, align 8
  %81 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %82 = load i64, ptr %3, align 8
  %83 = load ptr, ptr %6, align 8
  %84 = call i32 @mayo_sign(ptr noundef %79, ptr noundef %80, ptr noundef %4, ptr noundef %81, i64 noundef %82, ptr noundef %83)
  store i32 %84, ptr %12, align 4
  %85 = load i32, ptr %12, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %87, label %89

87:                                               ; preds = %77
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

89:                                               ; preds = %77
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %91

91:                                               ; preds = %89
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  %93 = load ptr, ptr %2, align 8
  %94 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0
  %95 = load ptr, ptr %9, align 8
  %96 = load i64, ptr %4, align 8
  %97 = load ptr, ptr %5, align 8
  %98 = call i32 @mayo_open(ptr noundef %93, ptr noundef %94, ptr noundef %3, ptr noundef %95, i64 noundef %96, ptr noundef %97)
  store i32 %98, ptr %12, align 4
  %99 = load i32, ptr %12, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %107, label %101

101:                                              ; preds = %91
  %102 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %103 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0
  %104 = load i64, ptr %3, align 8
  %105 = call i32 @memcmp(ptr noundef %102, ptr noundef %103, i64 noundef %104) #8
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %109

107:                                              ; preds = %101, %91
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

109:                                              ; preds = %101
  store i32 0, ptr %12, align 4
  %110 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %111

111:                                              ; preds = %109
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  %113 = load ptr, ptr %2, align 8
  %114 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %115 = load i64, ptr %3, align 8
  %116 = load ptr, ptr %9, align 8
  %117 = load ptr, ptr %5, align 8
  %118 = call i32 @mayo_verify(ptr noundef %113, ptr noundef %114, i64 noundef %115, ptr noundef %116, ptr noundef %117)
  store i32 %118, ptr %12, align 4
  %119 = load i32, ptr %12, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %121, label %123

121:                                              ; preds = %111
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

123:                                              ; preds = %111
  store i32 0, ptr %12, align 4
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %125

125:                                              ; preds = %123
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  %127 = load ptr, ptr %9, align 8
  %128 = getelementptr inbounds i8, ptr %127, i64 0
  %129 = load i8, ptr %128, align 1
  %130 = zext i8 %129 to i32
  %131 = xor i32 %130, -1
  %132 = trunc i32 %131 to i8
  %133 = load ptr, ptr %9, align 8
  %134 = getelementptr inbounds i8, ptr %133, i64 0
  store i8 %132, ptr %134, align 1
  %135 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0
  %136 = load i64, ptr %3, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %135, i8 0, i64 %136, i1 false)
  %137 = load ptr, ptr %2, align 8
  %138 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0
  %139 = load ptr, ptr %9, align 8
  %140 = load i64, ptr %4, align 8
  %141 = load ptr, ptr %5, align 8
  %142 = call i32 @mayo_open(ptr noundef %137, ptr noundef %138, ptr noundef %3, ptr noundef %139, i64 noundef %140, ptr noundef %141)
  store i32 %142, ptr %12, align 4
  %143 = load i32, ptr %12, align 4
  %144 = icmp ne i32 %143, 1
  br i1 %144, label %151, label %145

145:                                              ; preds = %125
  %146 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %147 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0
  %148 = load i64, ptr %3, align 8
  %149 = call i32 @memcmp(ptr noundef %146, ptr noundef %147, i64 noundef %148) #8
  %150 = icmp ne i32 %149, 0
  br i1 %150, label %153, label %151

151:                                              ; preds = %145, %125
  %152 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

153:                                              ; preds = %145
  store i32 0, ptr %12, align 4
  %154 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %155

155:                                              ; preds = %153
  %156 = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %157 = load ptr, ptr %2, align 8
  %158 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0
  %159 = load i64, ptr %3, align 8
  %160 = load ptr, ptr %9, align 8
  %161 = load ptr, ptr %5, align 8
  %162 = call i32 @mayo_verify(ptr noundef %157, ptr noundef %158, i64 noundef %159, ptr noundef %160, ptr noundef %161)
  store i32 %162, ptr %12, align 4
  %163 = load i32, ptr %12, align 4
  %164 = icmp eq i32 %163, 0
  br i1 %164, label %165, label %167

165:                                              ; preds = %155
  %166 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 -1, ptr %12, align 4
  br label %170

167:                                              ; preds = %155
  store i32 0, ptr %12, align 4
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  br label %169

169:                                              ; preds = %167
  br label %170

170:                                              ; preds = %169, %165, %151, %121, %107, %87, %73, %61, %49
  %171 = load ptr, ptr %5, align 8
  call void @free(ptr noundef %171) #9
  %172 = load ptr, ptr %7, align 8
  call void @free(ptr noundef %172) #9
  %173 = load ptr, ptr %6, align 8
  %174 = load ptr, ptr %2, align 8
  %175 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %174, i32 0, i32 14
  %176 = load i32, ptr %175, align 8
  %177 = sext i32 %176 to i64
  call void @mayo_secure_free(ptr noundef %173, i64 noundef %177)
  %178 = load ptr, ptr %8, align 8
  call void @mayo_secure_free(ptr noundef %178, i64 noundef 907240)
  %179 = load ptr, ptr %9, align 8
  call void @free(ptr noundef %179) #9
  %180 = load i32, ptr %12, align 4
  ret i32 %180
}

; Function Attrs: nounwind allocsize(0,1)
declare noalias ptr @calloc(i64 noundef, i64 noundef) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #3

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind willreturn memory(read)
declare i32 @memcmp(ptr noundef, ptr noundef, i64 noundef) #5

; Function Attrs: nounwind
declare void @free(ptr noundef) #6

declare void @mayo_secure_free(ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_keypair(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %8 = load ptr, ptr %4, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = load ptr, ptr %6, align 8
  %11 = call i32 @mayo_keypair_compact(ptr noundef %8, ptr noundef %9, ptr noundef %10)
  store i32 %11, ptr %7, align 4
  %12 = load i32, ptr %7, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

14:                                               ; preds = %3
  br label %16

15:                                               ; preds = %3
  br label %16

16:                                               ; preds = %15, %14
  %17 = load i32, ptr %7, align 4
  ret i32 %17
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_keypair_compact(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca [868 x i8], align 16
  %10 = alloca [113103 x i64], align 16
  %11 = alloca [2601 x i64], align 16
  %12 = alloca ptr, align 8
  %13 = alloca [2414 x i8], align 16
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca ptr, align 8
  %24 = alloca ptr, align 8
  %25 = alloca [1377 x i64], align 16
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %26 = load ptr, ptr %6, align 8
  store ptr %26, ptr %8, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %11, i8 0, i64 20808, i1 false)
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 21
  %29 = load i32, ptr %28, align 4
  store i32 %29, ptr %14, align 4
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 0
  %32 = load i32, ptr %31, align 8
  store i32 %32, ptr %15, align 4
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 1
  %35 = load i32, ptr %34, align 4
  %36 = load ptr, ptr %4, align 8
  %37 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %36, i32 0, i32 2
  %38 = load i32, ptr %37, align 8
  %39 = sub nsw i32 %35, %38
  store i32 %39, ptr %16, align 4
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  store i32 %42, ptr %17, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 7
  %45 = load i32, ptr %44, align 4
  store i32 %45, ptr %18, align 4
  %46 = load ptr, ptr %4, align 8
  %47 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %46, i32 0, i32 1
  %48 = load i32, ptr %47, align 4
  %49 = load ptr, ptr %4, align 8
  %50 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %49, i32 0, i32 2
  %51 = load i32, ptr %50, align 8
  %52 = sub nsw i32 %48, %51
  %53 = load ptr, ptr %4, align 8
  %54 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %53, i32 0, i32 1
  %55 = load i32, ptr %54, align 4
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %56, i32 0, i32 2
  %58 = load i32, ptr %57, align 8
  %59 = sub nsw i32 %55, %58
  %60 = add nsw i32 %59, 1
  %61 = mul nsw i32 %52, %60
  %62 = sdiv i32 %61, 2
  %63 = load ptr, ptr %4, align 8
  %64 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %63, i32 0, i32 21
  %65 = load i32, ptr %64, align 4
  %66 = mul nsw i32 %62, %65
  store i32 %66, ptr %19, align 4
  %67 = load ptr, ptr %4, align 8
  %68 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %67, i32 0, i32 2
  %69 = load i32, ptr %68, align 8
  %70 = load ptr, ptr %4, align 8
  %71 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %70, i32 0, i32 2
  %72 = load i32, ptr %71, align 8
  %73 = add nsw i32 %72, 1
  %74 = mul nsw i32 %69, %73
  %75 = sdiv i32 %74, 2
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %76, i32 0, i32 21
  %78 = load i32, ptr %77, align 4
  %79 = mul nsw i32 %75, %78
  store i32 %79, ptr %20, align 4
  %80 = load ptr, ptr %4, align 8
  %81 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %80, i32 0, i32 20
  %82 = load i32, ptr %81, align 8
  store i32 %82, ptr %21, align 4
  %83 = load ptr, ptr %4, align 8
  %84 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %83, i32 0, i32 18
  %85 = load i32, ptr %84, align 8
  store i32 %85, ptr %22, align 4
  %86 = getelementptr inbounds [113103 x i64], ptr %10, i64 0, i64 0
  store ptr %86, ptr %23, align 8
  %87 = getelementptr inbounds [113103 x i64], ptr %10, i64 0, i64 0
  %88 = load i32, ptr %19, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i64, ptr %87, i64 %89
  store ptr %90, ptr %24, align 8
  %91 = load ptr, ptr %8, align 8
  %92 = load i32, ptr %22, align 4
  %93 = sext i32 %92 to i64
  %94 = call i32 @randombytes(ptr noundef %91, i64 noundef %93)
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %97

96:                                               ; preds = %3
  store i32 1, ptr %7, align 4
  br label %141

97:                                               ; preds = %3
  %98 = getelementptr inbounds [868 x i8], ptr %9, i64 0, i64 0
  %99 = load i32, ptr %21, align 4
  %100 = load i32, ptr %18, align 4
  %101 = add nsw i32 %99, %100
  %102 = sext i32 %101 to i64
  %103 = load ptr, ptr %8, align 8
  %104 = load i32, ptr %22, align 4
  %105 = sext i32 %104 to i64
  %106 = call i32 @shake256(ptr noundef %98, i64 noundef %102, ptr noundef %103, i64 noundef %105)
  %107 = getelementptr inbounds [868 x i8], ptr %9, i64 0, i64 0
  store ptr %107, ptr %12, align 8
  %108 = getelementptr inbounds [868 x i8], ptr %9, i64 0, i64 0
  %109 = load i32, ptr %21, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i8, ptr %108, i64 %110
  %112 = getelementptr inbounds [2414 x i8], ptr %13, i64 0, i64 0
  %113 = load i32, ptr %16, align 4
  %114 = load i32, ptr %17, align 4
  %115 = mul nsw i32 %113, %114
  call void @decode(ptr noundef %111, ptr noundef %112, i32 noundef %115)
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds [113103 x i64], ptr %10, i64 0, i64 0
  %118 = load ptr, ptr %12, align 8
  call void @expand_P1_P2(ptr noundef %116, ptr noundef %117, ptr noundef %118)
  %119 = load ptr, ptr %4, align 8
  %120 = load ptr, ptr %23, align 8
  %121 = load ptr, ptr %24, align 8
  %122 = getelementptr inbounds [2414 x i8], ptr %13, i64 0, i64 0
  %123 = getelementptr inbounds [2601 x i64], ptr %11, i64 0, i64 0
  call void @compute_P3(ptr noundef %119, ptr noundef %120, ptr noundef %121, ptr noundef %122, ptr noundef %123)
  %124 = load ptr, ptr %5, align 8
  %125 = load ptr, ptr %12, align 8
  %126 = load i32, ptr %21, align 4
  %127 = sext i32 %126 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %124, ptr align 1 %125, i64 %127, i1 false)
  %128 = load ptr, ptr %4, align 8
  %129 = getelementptr inbounds [2601 x i64], ptr %11, i64 0, i64 0
  %130 = getelementptr inbounds [1377 x i64], ptr %25, i64 0, i64 0
  %131 = load i32, ptr %17, align 4
  call void @m_upper(ptr noundef %128, ptr noundef %129, ptr noundef %130, i32 noundef %131)
  %132 = getelementptr inbounds [1377 x i64], ptr %25, i64 0, i64 0
  %133 = load ptr, ptr %5, align 8
  %134 = load i32, ptr %21, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds i8, ptr %133, i64 %135
  %137 = load i32, ptr %20, align 4
  %138 = load i32, ptr %14, align 4
  %139 = sdiv i32 %137, %138
  %140 = load i32, ptr %15, align 4
  call void @pack_m_vecs(ptr noundef %132, ptr noundef %136, i32 noundef %139, i32 noundef %140)
  br label %141

141:                                              ; preds = %97, %96
  %142 = getelementptr inbounds [2414 x i8], ptr %13, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %142, i64 noundef 2414)
  %143 = load ptr, ptr %24, align 8
  %144 = load ptr, ptr %4, align 8
  %145 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %144, i32 0, i32 1
  %146 = load i32, ptr %145, align 4
  %147 = load ptr, ptr %4, align 8
  %148 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %147, i32 0, i32 2
  %149 = load i32, ptr %148, align 8
  %150 = sub nsw i32 %146, %149
  %151 = load ptr, ptr %4, align 8
  %152 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %151, i32 0, i32 2
  %153 = load i32, ptr %152, align 8
  %154 = mul nsw i32 %150, %153
  %155 = load ptr, ptr %4, align 8
  %156 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %155, i32 0, i32 21
  %157 = load i32, ptr %156, align 4
  %158 = mul nsw i32 %154, %157
  %159 = sext i32 %158 to i64
  %160 = mul i64 %159, 8
  call void @mayo_secure_clear(ptr noundef %143, i64 noundef %160)
  %161 = getelementptr inbounds [2601 x i64], ptr %11, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %161, i64 noundef 20808)
  %162 = load i32, ptr %7, align 4
  ret i32 %162
}

declare i32 @randombytes(ptr noundef, i64 noundef) #4

declare i32 @shake256(ptr noundef, i64 noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @decode(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %34, %3
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %6, align 4
  %11 = sdiv i32 %10, 2
  %12 = icmp slt i32 %9, %11
  br i1 %12, label %13, label %37

13:                                               ; preds = %8
  %14 = load ptr, ptr %4, align 8
  %15 = load i32, ptr %7, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, ptr %14, i64 %16
  %18 = load i8, ptr %17, align 1
  %19 = zext i8 %18 to i32
  %20 = and i32 %19, 15
  %21 = trunc i32 %20 to i8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw i8, ptr %22, i32 1
  store ptr %23, ptr %5, align 8
  store i8 %21, ptr %22, align 1
  %24 = load ptr, ptr %4, align 8
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  %28 = load i8, ptr %27, align 1
  %29 = zext i8 %28 to i32
  %30 = ashr i32 %29, 4
  %31 = trunc i32 %30 to i8
  %32 = load ptr, ptr %5, align 8
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 1
  store ptr %33, ptr %5, align 8
  store i8 %31, ptr %32, align 1
  br label %34

34:                                               ; preds = %13
  %35 = load i32, ptr %7, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %7, align 4
  br label %8, !llvm.loop !8

37:                                               ; preds = %8
  %38 = load i32, ptr %6, align 4
  %39 = srem i32 %38, 2
  %40 = icmp eq i32 %39, 1
  br i1 %40, label %41, label %52

41:                                               ; preds = %37
  %42 = load ptr, ptr %4, align 8
  %43 = load i32, ptr %7, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, ptr %42, i64 %44
  %46 = load i8, ptr %45, align 1
  %47 = zext i8 %46 to i32
  %48 = and i32 %47, 15
  %49 = trunc i32 %48 to i8
  %50 = load ptr, ptr %5, align 8
  %51 = getelementptr inbounds nuw i8, ptr %50, i32 1
  store ptr %51, ptr %5, align 8
  store i8 %49, ptr %50, align 1
  br label %52

52:                                               ; preds = %41, %37
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @expand_P1_P2(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %5, align 8
  %8 = load ptr, ptr %4, align 8
  %9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 11
  %10 = load i32, ptr %9, align 4
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 12
  %13 = load i32, ptr %12, align 8
  %14 = add nsw i32 %10, %13
  %15 = sext i32 %14 to i64
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 20
  %19 = load i32, ptr %18, align 8
  %20 = sext i32 %19 to i64
  %21 = call i32 @AES_128_CTR(ptr noundef %7, i64 noundef %15, ptr noundef %16, i64 noundef %20)
  %22 = load ptr, ptr %5, align 8
  %23 = load ptr, ptr %5, align 8
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8
  %30 = sub nsw i32 %26, %29
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 1
  %33 = load i32, ptr %32, align 4
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %34, i32 0, i32 2
  %36 = load i32, ptr %35, align 8
  %37 = sub nsw i32 %33, %36
  %38 = add nsw i32 %37, 1
  %39 = mul nsw i32 %30, %38
  %40 = sdiv i32 %39, 2
  %41 = load ptr, ptr %4, align 8
  %42 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %41, i32 0, i32 21
  %43 = load i32, ptr %42, align 4
  %44 = mul nsw i32 %40, %43
  %45 = load ptr, ptr %4, align 8
  %46 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %45, i32 0, i32 1
  %47 = load i32, ptr %46, align 4
  %48 = load ptr, ptr %4, align 8
  %49 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %48, i32 0, i32 2
  %50 = load i32, ptr %49, align 8
  %51 = sub nsw i32 %47, %50
  %52 = load ptr, ptr %4, align 8
  %53 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %52, i32 0, i32 2
  %54 = load i32, ptr %53, align 8
  %55 = mul nsw i32 %51, %54
  %56 = load ptr, ptr %4, align 8
  %57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %56, i32 0, i32 21
  %58 = load i32, ptr %57, align 4
  %59 = mul nsw i32 %55, %58
  %60 = add nsw i32 %44, %59
  %61 = load ptr, ptr %4, align 8
  %62 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %61, i32 0, i32 21
  %63 = load i32, ptr %62, align 4
  %64 = sdiv i32 %60, %63
  %65 = load ptr, ptr %4, align 8
  %66 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %65, i32 0, i32 0
  %67 = load i32, ptr %66, align 8
  call void @unpack_m_vecs(ptr noundef %22, ptr noundef %23, i32 noundef %64, i32 noundef %67)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_P3(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store ptr %3, ptr %9, align 8
  store ptr %4, ptr %10, align 8
  %14 = load ptr, ptr %6, align 8
  %15 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %14, i32 0, i32 21
  %16 = load i32, ptr %15, align 4
  store i32 %16, ptr %11, align 4
  %17 = load ptr, ptr %6, align 8
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = load ptr, ptr %6, align 8
  %21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 8
  %23 = sub nsw i32 %19, %22
  store i32 %23, ptr %12, align 4
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 8
  store i32 %26, ptr %13, align 4
  %27 = load ptr, ptr %6, align 8
  %28 = load ptr, ptr %7, align 8
  %29 = load ptr, ptr %9, align 8
  %30 = load ptr, ptr %8, align 8
  call void @P1_times_O(ptr noundef %27, ptr noundef %28, ptr noundef %29, ptr noundef %30)
  %31 = load i32, ptr %11, align 4
  %32 = load ptr, ptr %9, align 8
  %33 = load ptr, ptr %8, align 8
  %34 = load ptr, ptr %10, align 8
  %35 = load i32, ptr %12, align 4
  %36 = load i32, ptr %13, align 4
  %37 = load i32, ptr %13, align 4
  call void @mul_add_mat_trans_x_m_mat(i32 noundef %31, ptr noundef %32, ptr noundef %33, ptr noundef %34, i32 noundef %35, i32 noundef %36, i32 noundef %37)
  ret void
}

declare void @m_upper(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @pack_m_vecs(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %12 = load i32, ptr %8, align 4
  %13 = add nsw i32 %12, 15
  %14 = sdiv i32 %13, 16
  store i32 %14, ptr %9, align 4
  %15 = load ptr, ptr %5, align 8
  store ptr %15, ptr %10, align 8
  store i32 0, ptr %11, align 4
  br label %16

16:                                               ; preds = %38, %4
  %17 = load i32, ptr %11, align 4
  %18 = load i32, ptr %7, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %41

20:                                               ; preds = %16
  %21 = load ptr, ptr %6, align 8
  %22 = load i32, ptr %11, align 4
  %23 = load i32, ptr %8, align 4
  %24 = mul nsw i32 %22, %23
  %25 = sdiv i32 %24, 2
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %21, i64 %26
  %28 = load ptr, ptr %10, align 8
  %29 = load i32, ptr %11, align 4
  %30 = load i32, ptr %9, align 4
  %31 = mul nsw i32 %29, %30
  %32 = sext i32 %31 to i64
  %33 = mul i64 %32, 8
  %34 = getelementptr inbounds nuw i8, ptr %28, i64 %33
  %35 = load i32, ptr %8, align 4
  %36 = sdiv i32 %35, 2
  %37 = sext i32 %36 to i64
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %27, ptr align 1 %34, i64 %37, i1 false)
  br label %38

38:                                               ; preds = %20
  %39 = load i32, ptr %11, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, ptr %11, align 4
  br label %16, !llvm.loop !9

41:                                               ; preds = %16
  ret void
}

declare void @mayo_secure_clear(ptr noundef, i64 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr writeonly captures(none), ptr readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @P1_times_O(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 21
  %11 = load i32, ptr %10, align 4
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %17, %20
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 8
  %28 = sub nsw i32 %24, %27
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 2
  %31 = load i32, ptr %30, align 8
  call void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, i32 noundef %21, i32 noundef %28, i32 noundef %31, i32 noundef 1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_mat_trans_x_m_mat(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store i32 %4, ptr %12, align 4
  store i32 %5, ptr %13, align 4
  store i32 %6, ptr %14, align 4
  store i32 0, ptr %15, align 4
  br label %18

18:                                               ; preds = %71, %7
  %19 = load i32, ptr %15, align 4
  %20 = load i32, ptr %13, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %74

22:                                               ; preds = %18
  store i32 0, ptr %16, align 4
  br label %23

23:                                               ; preds = %67, %22
  %24 = load i32, ptr %16, align 4
  %25 = load i32, ptr %12, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %70

27:                                               ; preds = %23
  store i32 0, ptr %17, align 4
  br label %28

28:                                               ; preds = %63, %27
  %29 = load i32, ptr %17, align 4
  %30 = load i32, ptr %14, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %66

32:                                               ; preds = %28
  %33 = load i32, ptr %8, align 4
  %34 = load ptr, ptr %10, align 8
  %35 = load i32, ptr %8, align 4
  %36 = load i32, ptr %16, align 4
  %37 = load i32, ptr %14, align 4
  %38 = mul nsw i32 %36, %37
  %39 = load i32, ptr %17, align 4
  %40 = add nsw i32 %38, %39
  %41 = mul nsw i32 %35, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i64, ptr %34, i64 %42
  %44 = load ptr, ptr %9, align 8
  %45 = load i32, ptr %16, align 4
  %46 = load i32, ptr %13, align 4
  %47 = mul nsw i32 %45, %46
  %48 = load i32, ptr %15, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, ptr %44, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = load ptr, ptr %11, align 8
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %15, align 4
  %56 = load i32, ptr %14, align 4
  %57 = mul nsw i32 %55, %56
  %58 = load i32, ptr %17, align 4
  %59 = add nsw i32 %57, %58
  %60 = mul nsw i32 %54, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i64, ptr %53, i64 %61
  call void @m_vec_mul_add(i32 noundef %33, ptr noundef %43, i8 noundef zeroext %52, ptr noundef %62)
  br label %63

63:                                               ; preds = %32
  %64 = load i32, ptr %17, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %17, align 4
  br label %28, !llvm.loop !10

66:                                               ; preds = %28
  br label %67

67:                                               ; preds = %66
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %16, align 4
  br label %23, !llvm.loop !11

70:                                               ; preds = %23
  br label %71

71:                                               ; preds = %70
  %72 = load i32, ptr %15, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %15, align 4
  br label %18, !llvm.loop !12

74:                                               ; preds = %18
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_mul_add(i32 noundef %0, ptr noundef %1, i8 noundef zeroext %2, ptr noundef %3) #0 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
  store ptr %1, ptr %6, align 8
  store i8 %2, ptr %7, align 1
  store ptr %3, ptr %8, align 8
  store i32 0, ptr %9, align 4
  br label %10

10:                                               ; preds = %28, %4
  %11 = load i32, ptr %9, align 4
  %12 = load i32, ptr %5, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %31

14:                                               ; preds = %10
  %15 = load ptr, ptr %6, align 8
  %16 = load i32, ptr %9, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i64, ptr %15, i64 %17
  %19 = load i64, ptr %18, align 8
  %20 = load i8, ptr %7, align 1
  %21 = call i64 @gf16v_mul_u64(i64 noundef %19, i8 noundef zeroext %20)
  %22 = load ptr, ptr %8, align 8
  %23 = load i32, ptr %9, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i64, ptr %22, i64 %24
  %26 = load i64, ptr %25, align 8
  %27 = xor i64 %26, %21
  store i64 %27, ptr %25, align 8
  br label %28

28:                                               ; preds = %14
  %29 = load i32, ptr %9, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %9, align 4
  br label %10, !llvm.loop !13

31:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @gf16v_mul_u64(i64 noundef %0, i8 noundef zeroext %1) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
  store i8 %1, ptr %4, align 1
  store i64 -8608480567731124088, ptr %5, align 8
  %10 = load i64, ptr %3, align 8
  store i64 %10, ptr %7, align 8
  %11 = load i8, ptr %4, align 1
  %12 = zext i8 %11 to i32
  %13 = load volatile i8, ptr @unsigned_char_blocker, align 1
  %14 = zext i8 %13 to i32
  %15 = xor i32 %12, %14
  %16 = sext i32 %15 to i64
  store i64 %16, ptr %8, align 8
  %17 = load i64, ptr %7, align 8
  %18 = load i64, ptr %8, align 8
  %19 = and i64 %18, 1
  %20 = mul i64 %17, %19
  store i64 %20, ptr %9, align 8
  %21 = load i64, ptr %7, align 8
  %22 = load i64, ptr %5, align 8
  %23 = and i64 %21, %22
  store i64 %23, ptr %6, align 8
  %24 = load i64, ptr %6, align 8
  %25 = load i64, ptr %7, align 8
  %26 = xor i64 %25, %24
  store i64 %26, ptr %7, align 8
  %27 = load i64, ptr %7, align 8
  %28 = shl i64 %27, 1
  %29 = load i64, ptr %6, align 8
  %30 = lshr i64 %29, 3
  %31 = mul i64 %30, 3
  %32 = xor i64 %28, %31
  store i64 %32, ptr %7, align 8
  %33 = load i64, ptr %7, align 8
  %34 = load i64, ptr %8, align 8
  %35 = lshr i64 %34, 1
  %36 = and i64 %35, 1
  %37 = mul i64 %33, %36
  %38 = load i64, ptr %9, align 8
  %39 = xor i64 %38, %37
  store i64 %39, ptr %9, align 8
  %40 = load i64, ptr %7, align 8
  %41 = load i64, ptr %5, align 8
  %42 = and i64 %40, %41
  store i64 %42, ptr %6, align 8
  %43 = load i64, ptr %6, align 8
  %44 = load i64, ptr %7, align 8
  %45 = xor i64 %44, %43
  store i64 %45, ptr %7, align 8
  %46 = load i64, ptr %7, align 8
  %47 = shl i64 %46, 1
  %48 = load i64, ptr %6, align 8
  %49 = lshr i64 %48, 3
  %50 = mul i64 %49, 3
  %51 = xor i64 %47, %50
  store i64 %51, ptr %7, align 8
  %52 = load i64, ptr %7, align 8
  %53 = load i64, ptr %8, align 8
  %54 = lshr i64 %53, 2
  %55 = and i64 %54, 1
  %56 = mul i64 %52, %55
  %57 = load i64, ptr %9, align 8
  %58 = xor i64 %57, %56
  store i64 %58, ptr %9, align 8
  %59 = load i64, ptr %7, align 8
  %60 = load i64, ptr %5, align 8
  %61 = and i64 %59, %60
  store i64 %61, ptr %6, align 8
  %62 = load i64, ptr %6, align 8
  %63 = load i64, ptr %7, align 8
  %64 = xor i64 %63, %62
  store i64 %64, ptr %7, align 8
  %65 = load i64, ptr %7, align 8
  %66 = shl i64 %65, 1
  %67 = load i64, ptr %6, align 8
  %68 = lshr i64 %67, 3
  %69 = mul i64 %68, 3
  %70 = xor i64 %66, %69
  store i64 %70, ptr %7, align 8
  %71 = load i64, ptr %7, align 8
  %72 = load i64, ptr %8, align 8
  %73 = lshr i64 %72, 3
  %74 = and i64 %73, 1
  %75 = mul i64 %71, %74
  %76 = load i64, ptr %9, align 8
  %77 = xor i64 %76, %75
  store i64 %77, ptr %9, align 8
  %78 = load i64, ptr %9, align 8
  ret i64 %78
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store ptr %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store ptr %3, ptr %12, align 8
  store i32 %4, ptr %13, align 4
  store i32 %5, ptr %14, align 4
  store i32 %6, ptr %15, align 4
  store i32 %7, ptr %16, align 4
  store i32 0, ptr %17, align 4
  store i32 0, ptr %18, align 4
  br label %21

21:                                               ; preds = %75, %8
  %22 = load i32, ptr %18, align 4
  %23 = load i32, ptr %13, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %78

25:                                               ; preds = %21
  %26 = load i32, ptr %16, align 4
  %27 = load i32, ptr %18, align 4
  %28 = mul nsw i32 %26, %27
  store i32 %28, ptr %19, align 4
  br label %29

29:                                               ; preds = %71, %25
  %30 = load i32, ptr %19, align 4
  %31 = load i32, ptr %14, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %74

33:                                               ; preds = %29
  store i32 0, ptr %20, align 4
  br label %34

34:                                               ; preds = %65, %33
  %35 = load i32, ptr %20, align 4
  %36 = load i32, ptr %15, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %68

38:                                               ; preds = %34
  %39 = load i32, ptr %9, align 4
  %40 = load ptr, ptr %10, align 8
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %17, align 4
  %43 = mul nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i64, ptr %40, i64 %44
  %46 = load ptr, ptr %11, align 8
  %47 = load i32, ptr %19, align 4
  %48 = load i32, ptr %15, align 4
  %49 = mul nsw i32 %47, %48
  %50 = load i32, ptr %20, align 4
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %46, i64 %52
  %54 = load i8, ptr %53, align 1
  %55 = load ptr, ptr %12, align 8
  %56 = load i32, ptr %9, align 4
  %57 = load i32, ptr %18, align 4
  %58 = load i32, ptr %15, align 4
  %59 = mul nsw i32 %57, %58
  %60 = load i32, ptr %20, align 4
  %61 = add nsw i32 %59, %60
  %62 = mul nsw i32 %56, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i64, ptr %55, i64 %63
  call void @m_vec_mul_add(i32 noundef %39, ptr noundef %45, i8 noundef zeroext %54, ptr noundef %64)
  br label %65

65:                                               ; preds = %38
  %66 = load i32, ptr %20, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %20, align 4
  br label %34, !llvm.loop !14

68:                                               ; preds = %34
  %69 = load i32, ptr %17, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %17, align 4
  br label %71

71:                                               ; preds = %68
  %72 = load i32, ptr %19, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %19, align 4
  br label %29, !llvm.loop !15

74:                                               ; preds = %29
  br label %75

75:                                               ; preds = %74
  %76 = load i32, ptr %18, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %18, align 4
  br label %21, !llvm.loop !16

78:                                               ; preds = %21
  ret void
}

declare i32 @AES_128_CTR(ptr noundef, i64 noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @unpack_m_vecs(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca [9 x i64], align 16
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  %13 = load i32, ptr %8, align 4
  %14 = add nsw i32 %13, 15
  %15 = sdiv i32 %14, 16
  store i32 %15, ptr %9, align 4
  %16 = load ptr, ptr %6, align 8
  store ptr %16, ptr %10, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %11, i8 0, i64 72, i1 false)
  %17 = load i32, ptr %7, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, ptr %12, align 4
  br label %19

19:                                               ; preds = %45, %4
  %20 = load i32, ptr %12, align 4
  %21 = icmp sge i32 %20, 0
  br i1 %21, label %22, label %48

22:                                               ; preds = %19
  %23 = getelementptr inbounds [9 x i64], ptr %11, i64 0, i64 0
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %12, align 4
  %26 = load i32, ptr %8, align 4
  %27 = mul nsw i32 %25, %26
  %28 = sdiv i32 %27, 2
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %24, i64 %29
  %31 = load i32, ptr %8, align 4
  %32 = sdiv i32 %31, 2
  %33 = sext i32 %32 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %23, ptr align 1 %30, i64 %33, i1 false)
  %34 = load ptr, ptr %10, align 8
  %35 = load i32, ptr %12, align 4
  %36 = load i32, ptr %9, align 4
  %37 = mul nsw i32 %35, %36
  %38 = sext i32 %37 to i64
  %39 = mul i64 %38, 8
  %40 = getelementptr inbounds nuw i8, ptr %34, i64 %39
  %41 = getelementptr inbounds [9 x i64], ptr %11, i64 0, i64 0
  %42 = load i32, ptr %9, align 4
  %43 = sext i32 %42 to i64
  %44 = mul i64 %43, 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %40, ptr align 16 %41, i64 %44, i1 false)
  br label %45

45:                                               ; preds = %22
  %46 = load i32, ptr %12, align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, ptr %12, align 4
  br label %19, !llvm.loop !17

48:                                               ; preds = %19
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_expand_sk(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca [868 x i8], align 16
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca ptr, align 8
  %17 = alloca ptr, align 8
  %18 = alloca ptr, align 8
  %19 = alloca ptr, align 8
  %20 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  %21 = load ptr, ptr %6, align 8
  %22 = getelementptr inbounds nuw %struct.sk_t, ptr %21, i32 0, i32 0
  %23 = getelementptr inbounds [113103 x i64], ptr %22, i64 0, i64 0
  store ptr %23, ptr %9, align 8
  %24 = load ptr, ptr %6, align 8
  %25 = getelementptr inbounds nuw %struct.sk_t, ptr %24, i32 0, i32 1
  %26 = getelementptr inbounds [2414 x i8], ptr %25, i64 0, i64 0
  store ptr %26, ptr %10, align 8
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8
  store i32 %29, ptr %11, align 4
  %30 = load ptr, ptr %4, align 8
  %31 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 1
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %4, align 8
  %34 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 2
  %35 = load i32, ptr %34, align 8
  %36 = sub nsw i32 %32, %35
  store i32 %36, ptr %12, align 4
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 7
  %39 = load i32, ptr %38, align 4
  store i32 %39, ptr %13, align 4
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 20
  %42 = load i32, ptr %41, align 8
  store i32 %42, ptr %14, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 18
  %45 = load i32, ptr %44, align 8
  store i32 %45, ptr %15, align 4
  %46 = load ptr, ptr %5, align 8
  store ptr %46, ptr %16, align 8
  %47 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0
  store ptr %47, ptr %17, align 8
  %48 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0
  %49 = load i32, ptr %14, align 4
  %50 = load i32, ptr %13, align 4
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = load ptr, ptr %16, align 8
  %54 = load i32, ptr %15, align 4
  %55 = sext i32 %54 to i64
  %56 = call i32 @shake256(ptr noundef %48, i64 noundef %52, ptr noundef %53, i64 noundef %55)
  %57 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0
  %58 = load i32, ptr %14, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i8, ptr %57, i64 %59
  %61 = load ptr, ptr %10, align 8
  %62 = load i32, ptr %12, align 4
  %63 = load i32, ptr %11, align 4
  %64 = mul nsw i32 %62, %63
  call void @decode(ptr noundef %60, ptr noundef %61, i32 noundef %64)
  %65 = load ptr, ptr %4, align 8
  %66 = load ptr, ptr %9, align 8
  %67 = load ptr, ptr %17, align 8
  call void @expand_P1_P2(ptr noundef %65, ptr noundef %66, ptr noundef %67)
  %68 = load ptr, ptr %9, align 8
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %69, i32 0, i32 1
  %71 = load i32, ptr %70, align 4
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %72, i32 0, i32 2
  %74 = load i32, ptr %73, align 8
  %75 = sub nsw i32 %71, %74
  %76 = load ptr, ptr %4, align 8
  %77 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %76, i32 0, i32 1
  %78 = load i32, ptr %77, align 4
  %79 = load ptr, ptr %4, align 8
  %80 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %79, i32 0, i32 2
  %81 = load i32, ptr %80, align 8
  %82 = sub nsw i32 %78, %81
  %83 = add nsw i32 %82, 1
  %84 = mul nsw i32 %75, %83
  %85 = sdiv i32 %84, 2
  %86 = load ptr, ptr %4, align 8
  %87 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %86, i32 0, i32 21
  %88 = load i32, ptr %87, align 4
  %89 = mul nsw i32 %85, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i64, ptr %68, i64 %90
  store ptr %91, ptr %18, align 8
  %92 = load ptr, ptr %9, align 8
  store ptr %92, ptr %19, align 8
  %93 = load ptr, ptr %18, align 8
  store ptr %93, ptr %20, align 8
  %94 = load ptr, ptr %4, align 8
  %95 = load ptr, ptr %19, align 8
  %96 = load ptr, ptr %10, align 8
  %97 = load ptr, ptr %20, align 8
  call void @P1P1t_times_O(ptr noundef %94, ptr noundef %95, ptr noundef %96, ptr noundef %97)
  %98 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %98, i64 noundef 868)
  %99 = load i32, ptr %7, align 4
  ret i32 %99
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @P1P1t_times_O(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %16 = load ptr, ptr %5, align 8
  %17 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 2
  %18 = load i32, ptr %17, align 8
  store i32 %18, ptr %9, align 4
  %19 = load ptr, ptr %5, align 8
  %20 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 1
  %21 = load i32, ptr %20, align 4
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 2
  %24 = load i32, ptr %23, align 8
  %25 = sub nsw i32 %21, %24
  store i32 %25, ptr %10, align 4
  %26 = load ptr, ptr %5, align 8
  %27 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 21
  %28 = load i32, ptr %27, align 4
  store i32 %28, ptr %11, align 4
  store i32 0, ptr %12, align 4
  store i32 0, ptr %13, align 4
  br label %29

29:                                               ; preds = %114, %4
  %30 = load i32, ptr %13, align 4
  %31 = load i32, ptr %10, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %117

33:                                               ; preds = %29
  %34 = load i32, ptr %13, align 4
  store i32 %34, ptr %14, align 4
  br label %35

35:                                               ; preds = %110, %33
  %36 = load i32, ptr %14, align 4
  %37 = load i32, ptr %10, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %113

39:                                               ; preds = %35
  %40 = load i32, ptr %14, align 4
  %41 = load i32, ptr %13, align 4
  %42 = icmp eq i32 %40, %41
  br i1 %42, label %43, label %46

43:                                               ; preds = %39
  %44 = load i32, ptr %12, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, ptr %12, align 4
  br label %110

46:                                               ; preds = %39
  store i32 0, ptr %15, align 4
  br label %47

47:                                               ; preds = %104, %46
  %48 = load i32, ptr %15, align 4
  %49 = load i32, ptr %9, align 4
  %50 = icmp slt i32 %48, %49
  br i1 %50, label %51, label %107

51:                                               ; preds = %47
  %52 = load i32, ptr %11, align 4
  %53 = load ptr, ptr %6, align 8
  %54 = load i32, ptr %11, align 4
  %55 = load i32, ptr %12, align 4
  %56 = mul nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i64, ptr %53, i64 %57
  %59 = load ptr, ptr %7, align 8
  %60 = load i32, ptr %14, align 4
  %61 = load i32, ptr %9, align 4
  %62 = mul nsw i32 %60, %61
  %63 = load i32, ptr %15, align 4
  %64 = add nsw i32 %62, %63
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i8, ptr %59, i64 %65
  %67 = load i8, ptr %66, align 1
  %68 = load ptr, ptr %8, align 8
  %69 = load i32, ptr %11, align 4
  %70 = load i32, ptr %13, align 4
  %71 = load i32, ptr %9, align 4
  %72 = mul nsw i32 %70, %71
  %73 = load i32, ptr %15, align 4
  %74 = add nsw i32 %72, %73
  %75 = mul nsw i32 %69, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds i64, ptr %68, i64 %76
  call void @m_vec_mul_add(i32 noundef %52, ptr noundef %58, i8 noundef zeroext %67, ptr noundef %77)
  %78 = load i32, ptr %11, align 4
  %79 = load ptr, ptr %6, align 8
  %80 = load i32, ptr %11, align 4
  %81 = load i32, ptr %12, align 4
  %82 = mul nsw i32 %80, %81
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i64, ptr %79, i64 %83
  %85 = load ptr, ptr %7, align 8
  %86 = load i32, ptr %13, align 4
  %87 = load i32, ptr %9, align 4
  %88 = mul nsw i32 %86, %87
  %89 = load i32, ptr %15, align 4
  %90 = add nsw i32 %88, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, ptr %85, i64 %91
  %93 = load i8, ptr %92, align 1
  %94 = load ptr, ptr %8, align 8
  %95 = load i32, ptr %11, align 4
  %96 = load i32, ptr %14, align 4
  %97 = load i32, ptr %9, align 4
  %98 = mul nsw i32 %96, %97
  %99 = load i32, ptr %15, align 4
  %100 = add nsw i32 %98, %99
  %101 = mul nsw i32 %95, %100
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds i64, ptr %94, i64 %102
  call void @m_vec_mul_add(i32 noundef %78, ptr noundef %84, i8 noundef zeroext %93, ptr noundef %103)
  br label %104

104:                                              ; preds = %51
  %105 = load i32, ptr %15, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, ptr %15, align 4
  br label %47, !llvm.loop !18

107:                                              ; preds = %47
  %108 = load i32, ptr %12, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %12, align 4
  br label %110

110:                                              ; preds = %107, %43
  %111 = load i32, ptr %14, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, ptr %14, align 4
  br label %35, !llvm.loop !19

113:                                              ; preds = %35
  br label %114

114:                                              ; preds = %113
  %115 = load i32, ptr %13, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, ptr %13, align 4
  br label %29, !llvm.loop !20

117:                                              ; preds = %29
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_sign_signature(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca [71 x i8], align 16
  %15 = alloca [142 x i8], align 16
  %16 = alloca [142 x i8], align 16
  %17 = alloca [40 x i8], align 16
  %18 = alloca [924 x i8], align 16
  %19 = alloca [1704 x i8], align 16
  %20 = alloca [29520 x i8], align 16
  %21 = alloca [1848 x i8], align 16
  %22 = alloca [205 x i8], align 16
  %23 = alloca [1848 x i8], align 16
  %24 = alloca ptr, align 8
  %25 = alloca %struct.sk_t, align 32
  %26 = alloca [142 x i8], align 16
  %27 = alloca [145 x i8], align 16
  %28 = alloca ptr, align 8
  %29 = alloca ptr, align 8
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca ptr, align 8
  %44 = alloca ptr, align 8
  %45 = alloca [1836 x i64], align 16
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store i32 0, ptr %13, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %20, i8 0, i64 29520, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %22, i8 0, i64 205, i1 false)
  %50 = load ptr, ptr %7, align 8
  %51 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %50, i32 0, i32 0
  %52 = load i32, ptr %51, align 8
  store i32 %52, ptr %30, align 4
  %53 = load ptr, ptr %7, align 8
  %54 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %53, i32 0, i32 1
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr %31, align 4
  %56 = load ptr, ptr %7, align 8
  %57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %56, i32 0, i32 2
  %58 = load i32, ptr %57, align 8
  store i32 %58, ptr %32, align 4
  %59 = load ptr, ptr %7, align 8
  %60 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %59, i32 0, i32 3
  %61 = load i32, ptr %60, align 4
  store i32 %61, ptr %33, align 4
  %62 = load ptr, ptr %7, align 8
  %63 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %62, i32 0, i32 1
  %64 = load i32, ptr %63, align 4
  %65 = load ptr, ptr %7, align 8
  %66 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %65, i32 0, i32 2
  %67 = load i32, ptr %66, align 8
  %68 = sub nsw i32 %64, %67
  store i32 %68, ptr %34, align 4
  %69 = load ptr, ptr %7, align 8
  %70 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %69, i32 0, i32 6
  %71 = load i32, ptr %70, align 8
  store i32 %71, ptr %35, align 4
  %72 = load ptr, ptr %7, align 8
  %73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %72, i32 0, i32 8
  %74 = load i32, ptr %73, align 8
  store i32 %74, ptr %36, align 4
  %75 = load ptr, ptr %7, align 8
  %76 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %75, i32 0, i32 9
  %77 = load i32, ptr %76, align 4
  store i32 %77, ptr %37, align 4
  %78 = load ptr, ptr %7, align 8
  %79 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %78, i32 0, i32 16
  %80 = load i32, ptr %79, align 8
  store i32 %80, ptr %38, align 4
  %81 = load ptr, ptr %7, align 8
  %82 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %81, i32 0, i32 3
  %83 = load i32, ptr %82, align 4
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %84, i32 0, i32 2
  %86 = load i32, ptr %85, align 8
  %87 = mul nsw i32 %83, %86
  %88 = add nsw i32 %87, 1
  store i32 %88, ptr %39, align 4
  %89 = load ptr, ptr %7, align 8
  %90 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %89, i32 0, i32 19
  %91 = load i32, ptr %90, align 4
  store i32 %91, ptr %40, align 4
  %92 = load ptr, ptr %7, align 8
  %93 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %92, i32 0, i32 18
  %94 = load i32, ptr %93, align 8
  store i32 %94, ptr %41, align 4
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %95, i32 0, i32 17
  %97 = load i32, ptr %96, align 4
  store i32 %97, ptr %42, align 4
  %98 = load ptr, ptr %7, align 8
  %99 = load ptr, ptr %12, align 8
  %100 = call i32 @mayo_expand_sk(ptr noundef %98, ptr noundef %99, ptr noundef %25)
  store i32 %100, ptr %13, align 4
  %101 = load i32, ptr %13, align 4
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %104

103:                                              ; preds = %6
  br label %386

104:                                              ; preds = %6
  %105 = load ptr, ptr %12, align 8
  store ptr %105, ptr %24, align 8
  %106 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %107 = load i32, ptr %40, align 4
  %108 = sext i32 %107 to i64
  %109 = load ptr, ptr %10, align 8
  %110 = load i64, ptr %11, align 8
  %111 = call i32 @shake256(ptr noundef %106, i64 noundef %108, ptr noundef %109, i64 noundef %110)
  %112 = getelementptr inbounds nuw %struct.sk_t, ptr %25, i32 0, i32 0
  %113 = getelementptr inbounds [113103 x i64], ptr %112, i64 0, i64 0
  store ptr %113, ptr %43, align 8
  %114 = load ptr, ptr %43, align 8
  %115 = load ptr, ptr %7, align 8
  %116 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %115, i32 0, i32 1
  %117 = load i32, ptr %116, align 4
  %118 = load ptr, ptr %7, align 8
  %119 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %118, i32 0, i32 2
  %120 = load i32, ptr %119, align 8
  %121 = sub nsw i32 %117, %120
  %122 = load ptr, ptr %7, align 8
  %123 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %122, i32 0, i32 1
  %124 = load i32, ptr %123, align 4
  %125 = load ptr, ptr %7, align 8
  %126 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %125, i32 0, i32 2
  %127 = load i32, ptr %126, align 8
  %128 = sub nsw i32 %124, %127
  %129 = add nsw i32 %128, 1
  %130 = mul nsw i32 %121, %129
  %131 = sdiv i32 %130, 2
  %132 = load ptr, ptr %7, align 8
  %133 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %132, i32 0, i32 21
  %134 = load i32, ptr %133, align 4
  %135 = mul nsw i32 %131, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i64, ptr %114, i64 %136
  store ptr %137, ptr %44, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %45, i8 0, i64 14688, i1 false)
  %138 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %139 = load i32, ptr %40, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i8, ptr %138, i64 %140
  %142 = load i32, ptr %42, align 4
  %143 = sext i32 %142 to i64
  %144 = call i32 @randombytes(ptr noundef %141, i64 noundef %143)
  %145 = icmp ne i32 %144, 0
  br i1 %145, label %146, label %147

146:                                              ; preds = %104
  store i32 1, ptr %13, align 4
  br label %386

147:                                              ; preds = %104
  %148 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %149 = load i32, ptr %40, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i8, ptr %148, i64 %150
  %152 = load i32, ptr %42, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds i8, ptr %151, i64 %153
  %155 = load ptr, ptr %24, align 8
  %156 = load i32, ptr %41, align 4
  %157 = sext i32 %156 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %154, ptr align 1 %155, i64 %157, i1 false)
  %158 = getelementptr inbounds [40 x i8], ptr %17, i64 0, i64 0
  %159 = load i32, ptr %42, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %162 = load i32, ptr %40, align 4
  %163 = load i32, ptr %42, align 4
  %164 = add nsw i32 %162, %163
  %165 = load i32, ptr %41, align 4
  %166 = add nsw i32 %164, %165
  %167 = sext i32 %166 to i64
  %168 = call i32 @shake256(ptr noundef %158, i64 noundef %160, ptr noundef %161, i64 noundef %167)
  %169 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %170 = load i32, ptr %40, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i8, ptr %169, i64 %171
  %173 = getelementptr inbounds [40 x i8], ptr %17, i64 0, i64 0
  %174 = load i32, ptr %42, align 4
  %175 = sext i32 %174 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %172, ptr align 16 %173, i64 %175, i1 false)
  %176 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %177 = load i32, ptr %40, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds i8, ptr %176, i64 %178
  %180 = load i32, ptr %42, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds i8, ptr %179, i64 %181
  %183 = load i32, ptr %41, align 4
  %184 = sext i32 %183 to i64
  %185 = getelementptr inbounds i8, ptr %182, i64 %184
  store ptr %185, ptr %28, align 8
  %186 = getelementptr inbounds [71 x i8], ptr %14, i64 0, i64 0
  %187 = load i32, ptr %35, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %190 = load i32, ptr %40, align 4
  %191 = load i32, ptr %42, align 4
  %192 = add nsw i32 %190, %191
  %193 = sext i32 %192 to i64
  %194 = call i32 @shake256(ptr noundef %186, i64 noundef %188, ptr noundef %189, i64 noundef %193)
  %195 = getelementptr inbounds [71 x i8], ptr %14, i64 0, i64 0
  %196 = getelementptr inbounds [142 x i8], ptr %15, i64 0, i64 0
  %197 = load i32, ptr %30, align 4
  call void @decode(ptr noundef %195, ptr noundef %196, i32 noundef %197)
  store i32 0, ptr %46, align 4
  br label %198

198:                                              ; preds = %302, %147
  %199 = load i32, ptr %46, align 4
  %200 = icmp sle i32 %199, 255
  br i1 %200, label %201, label %305

201:                                              ; preds = %198
  %202 = load i32, ptr %46, align 4
  %203 = trunc i32 %202 to i8
  %204 = load ptr, ptr %28, align 8
  store i8 %203, ptr %204, align 1
  %205 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0
  %206 = load i32, ptr %33, align 4
  %207 = load i32, ptr %36, align 4
  %208 = mul nsw i32 %206, %207
  %209 = load i32, ptr %37, align 4
  %210 = add nsw i32 %208, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  %213 = load i32, ptr %40, align 4
  %214 = load i32, ptr %42, align 4
  %215 = add nsw i32 %213, %214
  %216 = load i32, ptr %41, align 4
  %217 = add nsw i32 %215, %216
  %218 = add nsw i32 %217, 1
  %219 = sext i32 %218 to i64
  %220 = call i32 @shake256(ptr noundef %205, i64 noundef %211, ptr noundef %212, i64 noundef %219)
  store i32 0, ptr %47, align 4
  br label %221

221:                                              ; preds = %240, %201
  %222 = load i32, ptr %47, align 4
  %223 = load i32, ptr %33, align 4
  %224 = sub nsw i32 %223, 1
  %225 = icmp sle i32 %222, %224
  br i1 %225, label %226, label %243

226:                                              ; preds = %221
  %227 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0
  %228 = load i32, ptr %47, align 4
  %229 = load i32, ptr %36, align 4
  %230 = mul nsw i32 %228, %229
  %231 = sext i32 %230 to i64
  %232 = getelementptr inbounds i8, ptr %227, i64 %231
  %233 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0
  %234 = load i32, ptr %47, align 4
  %235 = load i32, ptr %34, align 4
  %236 = mul nsw i32 %234, %235
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds i8, ptr %233, i64 %237
  %239 = load i32, ptr %34, align 4
  call void @decode(ptr noundef %232, ptr noundef %238, i32 noundef %239)
  br label %240

240:                                              ; preds = %226
  %241 = load i32, ptr %47, align 4
  %242 = add nsw i32 %241, 1
  store i32 %242, ptr %47, align 4
  br label %221, !llvm.loop !21

243:                                              ; preds = %221
  %244 = load ptr, ptr %7, align 8
  %245 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0
  %246 = load ptr, ptr %44, align 8
  %247 = load ptr, ptr %43, align 8
  %248 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0
  %249 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0
  call void @compute_M_and_VPV(ptr noundef %244, ptr noundef %245, ptr noundef %246, ptr noundef %247, ptr noundef %248, ptr noundef %249)
  %250 = load ptr, ptr %7, align 8
  %251 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0
  %252 = getelementptr inbounds [142 x i8], ptr %15, i64 0, i64 0
  %253 = getelementptr inbounds [142 x i8], ptr %16, i64 0, i64 0
  call void @compute_rhs(ptr noundef %250, ptr noundef %251, ptr noundef %252, ptr noundef %253)
  %254 = load ptr, ptr %7, align 8
  %255 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0
  %256 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0
  call void @compute_A(ptr noundef %254, ptr noundef %255, ptr noundef %256)
  store i32 0, ptr %48, align 4
  br label %257

257:                                              ; preds = %272, %243
  %258 = load i32, ptr %48, align 4
  %259 = load i32, ptr %30, align 4
  %260 = icmp slt i32 %258, %259
  br i1 %260, label %261, label %275

261:                                              ; preds = %257
  %262 = load i32, ptr %48, align 4
  %263 = add nsw i32 1, %262
  %264 = load i32, ptr %33, align 4
  %265 = load i32, ptr %32, align 4
  %266 = mul nsw i32 %264, %265
  %267 = add nsw i32 %266, 1
  %268 = mul nsw i32 %263, %267
  %269 = sub nsw i32 %268, 1
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 %270
  store i8 0, ptr %271, align 1
  br label %272

272:                                              ; preds = %261
  %273 = load i32, ptr %48, align 4
  %274 = add nsw i32 %273, 1
  store i32 %274, ptr %48, align 4
  br label %257, !llvm.loop !22

275:                                              ; preds = %257
  %276 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0
  %277 = load i32, ptr %33, align 4
  %278 = load i32, ptr %36, align 4
  %279 = mul nsw i32 %277, %278
  %280 = sext i32 %279 to i64
  %281 = getelementptr inbounds i8, ptr %276, i64 %280
  %282 = getelementptr inbounds [205 x i8], ptr %22, i64 0, i64 0
  %283 = load i32, ptr %33, align 4
  %284 = load i32, ptr %32, align 4
  %285 = mul nsw i32 %283, %284
  call void @decode(ptr noundef %281, ptr noundef %282, i32 noundef %285)
  %286 = load ptr, ptr %7, align 8
  %287 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0
  %288 = getelementptr inbounds [142 x i8], ptr %16, i64 0, i64 0
  %289 = getelementptr inbounds [205 x i8], ptr %22, i64 0, i64 0
  %290 = getelementptr inbounds [1848 x i8], ptr %21, i64 0, i64 0
  %291 = load i32, ptr %33, align 4
  %292 = load i32, ptr %32, align 4
  %293 = load i32, ptr %30, align 4
  %294 = load i32, ptr %39, align 4
  %295 = call i32 @sample_solution(ptr noundef %286, ptr noundef %287, ptr noundef %288, ptr noundef %289, ptr noundef %290, i32 noundef %291, i32 noundef %292, i32 noundef %293, i32 noundef %294)
  %296 = icmp ne i32 %295, 0
  br i1 %296, label %297, label %298

297:                                              ; preds = %275
  br label %305

298:                                              ; preds = %275
  %299 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %299, i8 0, i64 14688, i1 false)
  %300 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0
  call void @llvm.memset.p0.i64(ptr align 16 %300, i8 0, i64 29520, i1 false)
  br label %301

301:                                              ; preds = %298
  br label %302

302:                                              ; preds = %301
  %303 = load i32, ptr %46, align 4
  %304 = add nsw i32 %303, 1
  store i32 %304, ptr %46, align 4
  br label %198, !llvm.loop !23

305:                                              ; preds = %297, %198
  store i32 0, ptr %49, align 4
  br label %306

306:                                              ; preds = %363, %305
  %307 = load i32, ptr %49, align 4
  %308 = load i32, ptr %33, align 4
  %309 = sub nsw i32 %308, 1
  %310 = icmp sle i32 %307, %309
  br i1 %310, label %311, label %366

311:                                              ; preds = %306
  %312 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0
  %313 = load i32, ptr %49, align 4
  %314 = load i32, ptr %31, align 4
  %315 = load i32, ptr %32, align 4
  %316 = sub nsw i32 %314, %315
  %317 = mul nsw i32 %313, %316
  %318 = sext i32 %317 to i64
  %319 = getelementptr inbounds i8, ptr %312, i64 %318
  store ptr %319, ptr %29, align 8
  %320 = getelementptr inbounds nuw %struct.sk_t, ptr %25, i32 0, i32 1
  %321 = getelementptr inbounds [2414 x i8], ptr %320, i64 0, i64 0
  %322 = getelementptr inbounds [1848 x i8], ptr %21, i64 0, i64 0
  %323 = load i32, ptr %49, align 4
  %324 = load i32, ptr %32, align 4
  %325 = mul nsw i32 %323, %324
  %326 = sext i32 %325 to i64
  %327 = getelementptr inbounds i8, ptr %322, i64 %326
  %328 = getelementptr inbounds [142 x i8], ptr %26, i64 0, i64 0
  %329 = load i32, ptr %32, align 4
  %330 = load i32, ptr %31, align 4
  %331 = load i32, ptr %32, align 4
  %332 = sub nsw i32 %330, %331
  call void @mat_mul(ptr noundef %321, ptr noundef %327, ptr noundef %328, i32 noundef %329, i32 noundef %332, i32 noundef 1)
  %333 = load ptr, ptr %29, align 8
  %334 = getelementptr inbounds [142 x i8], ptr %26, i64 0, i64 0
  %335 = getelementptr inbounds [1848 x i8], ptr %23, i64 0, i64 0
  %336 = load i32, ptr %49, align 4
  %337 = load i32, ptr %31, align 4
  %338 = mul nsw i32 %336, %337
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds i8, ptr %335, i64 %339
  %341 = load i32, ptr %31, align 4
  %342 = load i32, ptr %32, align 4
  %343 = sub nsw i32 %341, %342
  call void @mat_add(ptr noundef %333, ptr noundef %334, ptr noundef %340, i32 noundef %343, i32 noundef 1)
  %344 = getelementptr inbounds [1848 x i8], ptr %23, i64 0, i64 0
  %345 = load i32, ptr %49, align 4
  %346 = load i32, ptr %31, align 4
  %347 = mul nsw i32 %345, %346
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i8, ptr %344, i64 %348
  %350 = load i32, ptr %31, align 4
  %351 = load i32, ptr %32, align 4
  %352 = sub nsw i32 %350, %351
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds i8, ptr %349, i64 %353
  %355 = getelementptr inbounds [1848 x i8], ptr %21, i64 0, i64 0
  %356 = load i32, ptr %49, align 4
  %357 = load i32, ptr %32, align 4
  %358 = mul nsw i32 %356, %357
  %359 = sext i32 %358 to i64
  %360 = getelementptr inbounds i8, ptr %355, i64 %359
  %361 = load i32, ptr %32, align 4
  %362 = sext i32 %361 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %354, ptr align 1 %360, i64 %362, i1 false)
  br label %363

363:                                              ; preds = %311
  %364 = load i32, ptr %49, align 4
  %365 = add nsw i32 %364, 1
  store i32 %365, ptr %49, align 4
  br label %306, !llvm.loop !24

366:                                              ; preds = %306
  %367 = getelementptr inbounds [1848 x i8], ptr %23, i64 0, i64 0
  %368 = load ptr, ptr %8, align 8
  %369 = load i32, ptr %31, align 4
  %370 = load i32, ptr %33, align 4
  %371 = mul nsw i32 %369, %370
  call void @encode(ptr noundef %367, ptr noundef %368, i32 noundef %371)
  %372 = load ptr, ptr %8, align 8
  %373 = load i32, ptr %38, align 4
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds i8, ptr %372, i64 %374
  %376 = load i32, ptr %42, align 4
  %377 = sext i32 %376 to i64
  %378 = sub i64 0, %377
  %379 = getelementptr inbounds i8, ptr %375, i64 %378
  %380 = getelementptr inbounds [40 x i8], ptr %17, i64 0, i64 0
  %381 = load i32, ptr %42, align 4
  %382 = sext i32 %381 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %379, ptr align 16 %380, i64 %382, i1 false)
  %383 = load i32, ptr %38, align 4
  %384 = sext i32 %383 to i64
  %385 = load ptr, ptr %9, align 8
  store i64 %384, ptr %385, align 8
  br label %386

386:                                              ; preds = %366, %146, %103
  %387 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %387, i64 noundef 924)
  %388 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %388, i64 noundef 1704)
  %389 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %389, i64 noundef 29520)
  %390 = getelementptr inbounds [205 x i8], ptr %22, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %390, i64 noundef 205)
  %391 = getelementptr inbounds nuw %struct.sk_t, ptr %25, i32 0, i32 1
  %392 = getelementptr inbounds [2414 x i8], ptr %391, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %392, i64 noundef 2414)
  call void @mayo_secure_clear(ptr noundef %25, i64 noundef 907240)
  %393 = getelementptr inbounds [142 x i8], ptr %26, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %393, i64 noundef 142)
  %394 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %394, i64 noundef 145)
  %395 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0
  call void @mayo_secure_clear(ptr noundef %395, i64 noundef 14688)
  %396 = load i32, ptr %13, align 4
  ret i32 %396
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_M_and_VPV(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [15336 x i64], align 16
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  %17 = load ptr, ptr %7, align 8
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 3
  %19 = load i32, ptr %18, align 4
  store i32 %19, ptr %13, align 4
  %20 = load ptr, ptr %7, align 8
  %21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 1
  %22 = load i32, ptr %21, align 4
  %23 = load ptr, ptr %7, align 8
  %24 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %23, i32 0, i32 2
  %25 = load i32, ptr %24, align 8
  %26 = sub nsw i32 %22, %25
  store i32 %26, ptr %14, align 4
  %27 = load ptr, ptr %7, align 8
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8
  store i32 %29, ptr %15, align 4
  %30 = load ptr, ptr %7, align 8
  %31 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 21
  %32 = load i32, ptr %31, align 4
  %33 = load ptr, ptr %8, align 8
  %34 = load ptr, ptr %9, align 8
  %35 = load ptr, ptr %11, align 8
  %36 = load i32, ptr %13, align 4
  %37 = load i32, ptr %14, align 4
  %38 = load i32, ptr %15, align 4
  call void @mul_add_mat_x_m_mat(i32 noundef %32, ptr noundef %33, ptr noundef %34, ptr noundef %35, i32 noundef %36, i32 noundef %37, i32 noundef %38)
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 122688, i1 false)
  %39 = load ptr, ptr %7, align 8
  %40 = load ptr, ptr %10, align 8
  %41 = load ptr, ptr %8, align 8
  %42 = getelementptr inbounds [15336 x i64], ptr %16, i64 0, i64 0
  call void @P1_times_Vt(ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %42)
  %43 = load ptr, ptr %7, align 8
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 21
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %8, align 8
  %47 = getelementptr inbounds [15336 x i64], ptr %16, i64 0, i64 0
  %48 = load ptr, ptr %12, align 8
  %49 = load i32, ptr %13, align 4
  %50 = load i32, ptr %14, align 4
  %51 = load i32, ptr %13, align 4
  call void @mul_add_mat_x_m_mat(i32 noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef %48, i32 noundef %49, i32 noundef %50, i32 noundef %51)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_rhs(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i32, align 4
  %13 = alloca [9 x i64], align 16
  %14 = alloca ptr, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8, align 1
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i64, align 8
  %21 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 0
  %24 = load i32, ptr %23, align 8
  %25 = sub nsw i32 %24, 1
  %26 = srem i32 %25, 16
  %27 = mul nsw i32 %26, 4
  %28 = sext i32 %27 to i64
  store i64 %28, ptr %9, align 8
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 21
  %31 = load i32, ptr %30, align 4
  %32 = sext i32 %31 to i64
  store i64 %32, ptr %10, align 8
  %33 = load ptr, ptr %5, align 8
  %34 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 0
  %35 = load i32, ptr %34, align 8
  %36 = srem i32 %35, 16
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %76

38:                                               ; preds = %4
  store i64 1, ptr %11, align 8
  %39 = load ptr, ptr %5, align 8
  %40 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %39, i32 0, i32 0
  %41 = load i32, ptr %40, align 8
  %42 = srem i32 %41, 16
  %43 = mul nsw i32 %42, 4
  %44 = load i64, ptr %11, align 8
  %45 = zext i32 %43 to i64
  %46 = shl i64 %44, %45
  store i64 %46, ptr %11, align 8
  %47 = load i64, ptr %11, align 8
  %48 = sub i64 %47, 1
  store i64 %48, ptr %11, align 8
  store i32 0, ptr %12, align 4
  br label %49

49:                                               ; preds = %72, %38
  %50 = load i32, ptr %12, align 4
  %51 = load ptr, ptr %5, align 8
  %52 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %51, i32 0, i32 3
  %53 = load i32, ptr %52, align 4
  %54 = load ptr, ptr %5, align 8
  %55 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %54, i32 0, i32 3
  %56 = load i32, ptr %55, align 4
  %57 = mul nsw i32 %53, %56
  %58 = icmp slt i32 %50, %57
  br i1 %58, label %59, label %75

59:                                               ; preds = %49
  %60 = load i64, ptr %11, align 8
  %61 = load ptr, ptr %6, align 8
  %62 = load i32, ptr %12, align 4
  %63 = sext i32 %62 to i64
  %64 = load i64, ptr %10, align 8
  %65 = mul i64 %63, %64
  %66 = load i64, ptr %10, align 8
  %67 = add i64 %65, %66
  %68 = sub i64 %67, 1
  %69 = getelementptr inbounds nuw i64, ptr %61, i64 %68
  %70 = load i64, ptr %69, align 8
  %71 = and i64 %70, %60
  store i64 %71, ptr %69, align 8
  br label %72

72:                                               ; preds = %59
  %73 = load i32, ptr %12, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, ptr %12, align 4
  br label %49, !llvm.loop !25

75:                                               ; preds = %49
  br label %76

76:                                               ; preds = %75, %4
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 72, i1 false)
  %77 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 0
  store ptr %77, ptr %14, align 8
  %78 = load ptr, ptr %5, align 8
  %79 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %78, i32 0, i32 3
  %80 = load i32, ptr %79, align 4
  %81 = sub nsw i32 %80, 1
  store i32 %81, ptr %15, align 4
  br label %82

82:                                               ; preds = %241, %76
  %83 = load i32, ptr %15, align 4
  %84 = icmp sge i32 %83, 0
  br i1 %84, label %85, label %244

85:                                               ; preds = %82
  %86 = load i32, ptr %15, align 4
  store i32 %86, ptr %16, align 4
  br label %87

87:                                               ; preds = %237, %85
  %88 = load i32, ptr %16, align 4
  %89 = load ptr, ptr %5, align 8
  %90 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %89, i32 0, i32 3
  %91 = load i32, ptr %90, align 4
  %92 = icmp slt i32 %88, %91
  br i1 %92, label %93, label %240

93:                                               ; preds = %87
  %94 = load i64, ptr %10, align 8
  %95 = sub i64 %94, 1
  %96 = getelementptr inbounds nuw [9 x i64], ptr %13, i64 0, i64 %95
  %97 = load i64, ptr %96, align 8
  %98 = load i64, ptr %9, align 8
  %99 = lshr i64 %97, %98
  %100 = urem i64 %99, 16
  %101 = trunc i64 %100 to i8
  store i8 %101, ptr %17, align 1
  %102 = load i64, ptr %10, align 8
  %103 = sub i64 %102, 1
  %104 = getelementptr inbounds nuw [9 x i64], ptr %13, i64 0, i64 %103
  %105 = load i64, ptr %104, align 8
  %106 = shl i64 %105, 4
  store i64 %106, ptr %104, align 8
  %107 = load i64, ptr %10, align 8
  %108 = sub i64 %107, 2
  %109 = trunc i64 %108 to i32
  store i32 %109, ptr %18, align 4
  br label %110

110:                                              ; preds = %130, %93
  %111 = load i32, ptr %18, align 4
  %112 = icmp sge i32 %111, 0
  br i1 %112, label %113, label %133

113:                                              ; preds = %110
  %114 = load i32, ptr %18, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 %115
  %117 = load i64, ptr %116, align 8
  %118 = lshr i64 %117, 60
  %119 = load i32, ptr %18, align 4
  %120 = add nsw i32 %119, 1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 %121
  %123 = load i64, ptr %122, align 8
  %124 = xor i64 %123, %118
  store i64 %124, ptr %122, align 8
  %125 = load i32, ptr %18, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 %126
  %128 = load i64, ptr %127, align 8
  %129 = shl i64 %128, 4
  store i64 %129, ptr %127, align 8
  br label %130

130:                                              ; preds = %113
  %131 = load i32, ptr %18, align 4
  %132 = add nsw i32 %131, -1
  store i32 %132, ptr %18, align 4
  br label %110, !llvm.loop !26

133:                                              ; preds = %110
  store i32 0, ptr %19, align 4
  br label %134

134:                                              ; preds = %183, %133
  %135 = load i32, ptr %19, align 4
  %136 = icmp slt i32 %135, 4
  br i1 %136, label %137, label %186

137:                                              ; preds = %134
  %138 = load i32, ptr %19, align 4
  %139 = srem i32 %138, 2
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %161

141:                                              ; preds = %137
  %142 = load i8, ptr %17, align 1
  %143 = load ptr, ptr %5, align 8
  %144 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %143, i32 0, i32 5
  %145 = load ptr, ptr %144, align 8
  %146 = load i32, ptr %19, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i8, ptr %145, i64 %147
  %149 = load i8, ptr %148, align 1
  %150 = call zeroext i8 @mul_f(i8 noundef zeroext %142, i8 noundef zeroext %149)
  %151 = zext i8 %150 to i32
  %152 = load ptr, ptr %14, align 8
  %153 = load i32, ptr %19, align 4
  %154 = sdiv i32 %153, 2
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds i8, ptr %152, i64 %155
  %157 = load i8, ptr %156, align 1
  %158 = zext i8 %157 to i32
  %159 = xor i32 %158, %151
  %160 = trunc i32 %159 to i8
  store i8 %160, ptr %156, align 1
  br label %182

161:                                              ; preds = %137
  %162 = load i8, ptr %17, align 1
  %163 = load ptr, ptr %5, align 8
  %164 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %163, i32 0, i32 5
  %165 = load ptr, ptr %164, align 8
  %166 = load i32, ptr %19, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds i8, ptr %165, i64 %167
  %169 = load i8, ptr %168, align 1
  %170 = call zeroext i8 @mul_f(i8 noundef zeroext %162, i8 noundef zeroext %169)
  %171 = zext i8 %170 to i32
  %172 = shl i32 %171, 4
  %173 = load ptr, ptr %14, align 8
  %174 = load i32, ptr %19, align 4
  %175 = sdiv i32 %174, 2
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds i8, ptr %173, i64 %176
  %178 = load i8, ptr %177, align 1
  %179 = zext i8 %178 to i32
  %180 = xor i32 %179, %172
  %181 = trunc i32 %180 to i8
  store i8 %181, ptr %177, align 1
  br label %182

182:                                              ; preds = %161, %141
  br label %183

183:                                              ; preds = %182
  %184 = load i32, ptr %19, align 4
  %185 = add nsw i32 %184, 1
  store i32 %185, ptr %19, align 4
  br label %134, !llvm.loop !27

186:                                              ; preds = %134
  store i64 0, ptr %20, align 8
  br label %187

187:                                              ; preds = %233, %186
  %188 = load i64, ptr %20, align 8
  %189 = load i64, ptr %10, align 8
  %190 = icmp ult i64 %188, %189
  br i1 %190, label %191, label %236

191:                                              ; preds = %187
  %192 = load ptr, ptr %6, align 8
  %193 = load i32, ptr %15, align 4
  %194 = load ptr, ptr %5, align 8
  %195 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %194, i32 0, i32 3
  %196 = load i32, ptr %195, align 4
  %197 = mul nsw i32 %193, %196
  %198 = load i32, ptr %16, align 4
  %199 = add nsw i32 %197, %198
  %200 = sext i32 %199 to i64
  %201 = load i64, ptr %10, align 8
  %202 = mul i64 %200, %201
  %203 = load i64, ptr %20, align 8
  %204 = add i64 %202, %203
  %205 = getelementptr inbounds nuw i64, ptr %192, i64 %204
  %206 = load i64, ptr %205, align 8
  %207 = load i32, ptr %15, align 4
  %208 = load i32, ptr %16, align 4
  %209 = icmp ne i32 %207, %208
  %210 = zext i1 %209 to i32
  %211 = sext i32 %210 to i64
  %212 = load ptr, ptr %6, align 8
  %213 = load i32, ptr %16, align 4
  %214 = load ptr, ptr %5, align 8
  %215 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %214, i32 0, i32 3
  %216 = load i32, ptr %215, align 4
  %217 = mul nsw i32 %213, %216
  %218 = load i32, ptr %15, align 4
  %219 = add nsw i32 %217, %218
  %220 = sext i32 %219 to i64
  %221 = load i64, ptr %10, align 8
  %222 = mul i64 %220, %221
  %223 = load i64, ptr %20, align 8
  %224 = add i64 %222, %223
  %225 = getelementptr inbounds nuw i64, ptr %212, i64 %224
  %226 = load i64, ptr %225, align 8
  %227 = mul i64 %211, %226
  %228 = xor i64 %206, %227
  %229 = load i64, ptr %20, align 8
  %230 = getelementptr inbounds nuw [9 x i64], ptr %13, i64 0, i64 %229
  %231 = load i64, ptr %230, align 8
  %232 = xor i64 %231, %228
  store i64 %232, ptr %230, align 8
  br label %233

233:                                              ; preds = %191
  %234 = load i64, ptr %20, align 8
  %235 = add i64 %234, 1
  store i64 %235, ptr %20, align 8
  br label %187, !llvm.loop !28

236:                                              ; preds = %187
  br label %237

237:                                              ; preds = %236
  %238 = load i32, ptr %16, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, ptr %16, align 4
  br label %87, !llvm.loop !29

240:                                              ; preds = %87
  br label %241

241:                                              ; preds = %240
  %242 = load i32, ptr %15, align 4
  %243 = add nsw i32 %242, -1
  store i32 %243, ptr %15, align 4
  br label %82, !llvm.loop !30

244:                                              ; preds = %82
  store i32 0, ptr %21, align 4
  br label %245

245:                                              ; preds = %294, %244
  %246 = load i32, ptr %21, align 4
  %247 = load ptr, ptr %5, align 8
  %248 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %247, i32 0, i32 0
  %249 = load i32, ptr %248, align 8
  %250 = icmp slt i32 %246, %249
  br i1 %250, label %251, label %297

251:                                              ; preds = %245
  %252 = load ptr, ptr %7, align 8
  %253 = load i32, ptr %21, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds i8, ptr %252, i64 %254
  %256 = load i8, ptr %255, align 1
  %257 = zext i8 %256 to i32
  %258 = load ptr, ptr %14, align 8
  %259 = load i32, ptr %21, align 4
  %260 = sdiv i32 %259, 2
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i8, ptr %258, i64 %261
  %263 = load i8, ptr %262, align 1
  %264 = zext i8 %263 to i32
  %265 = and i32 %264, 15
  %266 = xor i32 %257, %265
  %267 = trunc i32 %266 to i8
  %268 = load ptr, ptr %8, align 8
  %269 = load i32, ptr %21, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds i8, ptr %268, i64 %270
  store i8 %267, ptr %271, align 1
  %272 = load ptr, ptr %7, align 8
  %273 = load i32, ptr %21, align 4
  %274 = add nsw i32 %273, 1
  %275 = sext i32 %274 to i64
  %276 = getelementptr inbounds i8, ptr %272, i64 %275
  %277 = load i8, ptr %276, align 1
  %278 = zext i8 %277 to i32
  %279 = load ptr, ptr %14, align 8
  %280 = load i32, ptr %21, align 4
  %281 = sdiv i32 %280, 2
  %282 = sext i32 %281 to i64
  %283 = getelementptr inbounds i8, ptr %279, i64 %282
  %284 = load i8, ptr %283, align 1
  %285 = zext i8 %284 to i32
  %286 = ashr i32 %285, 4
  %287 = xor i32 %278, %286
  %288 = trunc i32 %287 to i8
  %289 = load ptr, ptr %8, align 8
  %290 = load i32, ptr %21, align 4
  %291 = add nsw i32 %290, 1
  %292 = sext i32 %291 to i64
  %293 = getelementptr inbounds i8, ptr %289, i64 %292
  store i8 %288, ptr %293, align 1
  br label %294

294:                                              ; preds = %251
  %295 = load i32, ptr %21, align 4
  %296 = add nsw i32 %295, 2
  store i32 %296, ptr %21, align 4
  br label %245, !llvm.loop !31

297:                                              ; preds = %245
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_A(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [3744 x i64], align 16
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i64, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i64, align 8
  %23 = alloca [16 x i8], align 16
  %24 = alloca i64, align 8
  %25 = alloca i64, align 8
  %26 = alloca i64, align 8
  %27 = alloca i32, align 4
  %28 = alloca i64, align 8
  %29 = alloca i64, align 8
  %30 = alloca i64, align 8
  %31 = alloca i64, align 8
  %32 = alloca i64, align 8
  %33 = alloca i64, align 8
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %37 = load ptr, ptr %4, align 8
  %38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 21
  %39 = load i32, ptr %38, align 4
  store i32 %39, ptr %9, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %10, i8 0, i64 29952, i1 false)
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 2
  %42 = load i32, ptr %41, align 8
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 3
  %45 = load i32, ptr %44, align 4
  %46 = mul nsw i32 %42, %45
  %47 = add nsw i32 %46, 15
  %48 = sdiv i32 %47, 16
  %49 = mul nsw i32 %48, 16
  %50 = sext i32 %49 to i64
  store i64 %50, ptr %11, align 8
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %51, i32 0, i32 0
  %53 = load i32, ptr %52, align 8
  %54 = srem i32 %53, 16
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %94

56:                                               ; preds = %3
  store i64 1, ptr %14, align 8
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %57, i32 0, i32 0
  %59 = load i32, ptr %58, align 8
  %60 = srem i32 %59, 16
  %61 = mul nsw i32 %60, 4
  %62 = load i64, ptr %14, align 8
  %63 = zext i32 %61 to i64
  %64 = shl i64 %62, %63
  store i64 %64, ptr %14, align 8
  %65 = load i64, ptr %14, align 8
  %66 = sub i64 %65, 1
  store i64 %66, ptr %14, align 8
  store i32 0, ptr %15, align 4
  br label %67

67:                                               ; preds = %90, %56
  %68 = load i32, ptr %15, align 4
  %69 = load ptr, ptr %4, align 8
  %70 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %69, i32 0, i32 2
  %71 = load i32, ptr %70, align 8
  %72 = load ptr, ptr %4, align 8
  %73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %72, i32 0, i32 3
  %74 = load i32, ptr %73, align 4
  %75 = mul nsw i32 %71, %74
  %76 = icmp slt i32 %68, %75
  br i1 %76, label %77, label %93

77:                                               ; preds = %67
  %78 = load i64, ptr %14, align 8
  %79 = load ptr, ptr %5, align 8
  %80 = load i32, ptr %15, align 4
  %81 = load i32, ptr %9, align 4
  %82 = mul nsw i32 %80, %81
  %83 = load i32, ptr %9, align 4
  %84 = add nsw i32 %82, %83
  %85 = sub nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds i64, ptr %79, i64 %86
  %88 = load i64, ptr %87, align 8
  %89 = and i64 %88, %78
  store i64 %89, ptr %87, align 8
  br label %90

90:                                               ; preds = %77
  %91 = load i32, ptr %15, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %15, align 4
  br label %67, !llvm.loop !32

93:                                               ; preds = %67
  br label %94

94:                                               ; preds = %93, %3
  store i32 0, ptr %16, align 4
  br label %95

95:                                               ; preds = %321, %94
  %96 = load i32, ptr %16, align 4
  %97 = load ptr, ptr %4, align 8
  %98 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %97, i32 0, i32 3
  %99 = load i32, ptr %98, align 4
  %100 = sub nsw i32 %99, 1
  %101 = icmp sle i32 %96, %100
  br i1 %101, label %102, label %324

102:                                              ; preds = %95
  %103 = load ptr, ptr %4, align 8
  %104 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %103, i32 0, i32 3
  %105 = load i32, ptr %104, align 4
  %106 = sub nsw i32 %105, 1
  store i32 %106, ptr %17, align 4
  br label %107

107:                                              ; preds = %317, %102
  %108 = load i32, ptr %17, align 4
  %109 = load i32, ptr %16, align 4
  %110 = icmp sge i32 %108, %109
  br i1 %110, label %111, label %320

111:                                              ; preds = %107
  %112 = load ptr, ptr %5, align 8
  %113 = load i32, ptr %17, align 4
  %114 = load i32, ptr %9, align 4
  %115 = mul nsw i32 %113, %114
  %116 = load ptr, ptr %4, align 8
  %117 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %116, i32 0, i32 2
  %118 = load i32, ptr %117, align 8
  %119 = mul nsw i32 %115, %118
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i64, ptr %112, i64 %120
  store ptr %121, ptr %13, align 8
  store i32 0, ptr %18, align 4
  br label %122

122:                                              ; preds = %204, %111
  %123 = load i32, ptr %18, align 4
  %124 = load ptr, ptr %4, align 8
  %125 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %124, i32 0, i32 2
  %126 = load i32, ptr %125, align 8
  %127 = icmp slt i32 %123, %126
  br i1 %127, label %128, label %207

128:                                              ; preds = %122
  store i32 0, ptr %19, align 4
  br label %129

129:                                              ; preds = %200, %128
  %130 = load i32, ptr %19, align 4
  %131 = load i32, ptr %9, align 4
  %132 = icmp slt i32 %130, %131
  br i1 %132, label %133, label %203

133:                                              ; preds = %129
  %134 = load ptr, ptr %13, align 8
  %135 = load i32, ptr %19, align 4
  %136 = load i32, ptr %18, align 4
  %137 = load i32, ptr %9, align 4
  %138 = mul nsw i32 %136, %137
  %139 = add nsw i32 %135, %138
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds i64, ptr %134, i64 %140
  %142 = load i64, ptr %141, align 8
  %143 = load i32, ptr %7, align 4
  %144 = zext i32 %143 to i64
  %145 = shl i64 %142, %144
  %146 = load ptr, ptr %4, align 8
  %147 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %146, i32 0, i32 2
  %148 = load i32, ptr %147, align 8
  %149 = load i32, ptr %16, align 4
  %150 = mul nsw i32 %148, %149
  %151 = load i32, ptr %18, align 4
  %152 = add nsw i32 %150, %151
  %153 = sext i32 %152 to i64
  %154 = load i32, ptr %19, align 4
  %155 = load i32, ptr %8, align 4
  %156 = add nsw i32 %154, %155
  %157 = sext i32 %156 to i64
  %158 = load i64, ptr %11, align 8
  %159 = mul i64 %157, %158
  %160 = add i64 %153, %159
  %161 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %160
  %162 = load i64, ptr %161, align 8
  %163 = xor i64 %162, %145
  store i64 %163, ptr %161, align 8
  %164 = load i32, ptr %7, align 4
  %165 = icmp sgt i32 %164, 0
  br i1 %165, label %166, label %199

166:                                              ; preds = %133
  %167 = load ptr, ptr %13, align 8
  %168 = load i32, ptr %19, align 4
  %169 = load i32, ptr %18, align 4
  %170 = load i32, ptr %9, align 4
  %171 = mul nsw i32 %169, %170
  %172 = add nsw i32 %168, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i64, ptr %167, i64 %173
  %175 = load i64, ptr %174, align 8
  %176 = load i32, ptr %7, align 4
  %177 = sub nsw i32 64, %176
  %178 = zext i32 %177 to i64
  %179 = lshr i64 %175, %178
  %180 = load ptr, ptr %4, align 8
  %181 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %180, i32 0, i32 2
  %182 = load i32, ptr %181, align 8
  %183 = load i32, ptr %16, align 4
  %184 = mul nsw i32 %182, %183
  %185 = load i32, ptr %18, align 4
  %186 = add nsw i32 %184, %185
  %187 = sext i32 %186 to i64
  %188 = load i32, ptr %19, align 4
  %189 = load i32, ptr %8, align 4
  %190 = add nsw i32 %188, %189
  %191 = add nsw i32 %190, 1
  %192 = sext i32 %191 to i64
  %193 = load i64, ptr %11, align 8
  %194 = mul i64 %192, %193
  %195 = add i64 %187, %194
  %196 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %195
  %197 = load i64, ptr %196, align 8
  %198 = xor i64 %197, %179
  store i64 %198, ptr %196, align 8
  br label %199

199:                                              ; preds = %166, %133
  br label %200

200:                                              ; preds = %199
  %201 = load i32, ptr %19, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, ptr %19, align 4
  br label %129, !llvm.loop !33

203:                                              ; preds = %129
  br label %204

204:                                              ; preds = %203
  %205 = load i32, ptr %18, align 4
  %206 = add nsw i32 %205, 1
  store i32 %206, ptr %18, align 4
  br label %122, !llvm.loop !34

207:                                              ; preds = %122
  %208 = load i32, ptr %16, align 4
  %209 = load i32, ptr %17, align 4
  %210 = icmp ne i32 %208, %209
  br i1 %210, label %211, label %308

211:                                              ; preds = %207
  %212 = load ptr, ptr %5, align 8
  %213 = load i32, ptr %16, align 4
  %214 = load i32, ptr %9, align 4
  %215 = mul nsw i32 %213, %214
  %216 = load ptr, ptr %4, align 8
  %217 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %216, i32 0, i32 2
  %218 = load i32, ptr %217, align 8
  %219 = mul nsw i32 %215, %218
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds i64, ptr %212, i64 %220
  store ptr %221, ptr %12, align 8
  store i32 0, ptr %20, align 4
  br label %222

222:                                              ; preds = %304, %211
  %223 = load i32, ptr %20, align 4
  %224 = load ptr, ptr %4, align 8
  %225 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %224, i32 0, i32 2
  %226 = load i32, ptr %225, align 8
  %227 = icmp slt i32 %223, %226
  br i1 %227, label %228, label %307

228:                                              ; preds = %222
  store i32 0, ptr %21, align 4
  br label %229

229:                                              ; preds = %300, %228
  %230 = load i32, ptr %21, align 4
  %231 = load i32, ptr %9, align 4
  %232 = icmp slt i32 %230, %231
  br i1 %232, label %233, label %303

233:                                              ; preds = %229
  %234 = load ptr, ptr %12, align 8
  %235 = load i32, ptr %21, align 4
  %236 = load i32, ptr %20, align 4
  %237 = load i32, ptr %9, align 4
  %238 = mul nsw i32 %236, %237
  %239 = add nsw i32 %235, %238
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds i64, ptr %234, i64 %240
  %242 = load i64, ptr %241, align 8
  %243 = load i32, ptr %7, align 4
  %244 = zext i32 %243 to i64
  %245 = shl i64 %242, %244
  %246 = load ptr, ptr %4, align 8
  %247 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %246, i32 0, i32 2
  %248 = load i32, ptr %247, align 8
  %249 = load i32, ptr %17, align 4
  %250 = mul nsw i32 %248, %249
  %251 = load i32, ptr %20, align 4
  %252 = add nsw i32 %250, %251
  %253 = sext i32 %252 to i64
  %254 = load i32, ptr %21, align 4
  %255 = load i32, ptr %8, align 4
  %256 = add nsw i32 %254, %255
  %257 = sext i32 %256 to i64
  %258 = load i64, ptr %11, align 8
  %259 = mul i64 %257, %258
  %260 = add i64 %253, %259
  %261 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %260
  %262 = load i64, ptr %261, align 8
  %263 = xor i64 %262, %245
  store i64 %263, ptr %261, align 8
  %264 = load i32, ptr %7, align 4
  %265 = icmp sgt i32 %264, 0
  br i1 %265, label %266, label %299

266:                                              ; preds = %233
  %267 = load ptr, ptr %12, align 8
  %268 = load i32, ptr %21, align 4
  %269 = load i32, ptr %20, align 4
  %270 = load i32, ptr %9, align 4
  %271 = mul nsw i32 %269, %270
  %272 = add nsw i32 %268, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds i64, ptr %267, i64 %273
  %275 = load i64, ptr %274, align 8
  %276 = load i32, ptr %7, align 4
  %277 = sub nsw i32 64, %276
  %278 = zext i32 %277 to i64
  %279 = lshr i64 %275, %278
  %280 = load ptr, ptr %4, align 8
  %281 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %280, i32 0, i32 2
  %282 = load i32, ptr %281, align 8
  %283 = load i32, ptr %17, align 4
  %284 = mul nsw i32 %282, %283
  %285 = load i32, ptr %20, align 4
  %286 = add nsw i32 %284, %285
  %287 = sext i32 %286 to i64
  %288 = load i32, ptr %21, align 4
  %289 = load i32, ptr %8, align 4
  %290 = add nsw i32 %288, %289
  %291 = add nsw i32 %290, 1
  %292 = sext i32 %291 to i64
  %293 = load i64, ptr %11, align 8
  %294 = mul i64 %292, %293
  %295 = add i64 %287, %294
  %296 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %295
  %297 = load i64, ptr %296, align 8
  %298 = xor i64 %297, %279
  store i64 %298, ptr %296, align 8
  br label %299

299:                                              ; preds = %266, %233
  br label %300

300:                                              ; preds = %299
  %301 = load i32, ptr %21, align 4
  %302 = add nsw i32 %301, 1
  store i32 %302, ptr %21, align 4
  br label %229, !llvm.loop !35

303:                                              ; preds = %229
  br label %304

304:                                              ; preds = %303
  %305 = load i32, ptr %20, align 4
  %306 = add nsw i32 %305, 1
  store i32 %306, ptr %20, align 4
  br label %222, !llvm.loop !36

307:                                              ; preds = %222
  br label %308

308:                                              ; preds = %307, %207
  %309 = load i32, ptr %7, align 4
  %310 = add nsw i32 %309, 4
  store i32 %310, ptr %7, align 4
  %311 = load i32, ptr %7, align 4
  %312 = icmp eq i32 %311, 64
  br i1 %312, label %313, label %316

313:                                              ; preds = %308
  %314 = load i32, ptr %8, align 4
  %315 = add nsw i32 %314, 1
  store i32 %315, ptr %8, align 4
  store i32 0, ptr %7, align 4
  br label %316

316:                                              ; preds = %313, %308
  br label %317

317:                                              ; preds = %316
  %318 = load i32, ptr %17, align 4
  %319 = add nsw i32 %318, -1
  store i32 %319, ptr %17, align 4
  br label %107, !llvm.loop !37

320:                                              ; preds = %107
  br label %321

321:                                              ; preds = %320
  %322 = load i32, ptr %16, align 4
  %323 = add nsw i32 %322, 1
  store i32 %323, ptr %16, align 4
  br label %95, !llvm.loop !38

324:                                              ; preds = %95
  store i64 0, ptr %22, align 8
  br label %325

325:                                              ; preds = %350, %324
  %326 = load i64, ptr %22, align 8
  %327 = load i64, ptr %11, align 8
  %328 = load ptr, ptr %4, align 8
  %329 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %328, i32 0, i32 0
  %330 = load i32, ptr %329, align 8
  %331 = load ptr, ptr %4, align 8
  %332 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %331, i32 0, i32 3
  %333 = load i32, ptr %332, align 4
  %334 = add nsw i32 %333, 1
  %335 = load ptr, ptr %4, align 8
  %336 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %335, i32 0, i32 3
  %337 = load i32, ptr %336, align 4
  %338 = mul nsw i32 %334, %337
  %339 = sdiv i32 %338, 2
  %340 = add nsw i32 %330, %339
  %341 = add nsw i32 %340, 15
  %342 = sdiv i32 %341, 16
  %343 = sext i32 %342 to i64
  %344 = mul i64 %327, %343
  %345 = icmp ult i64 %326, %344
  br i1 %345, label %346, label %353

346:                                              ; preds = %325
  %347 = getelementptr inbounds [3744 x i64], ptr %10, i64 0, i64 0
  %348 = load i64, ptr %22, align 8
  %349 = getelementptr inbounds nuw i64, ptr %347, i64 %348
  call void @transpose_16x16_nibbles(ptr noundef %349)
  br label %350

350:                                              ; preds = %346
  %351 = load i64, ptr %22, align 8
  %352 = add i64 %351, 16
  store i64 %352, ptr %22, align 8
  br label %325, !llvm.loop !39

353:                                              ; preds = %325
  call void @llvm.memset.p0.i64(ptr align 16 %23, i8 0, i64 16, i1 false)
  store i64 0, ptr %24, align 8
  br label %354

354:                                              ; preds = %401, %353
  %355 = load i64, ptr %24, align 8
  %356 = icmp ult i64 %355, 4
  br i1 %356, label %357, label %404

357:                                              ; preds = %354
  %358 = load ptr, ptr %4, align 8
  %359 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %358, i32 0, i32 5
  %360 = load ptr, ptr %359, align 8
  %361 = load i64, ptr %24, align 8
  %362 = getelementptr inbounds nuw i8, ptr %360, i64 %361
  %363 = load i8, ptr %362, align 1
  %364 = call zeroext i8 @mul_f(i8 noundef zeroext %363, i8 noundef zeroext 1)
  %365 = load i64, ptr %24, align 8
  %366 = mul i64 4, %365
  %367 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %366
  store i8 %364, ptr %367, align 1
  %368 = load ptr, ptr %4, align 8
  %369 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %368, i32 0, i32 5
  %370 = load ptr, ptr %369, align 8
  %371 = load i64, ptr %24, align 8
  %372 = getelementptr inbounds nuw i8, ptr %370, i64 %371
  %373 = load i8, ptr %372, align 1
  %374 = call zeroext i8 @mul_f(i8 noundef zeroext %373, i8 noundef zeroext 2)
  %375 = load i64, ptr %24, align 8
  %376 = mul i64 4, %375
  %377 = add i64 %376, 1
  %378 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %377
  store i8 %374, ptr %378, align 1
  %379 = load ptr, ptr %4, align 8
  %380 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %379, i32 0, i32 5
  %381 = load ptr, ptr %380, align 8
  %382 = load i64, ptr %24, align 8
  %383 = getelementptr inbounds nuw i8, ptr %381, i64 %382
  %384 = load i8, ptr %383, align 1
  %385 = call zeroext i8 @mul_f(i8 noundef zeroext %384, i8 noundef zeroext 4)
  %386 = load i64, ptr %24, align 8
  %387 = mul i64 4, %386
  %388 = add i64 %387, 2
  %389 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %388
  store i8 %385, ptr %389, align 1
  %390 = load ptr, ptr %4, align 8
  %391 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %390, i32 0, i32 5
  %392 = load ptr, ptr %391, align 8
  %393 = load i64, ptr %24, align 8
  %394 = getelementptr inbounds nuw i8, ptr %392, i64 %393
  %395 = load i8, ptr %394, align 1
  %396 = call zeroext i8 @mul_f(i8 noundef zeroext %395, i8 noundef zeroext 8)
  %397 = load i64, ptr %24, align 8
  %398 = mul i64 4, %397
  %399 = add i64 %398, 3
  %400 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %399
  store i8 %396, ptr %400, align 1
  br label %401

401:                                              ; preds = %357
  %402 = load i64, ptr %24, align 8
  %403 = add i64 %402, 1
  store i64 %403, ptr %24, align 8
  br label %354, !llvm.loop !40

404:                                              ; preds = %354
  store i64 1229782938247303441, ptr %25, align 8
  store i64 0, ptr %26, align 8
  br label %405

405:                                              ; preds = %539, %404
  %406 = load i64, ptr %26, align 8
  %407 = load i64, ptr %11, align 8
  %408 = icmp ult i64 %406, %407
  br i1 %408, label %409, label %542

409:                                              ; preds = %405
  %410 = load ptr, ptr %4, align 8
  %411 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %410, i32 0, i32 0
  %412 = load i32, ptr %411, align 8
  store i32 %412, ptr %27, align 4
  br label %413

413:                                              ; preds = %535, %409
  %414 = load i32, ptr %27, align 4
  %415 = load ptr, ptr %4, align 8
  %416 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %415, i32 0, i32 0
  %417 = load i32, ptr %416, align 8
  %418 = load ptr, ptr %4, align 8
  %419 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %418, i32 0, i32 3
  %420 = load i32, ptr %419, align 4
  %421 = add nsw i32 %420, 1
  %422 = load ptr, ptr %4, align 8
  %423 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %422, i32 0, i32 3
  %424 = load i32, ptr %423, align 4
  %425 = mul nsw i32 %421, %424
  %426 = sdiv i32 %425, 2
  %427 = add nsw i32 %417, %426
  %428 = icmp slt i32 %414, %427
  br i1 %428, label %429, label %538

429:                                              ; preds = %413
  %430 = load i32, ptr %27, align 4
  %431 = sdiv i32 %430, 16
  %432 = sext i32 %431 to i64
  %433 = load i64, ptr %11, align 8
  %434 = mul i64 %432, %433
  %435 = load i64, ptr %26, align 8
  %436 = add i64 %434, %435
  %437 = load i32, ptr %27, align 4
  %438 = srem i32 %437, 16
  %439 = sext i32 %438 to i64
  %440 = add i64 %436, %439
  store i64 %440, ptr %28, align 8
  %441 = load i64, ptr %28, align 8
  %442 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %441
  %443 = load i64, ptr %442, align 8
  %444 = load i64, ptr %25, align 8
  %445 = and i64 %443, %444
  store i64 %445, ptr %29, align 8
  %446 = load i64, ptr %28, align 8
  %447 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %446
  %448 = load i64, ptr %447, align 8
  %449 = lshr i64 %448, 1
  %450 = load i64, ptr %25, align 8
  %451 = and i64 %449, %450
  store i64 %451, ptr %30, align 8
  %452 = load i64, ptr %28, align 8
  %453 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %452
  %454 = load i64, ptr %453, align 8
  %455 = lshr i64 %454, 2
  %456 = load i64, ptr %25, align 8
  %457 = and i64 %455, %456
  store i64 %457, ptr %31, align 8
  %458 = load i64, ptr %28, align 8
  %459 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %458
  %460 = load i64, ptr %459, align 8
  %461 = lshr i64 %460, 3
  %462 = load i64, ptr %25, align 8
  %463 = and i64 %461, %462
  store i64 %463, ptr %32, align 8
  store i64 0, ptr %33, align 8
  br label %464

464:                                              ; preds = %531, %429
  %465 = load i64, ptr %33, align 8
  %466 = icmp ult i64 %465, 4
  br i1 %466, label %467, label %534

467:                                              ; preds = %464
  %468 = load i64, ptr %29, align 8
  %469 = load i64, ptr %33, align 8
  %470 = mul i64 4, %469
  %471 = add i64 %470, 0
  %472 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %471
  %473 = load i8, ptr %472, align 1
  %474 = zext i8 %473 to i64
  %475 = mul i64 %468, %474
  %476 = load i64, ptr %30, align 8
  %477 = load i64, ptr %33, align 8
  %478 = mul i64 4, %477
  %479 = add i64 %478, 1
  %480 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %479
  %481 = load i8, ptr %480, align 1
  %482 = zext i8 %481 to i64
  %483 = mul i64 %476, %482
  %484 = xor i64 %475, %483
  %485 = load i64, ptr %31, align 8
  %486 = load i64, ptr %33, align 8
  %487 = mul i64 4, %486
  %488 = add i64 %487, 2
  %489 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %488
  %490 = load i8, ptr %489, align 1
  %491 = zext i8 %490 to i64
  %492 = mul i64 %485, %491
  %493 = xor i64 %484, %492
  %494 = load i64, ptr %32, align 8
  %495 = load i64, ptr %33, align 8
  %496 = mul i64 4, %495
  %497 = add i64 %496, 3
  %498 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %497
  %499 = load i8, ptr %498, align 1
  %500 = zext i8 %499 to i64
  %501 = mul i64 %494, %500
  %502 = xor i64 %493, %501
  %503 = load i32, ptr %27, align 4
  %504 = sext i32 %503 to i64
  %505 = load i64, ptr %33, align 8
  %506 = add i64 %504, %505
  %507 = load ptr, ptr %4, align 8
  %508 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %507, i32 0, i32 0
  %509 = load i32, ptr %508, align 8
  %510 = sext i32 %509 to i64
  %511 = sub i64 %506, %510
  %512 = udiv i64 %511, 16
  %513 = load i64, ptr %11, align 8
  %514 = mul i64 %512, %513
  %515 = load i64, ptr %26, align 8
  %516 = add i64 %514, %515
  %517 = load i32, ptr %27, align 4
  %518 = sext i32 %517 to i64
  %519 = load i64, ptr %33, align 8
  %520 = add i64 %518, %519
  %521 = load ptr, ptr %4, align 8
  %522 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %521, i32 0, i32 0
  %523 = load i32, ptr %522, align 8
  %524 = sext i32 %523 to i64
  %525 = sub i64 %520, %524
  %526 = urem i64 %525, 16
  %527 = add i64 %516, %526
  %528 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %527
  %529 = load i64, ptr %528, align 8
  %530 = xor i64 %529, %502
  store i64 %530, ptr %528, align 8
  br label %531

531:                                              ; preds = %467
  %532 = load i64, ptr %33, align 8
  %533 = add i64 %532, 1
  store i64 %533, ptr %33, align 8
  br label %464, !llvm.loop !41

534:                                              ; preds = %464
  br label %535

535:                                              ; preds = %534
  %536 = load i32, ptr %27, align 4
  %537 = add nsw i32 %536, 1
  store i32 %537, ptr %27, align 4
  br label %413, !llvm.loop !42

538:                                              ; preds = %413
  br label %539

539:                                              ; preds = %538
  %540 = load i64, ptr %26, align 8
  %541 = add i64 %540, 16
  store i64 %541, ptr %26, align 8
  br label %405, !llvm.loop !43

542:                                              ; preds = %405
  store i32 0, ptr %34, align 4
  br label %543

543:                                              ; preds = %637, %542
  %544 = load i32, ptr %34, align 4
  %545 = load ptr, ptr %4, align 8
  %546 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %545, i32 0, i32 0
  %547 = load i32, ptr %546, align 8
  %548 = icmp slt i32 %544, %547
  br i1 %548, label %549, label %640

549:                                              ; preds = %543
  store i32 0, ptr %35, align 4
  br label %550

550:                                              ; preds = %633, %549
  %551 = load i32, ptr %35, align 4
  %552 = load ptr, ptr %4, align 8
  %553 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %552, i32 0, i32 3
  %554 = load i32, ptr %553, align 4
  %555 = load ptr, ptr %4, align 8
  %556 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %555, i32 0, i32 2
  %557 = load i32, ptr %556, align 8
  %558 = mul nsw i32 %554, %557
  %559 = add nsw i32 %558, 1
  %560 = sub nsw i32 %559, 1
  %561 = icmp slt i32 %551, %560
  br i1 %561, label %562, label %636

562:                                              ; preds = %550
  store i32 0, ptr %36, align 4
  br label %563

563:                                              ; preds = %629, %562
  %564 = load i32, ptr %36, align 4
  %565 = load i32, ptr %34, align 4
  %566 = add nsw i32 %564, %565
  %567 = load ptr, ptr %4, align 8
  %568 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %567, i32 0, i32 0
  %569 = load i32, ptr %568, align 8
  %570 = icmp slt i32 %566, %569
  br i1 %570, label %571, label %632

571:                                              ; preds = %563
  %572 = load i32, ptr %34, align 4
  %573 = sext i32 %572 to i64
  %574 = load i64, ptr %11, align 8
  %575 = mul i64 %573, %574
  %576 = udiv i64 %575, 16
  %577 = load i32, ptr %35, align 4
  %578 = sext i32 %577 to i64
  %579 = add i64 %576, %578
  %580 = load i32, ptr %36, align 4
  %581 = sext i32 %580 to i64
  %582 = add i64 %579, %581
  %583 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %582
  %584 = load ptr, ptr %6, align 8
  %585 = load ptr, ptr %4, align 8
  %586 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %585, i32 0, i32 3
  %587 = load i32, ptr %586, align 4
  %588 = load ptr, ptr %4, align 8
  %589 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %588, i32 0, i32 2
  %590 = load i32, ptr %589, align 8
  %591 = mul nsw i32 %587, %590
  %592 = add nsw i32 %591, 1
  %593 = load i32, ptr %34, align 4
  %594 = load i32, ptr %36, align 4
  %595 = add nsw i32 %593, %594
  %596 = mul nsw i32 %592, %595
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds i8, ptr %584, i64 %597
  %599 = load i32, ptr %35, align 4
  %600 = sext i32 %599 to i64
  %601 = getelementptr inbounds i8, ptr %598, i64 %600
  %602 = load ptr, ptr %4, align 8
  %603 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %602, i32 0, i32 3
  %604 = load i32, ptr %603, align 4
  %605 = load ptr, ptr %4, align 8
  %606 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %605, i32 0, i32 2
  %607 = load i32, ptr %606, align 8
  %608 = mul nsw i32 %604, %607
  %609 = add nsw i32 %608, 1
  %610 = sub nsw i32 %609, 1
  %611 = load i32, ptr %35, align 4
  %612 = sub nsw i32 %610, %611
  %613 = icmp slt i32 16, %612
  br i1 %613, label %614, label %615

614:                                              ; preds = %571
  br label %627

615:                                              ; preds = %571
  %616 = load ptr, ptr %4, align 8
  %617 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %616, i32 0, i32 3
  %618 = load i32, ptr %617, align 4
  %619 = load ptr, ptr %4, align 8
  %620 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %619, i32 0, i32 2
  %621 = load i32, ptr %620, align 8
  %622 = mul nsw i32 %618, %621
  %623 = add nsw i32 %622, 1
  %624 = sub nsw i32 %623, 1
  %625 = load i32, ptr %35, align 4
  %626 = sub nsw i32 %624, %625
  br label %627

627:                                              ; preds = %615, %614
  %628 = phi i32 [ 16, %614 ], [ %626, %615 ]
  call void @decode(ptr noundef %583, ptr noundef %601, i32 noundef %628)
  br label %629

629:                                              ; preds = %627
  %630 = load i32, ptr %36, align 4
  %631 = add nsw i32 %630, 1
  store i32 %631, ptr %36, align 4
  br label %563, !llvm.loop !44

632:                                              ; preds = %563
  br label %633

633:                                              ; preds = %632
  %634 = load i32, ptr %35, align 4
  %635 = add nsw i32 %634, 16
  store i32 %635, ptr %35, align 4
  br label %550, !llvm.loop !45

636:                                              ; preds = %550
  br label %637

637:                                              ; preds = %636
  %638 = load i32, ptr %34, align 4
  %639 = add nsw i32 %638, 16
  store i32 %639, ptr %34, align 4
  br label %543, !llvm.loop !46

640:                                              ; preds = %543
  ret void
}

declare i32 @sample_solution(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mat_mul(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store i32 %5, ptr %12, align 4
  store i32 0, ptr %13, align 4
  br label %15

15:                                               ; preds = %40, %6
  %16 = load i32, ptr %13, align 4
  %17 = load i32, ptr %11, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %47

19:                                               ; preds = %15
  store i32 0, ptr %14, align 4
  br label %20

20:                                               ; preds = %34, %19
  %21 = load i32, ptr %14, align 4
  %22 = load i32, ptr %12, align 4
  %23 = icmp slt i32 %21, %22
  br i1 %23, label %24, label %39

24:                                               ; preds = %20
  %25 = load ptr, ptr %7, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = load i32, ptr %14, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %26, i64 %28
  %30 = load i32, ptr %10, align 4
  %31 = load i32, ptr %12, align 4
  %32 = call zeroext i8 @lincomb(ptr noundef %25, ptr noundef %29, i32 noundef %30, i32 noundef %31)
  %33 = load ptr, ptr %9, align 8
  store i8 %32, ptr %33, align 1
  br label %34

34:                                               ; preds = %24
  %35 = load i32, ptr %14, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, ptr %14, align 4
  %37 = load ptr, ptr %9, align 8
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 1
  store ptr %38, ptr %9, align 8
  br label %20, !llvm.loop !47

39:                                               ; preds = %20
  br label %40

40:                                               ; preds = %39
  %41 = load i32, ptr %13, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %13, align 4
  %43 = load i32, ptr %10, align 4
  %44 = load ptr, ptr %7, align 8
  %45 = sext i32 %43 to i64
  %46 = getelementptr inbounds i8, ptr %44, i64 %45
  store ptr %46, ptr %7, align 8
  br label %15, !llvm.loop !48

47:                                               ; preds = %15
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mat_add(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
  store ptr %1, ptr %7, align 8
  store ptr %2, ptr %8, align 8
  store i32 %3, ptr %9, align 4
  store i32 %4, ptr %10, align 4
  store i32 0, ptr %11, align 4
  br label %13

13:                                               ; preds = %57, %5
  %14 = load i32, ptr %11, align 4
  %15 = load i32, ptr %9, align 4
  %16 = icmp slt i32 %14, %15
  br i1 %16, label %17, label %60

17:                                               ; preds = %13
  store i32 0, ptr %12, align 4
  br label %18

18:                                               ; preds = %53, %17
  %19 = load i32, ptr %12, align 4
  %20 = load i32, ptr %10, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %56

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8
  %24 = load i32, ptr %11, align 4
  %25 = load i32, ptr %10, align 4
  %26 = mul nsw i32 %24, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i8, ptr %23, i64 %27
  %29 = load i32, ptr %12, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %28, i64 %30
  %32 = load i8, ptr %31, align 1
  %33 = load ptr, ptr %7, align 8
  %34 = load i32, ptr %11, align 4
  %35 = load i32, ptr %10, align 4
  %36 = mul nsw i32 %34, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, ptr %33, i64 %37
  %39 = load i32, ptr %12, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, ptr %38, i64 %40
  %42 = load i8, ptr %41, align 1
  %43 = call zeroext i8 @add_f(i8 noundef zeroext %32, i8 noundef zeroext %42)
  %44 = load ptr, ptr %8, align 8
  %45 = load i32, ptr %11, align 4
  %46 = load i32, ptr %10, align 4
  %47 = mul nsw i32 %45, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, ptr %44, i64 %48
  %50 = load i32, ptr %12, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i8, ptr %49, i64 %51
  store i8 %43, ptr %52, align 1
  br label %53

53:                                               ; preds = %22
  %54 = load i32, ptr %12, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, ptr %12, align 4
  br label %18, !llvm.loop !49

56:                                               ; preds = %18
  br label %57

57:                                               ; preds = %56
  %58 = load i32, ptr %11, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, ptr %11, align 4
  br label %13, !llvm.loop !50

60:                                               ; preds = %13
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @encode(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store i32 %2, ptr %6, align 4
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %28, %3
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %6, align 4
  %11 = sdiv i32 %10, 2
  %12 = icmp slt i32 %9, %11
  br i1 %12, label %13, label %33

13:                                               ; preds = %8
  %14 = load ptr, ptr %4, align 8
  %15 = load i8, ptr %14, align 1
  %16 = zext i8 %15 to i32
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds i8, ptr %17, i64 1
  %19 = load i8, ptr %18, align 1
  %20 = zext i8 %19 to i32
  %21 = shl i32 %20, 4
  %22 = or i32 %16, %21
  %23 = trunc i32 %22 to i8
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, ptr %24, i64 %26
  store i8 %23, ptr %27, align 1
  br label %28

28:                                               ; preds = %13
  %29 = load i32, ptr %7, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, ptr %7, align 4
  %31 = load ptr, ptr %4, align 8
  %32 = getelementptr inbounds i8, ptr %31, i64 2
  store ptr %32, ptr %4, align 8
  br label %8, !llvm.loop !51

33:                                               ; preds = %8
  %34 = load i32, ptr %6, align 4
  %35 = srem i32 %34, 2
  %36 = icmp eq i32 %35, 1
  br i1 %36, label %37, label %44

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8
  %39 = load i8, ptr %38, align 1
  %40 = load ptr, ptr %5, align 8
  %41 = load i32, ptr %7, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, ptr %40, i64 %42
  store i8 %39, ptr %43, align 1
  br label %44

44:                                               ; preds = %37, %33
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  store i8 %1, ptr %4, align 1
  %5 = load i8, ptr %3, align 1
  %6 = zext i8 %5 to i32
  %7 = load i8, ptr %4, align 1
  %8 = zext i8 %7 to i32
  %9 = xor i32 %6, %8
  %10 = trunc i32 %9 to i8
  ret i8 %10
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @lincomb(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store i32 %2, ptr %7, align 4
  store i32 %3, ptr %8, align 4
  store i8 0, ptr %9, align 1
  store i32 0, ptr %10, align 4
  br label %11

11:                                               ; preds = %26, %4
  %12 = load i32, ptr %10, align 4
  %13 = load i32, ptr %7, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %33

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %10, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, ptr %16, i64 %18
  %20 = load i8, ptr %19, align 1
  %21 = load ptr, ptr %6, align 8
  %22 = load i8, ptr %21, align 1
  %23 = call zeroext i8 @mul_f(i8 noundef zeroext %20, i8 noundef zeroext %22)
  %24 = load i8, ptr %9, align 1
  %25 = call zeroext i8 @add_f(i8 noundef zeroext %23, i8 noundef zeroext %24)
  store i8 %25, ptr %9, align 1
  br label %26

26:                                               ; preds = %15
  %27 = load i32, ptr %10, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, ptr %10, align 4
  %29 = load i32, ptr %8, align 4
  %30 = load ptr, ptr %6, align 8
  %31 = sext i32 %29 to i64
  %32 = getelementptr inbounds i8, ptr %30, i64 %31
  store ptr %32, ptr %6, align 8
  br label %11, !llvm.loop !52

33:                                               ; preds = %11
  %34 = load i8, ptr %9, align 1
  ret i8 %34
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #0 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
  store i8 %1, ptr %4, align 1
  %8 = load volatile i8, ptr @unsigned_char_blocker, align 1
  %9 = zext i8 %8 to i32
  %10 = load i8, ptr %3, align 1
  %11 = zext i8 %10 to i32
  %12 = xor i32 %11, %9
  %13 = trunc i32 %12 to i8
  store i8 %13, ptr %3, align 1
  %14 = load i8, ptr %3, align 1
  %15 = zext i8 %14 to i32
  %16 = and i32 %15, 1
  %17 = load i8, ptr %4, align 1
  %18 = zext i8 %17 to i32
  %19 = mul nsw i32 %16, %18
  %20 = trunc i32 %19 to i8
  store i8 %20, ptr %5, align 1
  %21 = load i8, ptr %3, align 1
  %22 = zext i8 %21 to i32
  %23 = and i32 %22, 2
  %24 = load i8, ptr %4, align 1
  %25 = zext i8 %24 to i32
  %26 = mul nsw i32 %23, %25
  %27 = load i8, ptr %5, align 1
  %28 = zext i8 %27 to i32
  %29 = xor i32 %28, %26
  %30 = trunc i32 %29 to i8
  store i8 %30, ptr %5, align 1
  %31 = load i8, ptr %3, align 1
  %32 = zext i8 %31 to i32
  %33 = and i32 %32, 4
  %34 = load i8, ptr %4, align 1
  %35 = zext i8 %34 to i32
  %36 = mul nsw i32 %33, %35
  %37 = load i8, ptr %5, align 1
  %38 = zext i8 %37 to i32
  %39 = xor i32 %38, %36
  %40 = trunc i32 %39 to i8
  store i8 %40, ptr %5, align 1
  %41 = load i8, ptr %3, align 1
  %42 = zext i8 %41 to i32
  %43 = and i32 %42, 8
  %44 = load i8, ptr %4, align 1
  %45 = zext i8 %44 to i32
  %46 = mul nsw i32 %43, %45
  %47 = load i8, ptr %5, align 1
  %48 = zext i8 %47 to i32
  %49 = xor i32 %48, %46
  %50 = trunc i32 %49 to i8
  store i8 %50, ptr %5, align 1
  %51 = load i8, ptr %5, align 1
  %52 = zext i8 %51 to i32
  %53 = and i32 %52, 240
  %54 = trunc i32 %53 to i8
  store i8 %54, ptr %6, align 1
  %55 = load i8, ptr %5, align 1
  %56 = zext i8 %55 to i32
  %57 = load i8, ptr %6, align 1
  %58 = zext i8 %57 to i32
  %59 = ashr i32 %58, 4
  %60 = xor i32 %56, %59
  %61 = load i8, ptr %6, align 1
  %62 = zext i8 %61 to i32
  %63 = ashr i32 %62, 3
  %64 = xor i32 %60, %63
  %65 = and i32 %64, 15
  %66 = trunc i32 %65 to i8
  store i8 %66, ptr %7, align 1
  %67 = load i8, ptr %7, align 1
  ret i8 %67
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @transpose_16x16_nibbles(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i64, align 8
  %12 = alloca i64, align 8
  store ptr %0, ptr %2, align 8
  store i64 0, ptr %3, align 8
  br label %13

13:                                               ; preds = %43, %1
  %14 = load i64, ptr %3, align 8
  %15 = icmp ult i64 %14, 16
  br i1 %15, label %16, label %46

16:                                               ; preds = %13
  %17 = load ptr, ptr %2, align 8
  %18 = load i64, ptr %3, align 8
  %19 = getelementptr inbounds nuw i64, ptr %17, i64 %18
  %20 = load i64, ptr %19, align 8
  %21 = lshr i64 %20, 4
  %22 = load ptr, ptr %2, align 8
  %23 = load i64, ptr %3, align 8
  %24 = add i64 %23, 1
  %25 = getelementptr inbounds nuw i64, ptr %22, i64 %24
  %26 = load i64, ptr %25, align 8
  %27 = xor i64 %21, %26
  %28 = and i64 %27, 1085102592571150095
  store i64 %28, ptr %4, align 8
  %29 = load i64, ptr %4, align 8
  %30 = shl i64 %29, 4
  %31 = load ptr, ptr %2, align 8
  %32 = load i64, ptr %3, align 8
  %33 = getelementptr inbounds nuw i64, ptr %31, i64 %32
  %34 = load i64, ptr %33, align 8
  %35 = xor i64 %34, %30
  store i64 %35, ptr %33, align 8
  %36 = load i64, ptr %4, align 8
  %37 = load ptr, ptr %2, align 8
  %38 = load i64, ptr %3, align 8
  %39 = add i64 %38, 1
  %40 = getelementptr inbounds nuw i64, ptr %37, i64 %39
  %41 = load i64, ptr %40, align 8
  %42 = xor i64 %41, %36
  store i64 %42, ptr %40, align 8
  br label %43

43:                                               ; preds = %16
  %44 = load i64, ptr %3, align 8
  %45 = add i64 %44, 2
  store i64 %45, ptr %3, align 8
  br label %13, !llvm.loop !53

46:                                               ; preds = %13
  store i64 0, ptr %5, align 8
  br label %47

47:                                               ; preds = %105, %46
  %48 = load i64, ptr %5, align 8
  %49 = icmp ult i64 %48, 16
  br i1 %49, label %50, label %108

50:                                               ; preds = %47
  %51 = load ptr, ptr %2, align 8
  %52 = load i64, ptr %5, align 8
  %53 = getelementptr inbounds nuw i64, ptr %51, i64 %52
  %54 = load i64, ptr %53, align 8
  %55 = lshr i64 %54, 8
  %56 = load ptr, ptr %2, align 8
  %57 = load i64, ptr %5, align 8
  %58 = add i64 %57, 2
  %59 = getelementptr inbounds nuw i64, ptr %56, i64 %58
  %60 = load i64, ptr %59, align 8
  %61 = xor i64 %55, %60
  %62 = and i64 %61, 71777214294589695
  store i64 %62, ptr %6, align 8
  %63 = load ptr, ptr %2, align 8
  %64 = load i64, ptr %5, align 8
  %65 = add i64 %64, 1
  %66 = getelementptr inbounds nuw i64, ptr %63, i64 %65
  %67 = load i64, ptr %66, align 8
  %68 = lshr i64 %67, 8
  %69 = load ptr, ptr %2, align 8
  %70 = load i64, ptr %5, align 8
  %71 = add i64 %70, 3
  %72 = getelementptr inbounds nuw i64, ptr %69, i64 %71
  %73 = load i64, ptr %72, align 8
  %74 = xor i64 %68, %73
  %75 = and i64 %74, 71777214294589695
  store i64 %75, ptr %7, align 8
  %76 = load i64, ptr %6, align 8
  %77 = shl i64 %76, 8
  %78 = load ptr, ptr %2, align 8
  %79 = load i64, ptr %5, align 8
  %80 = getelementptr inbounds nuw i64, ptr %78, i64 %79
  %81 = load i64, ptr %80, align 8
  %82 = xor i64 %81, %77
  store i64 %82, ptr %80, align 8
  %83 = load i64, ptr %7, align 8
  %84 = shl i64 %83, 8
  %85 = load ptr, ptr %2, align 8
  %86 = load i64, ptr %5, align 8
  %87 = add i64 %86, 1
  %88 = getelementptr inbounds nuw i64, ptr %85, i64 %87
  %89 = load i64, ptr %88, align 8
  %90 = xor i64 %89, %84
  store i64 %90, ptr %88, align 8
  %91 = load i64, ptr %6, align 8
  %92 = load ptr, ptr %2, align 8
  %93 = load i64, ptr %5, align 8
  %94 = add i64 %93, 2
  %95 = getelementptr inbounds nuw i64, ptr %92, i64 %94
  %96 = load i64, ptr %95, align 8
  %97 = xor i64 %96, %91
  store i64 %97, ptr %95, align 8
  %98 = load i64, ptr %7, align 8
  %99 = load ptr, ptr %2, align 8
  %100 = load i64, ptr %5, align 8
  %101 = add i64 %100, 3
  %102 = getelementptr inbounds nuw i64, ptr %99, i64 %101
  %103 = load i64, ptr %102, align 8
  %104 = xor i64 %103, %98
  store i64 %104, ptr %102, align 8
  br label %105

105:                                              ; preds = %50
  %106 = load i64, ptr %5, align 8
  %107 = add i64 %106, 4
  store i64 %107, ptr %5, align 8
  br label %47, !llvm.loop !54

108:                                              ; preds = %47
  store i64 0, ptr %8, align 8
  br label %109

109:                                              ; preds = %167, %108
  %110 = load i64, ptr %8, align 8
  %111 = icmp ult i64 %110, 4
  br i1 %111, label %112, label %170

112:                                              ; preds = %109
  %113 = load ptr, ptr %2, align 8
  %114 = load i64, ptr %8, align 8
  %115 = getelementptr inbounds nuw i64, ptr %113, i64 %114
  %116 = load i64, ptr %115, align 8
  %117 = lshr i64 %116, 16
  %118 = load ptr, ptr %2, align 8
  %119 = load i64, ptr %8, align 8
  %120 = add i64 %119, 4
  %121 = getelementptr inbounds nuw i64, ptr %118, i64 %120
  %122 = load i64, ptr %121, align 8
  %123 = xor i64 %117, %122
  %124 = and i64 %123, 281470681808895
  store i64 %124, ptr %9, align 8
  %125 = load ptr, ptr %2, align 8
  %126 = load i64, ptr %8, align 8
  %127 = add i64 %126, 8
  %128 = getelementptr inbounds nuw i64, ptr %125, i64 %127
  %129 = load i64, ptr %128, align 8
  %130 = lshr i64 %129, 16
  %131 = load ptr, ptr %2, align 8
  %132 = load i64, ptr %8, align 8
  %133 = add i64 %132, 12
  %134 = getelementptr inbounds nuw i64, ptr %131, i64 %133
  %135 = load i64, ptr %134, align 8
  %136 = xor i64 %130, %135
  %137 = and i64 %136, 281470681808895
  store i64 %137, ptr %10, align 8
  %138 = load i64, ptr %9, align 8
  %139 = shl i64 %138, 16
  %140 = load ptr, ptr %2, align 8
  %141 = load i64, ptr %8, align 8
  %142 = getelementptr inbounds nuw i64, ptr %140, i64 %141
  %143 = load i64, ptr %142, align 8
  %144 = xor i64 %143, %139
  store i64 %144, ptr %142, align 8
  %145 = load i64, ptr %10, align 8
  %146 = shl i64 %145, 16
  %147 = load ptr, ptr %2, align 8
  %148 = load i64, ptr %8, align 8
  %149 = add i64 %148, 8
  %150 = getelementptr inbounds nuw i64, ptr %147, i64 %149
  %151 = load i64, ptr %150, align 8
  %152 = xor i64 %151, %146
  store i64 %152, ptr %150, align 8
  %153 = load i64, ptr %9, align 8
  %154 = load ptr, ptr %2, align 8
  %155 = load i64, ptr %8, align 8
  %156 = add i64 %155, 4
  %157 = getelementptr inbounds nuw i64, ptr %154, i64 %156
  %158 = load i64, ptr %157, align 8
  %159 = xor i64 %158, %153
  store i64 %159, ptr %157, align 8
  %160 = load i64, ptr %10, align 8
  %161 = load ptr, ptr %2, align 8
  %162 = load i64, ptr %8, align 8
  %163 = add i64 %162, 12
  %164 = getelementptr inbounds nuw i64, ptr %161, i64 %163
  %165 = load i64, ptr %164, align 8
  %166 = xor i64 %165, %160
  store i64 %166, ptr %164, align 8
  br label %167

167:                                              ; preds = %112
  %168 = load i64, ptr %8, align 8
  %169 = add i64 %168, 1
  store i64 %169, ptr %8, align 8
  br label %109, !llvm.loop !55

170:                                              ; preds = %109
  store i64 0, ptr %11, align 8
  br label %171

171:                                              ; preds = %201, %170
  %172 = load i64, ptr %11, align 8
  %173 = icmp ult i64 %172, 8
  br i1 %173, label %174, label %204

174:                                              ; preds = %171
  %175 = load ptr, ptr %2, align 8
  %176 = load i64, ptr %11, align 8
  %177 = getelementptr inbounds nuw i64, ptr %175, i64 %176
  %178 = load i64, ptr %177, align 8
  %179 = lshr i64 %178, 32
  %180 = load ptr, ptr %2, align 8
  %181 = load i64, ptr %11, align 8
  %182 = add i64 %181, 8
  %183 = getelementptr inbounds nuw i64, ptr %180, i64 %182
  %184 = load i64, ptr %183, align 8
  %185 = xor i64 %179, %184
  %186 = and i64 %185, 4294967295
  store i64 %186, ptr %12, align 8
  %187 = load i64, ptr %12, align 8
  %188 = shl i64 %187, 32
  %189 = load ptr, ptr %2, align 8
  %190 = load i64, ptr %11, align 8
  %191 = getelementptr inbounds nuw i64, ptr %189, i64 %190
  %192 = load i64, ptr %191, align 8
  %193 = xor i64 %192, %188
  store i64 %193, ptr %191, align 8
  %194 = load i64, ptr %12, align 8
  %195 = load ptr, ptr %2, align 8
  %196 = load i64, ptr %11, align 8
  %197 = add i64 %196, 8
  %198 = getelementptr inbounds nuw i64, ptr %195, i64 %197
  %199 = load i64, ptr %198, align 8
  %200 = xor i64 %199, %194
  store i64 %200, ptr %198, align 8
  br label %201

201:                                              ; preds = %174
  %202 = load i64, ptr %11, align 8
  %203 = add i64 %202, 1
  store i64 %203, ptr %11, align 8
  br label %171, !llvm.loop !56

204:                                              ; preds = %171
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_mat_x_m_mat(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 {
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32 %0, ptr %8, align 4
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store i32 %4, ptr %12, align 4
  store i32 %5, ptr %13, align 4
  store i32 %6, ptr %14, align 4
  store i32 0, ptr %15, align 4
  br label %18

18:                                               ; preds = %71, %7
  %19 = load i32, ptr %15, align 4
  %20 = load i32, ptr %12, align 4
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %74

22:                                               ; preds = %18
  store i32 0, ptr %16, align 4
  br label %23

23:                                               ; preds = %67, %22
  %24 = load i32, ptr %16, align 4
  %25 = load i32, ptr %13, align 4
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %27, label %70

27:                                               ; preds = %23
  store i32 0, ptr %17, align 4
  br label %28

28:                                               ; preds = %63, %27
  %29 = load i32, ptr %17, align 4
  %30 = load i32, ptr %14, align 4
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %66

32:                                               ; preds = %28
  %33 = load i32, ptr %8, align 4
  %34 = load ptr, ptr %10, align 8
  %35 = load i32, ptr %8, align 4
  %36 = load i32, ptr %16, align 4
  %37 = load i32, ptr %14, align 4
  %38 = mul nsw i32 %36, %37
  %39 = load i32, ptr %17, align 4
  %40 = add nsw i32 %38, %39
  %41 = mul nsw i32 %35, %40
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i64, ptr %34, i64 %42
  %44 = load ptr, ptr %9, align 8
  %45 = load i32, ptr %15, align 4
  %46 = load i32, ptr %13, align 4
  %47 = mul nsw i32 %45, %46
  %48 = load i32, ptr %16, align 4
  %49 = add nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, ptr %44, i64 %50
  %52 = load i8, ptr %51, align 1
  %53 = load ptr, ptr %11, align 8
  %54 = load i32, ptr %8, align 4
  %55 = load i32, ptr %15, align 4
  %56 = load i32, ptr %14, align 4
  %57 = mul nsw i32 %55, %56
  %58 = load i32, ptr %17, align 4
  %59 = add nsw i32 %57, %58
  %60 = mul nsw i32 %54, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i64, ptr %53, i64 %61
  call void @m_vec_mul_add(i32 noundef %33, ptr noundef %43, i8 noundef zeroext %52, ptr noundef %62)
  br label %63

63:                                               ; preds = %32
  %64 = load i32, ptr %17, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, ptr %17, align 4
  br label %28, !llvm.loop !57

66:                                               ; preds = %28
  br label %67

67:                                               ; preds = %66
  %68 = load i32, ptr %16, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, ptr %16, align 4
  br label %23, !llvm.loop !58

70:                                               ; preds = %23
  br label %71

71:                                               ; preds = %70
  %72 = load i32, ptr %15, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %15, align 4
  br label %18, !llvm.loop !59

74:                                               ; preds = %18
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @P1_times_Vt(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
  store ptr %1, ptr %6, align 8
  store ptr %2, ptr %7, align 8
  store ptr %3, ptr %8, align 8
  %9 = load ptr, ptr %5, align 8
  %10 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 21
  %11 = load i32, ptr %10, align 4
  %12 = load ptr, ptr %6, align 8
  %13 = load ptr, ptr %7, align 8
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %5, align 8
  %16 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 1
  %17 = load i32, ptr %16, align 4
  %18 = load ptr, ptr %5, align 8
  %19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 2
  %20 = load i32, ptr %19, align 8
  %21 = sub nsw i32 %17, %20
  %22 = load ptr, ptr %5, align 8
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 1
  %24 = load i32, ptr %23, align 4
  %25 = load ptr, ptr %5, align 8
  %26 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2
  %27 = load i32, ptr %26, align 8
  %28 = sub nsw i32 %24, %27
  %29 = load ptr, ptr %5, align 8
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 3
  %31 = load i32, ptr %30, align 4
  call void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, i32 noundef %21, i32 noundef %28, i32 noundef %31, i32 noundef 1)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #0 {
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  store i32 %0, ptr %9, align 4
  store ptr %1, ptr %10, align 8
  store ptr %2, ptr %11, align 8
  store ptr %3, ptr %12, align 8
  store i32 %4, ptr %13, align 4
  store i32 %5, ptr %14, align 4
  store i32 %6, ptr %15, align 4
  store i32 %7, ptr %16, align 4
  store i32 0, ptr %17, align 4
  store i32 0, ptr %18, align 4
  br label %21

21:                                               ; preds = %75, %8
  %22 = load i32, ptr %18, align 4
  %23 = load i32, ptr %13, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %78

25:                                               ; preds = %21
  %26 = load i32, ptr %16, align 4
  %27 = load i32, ptr %18, align 4
  %28 = mul nsw i32 %26, %27
  store i32 %28, ptr %19, align 4
  br label %29

29:                                               ; preds = %71, %25
  %30 = load i32, ptr %19, align 4
  %31 = load i32, ptr %14, align 4
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %74

33:                                               ; preds = %29
  store i32 0, ptr %20, align 4
  br label %34

34:                                               ; preds = %65, %33
  %35 = load i32, ptr %20, align 4
  %36 = load i32, ptr %15, align 4
  %37 = icmp slt i32 %35, %36
  br i1 %37, label %38, label %68

38:                                               ; preds = %34
  %39 = load i32, ptr %9, align 4
  %40 = load ptr, ptr %10, align 8
  %41 = load i32, ptr %9, align 4
  %42 = load i32, ptr %17, align 4
  %43 = mul nsw i32 %41, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i64, ptr %40, i64 %44
  %46 = load ptr, ptr %11, align 8
  %47 = load i32, ptr %20, align 4
  %48 = load i32, ptr %14, align 4
  %49 = mul nsw i32 %47, %48
  %50 = load i32, ptr %19, align 4
  %51 = add nsw i32 %49, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i8, ptr %46, i64 %52
  %54 = load i8, ptr %53, align 1
  %55 = load ptr, ptr %12, align 8
  %56 = load i32, ptr %9, align 4
  %57 = load i32, ptr %18, align 4
  %58 = load i32, ptr %15, align 4
  %59 = mul nsw i32 %57, %58
  %60 = load i32, ptr %20, align 4
  %61 = add nsw i32 %59, %60
  %62 = mul nsw i32 %56, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i64, ptr %55, i64 %63
  call void @m_vec_mul_add(i32 noundef %39, ptr noundef %45, i8 noundef zeroext %54, ptr noundef %64)
  br label %65

65:                                               ; preds = %38
  %66 = load i32, ptr %20, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, ptr %20, align 4
  br label %34, !llvm.loop !60

68:                                               ; preds = %34
  %69 = load i32, ptr %17, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, ptr %17, align 4
  br label %71

71:                                               ; preds = %68
  %72 = load i32, ptr %19, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, ptr %19, align 4
  br label %29, !llvm.loop !61

74:                                               ; preds = %29
  br label %75

75:                                               ; preds = %74
  %76 = load i32, ptr %18, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, ptr %18, align 4
  br label %21, !llvm.loop !62

78:                                               ; preds = %21
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_sign(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i64, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store i64 %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  store i32 0, ptr %13, align 4
  %16 = load ptr, ptr %7, align 8
  %17 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 16
  %18 = load i32, ptr %17, align 8
  store i32 %18, ptr %14, align 4
  %19 = load ptr, ptr %8, align 8
  %20 = load i32, ptr %14, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i8, ptr %19, i64 %21
  %23 = load ptr, ptr %10, align 8
  %24 = load i64, ptr %11, align 8
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %22, ptr align 1 %23, i64 %24, i1 false)
  %25 = load ptr, ptr %7, align 8
  %26 = load ptr, ptr %8, align 8
  %27 = load ptr, ptr %8, align 8
  %28 = load i32, ptr %14, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i8, ptr %27, i64 %29
  %31 = load i64, ptr %11, align 8
  %32 = load ptr, ptr %12, align 8
  %33 = call i32 @mayo_sign_signature(ptr noundef %25, ptr noundef %26, ptr noundef %15, ptr noundef %30, i64 noundef %31, ptr noundef %32)
  store i32 %33, ptr %13, align 4
  %34 = load i32, ptr %13, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %41, label %36

36:                                               ; preds = %6
  %37 = load i64, ptr %15, align 8
  %38 = load i32, ptr %14, align 4
  %39 = sext i32 %38 to i64
  %40 = icmp ne i64 %37, %39
  br i1 %40, label %41, label %46

41:                                               ; preds = %36, %6
  %42 = load ptr, ptr %8, align 8
  %43 = load i64, ptr %15, align 8
  %44 = load i64, ptr %11, align 8
  %45 = add i64 %43, %44
  call void @llvm.memset.p0.i64(ptr align 1 %42, i8 0, i64 %45, i1 false)
  br label %51

46:                                               ; preds = %36
  %47 = load i64, ptr %15, align 8
  %48 = load i64, ptr %11, align 8
  %49 = add i64 %47, %48
  %50 = load ptr, ptr %9, align 8
  store i64 %49, ptr %50, align 8
  br label %51

51:                                               ; preds = %46, %41
  %52 = load i32, ptr %13, align 4
  ret i32 %52
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_open(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4, ptr noundef %5) #0 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca i64, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %8, align 8
  store ptr %1, ptr %9, align 8
  store ptr %2, ptr %10, align 8
  store ptr %3, ptr %11, align 8
  store i64 %4, ptr %12, align 8
  store ptr %5, ptr %13, align 8
  %16 = load ptr, ptr %8, align 8
  %17 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 16
  %18 = load i32, ptr %17, align 8
  store i32 %18, ptr %14, align 4
  %19 = load i64, ptr %12, align 8
  %20 = load i32, ptr %14, align 4
  %21 = sext i32 %20 to i64
  %22 = icmp ult i64 %19, %21
  br i1 %22, label %23, label %24

23:                                               ; preds = %6
  store i32 1, ptr %7, align 4
  br label %54

24:                                               ; preds = %6
  %25 = load ptr, ptr %8, align 8
  %26 = load ptr, ptr %11, align 8
  %27 = load i32, ptr %14, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, ptr %26, i64 %28
  %30 = load i64, ptr %12, align 8
  %31 = load i32, ptr %14, align 4
  %32 = sext i32 %31 to i64
  %33 = sub i64 %30, %32
  %34 = load ptr, ptr %11, align 8
  %35 = load ptr, ptr %13, align 8
  %36 = call i32 @mayo_verify(ptr noundef %25, ptr noundef %29, i64 noundef %33, ptr noundef %34, ptr noundef %35)
  store i32 %36, ptr %15, align 4
  %37 = load i32, ptr %15, align 4
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %52

39:                                               ; preds = %24
  %40 = load i64, ptr %12, align 8
  %41 = load i32, ptr %14, align 4
  %42 = sext i32 %41 to i64
  %43 = sub i64 %40, %42
  %44 = load ptr, ptr %10, align 8
  store i64 %43, ptr %44, align 8
  %45 = load ptr, ptr %9, align 8
  %46 = load ptr, ptr %11, align 8
  %47 = load i32, ptr %14, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i8, ptr %46, i64 %48
  %50 = load ptr, ptr %10, align 8
  %51 = load i64, ptr %50, align 8
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %45, ptr align 1 %49, i64 %51, i1 false)
  br label %52

52:                                               ; preds = %39, %24
  %53 = load i32, ptr %15, align 4
  store i32 %53, ptr %7, align 4
  br label %54

54:                                               ; preds = %52, %23
  %55 = load i32, ptr %7, align 4
  ret i32 %55
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_verify(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4) #0 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i64, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca [71 x i8], align 16
  %13 = alloca [142 x i8], align 16
  %14 = alloca [284 x i8], align 16
  %15 = alloca [1848 x i8], align 16
  %16 = alloca [114480 x i64], align 16
  %17 = alloca [104 x i8], align 16
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca ptr, align 8
  %27 = alloca ptr, align 8
  %28 = alloca ptr, align 8
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store i64 %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 284, i1 false)
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 915840, i1 false)
  %29 = load ptr, ptr %7, align 8
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 0
  %31 = load i32, ptr %30, align 8
  store i32 %31, ptr %18, align 4
  %32 = load ptr, ptr %7, align 8
  %33 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %32, i32 0, i32 1
  %34 = load i32, ptr %33, align 4
  store i32 %34, ptr %19, align 4
  %35 = load ptr, ptr %7, align 8
  %36 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %35, i32 0, i32 3
  %37 = load i32, ptr %36, align 4
  store i32 %37, ptr %20, align 4
  %38 = load ptr, ptr %7, align 8
  %39 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %38, i32 0, i32 6
  %40 = load i32, ptr %39, align 8
  store i32 %40, ptr %21, align 4
  %41 = load ptr, ptr %7, align 8
  %42 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %41, i32 0, i32 16
  %43 = load i32, ptr %42, align 8
  store i32 %43, ptr %22, align 4
  %44 = load ptr, ptr %7, align 8
  %45 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %44, i32 0, i32 19
  %46 = load i32, ptr %45, align 4
  store i32 %46, ptr %23, align 4
  %47 = load ptr, ptr %7, align 8
  %48 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %47, i32 0, i32 17
  %49 = load i32, ptr %48, align 4
  store i32 %49, ptr %24, align 4
  %50 = load ptr, ptr %7, align 8
  %51 = load ptr, ptr %11, align 8
  %52 = getelementptr inbounds [114480 x i64], ptr %16, i64 0, i64 0
  %53 = call i32 @mayo_expand_pk(ptr noundef %50, ptr noundef %51, ptr noundef %52)
  store i32 %53, ptr %25, align 4
  %54 = load i32, ptr %25, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %57

56:                                               ; preds = %5
  store i32 1, ptr %6, align 4
  br label %152

57:                                               ; preds = %5
  %58 = getelementptr inbounds [114480 x i64], ptr %16, i64 0, i64 0
  store ptr %58, ptr %26, align 8
  %59 = load ptr, ptr %26, align 8
  %60 = load ptr, ptr %7, align 8
  %61 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %60, i32 0, i32 1
  %62 = load i32, ptr %61, align 4
  %63 = load ptr, ptr %7, align 8
  %64 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %63, i32 0, i32 2
  %65 = load i32, ptr %64, align 8
  %66 = sub nsw i32 %62, %65
  %67 = load ptr, ptr %7, align 8
  %68 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %67, i32 0, i32 1
  %69 = load i32, ptr %68, align 4
  %70 = load ptr, ptr %7, align 8
  %71 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %70, i32 0, i32 2
  %72 = load i32, ptr %71, align 8
  %73 = sub nsw i32 %69, %72
  %74 = add nsw i32 %73, 1
  %75 = mul nsw i32 %66, %74
  %76 = sdiv i32 %75, 2
  %77 = load ptr, ptr %7, align 8
  %78 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %77, i32 0, i32 21
  %79 = load i32, ptr %78, align 4
  %80 = mul nsw i32 %76, %79
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i64, ptr %59, i64 %81
  store ptr %82, ptr %27, align 8
  %83 = load ptr, ptr %27, align 8
  %84 = load ptr, ptr %7, align 8
  %85 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %84, i32 0, i32 1
  %86 = load i32, ptr %85, align 4
  %87 = load ptr, ptr %7, align 8
  %88 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %87, i32 0, i32 2
  %89 = load i32, ptr %88, align 8
  %90 = sub nsw i32 %86, %89
  %91 = load ptr, ptr %7, align 8
  %92 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %91, i32 0, i32 2
  %93 = load i32, ptr %92, align 8
  %94 = mul nsw i32 %90, %93
  %95 = load ptr, ptr %7, align 8
  %96 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %95, i32 0, i32 21
  %97 = load i32, ptr %96, align 4
  %98 = mul nsw i32 %94, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i64, ptr %83, i64 %99
  store ptr %100, ptr %28, align 8
  %101 = getelementptr inbounds [104 x i8], ptr %17, i64 0, i64 0
  %102 = load i32, ptr %23, align 4
  %103 = sext i32 %102 to i64
  %104 = load ptr, ptr %8, align 8
  %105 = load i64, ptr %9, align 8
  %106 = call i32 @shake256(ptr noundef %101, i64 noundef %103, ptr noundef %104, i64 noundef %105)
  %107 = getelementptr inbounds [104 x i8], ptr %17, i64 0, i64 0
  %108 = load i32, ptr %23, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds i8, ptr %107, i64 %109
  %111 = load ptr, ptr %10, align 8
  %112 = load i32, ptr %22, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i8, ptr %111, i64 %113
  %115 = load i32, ptr %24, align 4
  %116 = sext i32 %115 to i64
  %117 = sub i64 0, %116
  %118 = getelementptr inbounds i8, ptr %114, i64 %117
  %119 = load i32, ptr %24, align 4
  %120 = sext i32 %119 to i64
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %110, ptr align 1 %118, i64 %120, i1 false)
  %121 = getelementptr inbounds [71 x i8], ptr %12, i64 0, i64 0
  %122 = load i32, ptr %21, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [104 x i8], ptr %17, i64 0, i64 0
  %125 = load i32, ptr %23, align 4
  %126 = load i32, ptr %24, align 4
  %127 = add nsw i32 %125, %126
  %128 = sext i32 %127 to i64
  %129 = call i32 @shake256(ptr noundef %121, i64 noundef %123, ptr noundef %124, i64 noundef %128)
  %130 = getelementptr inbounds [71 x i8], ptr %12, i64 0, i64 0
  %131 = getelementptr inbounds [142 x i8], ptr %13, i64 0, i64 0
  %132 = load i32, ptr %18, align 4
  call void @decode(ptr noundef %130, ptr noundef %131, i32 noundef %132)
  %133 = load ptr, ptr %10, align 8
  %134 = getelementptr inbounds [1848 x i8], ptr %15, i64 0, i64 0
  %135 = load i32, ptr %20, align 4
  %136 = load i32, ptr %19, align 4
  %137 = mul nsw i32 %135, %136
  call void @decode(ptr noundef %133, ptr noundef %134, i32 noundef %137)
  %138 = load ptr, ptr %7, align 8
  %139 = getelementptr inbounds [1848 x i8], ptr %15, i64 0, i64 0
  %140 = load ptr, ptr %26, align 8
  %141 = load ptr, ptr %27, align 8
  %142 = load ptr, ptr %28, align 8
  %143 = getelementptr inbounds [284 x i8], ptr %14, i64 0, i64 0
  call void @eval_public_map(ptr noundef %138, ptr noundef %139, ptr noundef %140, ptr noundef %141, ptr noundef %142, ptr noundef %143)
  %144 = getelementptr inbounds [284 x i8], ptr %14, i64 0, i64 0
  %145 = getelementptr inbounds [142 x i8], ptr %13, i64 0, i64 0
  %146 = load i32, ptr %18, align 4
  %147 = sext i32 %146 to i64
  %148 = call i32 @memcmp(ptr noundef %144, ptr noundef %145, i64 noundef %147) #8
  %149 = icmp eq i32 %148, 0
  br i1 %149, label %150, label %151

150:                                              ; preds = %57
  store i32 0, ptr %6, align 4
  br label %152

151:                                              ; preds = %57
  store i32 1, ptr %6, align 4
  br label %152

152:                                              ; preds = %151, %150, %56
  %153 = load i32, ptr %6, align 4
  ret i32 %153
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_expand_pk(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %6, align 8
  %9 = load ptr, ptr %5, align 8
  call void @expand_P1_P2(ptr noundef %7, ptr noundef %8, ptr noundef %9)
  %10 = load ptr, ptr %5, align 8
  %11 = load ptr, ptr %4, align 8
  %12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 20
  %13 = load i32, ptr %12, align 8
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds i8, ptr %10, i64 %14
  %16 = load ptr, ptr %6, align 8
  %17 = load ptr, ptr %4, align 8
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1
  %19 = load i32, ptr %18, align 4
  %20 = load ptr, ptr %4, align 8
  %21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 2
  %22 = load i32, ptr %21, align 8
  %23 = sub nsw i32 %19, %22
  %24 = load ptr, ptr %4, align 8
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 1
  %26 = load i32, ptr %25, align 4
  %27 = load ptr, ptr %4, align 8
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2
  %29 = load i32, ptr %28, align 8
  %30 = sub nsw i32 %26, %29
  %31 = add nsw i32 %30, 1
  %32 = mul nsw i32 %23, %31
  %33 = sdiv i32 %32, 2
  %34 = load ptr, ptr %4, align 8
  %35 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %34, i32 0, i32 21
  %36 = load i32, ptr %35, align 4
  %37 = mul nsw i32 %33, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i64, ptr %16, i64 %38
  %40 = load ptr, ptr %4, align 8
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 1
  %42 = load i32, ptr %41, align 4
  %43 = load ptr, ptr %4, align 8
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 2
  %45 = load i32, ptr %44, align 8
  %46 = sub nsw i32 %42, %45
  %47 = load ptr, ptr %4, align 8
  %48 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %47, i32 0, i32 2
  %49 = load i32, ptr %48, align 8
  %50 = mul nsw i32 %46, %49
  %51 = load ptr, ptr %4, align 8
  %52 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %51, i32 0, i32 21
  %53 = load i32, ptr %52, align 4
  %54 = mul nsw i32 %50, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i64, ptr %39, i64 %55
  %57 = load ptr, ptr %4, align 8
  %58 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %57, i32 0, i32 2
  %59 = load i32, ptr %58, align 8
  %60 = load ptr, ptr %4, align 8
  %61 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %60, i32 0, i32 2
  %62 = load i32, ptr %61, align 8
  %63 = add nsw i32 %62, 1
  %64 = mul nsw i32 %59, %63
  %65 = sdiv i32 %64, 2
  %66 = load ptr, ptr %4, align 8
  %67 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %66, i32 0, i32 21
  %68 = load i32, ptr %67, align 4
  %69 = mul nsw i32 %65, %68
  %70 = load ptr, ptr %4, align 8
  %71 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %70, i32 0, i32 21
  %72 = load i32, ptr %71, align 4
  %73 = sdiv i32 %69, %72
  %74 = load ptr, ptr %4, align 8
  %75 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %74, i32 0, i32 0
  %76 = load i32, ptr %75, align 8
  call void @unpack_m_vecs(ptr noundef %15, ptr noundef %56, i32 noundef %73, i32 noundef %76)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @eval_public_map(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca [1296 x i64], align 16
  %14 = alloca [142 x i8], align 16
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 10368, i1 false)
  %15 = load ptr, ptr %7, align 8
  %16 = load ptr, ptr %9, align 8
  %17 = load ptr, ptr %10, align 8
  %18 = load ptr, ptr %11, align 8
  %19 = load ptr, ptr %8, align 8
  %20 = getelementptr inbounds [1296 x i64], ptr %13, i64 0, i64 0
  call void @m_calculate_PS_SPS(ptr noundef %15, ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20)
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 142, i1 false)
  %21 = load ptr, ptr %7, align 8
  %22 = getelementptr inbounds [1296 x i64], ptr %13, i64 0, i64 0
  %23 = getelementptr inbounds [142 x i8], ptr %14, i64 0, i64 0
  %24 = load ptr, ptr %12, align 8
  call void @compute_rhs(ptr noundef %21, ptr noundef %22, ptr noundef %23, ptr noundef %24)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_calculate_PS_SPS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca [16632 x i64], align 16
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store ptr %2, ptr %9, align 8
  store ptr %3, ptr %10, align 8
  store ptr %4, ptr %11, align 8
  store ptr %5, ptr %12, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 133056, i1 false)
  %14 = load ptr, ptr %8, align 8
  %15 = load ptr, ptr %9, align 8
  %16 = load ptr, ptr %10, align 8
  %17 = load ptr, ptr %11, align 8
  %18 = load ptr, ptr %7, align 8
  %19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 0
  %20 = load i32, ptr %19, align 8
  %21 = load ptr, ptr %7, align 8
  %22 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %21, i32 0, i32 1
  %23 = load i32, ptr %22, align 4
  %24 = load ptr, ptr %7, align 8
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2
  %26 = load i32, ptr %25, align 8
  %27 = sub nsw i32 %23, %26
  %28 = load ptr, ptr %7, align 8
  %29 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %28, i32 0, i32 2
  %30 = load i32, ptr %29, align 8
  %31 = load ptr, ptr %7, align 8
  %32 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 3
  %33 = load i32, ptr %32, align 4
  %34 = getelementptr inbounds [16632 x i64], ptr %13, i64 0, i64 0
  call void @mayo_generic_m_calculate_PS(ptr noundef %14, ptr noundef %15, ptr noundef %16, ptr noundef %17, i32 noundef %20, i32 noundef %27, i32 noundef %30, i32 noundef %33, ptr noundef %34)
  %35 = getelementptr inbounds [16632 x i64], ptr %13, i64 0, i64 0
  %36 = load ptr, ptr %11, align 8
  %37 = load ptr, ptr %7, align 8
  %38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 0
  %39 = load i32, ptr %38, align 8
  %40 = load ptr, ptr %7, align 8
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 3
  %42 = load i32, ptr %41, align 4
  %43 = load ptr, ptr %7, align 8
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 1
  %45 = load i32, ptr %44, align 4
  %46 = load ptr, ptr %12, align 8
  call void @mayo_generic_m_calculate_SPS(ptr noundef %35, ptr noundef %36, i32 noundef %39, i32 noundef %42, i32 noundef %45, ptr noundef %46)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mayo_generic_m_calculate_PS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8) #0 {
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca ptr, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca [266112 x i64], align 16
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  store ptr %0, ptr %10, align 8
  store ptr %1, ptr %11, align 8
  store ptr %2, ptr %12, align 8
  store ptr %3, ptr %13, align 8
  store i32 %4, ptr %14, align 4
  store i32 %5, ptr %15, align 4
  store i32 %6, ptr %16, align 4
  store i32 %7, ptr %17, align 4
  store ptr %8, ptr %18, align 8
  %33 = load i32, ptr %16, align 4
  %34 = load i32, ptr %15, align 4
  %35 = add nsw i32 %33, %34
  store i32 %35, ptr %19, align 4
  %36 = load i32, ptr %14, align 4
  %37 = add nsw i32 %36, 15
  %38 = sdiv i32 %37, 16
  store i32 %38, ptr %20, align 4
  call void @llvm.memset.p0.i64(ptr align 16 %21, i8 0, i64 2128896, i1 false)
  store i32 0, ptr %22, align 4
  store i32 0, ptr %23, align 4
  br label %39

39:                                               ; preds = %147, %9
  %40 = load i32, ptr %23, align 4
  %41 = load i32, ptr %15, align 4
  %42 = icmp slt i32 %40, %41
  br i1 %42, label %43, label %150

43:                                               ; preds = %39
  %44 = load i32, ptr %23, align 4
  store i32 %44, ptr %24, align 4
  br label %45

45:                                               ; preds = %90, %43
  %46 = load i32, ptr %24, align 4
  %47 = load i32, ptr %15, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %93

49:                                               ; preds = %45
  store i32 0, ptr %25, align 4
  br label %50

50:                                               ; preds = %84, %49
  %51 = load i32, ptr %25, align 4
  %52 = load i32, ptr %17, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %87

54:                                               ; preds = %50
  %55 = load i32, ptr %20, align 4
  %56 = load ptr, ptr %10, align 8
  %57 = load i32, ptr %22, align 4
  %58 = load i32, ptr %20, align 4
  %59 = mul nsw i32 %57, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i64, ptr %56, i64 %60
  %62 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0
  %63 = load i32, ptr %23, align 4
  %64 = load i32, ptr %17, align 4
  %65 = mul nsw i32 %63, %64
  %66 = load i32, ptr %25, align 4
  %67 = add nsw i32 %65, %66
  %68 = mul nsw i32 %67, 16
  %69 = load ptr, ptr %13, align 8
  %70 = load i32, ptr %25, align 4
  %71 = load i32, ptr %19, align 4
  %72 = mul nsw i32 %70, %71
  %73 = load i32, ptr %24, align 4
  %74 = add nsw i32 %72, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds i8, ptr %69, i64 %75
  %77 = load i8, ptr %76, align 1
  %78 = zext i8 %77 to i32
  %79 = add nsw i32 %68, %78
  %80 = load i32, ptr %20, align 4
  %81 = mul nsw i32 %79, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i64, ptr %62, i64 %82
  call void @m_vec_add(i32 noundef %55, ptr noundef %61, ptr noundef %83)
  br label %84

84:                                               ; preds = %54
  %85 = load i32, ptr %25, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, ptr %25, align 4
  br label %50, !llvm.loop !63

87:                                               ; preds = %50
  %88 = load i32, ptr %22, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, ptr %22, align 4
  br label %90

90:                                               ; preds = %87
  %91 = load i32, ptr %24, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, ptr %24, align 4
  br label %45, !llvm.loop !64

93:                                               ; preds = %45
  store i32 0, ptr %26, align 4
  br label %94

94:                                               ; preds = %143, %93
  %95 = load i32, ptr %26, align 4
  %96 = load i32, ptr %16, align 4
  %97 = icmp slt i32 %95, %96
  br i1 %97, label %98, label %146

98:                                               ; preds = %94
  store i32 0, ptr %27, align 4
  br label %99

99:                                               ; preds = %139, %98
  %100 = load i32, ptr %27, align 4
  %101 = load i32, ptr %17, align 4
  %102 = icmp slt i32 %100, %101
  br i1 %102, label %103, label %142

103:                                              ; preds = %99
  %104 = load i32, ptr %20, align 4
  %105 = load ptr, ptr %11, align 8
  %106 = load i32, ptr %23, align 4
  %107 = load i32, ptr %16, align 4
  %108 = mul nsw i32 %106, %107
  %109 = load i32, ptr %26, align 4
  %110 = add nsw i32 %108, %109
  %111 = load i32, ptr %20, align 4
  %112 = mul nsw i32 %110, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i64, ptr %105, i64 %113
  %115 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0
  %116 = load i32, ptr %23, align 4
  %117 = load i32, ptr %17, align 4
  %118 = mul nsw i32 %116, %117
  %119 = load i32, ptr %27, align 4
  %120 = add nsw i32 %118, %119
  %121 = mul nsw i32 %120, 16
  %122 = load ptr, ptr %13, align 8
  %123 = load i32, ptr %27, align 4
  %124 = load i32, ptr %19, align 4
  %125 = mul nsw i32 %123, %124
  %126 = load i32, ptr %26, align 4
  %127 = add nsw i32 %125, %126
  %128 = load i32, ptr %15, align 4
  %129 = add nsw i32 %127, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i8, ptr %122, i64 %130
  %132 = load i8, ptr %131, align 1
  %133 = zext i8 %132 to i32
  %134 = add nsw i32 %121, %133
  %135 = load i32, ptr %20, align 4
  %136 = mul nsw i32 %134, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i64, ptr %115, i64 %137
  call void @m_vec_add(i32 noundef %104, ptr noundef %114, ptr noundef %138)
  br label %139

139:                                              ; preds = %103
  %140 = load i32, ptr %27, align 4
  %141 = add nsw i32 %140, 1
  store i32 %141, ptr %27, align 4
  br label %99, !llvm.loop !65

142:                                              ; preds = %99
  br label %143

143:                                              ; preds = %142
  %144 = load i32, ptr %26, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr %26, align 4
  br label %94, !llvm.loop !66

146:                                              ; preds = %94
  br label %147

147:                                              ; preds = %146
  %148 = load i32, ptr %23, align 4
  %149 = add nsw i32 %148, 1
  store i32 %149, ptr %23, align 4
  br label %39, !llvm.loop !67

150:                                              ; preds = %39
  store i32 0, ptr %28, align 4
  %151 = load i32, ptr %15, align 4
  store i32 %151, ptr %29, align 4
  br label %152

152:                                              ; preds = %207, %150
  %153 = load i32, ptr %29, align 4
  %154 = load i32, ptr %19, align 4
  %155 = icmp slt i32 %153, %154
  br i1 %155, label %156, label %210

156:                                              ; preds = %152
  %157 = load i32, ptr %29, align 4
  store i32 %157, ptr %30, align 4
  br label %158

158:                                              ; preds = %203, %156
  %159 = load i32, ptr %30, align 4
  %160 = load i32, ptr %19, align 4
  %161 = icmp slt i32 %159, %160
  br i1 %161, label %162, label %206

162:                                              ; preds = %158
  store i32 0, ptr %31, align 4
  br label %163

163:                                              ; preds = %197, %162
  %164 = load i32, ptr %31, align 4
  %165 = load i32, ptr %17, align 4
  %166 = icmp slt i32 %164, %165
  br i1 %166, label %167, label %200

167:                                              ; preds = %163
  %168 = load i32, ptr %20, align 4
  %169 = load ptr, ptr %12, align 8
  %170 = load i32, ptr %28, align 4
  %171 = load i32, ptr %20, align 4
  %172 = mul nsw i32 %170, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds i64, ptr %169, i64 %173
  %175 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0
  %176 = load i32, ptr %29, align 4
  %177 = load i32, ptr %17, align 4
  %178 = mul nsw i32 %176, %177
  %179 = load i32, ptr %31, align 4
  %180 = add nsw i32 %178, %179
  %181 = mul nsw i32 %180, 16
  %182 = load ptr, ptr %13, align 8
  %183 = load i32, ptr %31, align 4
  %184 = load i32, ptr %19, align 4
  %185 = mul nsw i32 %183, %184
  %186 = load i32, ptr %30, align 4
  %187 = add nsw i32 %185, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds i8, ptr %182, i64 %188
  %190 = load i8, ptr %189, align 1
  %191 = zext i8 %190 to i32
  %192 = add nsw i32 %181, %191
  %193 = load i32, ptr %20, align 4
  %194 = mul nsw i32 %192, %193
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds i64, ptr %175, i64 %195
  call void @m_vec_add(i32 noundef %168, ptr noundef %174, ptr noundef %196)
  br label %197

197:                                              ; preds = %167
  %198 = load i32, ptr %31, align 4
  %199 = add nsw i32 %198, 1
  store i32 %199, ptr %31, align 4
  br label %163, !llvm.loop !68

200:                                              ; preds = %163
  %201 = load i32, ptr %28, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, ptr %28, align 4
  br label %203

203:                                              ; preds = %200
  %204 = load i32, ptr %30, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, ptr %30, align 4
  br label %158, !llvm.loop !69

206:                                              ; preds = %158
  br label %207

207:                                              ; preds = %206
  %208 = load i32, ptr %29, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, ptr %29, align 4
  br label %152, !llvm.loop !70

210:                                              ; preds = %152
  store i32 0, ptr %32, align 4
  br label %211

211:                                              ; preds = %217, %210
  %212 = load i32, ptr %32, align 4
  %213 = load i32, ptr %19, align 4
  %214 = load i32, ptr %17, align 4
  %215 = mul nsw i32 %213, %214
  %216 = icmp slt i32 %212, %215
  br i1 %216, label %217, label %234

217:                                              ; preds = %211
  %218 = load i32, ptr %20, align 4
  %219 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0
  %220 = load i32, ptr %32, align 4
  %221 = mul nsw i32 %220, 16
  %222 = load i32, ptr %20, align 4
  %223 = mul nsw i32 %221, %222
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds i64, ptr %219, i64 %224
  %226 = load ptr, ptr %18, align 8
  %227 = load i32, ptr %32, align 4
  %228 = load i32, ptr %20, align 4
  %229 = mul nsw i32 %227, %228
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i64, ptr %226, i64 %230
  call void @m_vec_multiply_bins(i32 noundef %218, ptr noundef %225, ptr noundef %231)
  %232 = load i32, ptr %32, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, ptr %32, align 4
  br label %211, !llvm.loop !71

234:                                              ; preds = %211
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mayo_generic_m_calculate_SPS(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5) #0 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca [20736 x i64], align 16
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
  store ptr %1, ptr %8, align 8
  store i32 %2, ptr %9, align 4
  store i32 %3, ptr %10, align 4
  store i32 %4, ptr %11, align 4
  store ptr %5, ptr %12, align 8
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 165888, i1 false)
  %19 = load i32, ptr %9, align 4
  %20 = add nsw i32 %19, 15
  %21 = sdiv i32 %20, 16
  store i32 %21, ptr %14, align 4
  store i32 0, ptr %15, align 4
  br label %22

22:                                               ; preds = %78, %6
  %23 = load i32, ptr %15, align 4
  %24 = load i32, ptr %10, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %81

26:                                               ; preds = %22
  store i32 0, ptr %16, align 4
  br label %27

27:                                               ; preds = %74, %26
  %28 = load i32, ptr %16, align 4
  %29 = load i32, ptr %11, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %77

31:                                               ; preds = %27
  store i32 0, ptr %17, align 4
  br label %32

32:                                               ; preds = %70, %31
  %33 = load i32, ptr %17, align 4
  %34 = load i32, ptr %10, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %73

36:                                               ; preds = %32
  %37 = load i32, ptr %14, align 4
  %38 = load ptr, ptr %7, align 8
  %39 = load i32, ptr %16, align 4
  %40 = load i32, ptr %10, align 4
  %41 = mul nsw i32 %39, %40
  %42 = load i32, ptr %17, align 4
  %43 = add nsw i32 %41, %42
  %44 = load i32, ptr %14, align 4
  %45 = mul nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i64, ptr %38, i64 %46
  %48 = getelementptr inbounds [20736 x i64], ptr %13, i64 0, i64 0
  %49 = load i32, ptr %15, align 4
  %50 = load i32, ptr %10, align 4
  %51 = mul nsw i32 %49, %50
  %52 = load i32, ptr %17, align 4
  %53 = add nsw i32 %51, %52
  %54 = mul nsw i32 %53, 16
  %55 = load ptr, ptr %8, align 8
  %56 = load i32, ptr %15, align 4
  %57 = load i32, ptr %11, align 4
  %58 = mul nsw i32 %56, %57
  %59 = load i32, ptr %16, align 4
  %60 = add nsw i32 %58, %59
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i8, ptr %55, i64 %61
  %63 = load i8, ptr %62, align 1
  %64 = zext i8 %63 to i32
  %65 = add nsw i32 %54, %64
  %66 = load i32, ptr %14, align 4
  %67 = mul nsw i32 %65, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i64, ptr %48, i64 %68
  call void @m_vec_add(i32 noundef %37, ptr noundef %47, ptr noundef %69)
  br label %70

70:                                               ; preds = %36
  %71 = load i32, ptr %17, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, ptr %17, align 4
  br label %32, !llvm.loop !72

73:                                               ; preds = %32
  br label %74

74:                                               ; preds = %73
  %75 = load i32, ptr %16, align 4
  %76 = add nsw i32 %75, 1
  store i32 %76, ptr %16, align 4
  br label %27, !llvm.loop !73

77:                                               ; preds = %27
  br label %78

78:                                               ; preds = %77
  %79 = load i32, ptr %15, align 4
  %80 = add nsw i32 %79, 1
  store i32 %80, ptr %15, align 4
  br label %22, !llvm.loop !74

81:                                               ; preds = %22
  store i32 0, ptr %18, align 4
  br label %82

82:                                               ; preds = %88, %81
  %83 = load i32, ptr %18, align 4
  %84 = load i32, ptr %10, align 4
  %85 = load i32, ptr %10, align 4
  %86 = mul nsw i32 %84, %85
  %87 = icmp slt i32 %83, %86
  br i1 %87, label %88, label %105

88:                                               ; preds = %82
  %89 = load i32, ptr %14, align 4
  %90 = getelementptr inbounds [20736 x i64], ptr %13, i64 0, i64 0
  %91 = load i32, ptr %18, align 4
  %92 = mul nsw i32 %91, 16
  %93 = load i32, ptr %14, align 4
  %94 = mul nsw i32 %92, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i64, ptr %90, i64 %95
  %97 = load ptr, ptr %12, align 8
  %98 = load i32, ptr %18, align 4
  %99 = load i32, ptr %14, align 4
  %100 = mul nsw i32 %98, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds i64, ptr %97, i64 %101
  call void @m_vec_multiply_bins(i32 noundef %89, ptr noundef %96, ptr noundef %102)
  %103 = load i32, ptr %18, align 4
  %104 = add nsw i32 %103, 1
  store i32 %104, ptr %18, align 4
  br label %82, !llvm.loop !75

105:                                              ; preds = %82
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_add(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %24, %3
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %27

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i64, ptr %13, i64 %15
  %17 = load i64, ptr %16, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i64, ptr %18, i64 %20
  %22 = load i64, ptr %21, align 8
  %23 = xor i64 %22, %17
  store i64 %23, ptr %21, align 8
  br label %24

24:                                               ; preds = %12
  %25 = load i32, ptr %7, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %7, align 4
  br label %8, !llvm.loop !76

27:                                               ; preds = %8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_multiply_bins(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load i32, ptr %4, align 4
  %8 = load ptr, ptr %5, align 8
  %9 = load i32, ptr %4, align 4
  %10 = mul nsw i32 5, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i64, ptr %8, i64 %11
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %4, align 4
  %15 = mul nsw i32 10, %14
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i64, ptr %13, i64 %16
  call void @m_vec_mul_add_x_inv(i32 noundef %7, ptr noundef %12, ptr noundef %17)
  %18 = load i32, ptr %4, align 4
  %19 = load ptr, ptr %5, align 8
  %20 = load i32, ptr %4, align 4
  %21 = mul nsw i32 11, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i64, ptr %19, i64 %22
  %24 = load ptr, ptr %5, align 8
  %25 = load i32, ptr %4, align 4
  %26 = mul nsw i32 12, %25
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i64, ptr %24, i64 %27
  call void @m_vec_mul_add_x(i32 noundef %18, ptr noundef %23, ptr noundef %28)
  %29 = load i32, ptr %4, align 4
  %30 = load ptr, ptr %5, align 8
  %31 = load i32, ptr %4, align 4
  %32 = mul nsw i32 10, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i64, ptr %30, i64 %33
  %35 = load ptr, ptr %5, align 8
  %36 = load i32, ptr %4, align 4
  %37 = mul nsw i32 7, %36
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i64, ptr %35, i64 %38
  call void @m_vec_mul_add_x_inv(i32 noundef %29, ptr noundef %34, ptr noundef %39)
  %40 = load i32, ptr %4, align 4
  %41 = load ptr, ptr %5, align 8
  %42 = load i32, ptr %4, align 4
  %43 = mul nsw i32 12, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i64, ptr %41, i64 %44
  %46 = load ptr, ptr %5, align 8
  %47 = load i32, ptr %4, align 4
  %48 = mul nsw i32 6, %47
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i64, ptr %46, i64 %49
  call void @m_vec_mul_add_x(i32 noundef %40, ptr noundef %45, ptr noundef %50)
  %51 = load i32, ptr %4, align 4
  %52 = load ptr, ptr %5, align 8
  %53 = load i32, ptr %4, align 4
  %54 = mul nsw i32 7, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i64, ptr %52, i64 %55
  %57 = load ptr, ptr %5, align 8
  %58 = load i32, ptr %4, align 4
  %59 = mul nsw i32 14, %58
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i64, ptr %57, i64 %60
  call void @m_vec_mul_add_x_inv(i32 noundef %51, ptr noundef %56, ptr noundef %61)
  %62 = load i32, ptr %4, align 4
  %63 = load ptr, ptr %5, align 8
  %64 = load i32, ptr %4, align 4
  %65 = mul nsw i32 6, %64
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i64, ptr %63, i64 %66
  %68 = load ptr, ptr %5, align 8
  %69 = load i32, ptr %4, align 4
  %70 = mul nsw i32 3, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i64, ptr %68, i64 %71
  call void @m_vec_mul_add_x(i32 noundef %62, ptr noundef %67, ptr noundef %72)
  %73 = load i32, ptr %4, align 4
  %74 = load ptr, ptr %5, align 8
  %75 = load i32, ptr %4, align 4
  %76 = mul nsw i32 14, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i64, ptr %74, i64 %77
  %79 = load ptr, ptr %5, align 8
  %80 = load i32, ptr %4, align 4
  %81 = mul nsw i32 15, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i64, ptr %79, i64 %82
  call void @m_vec_mul_add_x_inv(i32 noundef %73, ptr noundef %78, ptr noundef %83)
  %84 = load i32, ptr %4, align 4
  %85 = load ptr, ptr %5, align 8
  %86 = load i32, ptr %4, align 4
  %87 = mul nsw i32 3, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i64, ptr %85, i64 %88
  %90 = load ptr, ptr %5, align 8
  %91 = load i32, ptr %4, align 4
  %92 = mul nsw i32 8, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i64, ptr %90, i64 %93
  call void @m_vec_mul_add_x(i32 noundef %84, ptr noundef %89, ptr noundef %94)
  %95 = load i32, ptr %4, align 4
  %96 = load ptr, ptr %5, align 8
  %97 = load i32, ptr %4, align 4
  %98 = mul nsw i32 15, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i64, ptr %96, i64 %99
  %101 = load ptr, ptr %5, align 8
  %102 = load i32, ptr %4, align 4
  %103 = mul nsw i32 13, %102
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i64, ptr %101, i64 %104
  call void @m_vec_mul_add_x_inv(i32 noundef %95, ptr noundef %100, ptr noundef %105)
  %106 = load i32, ptr %4, align 4
  %107 = load ptr, ptr %5, align 8
  %108 = load i32, ptr %4, align 4
  %109 = mul nsw i32 8, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds i64, ptr %107, i64 %110
  %112 = load ptr, ptr %5, align 8
  %113 = load i32, ptr %4, align 4
  %114 = mul nsw i32 4, %113
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i64, ptr %112, i64 %115
  call void @m_vec_mul_add_x(i32 noundef %106, ptr noundef %111, ptr noundef %116)
  %117 = load i32, ptr %4, align 4
  %118 = load ptr, ptr %5, align 8
  %119 = load i32, ptr %4, align 4
  %120 = mul nsw i32 13, %119
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i64, ptr %118, i64 %121
  %123 = load ptr, ptr %5, align 8
  %124 = load i32, ptr %4, align 4
  %125 = mul nsw i32 9, %124
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i64, ptr %123, i64 %126
  call void @m_vec_mul_add_x_inv(i32 noundef %117, ptr noundef %122, ptr noundef %127)
  %128 = load i32, ptr %4, align 4
  %129 = load ptr, ptr %5, align 8
  %130 = load i32, ptr %4, align 4
  %131 = mul nsw i32 4, %130
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i64, ptr %129, i64 %132
  %134 = load ptr, ptr %5, align 8
  %135 = load i32, ptr %4, align 4
  %136 = mul nsw i32 2, %135
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i64, ptr %134, i64 %137
  call void @m_vec_mul_add_x(i32 noundef %128, ptr noundef %133, ptr noundef %138)
  %139 = load i32, ptr %4, align 4
  %140 = load ptr, ptr %5, align 8
  %141 = load i32, ptr %4, align 4
  %142 = mul nsw i32 9, %141
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i64, ptr %140, i64 %143
  %145 = load ptr, ptr %5, align 8
  %146 = load i32, ptr %4, align 4
  %147 = mul nsw i32 1, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i64, ptr %145, i64 %148
  call void @m_vec_mul_add_x_inv(i32 noundef %139, ptr noundef %144, ptr noundef %149)
  %150 = load i32, ptr %4, align 4
  %151 = load ptr, ptr %5, align 8
  %152 = load i32, ptr %4, align 4
  %153 = mul nsw i32 2, %152
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds i64, ptr %151, i64 %154
  %156 = load ptr, ptr %5, align 8
  %157 = load i32, ptr %4, align 4
  %158 = mul nsw i32 1, %157
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i64, ptr %156, i64 %159
  call void @m_vec_mul_add_x(i32 noundef %150, ptr noundef %155, ptr noundef %160)
  %161 = load i32, ptr %4, align 4
  %162 = load ptr, ptr %5, align 8
  %163 = load i32, ptr %4, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i64, ptr %162, i64 %164
  %166 = load ptr, ptr %6, align 8
  call void @m_vec_copy(i32 noundef %161, ptr noundef %165, ptr noundef %166)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_mul_add_x_inv(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 1229782938247303441, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %10

10:                                               ; preds = %39, %3
  %11 = load i32, ptr %8, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %42

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %8, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i64, ptr %15, i64 %17
  %19 = load i64, ptr %18, align 8
  %20 = load i64, ptr %7, align 8
  %21 = and i64 %19, %20
  store i64 %21, ptr %9, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = load i32, ptr %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i64, ptr %22, i64 %24
  %26 = load i64, ptr %25, align 8
  %27 = load i64, ptr %9, align 8
  %28 = xor i64 %26, %27
  %29 = lshr i64 %28, 1
  %30 = load i64, ptr %9, align 8
  %31 = mul i64 %30, 9
  %32 = xor i64 %29, %31
  %33 = load ptr, ptr %6, align 8
  %34 = load i32, ptr %8, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i64, ptr %33, i64 %35
  %37 = load i64, ptr %36, align 8
  %38 = xor i64 %37, %32
  store i64 %38, ptr %36, align 8
  br label %39

39:                                               ; preds = %14
  %40 = load i32, ptr %8, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, ptr %8, align 4
  br label %10, !llvm.loop !77

42:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_mul_add_x(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i64 -8608480567731124088, ptr %7, align 8
  store i32 0, ptr %8, align 4
  br label %10

10:                                               ; preds = %40, %3
  %11 = load i32, ptr %8, align 4
  %12 = load i32, ptr %4, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %43

14:                                               ; preds = %10
  %15 = load ptr, ptr %5, align 8
  %16 = load i32, ptr %8, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i64, ptr %15, i64 %17
  %19 = load i64, ptr %18, align 8
  %20 = load i64, ptr %7, align 8
  %21 = and i64 %19, %20
  store i64 %21, ptr %9, align 8
  %22 = load ptr, ptr %5, align 8
  %23 = load i32, ptr %8, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i64, ptr %22, i64 %24
  %26 = load i64, ptr %25, align 8
  %27 = load i64, ptr %9, align 8
  %28 = xor i64 %26, %27
  %29 = shl i64 %28, 1
  %30 = load i64, ptr %9, align 8
  %31 = lshr i64 %30, 3
  %32 = mul i64 %31, 3
  %33 = xor i64 %29, %32
  %34 = load ptr, ptr %6, align 8
  %35 = load i32, ptr %8, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i64, ptr %34, i64 %36
  %38 = load i64, ptr %37, align 8
  %39 = xor i64 %38, %33
  store i64 %39, ptr %37, align 8
  br label %40

40:                                               ; preds = %14
  %41 = load i32, ptr %8, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, ptr %8, align 4
  br label %10, !llvm.loop !78

43:                                               ; preds = %10
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_copy(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  store i32 0, ptr %7, align 4
  br label %8

8:                                                ; preds = %22, %3
  %9 = load i32, ptr %7, align 4
  %10 = load i32, ptr %4, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %25

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8
  %14 = load i32, ptr %7, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i64, ptr %13, i64 %15
  %17 = load i64, ptr %16, align 8
  %18 = load ptr, ptr %6, align 8
  %19 = load i32, ptr %7, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i64, ptr %18, i64 %20
  store i64 %17, ptr %21, align 8
  br label %22

22:                                               ; preds = %12
  %23 = load i32, ptr %7, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %7, align 4
  br label %8, !llvm.loop !79

25:                                               ; preds = %8
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind allocsize(0,1) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind allocsize(0,1) }
attributes #8 = { nounwind willreturn memory(read) }
attributes #9 = { nounwind }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"clang version 23.0.0git (https://github.com/llvm/llvm-project.git 0d562c96689de6bce7ca06bd1890724c72d9c536)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 2}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
!32 = distinct !{!32, !7}
!33 = distinct !{!33, !7}
!34 = distinct !{!34, !7}
!35 = distinct !{!35, !7}
!36 = distinct !{!36, !7}
!37 = distinct !{!37, !7}
!38 = distinct !{!38, !7}
!39 = distinct !{!39, !7}
!40 = distinct !{!40, !7}
!41 = distinct !{!41, !7}
!42 = distinct !{!42, !7}
!43 = distinct !{!43, !7}
!44 = distinct !{!44, !7}
!45 = distinct !{!45, !7}
!46 = distinct !{!46, !7}
!47 = distinct !{!47, !7}
!48 = distinct !{!48, !7}
!49 = distinct !{!49, !7}
!50 = distinct !{!50, !7}
!51 = distinct !{!51, !7}
!52 = distinct !{!52, !7}
!53 = distinct !{!53, !7}
!54 = distinct !{!54, !7}
!55 = distinct !{!55, !7}
!56 = distinct !{!56, !7}
!57 = distinct !{!57, !7}
!58 = distinct !{!58, !7}
!59 = distinct !{!59, !7}
!60 = distinct !{!60, !7}
!61 = distinct !{!61, !7}
!62 = distinct !{!62, !7}
!63 = distinct !{!63, !7}
!64 = distinct !{!64, !7}
!65 = distinct !{!65, !7}
!66 = distinct !{!66, !7}
!67 = distinct !{!67, !7}
!68 = distinct !{!68, !7}
!69 = distinct !{!69, !7}
!70 = distinct !{!70, !7}
!71 = distinct !{!71, !7}
!72 = distinct !{!72, !7}
!73 = distinct !{!73, !7}
!74 = distinct !{!74, !7}
!75 = distinct !{!75, !7}
!76 = distinct !{!76, !7}
!77 = distinct !{!77, !7}
!78 = distinct !{!78, !7}
!79 = distinct !{!79, !7}
