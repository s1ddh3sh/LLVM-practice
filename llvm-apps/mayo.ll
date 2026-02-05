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
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1, !dbg !9
@.str.3 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1, !dbg !26
@.str.7 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1, !dbg !31
@.str.8 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1, !dbg !36
@.str.9 = private unnamed_addr constant [39 x i8] c"mayo_open (with altered signature) -> \00", align 1, !dbg !41
@.str.10 = private unnamed_addr constant [41 x i8] c"mayo_verify (with altered signature) -> \00", align 1, !dbg !43
@unsigned_char_blocker = external global i8, align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !82 {
  %1 = alloca i32, align 4
  %2 = alloca [4 x ptr], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
    #dbg_declare(ptr %2, !86, !DIExpression(), !121)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %2, ptr align 16 @__const.main.params, i64 32, i1 false), !dbg !121
    #dbg_declare(ptr %3, !122, !DIExpression(), !123)
  store i32 4, ptr %3, align 4, !dbg !123
    #dbg_declare(ptr %4, !124, !DIExpression(), !126)
  store i32 0, ptr %4, align 4, !dbg !126
  br label %5, !dbg !127

5:                                                ; preds = %18, %0
  %6 = load i32, ptr %4, align 4, !dbg !128
  %7 = load i32, ptr %3, align 4, !dbg !130
  %8 = icmp slt i32 %6, %7, !dbg !131
  br i1 %8, label %9, label %21, !dbg !132

9:                                                ; preds = %5
  %10 = load i32, ptr %4, align 4, !dbg !133
  %11 = sext i32 %10 to i64, !dbg !136
  %12 = getelementptr inbounds [4 x ptr], ptr %2, i64 0, i64 %11, !dbg !136
  %13 = load ptr, ptr %12, align 8, !dbg !136
  %14 = call i32 @example_mayo(ptr noundef %13), !dbg !137
  %15 = icmp ne i32 %14, 0, !dbg !138
  br i1 %15, label %16, label %17, !dbg !138

16:                                               ; preds = %9
  store i32 -1, ptr %1, align 4, !dbg !139
  br label %21, !dbg !139

17:                                               ; preds = %9
  br label %18, !dbg !141

18:                                               ; preds = %17
  %19 = load i32, ptr %4, align 4, !dbg !142
  %20 = add nsw i32 %19, 1, !dbg !142
  store i32 %20, ptr %4, align 4, !dbg !142
  br label %5, !dbg !143, !llvm.loop !144

21:                                               ; preds = %16, %5
  %22 = load i32, ptr %1, align 4, !dbg !147
  ret i32 %22, !dbg !147
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @example_mayo(ptr noundef %0) #0 !dbg !148 {
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
    #dbg_declare(ptr %2, !151, !DIExpression(), !152)
    #dbg_declare(ptr %3, !153, !DIExpression(), !154)
  store i64 32, ptr %3, align 8, !dbg !154
    #dbg_declare(ptr %4, !155, !DIExpression(), !156)
  %13 = load ptr, ptr %2, align 8, !dbg !157
  %14 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %13, i32 0, i32 16, !dbg !158
  %15 = load i32, ptr %14, align 8, !dbg !158
  %16 = sext i32 %15 to i64, !dbg !158
  %17 = load i64, ptr %3, align 8, !dbg !159
  %18 = add i64 %16, %17, !dbg !160
  store i64 %18, ptr %4, align 8, !dbg !156
    #dbg_declare(ptr %5, !161, !DIExpression(), !162)
  %19 = load ptr, ptr %2, align 8, !dbg !163
  %20 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 15, !dbg !164
  %21 = load i32, ptr %20, align 4, !dbg !164
  %22 = sext i32 %21 to i64, !dbg !164
  %23 = call noalias ptr @calloc(i64 noundef %22, i64 noundef 1) #7, !dbg !165
  store ptr %23, ptr %5, align 8, !dbg !162
    #dbg_declare(ptr %6, !166, !DIExpression(), !167)
  %24 = load ptr, ptr %2, align 8, !dbg !168
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 14, !dbg !169
  %26 = load i32, ptr %25, align 8, !dbg !169
  %27 = sext i32 %26 to i64, !dbg !169
  %28 = call noalias ptr @calloc(i64 noundef %27, i64 noundef 1) #7, !dbg !170
  store ptr %28, ptr %6, align 8, !dbg !167
    #dbg_declare(ptr %7, !171, !DIExpression(), !172)
  %29 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 915840) #7, !dbg !173
  store ptr %29, ptr %7, align 8, !dbg !172
    #dbg_declare(ptr %8, !174, !DIExpression(), !189)
  %30 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 907240) #7, !dbg !190
  store ptr %30, ptr %8, align 8, !dbg !189
    #dbg_declare(ptr %9, !191, !DIExpression(), !192)
  %31 = load ptr, ptr %2, align 8, !dbg !193
  %32 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 16, !dbg !194
  %33 = load i32, ptr %32, align 8, !dbg !194
  %34 = sext i32 %33 to i64, !dbg !194
  %35 = load i64, ptr %3, align 8, !dbg !195
  %36 = add i64 %34, %35, !dbg !196
  %37 = call noalias ptr @calloc(i64 noundef %36, i64 noundef 1) #7, !dbg !197
  store ptr %37, ptr %9, align 8, !dbg !192
    #dbg_declare(ptr %10, !198, !DIExpression(), !202)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %10, ptr align 16 @__const.example_mayo.msg, i64 32, i1 false), !dbg !202
    #dbg_declare(ptr %11, !203, !DIExpression(), !204)
  call void @llvm.memset.p0.i64(ptr align 16 %11, i8 0, i64 32, i1 false), !dbg !204
  %38 = load ptr, ptr %2, align 8, !dbg !205
  %39 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %38, i32 0, i32 22, !dbg !206
  %40 = load ptr, ptr %39, align 8, !dbg !206
  %41 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %40), !dbg !207
  %42 = call i32 (ptr, ...) @printf(ptr noundef @.str.1), !dbg !208
    #dbg_declare(ptr %12, !209, !DIExpression(), !210)
  %43 = load ptr, ptr %2, align 8, !dbg !211
  %44 = load ptr, ptr %5, align 8, !dbg !212
  %45 = load ptr, ptr %6, align 8, !dbg !213
  %46 = call i32 @mayo_keypair(ptr noundef %43, ptr noundef %44, ptr noundef %45), !dbg !214
  store i32 %46, ptr %12, align 4, !dbg !210
  %47 = load i32, ptr %12, align 4, !dbg !215
  %48 = icmp ne i32 %47, 0, !dbg !217
  br i1 %48, label %49, label %51, !dbg !217

49:                                               ; preds = %1
  %50 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !218
  store i32 -1, ptr %12, align 4, !dbg !220
  br label %170, !dbg !221

51:                                               ; preds = %1
  %52 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !222
  br label %53

53:                                               ; preds = %51
  %54 = call i32 (ptr, ...) @printf(ptr noundef @.str.4), !dbg !224
  %55 = load ptr, ptr %2, align 8, !dbg !225
  %56 = load ptr, ptr %6, align 8, !dbg !226
  %57 = load ptr, ptr %8, align 8, !dbg !227
  %58 = call i32 @mayo_expand_sk(ptr noundef %55, ptr noundef %56, ptr noundef %57), !dbg !228
  store i32 %58, ptr %12, align 4, !dbg !229
  %59 = load i32, ptr %12, align 4, !dbg !230
  %60 = icmp ne i32 %59, 0, !dbg !232
  br i1 %60, label %61, label %63, !dbg !232

61:                                               ; preds = %53
  %62 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !233
  store i32 -1, ptr %12, align 4, !dbg !235
  br label %170, !dbg !236

63:                                               ; preds = %53
  %64 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !237
  br label %65

65:                                               ; preds = %63
  %66 = call i32 (ptr, ...) @printf(ptr noundef @.str.5), !dbg !239
  %67 = load ptr, ptr %2, align 8, !dbg !240
  %68 = load ptr, ptr %5, align 8, !dbg !241
  %69 = load ptr, ptr %7, align 8, !dbg !242
  %70 = call i32 @mayo_expand_pk(ptr noundef %67, ptr noundef %68, ptr noundef %69), !dbg !243
  store i32 %70, ptr %12, align 4, !dbg !244
  %71 = load i32, ptr %12, align 4, !dbg !245
  %72 = icmp ne i32 %71, 0, !dbg !247
  br i1 %72, label %73, label %75, !dbg !247

73:                                               ; preds = %65
  %74 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !248
  store i32 -1, ptr %12, align 4, !dbg !250
  br label %170, !dbg !251

75:                                               ; preds = %65
  %76 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !252
  br label %77

77:                                               ; preds = %75
  %78 = call i32 (ptr, ...) @printf(ptr noundef @.str.6), !dbg !254
  %79 = load ptr, ptr %2, align 8, !dbg !255
  %80 = load ptr, ptr %9, align 8, !dbg !256
  %81 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !257
  %82 = load i64, ptr %3, align 8, !dbg !258
  %83 = load ptr, ptr %6, align 8, !dbg !259
  %84 = call i32 @mayo_sign(ptr noundef %79, ptr noundef %80, ptr noundef %4, ptr noundef %81, i64 noundef %82, ptr noundef %83), !dbg !260
  store i32 %84, ptr %12, align 4, !dbg !261
  %85 = load i32, ptr %12, align 4, !dbg !262
  %86 = icmp ne i32 %85, 0, !dbg !264
  br i1 %86, label %87, label %89, !dbg !264

87:                                               ; preds = %77
  %88 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !265
  store i32 -1, ptr %12, align 4, !dbg !267
  br label %170, !dbg !268

89:                                               ; preds = %77
  %90 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !269
  br label %91

91:                                               ; preds = %89
  %92 = call i32 (ptr, ...) @printf(ptr noundef @.str.7), !dbg !271
  %93 = load ptr, ptr %2, align 8, !dbg !272
  %94 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0, !dbg !273
  %95 = load ptr, ptr %9, align 8, !dbg !274
  %96 = load i64, ptr %4, align 8, !dbg !275
  %97 = load ptr, ptr %5, align 8, !dbg !276
  %98 = call i32 @mayo_open(ptr noundef %93, ptr noundef %94, ptr noundef %3, ptr noundef %95, i64 noundef %96, ptr noundef %97), !dbg !277
  store i32 %98, ptr %12, align 4, !dbg !278
  %99 = load i32, ptr %12, align 4, !dbg !279
  %100 = icmp ne i32 %99, 0, !dbg !281
  br i1 %100, label %107, label %101, !dbg !282

101:                                              ; preds = %91
  %102 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !283
  %103 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0, !dbg !284
  %104 = load i64, ptr %3, align 8, !dbg !285
  %105 = call i32 @memcmp(ptr noundef %102, ptr noundef %103, i64 noundef %104) #8, !dbg !286
  %106 = icmp ne i32 %105, 0, !dbg !286
  br i1 %106, label %107, label %109, !dbg !282

107:                                              ; preds = %101, %91
  %108 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !287
  store i32 -1, ptr %12, align 4, !dbg !289
  br label %170, !dbg !290

109:                                              ; preds = %101
  store i32 0, ptr %12, align 4, !dbg !291
  %110 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !293
  br label %111

111:                                              ; preds = %109
  %112 = call i32 (ptr, ...) @printf(ptr noundef @.str.8), !dbg !294
  %113 = load ptr, ptr %2, align 8, !dbg !295
  %114 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !296
  %115 = load i64, ptr %3, align 8, !dbg !297
  %116 = load ptr, ptr %9, align 8, !dbg !298
  %117 = load ptr, ptr %5, align 8, !dbg !299
  %118 = call i32 @mayo_verify(ptr noundef %113, ptr noundef %114, i64 noundef %115, ptr noundef %116, ptr noundef %117), !dbg !300
  store i32 %118, ptr %12, align 4, !dbg !301
  %119 = load i32, ptr %12, align 4, !dbg !302
  %120 = icmp ne i32 %119, 0, !dbg !304
  br i1 %120, label %121, label %123, !dbg !304

121:                                              ; preds = %111
  %122 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !305
  store i32 -1, ptr %12, align 4, !dbg !307
  br label %170, !dbg !308

123:                                              ; preds = %111
  store i32 0, ptr %12, align 4, !dbg !309
  %124 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !311
  br label %125

125:                                              ; preds = %123
  %126 = call i32 (ptr, ...) @printf(ptr noundef @.str.9), !dbg !312
  %127 = load ptr, ptr %9, align 8, !dbg !313
  %128 = getelementptr inbounds i8, ptr %127, i64 0, !dbg !313
  %129 = load i8, ptr %128, align 1, !dbg !313
  %130 = zext i8 %129 to i32, !dbg !313
  %131 = xor i32 %130, -1, !dbg !314
  %132 = trunc i32 %131 to i8, !dbg !314
  %133 = load ptr, ptr %9, align 8, !dbg !315
  %134 = getelementptr inbounds i8, ptr %133, i64 0, !dbg !315
  store i8 %132, ptr %134, align 1, !dbg !316
  %135 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0, !dbg !317
  %136 = load i64, ptr %3, align 8, !dbg !318
  call void @llvm.memset.p0.i64(ptr align 16 %135, i8 0, i64 %136, i1 false), !dbg !317
  %137 = load ptr, ptr %2, align 8, !dbg !319
  %138 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0, !dbg !320
  %139 = load ptr, ptr %9, align 8, !dbg !321
  %140 = load i64, ptr %4, align 8, !dbg !322
  %141 = load ptr, ptr %5, align 8, !dbg !323
  %142 = call i32 @mayo_open(ptr noundef %137, ptr noundef %138, ptr noundef %3, ptr noundef %139, i64 noundef %140, ptr noundef %141), !dbg !324
  store i32 %142, ptr %12, align 4, !dbg !325
  %143 = load i32, ptr %12, align 4, !dbg !326
  %144 = icmp ne i32 %143, 1, !dbg !328
  br i1 %144, label %151, label %145, !dbg !329

145:                                              ; preds = %125
  %146 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !330
  %147 = getelementptr inbounds [32 x i8], ptr %11, i64 0, i64 0, !dbg !331
  %148 = load i64, ptr %3, align 8, !dbg !332
  %149 = call i32 @memcmp(ptr noundef %146, ptr noundef %147, i64 noundef %148) #8, !dbg !333
  %150 = icmp ne i32 %149, 0, !dbg !333
  br i1 %150, label %153, label %151, !dbg !329

151:                                              ; preds = %145, %125
  %152 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !334
  store i32 -1, ptr %12, align 4, !dbg !336
  br label %170, !dbg !337

153:                                              ; preds = %145
  store i32 0, ptr %12, align 4, !dbg !338
  %154 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !340
  br label %155

155:                                              ; preds = %153
  %156 = call i32 (ptr, ...) @printf(ptr noundef @.str.10), !dbg !341
  %157 = load ptr, ptr %2, align 8, !dbg !342
  %158 = getelementptr inbounds [32 x i8], ptr %10, i64 0, i64 0, !dbg !343
  %159 = load i64, ptr %3, align 8, !dbg !344
  %160 = load ptr, ptr %9, align 8, !dbg !345
  %161 = load ptr, ptr %5, align 8, !dbg !346
  %162 = call i32 @mayo_verify(ptr noundef %157, ptr noundef %158, i64 noundef %159, ptr noundef %160, ptr noundef %161), !dbg !347
  store i32 %162, ptr %12, align 4, !dbg !348
  %163 = load i32, ptr %12, align 4, !dbg !349
  %164 = icmp eq i32 %163, 0, !dbg !351
  br i1 %164, label %165, label %167, !dbg !351

165:                                              ; preds = %155
  %166 = call i32 (ptr, ...) @printf(ptr noundef @.str.2), !dbg !352
  store i32 -1, ptr %12, align 4, !dbg !354
  br label %170, !dbg !355

167:                                              ; preds = %155
  store i32 0, ptr %12, align 4, !dbg !356
  %168 = call i32 (ptr, ...) @printf(ptr noundef @.str.3), !dbg !358
  br label %169

169:                                              ; preds = %167
  br label %170, !dbg !359

170:                                              ; preds = %169, %165, %151, %121, %107, %87, %73, %61, %49
    #dbg_label(!360, !361)
  %171 = load ptr, ptr %5, align 8, !dbg !362
  call void @free(ptr noundef %171) #9, !dbg !363
  %172 = load ptr, ptr %7, align 8, !dbg !364
  call void @free(ptr noundef %172) #9, !dbg !365
  %173 = load ptr, ptr %6, align 8, !dbg !366
  %174 = load ptr, ptr %2, align 8, !dbg !367
  %175 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %174, i32 0, i32 14, !dbg !368
  %176 = load i32, ptr %175, align 8, !dbg !368
  %177 = sext i32 %176 to i64, !dbg !368
  call void @mayo_secure_free(ptr noundef %173, i64 noundef %177), !dbg !369
  %178 = load ptr, ptr %8, align 8, !dbg !370
  call void @mayo_secure_free(ptr noundef %178, i64 noundef 907240), !dbg !371
  %179 = load ptr, ptr %9, align 8, !dbg !372
  call void @free(ptr noundef %179) #9, !dbg !373
  %180 = load i32, ptr %12, align 4, !dbg !374
  ret i32 %180, !dbg !375
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
define dso_local i32 @mayo_keypair(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !376 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !407, !DIExpression(), !408)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !409, !DIExpression(), !410)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !411, !DIExpression(), !412)
    #dbg_declare(ptr %7, !413, !DIExpression(), !414)
  store i32 0, ptr %7, align 4, !dbg !414
  %8 = load ptr, ptr %4, align 8, !dbg !415
  %9 = load ptr, ptr %5, align 8, !dbg !416
  %10 = load ptr, ptr %6, align 8, !dbg !417
  %11 = call i32 @mayo_keypair_compact(ptr noundef %8, ptr noundef %9, ptr noundef %10), !dbg !418
  store i32 %11, ptr %7, align 4, !dbg !419
  %12 = load i32, ptr %7, align 4, !dbg !420
  %13 = icmp ne i32 %12, 0, !dbg !422
  br i1 %13, label %14, label %15, !dbg !422

14:                                               ; preds = %3
  br label %16, !dbg !423

15:                                               ; preds = %3
  br label %16, !dbg !425

16:                                               ; preds = %15, %14
    #dbg_label(!426, !427)
  %17 = load i32, ptr %7, align 4, !dbg !428
  ret i32 %17, !dbg !429
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_keypair_compact(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !430 {
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
    #dbg_declare(ptr %4, !431, !DIExpression(), !432)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !433, !DIExpression(), !434)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !435, !DIExpression(), !436)
    #dbg_declare(ptr %7, !437, !DIExpression(), !438)
  store i32 0, ptr %7, align 4, !dbg !438
    #dbg_declare(ptr %8, !439, !DIExpression(), !440)
  %26 = load ptr, ptr %6, align 8, !dbg !441
  store ptr %26, ptr %8, align 8, !dbg !440
    #dbg_declare(ptr %9, !442, !DIExpression(), !446)
    #dbg_declare(ptr %10, !447, !DIExpression(), !448)
    #dbg_declare(ptr %11, !449, !DIExpression(), !453)
  call void @llvm.memset.p0.i64(ptr align 16 %11, i8 0, i64 20808, i1 false), !dbg !453
    #dbg_declare(ptr %12, !454, !DIExpression(), !455)
    #dbg_declare(ptr %13, !456, !DIExpression(), !458)
    #dbg_declare(ptr %14, !459, !DIExpression(), !461)
  %27 = load ptr, ptr %4, align 8, !dbg !462
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 21, !dbg !463
  %29 = load i32, ptr %28, align 4, !dbg !463
  store i32 %29, ptr %14, align 4, !dbg !461
    #dbg_declare(ptr %15, !464, !DIExpression(), !465)
  %30 = load ptr, ptr %4, align 8, !dbg !466
  %31 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 0, !dbg !467
  %32 = load i32, ptr %31, align 8, !dbg !467
  store i32 %32, ptr %15, align 4, !dbg !465
    #dbg_declare(ptr %16, !468, !DIExpression(), !469)
  %33 = load ptr, ptr %4, align 8, !dbg !470
  %34 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 1, !dbg !471
  %35 = load i32, ptr %34, align 4, !dbg !471
  %36 = load ptr, ptr %4, align 8, !dbg !470
  %37 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %36, i32 0, i32 2, !dbg !471
  %38 = load i32, ptr %37, align 8, !dbg !471
  %39 = sub nsw i32 %35, %38, !dbg !471
  store i32 %39, ptr %16, align 4, !dbg !469
    #dbg_declare(ptr %17, !472, !DIExpression(), !473)
  %40 = load ptr, ptr %4, align 8, !dbg !474
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 2, !dbg !475
  %42 = load i32, ptr %41, align 8, !dbg !475
  store i32 %42, ptr %17, align 4, !dbg !473
    #dbg_declare(ptr %18, !476, !DIExpression(), !477)
  %43 = load ptr, ptr %4, align 8, !dbg !478
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 7, !dbg !479
  %45 = load i32, ptr %44, align 4, !dbg !479
  store i32 %45, ptr %18, align 4, !dbg !477
    #dbg_declare(ptr %19, !480, !DIExpression(), !481)
  %46 = load ptr, ptr %4, align 8, !dbg !482
  %47 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %46, i32 0, i32 1, !dbg !483
  %48 = load i32, ptr %47, align 4, !dbg !483
  %49 = load ptr, ptr %4, align 8, !dbg !482
  %50 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %49, i32 0, i32 2, !dbg !483
  %51 = load i32, ptr %50, align 8, !dbg !483
  %52 = sub nsw i32 %48, %51, !dbg !483
  %53 = load ptr, ptr %4, align 8, !dbg !482
  %54 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %53, i32 0, i32 1, !dbg !483
  %55 = load i32, ptr %54, align 4, !dbg !483
  %56 = load ptr, ptr %4, align 8, !dbg !482
  %57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %56, i32 0, i32 2, !dbg !483
  %58 = load i32, ptr %57, align 8, !dbg !483
  %59 = sub nsw i32 %55, %58, !dbg !483
  %60 = add nsw i32 %59, 1, !dbg !483
  %61 = mul nsw i32 %52, %60, !dbg !483
  %62 = sdiv i32 %61, 2, !dbg !483
  %63 = load ptr, ptr %4, align 8, !dbg !482
  %64 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %63, i32 0, i32 21, !dbg !483
  %65 = load i32, ptr %64, align 4, !dbg !483
  %66 = mul nsw i32 %62, %65, !dbg !483
  store i32 %66, ptr %19, align 4, !dbg !481
    #dbg_declare(ptr %20, !484, !DIExpression(), !485)
  %67 = load ptr, ptr %4, align 8, !dbg !486
  %68 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %67, i32 0, i32 2, !dbg !487
  %69 = load i32, ptr %68, align 8, !dbg !487
  %70 = load ptr, ptr %4, align 8, !dbg !486
  %71 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %70, i32 0, i32 2, !dbg !487
  %72 = load i32, ptr %71, align 8, !dbg !487
  %73 = add nsw i32 %72, 1, !dbg !487
  %74 = mul nsw i32 %69, %73, !dbg !487
  %75 = sdiv i32 %74, 2, !dbg !487
  %76 = load ptr, ptr %4, align 8, !dbg !486
  %77 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %76, i32 0, i32 21, !dbg !487
  %78 = load i32, ptr %77, align 4, !dbg !487
  %79 = mul nsw i32 %75, %78, !dbg !487
  store i32 %79, ptr %20, align 4, !dbg !485
    #dbg_declare(ptr %21, !488, !DIExpression(), !489)
  %80 = load ptr, ptr %4, align 8, !dbg !490
  %81 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %80, i32 0, i32 20, !dbg !491
  %82 = load i32, ptr %81, align 8, !dbg !491
  store i32 %82, ptr %21, align 4, !dbg !489
    #dbg_declare(ptr %22, !492, !DIExpression(), !493)
  %83 = load ptr, ptr %4, align 8, !dbg !494
  %84 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %83, i32 0, i32 18, !dbg !495
  %85 = load i32, ptr %84, align 8, !dbg !495
  store i32 %85, ptr %22, align 4, !dbg !493
    #dbg_declare(ptr %23, !496, !DIExpression(), !497)
  %86 = getelementptr inbounds [113103 x i64], ptr %10, i64 0, i64 0, !dbg !498
  store ptr %86, ptr %23, align 8, !dbg !497
    #dbg_declare(ptr %24, !499, !DIExpression(), !500)
  %87 = getelementptr inbounds [113103 x i64], ptr %10, i64 0, i64 0, !dbg !501
  %88 = load i32, ptr %19, align 4, !dbg !502
  %89 = sext i32 %88 to i64, !dbg !503
  %90 = getelementptr inbounds i64, ptr %87, i64 %89, !dbg !503
  store ptr %90, ptr %24, align 8, !dbg !500
  %91 = load ptr, ptr %8, align 8, !dbg !504
  %92 = load i32, ptr %22, align 4, !dbg !506
  %93 = sext i32 %92 to i64, !dbg !506
  %94 = call i32 @randombytes(ptr noundef %91, i64 noundef %93), !dbg !507
  %95 = icmp ne i32 %94, 0, !dbg !508
  br i1 %95, label %96, label %97, !dbg !508

96:                                               ; preds = %3
  store i32 1, ptr %7, align 4, !dbg !509
  br label %141, !dbg !511

97:                                               ; preds = %3
  %98 = getelementptr inbounds [868 x i8], ptr %9, i64 0, i64 0, !dbg !512
  %99 = load i32, ptr %21, align 4, !dbg !513
  %100 = load i32, ptr %18, align 4, !dbg !514
  %101 = add nsw i32 %99, %100, !dbg !515
  %102 = sext i32 %101 to i64, !dbg !513
  %103 = load ptr, ptr %8, align 8, !dbg !516
  %104 = load i32, ptr %22, align 4, !dbg !517
  %105 = sext i32 %104 to i64, !dbg !517
  %106 = call i32 @shake256(ptr noundef %98, i64 noundef %102, ptr noundef %103, i64 noundef %105), !dbg !518
  %107 = getelementptr inbounds [868 x i8], ptr %9, i64 0, i64 0, !dbg !519
  store ptr %107, ptr %12, align 8, !dbg !520
  %108 = getelementptr inbounds [868 x i8], ptr %9, i64 0, i64 0, !dbg !521
  %109 = load i32, ptr %21, align 4, !dbg !522
  %110 = sext i32 %109 to i64, !dbg !523
  %111 = getelementptr inbounds i8, ptr %108, i64 %110, !dbg !523
  %112 = getelementptr inbounds [2414 x i8], ptr %13, i64 0, i64 0, !dbg !524
  %113 = load i32, ptr %16, align 4, !dbg !525
  %114 = load i32, ptr %17, align 4, !dbg !526
  %115 = mul nsw i32 %113, %114, !dbg !527
  call void @decode(ptr noundef %111, ptr noundef %112, i32 noundef %115), !dbg !528
  %116 = load ptr, ptr %4, align 8, !dbg !529
  %117 = getelementptr inbounds [113103 x i64], ptr %10, i64 0, i64 0, !dbg !530
  %118 = load ptr, ptr %12, align 8, !dbg !531
  call void @expand_P1_P2(ptr noundef %116, ptr noundef %117, ptr noundef %118), !dbg !532
  %119 = load ptr, ptr %4, align 8, !dbg !533
  %120 = load ptr, ptr %23, align 8, !dbg !534
  %121 = load ptr, ptr %24, align 8, !dbg !535
  %122 = getelementptr inbounds [2414 x i8], ptr %13, i64 0, i64 0, !dbg !536
  %123 = getelementptr inbounds [2601 x i64], ptr %11, i64 0, i64 0, !dbg !537
  call void @compute_P3(ptr noundef %119, ptr noundef %120, ptr noundef %121, ptr noundef %122, ptr noundef %123), !dbg !538
  %124 = load ptr, ptr %5, align 8, !dbg !539
  %125 = load ptr, ptr %12, align 8, !dbg !540
  %126 = load i32, ptr %21, align 4, !dbg !541
  %127 = sext i32 %126 to i64, !dbg !541
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %124, ptr align 1 %125, i64 %127, i1 false), !dbg !542
    #dbg_declare(ptr %25, !543, !DIExpression(), !547)
  %128 = load ptr, ptr %4, align 8, !dbg !548
  %129 = getelementptr inbounds [2601 x i64], ptr %11, i64 0, i64 0, !dbg !549
  %130 = getelementptr inbounds [1377 x i64], ptr %25, i64 0, i64 0, !dbg !550
  %131 = load i32, ptr %17, align 4, !dbg !551
  call void @m_upper(ptr noundef %128, ptr noundef %129, ptr noundef %130, i32 noundef %131), !dbg !552
  %132 = getelementptr inbounds [1377 x i64], ptr %25, i64 0, i64 0, !dbg !553
  %133 = load ptr, ptr %5, align 8, !dbg !554
  %134 = load i32, ptr %21, align 4, !dbg !555
  %135 = sext i32 %134 to i64, !dbg !556
  %136 = getelementptr inbounds i8, ptr %133, i64 %135, !dbg !556
  %137 = load i32, ptr %20, align 4, !dbg !557
  %138 = load i32, ptr %14, align 4, !dbg !558
  %139 = sdiv i32 %137, %138, !dbg !559
  %140 = load i32, ptr %15, align 4, !dbg !560
  call void @pack_m_vecs(ptr noundef %132, ptr noundef %136, i32 noundef %139, i32 noundef %140), !dbg !561
  br label %141, !dbg !561

141:                                              ; preds = %97, %96
    #dbg_label(!562, !563)
  %142 = getelementptr inbounds [2414 x i8], ptr %13, i64 0, i64 0, !dbg !564
  call void @mayo_secure_clear(ptr noundef %142, i64 noundef 2414), !dbg !565
  %143 = load ptr, ptr %24, align 8, !dbg !566
  %144 = load ptr, ptr %4, align 8, !dbg !567
  %145 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %144, i32 0, i32 1, !dbg !568
  %146 = load i32, ptr %145, align 4, !dbg !568
  %147 = load ptr, ptr %4, align 8, !dbg !567
  %148 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %147, i32 0, i32 2, !dbg !568
  %149 = load i32, ptr %148, align 8, !dbg !568
  %150 = sub nsw i32 %146, %149, !dbg !568
  %151 = load ptr, ptr %4, align 8, !dbg !567
  %152 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %151, i32 0, i32 2, !dbg !568
  %153 = load i32, ptr %152, align 8, !dbg !568
  %154 = mul nsw i32 %150, %153, !dbg !568
  %155 = load ptr, ptr %4, align 8, !dbg !567
  %156 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %155, i32 0, i32 21, !dbg !568
  %157 = load i32, ptr %156, align 4, !dbg !568
  %158 = mul nsw i32 %154, %157, !dbg !568
  %159 = sext i32 %158 to i64, !dbg !568
  %160 = mul i64 %159, 8, !dbg !569
  call void @mayo_secure_clear(ptr noundef %143, i64 noundef %160), !dbg !570
  %161 = getelementptr inbounds [2601 x i64], ptr %11, i64 0, i64 0, !dbg !571
  call void @mayo_secure_clear(ptr noundef %161, i64 noundef 20808), !dbg !572
  %162 = load i32, ptr %7, align 4, !dbg !573
  ret i32 %162, !dbg !574
}

declare i32 @randombytes(ptr noundef, i64 noundef) #4

declare i32 @shake256(ptr noundef, i64 noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @decode(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !575 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !578, !DIExpression(), !579)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !580, !DIExpression(), !581)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !582, !DIExpression(), !583)
    #dbg_declare(ptr %7, !584, !DIExpression(), !585)
  store i32 0, ptr %7, align 4, !dbg !586
  br label %8, !dbg !588

8:                                                ; preds = %34, %3
  %9 = load i32, ptr %7, align 4, !dbg !589
  %10 = load i32, ptr %6, align 4, !dbg !591
  %11 = sdiv i32 %10, 2, !dbg !592
  %12 = icmp slt i32 %9, %11, !dbg !593
  br i1 %12, label %13, label %37, !dbg !594

13:                                               ; preds = %8
  %14 = load ptr, ptr %4, align 8, !dbg !595
  %15 = load i32, ptr %7, align 4, !dbg !597
  %16 = sext i32 %15 to i64, !dbg !595
  %17 = getelementptr inbounds i8, ptr %14, i64 %16, !dbg !595
  %18 = load i8, ptr %17, align 1, !dbg !595
  %19 = zext i8 %18 to i32, !dbg !595
  %20 = and i32 %19, 15, !dbg !598
  %21 = trunc i32 %20 to i8, !dbg !595
  %22 = load ptr, ptr %5, align 8, !dbg !599
  %23 = getelementptr inbounds nuw i8, ptr %22, i32 1, !dbg !599
  store ptr %23, ptr %5, align 8, !dbg !599
  store i8 %21, ptr %22, align 1, !dbg !600
  %24 = load ptr, ptr %4, align 8, !dbg !601
  %25 = load i32, ptr %7, align 4, !dbg !602
  %26 = sext i32 %25 to i64, !dbg !601
  %27 = getelementptr inbounds i8, ptr %24, i64 %26, !dbg !601
  %28 = load i8, ptr %27, align 1, !dbg !601
  %29 = zext i8 %28 to i32, !dbg !601
  %30 = ashr i32 %29, 4, !dbg !603
  %31 = trunc i32 %30 to i8, !dbg !601
  %32 = load ptr, ptr %5, align 8, !dbg !604
  %33 = getelementptr inbounds nuw i8, ptr %32, i32 1, !dbg !604
  store ptr %33, ptr %5, align 8, !dbg !604
  store i8 %31, ptr %32, align 1, !dbg !605
  br label %34, !dbg !606

34:                                               ; preds = %13
  %35 = load i32, ptr %7, align 4, !dbg !607
  %36 = add nsw i32 %35, 1, !dbg !607
  store i32 %36, ptr %7, align 4, !dbg !607
  br label %8, !dbg !608, !llvm.loop !609

37:                                               ; preds = %8
  %38 = load i32, ptr %6, align 4, !dbg !611
  %39 = srem i32 %38, 2, !dbg !613
  %40 = icmp eq i32 %39, 1, !dbg !614
  br i1 %40, label %41, label %52, !dbg !614

41:                                               ; preds = %37
  %42 = load ptr, ptr %4, align 8, !dbg !615
  %43 = load i32, ptr %7, align 4, !dbg !617
  %44 = sext i32 %43 to i64, !dbg !615
  %45 = getelementptr inbounds i8, ptr %42, i64 %44, !dbg !615
  %46 = load i8, ptr %45, align 1, !dbg !615
  %47 = zext i8 %46 to i32, !dbg !615
  %48 = and i32 %47, 15, !dbg !618
  %49 = trunc i32 %48 to i8, !dbg !615
  %50 = load ptr, ptr %5, align 8, !dbg !619
  %51 = getelementptr inbounds nuw i8, ptr %50, i32 1, !dbg !619
  store ptr %51, ptr %5, align 8, !dbg !619
  store i8 %49, ptr %50, align 1, !dbg !620
  br label %52, !dbg !621

52:                                               ; preds = %41, %37
  ret void, !dbg !622
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @expand_P1_P2(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !623 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !626, !DIExpression(), !627)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !628, !DIExpression(), !629)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !630, !DIExpression(), !631)
  %7 = load ptr, ptr %5, align 8, !dbg !632
  %8 = load ptr, ptr %4, align 8, !dbg !633
  %9 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %8, i32 0, i32 11, !dbg !634
  %10 = load i32, ptr %9, align 4, !dbg !634
  %11 = load ptr, ptr %4, align 8, !dbg !635
  %12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 12, !dbg !636
  %13 = load i32, ptr %12, align 8, !dbg !636
  %14 = add nsw i32 %10, %13, !dbg !637
  %15 = sext i32 %14 to i64, !dbg !634
  %16 = load ptr, ptr %6, align 8, !dbg !638
  %17 = load ptr, ptr %4, align 8, !dbg !639
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 20, !dbg !640
  %19 = load i32, ptr %18, align 8, !dbg !640
  %20 = sext i32 %19 to i64, !dbg !640
  %21 = call i32 @AES_128_CTR(ptr noundef %7, i64 noundef %15, ptr noundef %16, i64 noundef %20), !dbg !641
  %22 = load ptr, ptr %5, align 8, !dbg !642
  %23 = load ptr, ptr %5, align 8, !dbg !643
  %24 = load ptr, ptr %4, align 8, !dbg !644
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 1, !dbg !645
  %26 = load i32, ptr %25, align 4, !dbg !645
  %27 = load ptr, ptr %4, align 8, !dbg !644
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2, !dbg !645
  %29 = load i32, ptr %28, align 8, !dbg !645
  %30 = sub nsw i32 %26, %29, !dbg !645
  %31 = load ptr, ptr %4, align 8, !dbg !644
  %32 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 1, !dbg !645
  %33 = load i32, ptr %32, align 4, !dbg !645
  %34 = load ptr, ptr %4, align 8, !dbg !644
  %35 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %34, i32 0, i32 2, !dbg !645
  %36 = load i32, ptr %35, align 8, !dbg !645
  %37 = sub nsw i32 %33, %36, !dbg !645
  %38 = add nsw i32 %37, 1, !dbg !645
  %39 = mul nsw i32 %30, %38, !dbg !645
  %40 = sdiv i32 %39, 2, !dbg !645
  %41 = load ptr, ptr %4, align 8, !dbg !644
  %42 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %41, i32 0, i32 21, !dbg !645
  %43 = load i32, ptr %42, align 4, !dbg !645
  %44 = mul nsw i32 %40, %43, !dbg !645
  %45 = load ptr, ptr %4, align 8, !dbg !646
  %46 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %45, i32 0, i32 1, !dbg !647
  %47 = load i32, ptr %46, align 4, !dbg !647
  %48 = load ptr, ptr %4, align 8, !dbg !646
  %49 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %48, i32 0, i32 2, !dbg !647
  %50 = load i32, ptr %49, align 8, !dbg !647
  %51 = sub nsw i32 %47, %50, !dbg !647
  %52 = load ptr, ptr %4, align 8, !dbg !646
  %53 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %52, i32 0, i32 2, !dbg !647
  %54 = load i32, ptr %53, align 8, !dbg !647
  %55 = mul nsw i32 %51, %54, !dbg !647
  %56 = load ptr, ptr %4, align 8, !dbg !646
  %57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %56, i32 0, i32 21, !dbg !647
  %58 = load i32, ptr %57, align 4, !dbg !647
  %59 = mul nsw i32 %55, %58, !dbg !647
  %60 = add nsw i32 %44, %59, !dbg !648
  %61 = load ptr, ptr %4, align 8, !dbg !649
  %62 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %61, i32 0, i32 21, !dbg !650
  %63 = load i32, ptr %62, align 4, !dbg !650
  %64 = sdiv i32 %60, %63, !dbg !651
  %65 = load ptr, ptr %4, align 8, !dbg !652
  %66 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %65, i32 0, i32 0, !dbg !653
  %67 = load i32, ptr %66, align 8, !dbg !653
  call void @unpack_m_vecs(ptr noundef %22, ptr noundef %23, i32 noundef %64, i32 noundef %67), !dbg !654
  ret void, !dbg !655
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_P3(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !656 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !661, !DIExpression(), !662)
  store ptr %1, ptr %7, align 8
    #dbg_declare(ptr %7, !663, !DIExpression(), !664)
  store ptr %2, ptr %8, align 8
    #dbg_declare(ptr %8, !665, !DIExpression(), !666)
  store ptr %3, ptr %9, align 8
    #dbg_declare(ptr %9, !667, !DIExpression(), !668)
  store ptr %4, ptr %10, align 8
    #dbg_declare(ptr %10, !669, !DIExpression(), !670)
    #dbg_declare(ptr %11, !671, !DIExpression(), !672)
  %14 = load ptr, ptr %6, align 8, !dbg !673
  %15 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %14, i32 0, i32 21, !dbg !674
  %16 = load i32, ptr %15, align 4, !dbg !674
  store i32 %16, ptr %11, align 4, !dbg !672
    #dbg_declare(ptr %12, !675, !DIExpression(), !676)
  %17 = load ptr, ptr %6, align 8, !dbg !677
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1, !dbg !678
  %19 = load i32, ptr %18, align 4, !dbg !678
  %20 = load ptr, ptr %6, align 8, !dbg !677
  %21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 2, !dbg !678
  %22 = load i32, ptr %21, align 8, !dbg !678
  %23 = sub nsw i32 %19, %22, !dbg !678
  store i32 %23, ptr %12, align 4, !dbg !676
    #dbg_declare(ptr %13, !679, !DIExpression(), !680)
  %24 = load ptr, ptr %6, align 8, !dbg !681
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2, !dbg !682
  %26 = load i32, ptr %25, align 8, !dbg !682
  store i32 %26, ptr %13, align 4, !dbg !680
  %27 = load ptr, ptr %6, align 8, !dbg !683
  %28 = load ptr, ptr %7, align 8, !dbg !684
  %29 = load ptr, ptr %9, align 8, !dbg !685
  %30 = load ptr, ptr %8, align 8, !dbg !686
  call void @P1_times_O(ptr noundef %27, ptr noundef %28, ptr noundef %29, ptr noundef %30), !dbg !687
  %31 = load i32, ptr %11, align 4, !dbg !688
  %32 = load ptr, ptr %9, align 8, !dbg !689
  %33 = load ptr, ptr %8, align 8, !dbg !690
  %34 = load ptr, ptr %10, align 8, !dbg !691
  %35 = load i32, ptr %12, align 4, !dbg !692
  %36 = load i32, ptr %13, align 4, !dbg !693
  %37 = load i32, ptr %13, align 4, !dbg !694
  call void @mul_add_mat_trans_x_m_mat(i32 noundef %31, ptr noundef %32, ptr noundef %33, ptr noundef %34, i32 noundef %35, i32 noundef %36, i32 noundef %37), !dbg !695
  ret void, !dbg !696
}

declare void @m_upper(ptr noundef, ptr noundef, ptr noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @pack_m_vecs(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !697 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !700, !DIExpression(), !701)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !702, !DIExpression(), !703)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !704, !DIExpression(), !705)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !706, !DIExpression(), !707)
    #dbg_declare(ptr %9, !708, !DIExpression(), !709)
  %12 = load i32, ptr %8, align 4, !dbg !710
  %13 = add nsw i32 %12, 15, !dbg !711
  %14 = sdiv i32 %13, 16, !dbg !712
  store i32 %14, ptr %9, align 4, !dbg !709
    #dbg_declare(ptr %10, !713, !DIExpression(), !714)
  %15 = load ptr, ptr %5, align 8, !dbg !715
  store ptr %15, ptr %10, align 8, !dbg !714
    #dbg_declare(ptr %11, !716, !DIExpression(), !718)
  store i32 0, ptr %11, align 4, !dbg !718
  br label %16, !dbg !719

16:                                               ; preds = %38, %4
  %17 = load i32, ptr %11, align 4, !dbg !720
  %18 = load i32, ptr %7, align 4, !dbg !722
  %19 = icmp slt i32 %17, %18, !dbg !723
  br i1 %19, label %20, label %41, !dbg !724

20:                                               ; preds = %16
  %21 = load ptr, ptr %6, align 8, !dbg !725
  %22 = load i32, ptr %11, align 4, !dbg !727
  %23 = load i32, ptr %8, align 4, !dbg !728
  %24 = mul nsw i32 %22, %23, !dbg !729
  %25 = sdiv i32 %24, 2, !dbg !730
  %26 = sext i32 %25 to i64, !dbg !731
  %27 = getelementptr inbounds i8, ptr %21, i64 %26, !dbg !731
  %28 = load ptr, ptr %10, align 8, !dbg !732
  %29 = load i32, ptr %11, align 4, !dbg !733
  %30 = load i32, ptr %9, align 4, !dbg !734
  %31 = mul nsw i32 %29, %30, !dbg !735
  %32 = sext i32 %31 to i64, !dbg !733
  %33 = mul i64 %32, 8, !dbg !736
  %34 = getelementptr inbounds nuw i8, ptr %28, i64 %33, !dbg !731
  %35 = load i32, ptr %8, align 4, !dbg !737
  %36 = sdiv i32 %35, 2, !dbg !738
  %37 = sext i32 %36 to i64, !dbg !737
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %27, ptr align 1 %34, i64 %37, i1 false), !dbg !731
  br label %38, !dbg !739

38:                                               ; preds = %20
  %39 = load i32, ptr %11, align 4, !dbg !740
  %40 = add nsw i32 %39, 1, !dbg !740
  store i32 %40, ptr %11, align 4, !dbg !740
  br label %16, !dbg !741, !llvm.loop !742

41:                                               ; preds = %16
  ret void, !dbg !744
}

declare void @mayo_secure_clear(ptr noundef, i64 noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr writeonly captures(none), ptr readonly captures(none), i64, i1 immarg) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @P1_times_O(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !745 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !748, !DIExpression(), !749)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !750, !DIExpression(), !751)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !752, !DIExpression(), !753)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !754, !DIExpression(), !755)
  %9 = load ptr, ptr %5, align 8, !dbg !756
  %10 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 21, !dbg !757
  %11 = load i32, ptr %10, align 4, !dbg !757
  %12 = load ptr, ptr %6, align 8, !dbg !758
  %13 = load ptr, ptr %7, align 8, !dbg !759
  %14 = load ptr, ptr %8, align 8, !dbg !760
  %15 = load ptr, ptr %5, align 8, !dbg !761
  %16 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 1, !dbg !762
  %17 = load i32, ptr %16, align 4, !dbg !762
  %18 = load ptr, ptr %5, align 8, !dbg !761
  %19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 2, !dbg !762
  %20 = load i32, ptr %19, align 8, !dbg !762
  %21 = sub nsw i32 %17, %20, !dbg !762
  %22 = load ptr, ptr %5, align 8, !dbg !763
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 1, !dbg !764
  %24 = load i32, ptr %23, align 4, !dbg !764
  %25 = load ptr, ptr %5, align 8, !dbg !763
  %26 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2, !dbg !764
  %27 = load i32, ptr %26, align 8, !dbg !764
  %28 = sub nsw i32 %24, %27, !dbg !764
  %29 = load ptr, ptr %5, align 8, !dbg !765
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 2, !dbg !766
  %31 = load i32, ptr %30, align 8, !dbg !766
  call void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, i32 noundef %21, i32 noundef %28, i32 noundef %31, i32 noundef 1), !dbg !767
  ret void, !dbg !768
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_mat_trans_x_m_mat(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !769 {
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
    #dbg_declare(ptr %8, !772, !DIExpression(), !773)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !774, !DIExpression(), !775)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !776, !DIExpression(), !777)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !778, !DIExpression(), !779)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !780, !DIExpression(), !781)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !782, !DIExpression(), !783)
  store i32 %6, ptr %14, align 4
    #dbg_declare(ptr %14, !784, !DIExpression(), !785)
    #dbg_declare(ptr %15, !786, !DIExpression(), !788)
  store i32 0, ptr %15, align 4, !dbg !788
  br label %18, !dbg !789

18:                                               ; preds = %71, %7
  %19 = load i32, ptr %15, align 4, !dbg !790
  %20 = load i32, ptr %13, align 4, !dbg !792
  %21 = icmp slt i32 %19, %20, !dbg !793
  br i1 %21, label %22, label %74, !dbg !794

22:                                               ; preds = %18
    #dbg_declare(ptr %16, !795, !DIExpression(), !798)
  store i32 0, ptr %16, align 4, !dbg !798
  br label %23, !dbg !799

23:                                               ; preds = %67, %22
  %24 = load i32, ptr %16, align 4, !dbg !800
  %25 = load i32, ptr %12, align 4, !dbg !802
  %26 = icmp slt i32 %24, %25, !dbg !803
  br i1 %26, label %27, label %70, !dbg !804

27:                                               ; preds = %23
    #dbg_declare(ptr %17, !805, !DIExpression(), !808)
  store i32 0, ptr %17, align 4, !dbg !808
  br label %28, !dbg !809

28:                                               ; preds = %63, %27
  %29 = load i32, ptr %17, align 4, !dbg !810
  %30 = load i32, ptr %14, align 4, !dbg !812
  %31 = icmp slt i32 %29, %30, !dbg !813
  br i1 %31, label %32, label %66, !dbg !814

32:                                               ; preds = %28
  %33 = load i32, ptr %8, align 4, !dbg !815
  %34 = load ptr, ptr %10, align 8, !dbg !817
  %35 = load i32, ptr %8, align 4, !dbg !818
  %36 = load i32, ptr %16, align 4, !dbg !819
  %37 = load i32, ptr %14, align 4, !dbg !820
  %38 = mul nsw i32 %36, %37, !dbg !821
  %39 = load i32, ptr %17, align 4, !dbg !822
  %40 = add nsw i32 %38, %39, !dbg !823
  %41 = mul nsw i32 %35, %40, !dbg !824
  %42 = sext i32 %41 to i64, !dbg !825
  %43 = getelementptr inbounds i64, ptr %34, i64 %42, !dbg !825
  %44 = load ptr, ptr %9, align 8, !dbg !826
  %45 = load i32, ptr %16, align 4, !dbg !827
  %46 = load i32, ptr %13, align 4, !dbg !828
  %47 = mul nsw i32 %45, %46, !dbg !829
  %48 = load i32, ptr %15, align 4, !dbg !830
  %49 = add nsw i32 %47, %48, !dbg !831
  %50 = sext i32 %49 to i64, !dbg !826
  %51 = getelementptr inbounds i8, ptr %44, i64 %50, !dbg !826
  %52 = load i8, ptr %51, align 1, !dbg !826
  %53 = load ptr, ptr %11, align 8, !dbg !832
  %54 = load i32, ptr %8, align 4, !dbg !833
  %55 = load i32, ptr %15, align 4, !dbg !834
  %56 = load i32, ptr %14, align 4, !dbg !835
  %57 = mul nsw i32 %55, %56, !dbg !836
  %58 = load i32, ptr %17, align 4, !dbg !837
  %59 = add nsw i32 %57, %58, !dbg !838
  %60 = mul nsw i32 %54, %59, !dbg !839
  %61 = sext i32 %60 to i64, !dbg !840
  %62 = getelementptr inbounds i64, ptr %53, i64 %61, !dbg !840
  call void @m_vec_mul_add(i32 noundef %33, ptr noundef %43, i8 noundef zeroext %52, ptr noundef %62), !dbg !841
  br label %63, !dbg !842

63:                                               ; preds = %32
  %64 = load i32, ptr %17, align 4, !dbg !843
  %65 = add nsw i32 %64, 1, !dbg !843
  store i32 %65, ptr %17, align 4, !dbg !843
  br label %28, !dbg !844, !llvm.loop !845

66:                                               ; preds = %28
  br label %67, !dbg !847

67:                                               ; preds = %66
  %68 = load i32, ptr %16, align 4, !dbg !848
  %69 = add nsw i32 %68, 1, !dbg !848
  store i32 %69, ptr %16, align 4, !dbg !848
  br label %23, !dbg !849, !llvm.loop !850

70:                                               ; preds = %23
  br label %71, !dbg !852

71:                                               ; preds = %70
  %72 = load i32, ptr %15, align 4, !dbg !853
  %73 = add nsw i32 %72, 1, !dbg !853
  store i32 %73, ptr %15, align 4, !dbg !853
  br label %18, !dbg !854, !llvm.loop !855

74:                                               ; preds = %18
  ret void, !dbg !857
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_mul_add(i32 noundef %0, ptr noundef %1, i8 noundef zeroext %2, ptr noundef %3) #0 !dbg !858 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store i32 %0, ptr %5, align 4
    #dbg_declare(ptr %5, !862, !DIExpression(), !863)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !864, !DIExpression(), !865)
  store i8 %2, ptr %7, align 1
    #dbg_declare(ptr %7, !866, !DIExpression(), !867)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !868, !DIExpression(), !869)
    #dbg_declare(ptr %9, !870, !DIExpression(), !872)
  store i32 0, ptr %9, align 4, !dbg !872
  br label %10, !dbg !873

10:                                               ; preds = %28, %4
  %11 = load i32, ptr %9, align 4, !dbg !874
  %12 = load i32, ptr %5, align 4, !dbg !876
  %13 = icmp slt i32 %11, %12, !dbg !877
  br i1 %13, label %14, label %31, !dbg !878

14:                                               ; preds = %10
  %15 = load ptr, ptr %6, align 8, !dbg !879
  %16 = load i32, ptr %9, align 4, !dbg !881
  %17 = sext i32 %16 to i64, !dbg !879
  %18 = getelementptr inbounds i64, ptr %15, i64 %17, !dbg !879
  %19 = load i64, ptr %18, align 8, !dbg !879
  %20 = load i8, ptr %7, align 1, !dbg !882
  %21 = call i64 @gf16v_mul_u64(i64 noundef %19, i8 noundef zeroext %20), !dbg !883
  %22 = load ptr, ptr %8, align 8, !dbg !884
  %23 = load i32, ptr %9, align 4, !dbg !885
  %24 = sext i32 %23 to i64, !dbg !884
  %25 = getelementptr inbounds i64, ptr %22, i64 %24, !dbg !884
  %26 = load i64, ptr %25, align 8, !dbg !886
  %27 = xor i64 %26, %21, !dbg !886
  store i64 %27, ptr %25, align 8, !dbg !886
  br label %28, !dbg !887

28:                                               ; preds = %14
  %29 = load i32, ptr %9, align 4, !dbg !888
  %30 = add nsw i32 %29, 1, !dbg !888
  store i32 %30, ptr %9, align 4, !dbg !888
  br label %10, !dbg !889, !llvm.loop !890

31:                                               ; preds = %10
  ret void, !dbg !892
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @gf16v_mul_u64(i64 noundef %0, i8 noundef zeroext %1) #0 !dbg !893 {
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i64 %0, ptr %3, align 8
    #dbg_declare(ptr %3, !897, !DIExpression(), !898)
  store i8 %1, ptr %4, align 1
    #dbg_declare(ptr %4, !899, !DIExpression(), !900)
    #dbg_declare(ptr %5, !901, !DIExpression(), !902)
  store i64 -8608480567731124088, ptr %5, align 8, !dbg !902
    #dbg_declare(ptr %6, !903, !DIExpression(), !904)
    #dbg_declare(ptr %7, !905, !DIExpression(), !906)
  %10 = load i64, ptr %3, align 8, !dbg !907
  store i64 %10, ptr %7, align 8, !dbg !906
    #dbg_declare(ptr %8, !908, !DIExpression(), !909)
  %11 = load i8, ptr %4, align 1, !dbg !910
  %12 = zext i8 %11 to i32, !dbg !910
  %13 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !911
  %14 = zext i8 %13 to i32, !dbg !911
  %15 = xor i32 %12, %14, !dbg !912
  %16 = sext i32 %15 to i64, !dbg !910
  store i64 %16, ptr %8, align 8, !dbg !909
    #dbg_declare(ptr %9, !913, !DIExpression(), !914)
  %17 = load i64, ptr %7, align 8, !dbg !915
  %18 = load i64, ptr %8, align 8, !dbg !916
  %19 = and i64 %18, 1, !dbg !917
  %20 = mul i64 %17, %19, !dbg !918
  store i64 %20, ptr %9, align 8, !dbg !914
  %21 = load i64, ptr %7, align 8, !dbg !919
  %22 = load i64, ptr %5, align 8, !dbg !920
  %23 = and i64 %21, %22, !dbg !921
  store i64 %23, ptr %6, align 8, !dbg !922
  %24 = load i64, ptr %6, align 8, !dbg !923
  %25 = load i64, ptr %7, align 8, !dbg !924
  %26 = xor i64 %25, %24, !dbg !924
  store i64 %26, ptr %7, align 8, !dbg !924
  %27 = load i64, ptr %7, align 8, !dbg !925
  %28 = shl i64 %27, 1, !dbg !926
  %29 = load i64, ptr %6, align 8, !dbg !927
  %30 = lshr i64 %29, 3, !dbg !928
  %31 = mul i64 %30, 3, !dbg !929
  %32 = xor i64 %28, %31, !dbg !930
  store i64 %32, ptr %7, align 8, !dbg !931
  %33 = load i64, ptr %7, align 8, !dbg !932
  %34 = load i64, ptr %8, align 8, !dbg !933
  %35 = lshr i64 %34, 1, !dbg !934
  %36 = and i64 %35, 1, !dbg !935
  %37 = mul i64 %33, %36, !dbg !936
  %38 = load i64, ptr %9, align 8, !dbg !937
  %39 = xor i64 %38, %37, !dbg !937
  store i64 %39, ptr %9, align 8, !dbg !937
  %40 = load i64, ptr %7, align 8, !dbg !938
  %41 = load i64, ptr %5, align 8, !dbg !939
  %42 = and i64 %40, %41, !dbg !940
  store i64 %42, ptr %6, align 8, !dbg !941
  %43 = load i64, ptr %6, align 8, !dbg !942
  %44 = load i64, ptr %7, align 8, !dbg !943
  %45 = xor i64 %44, %43, !dbg !943
  store i64 %45, ptr %7, align 8, !dbg !943
  %46 = load i64, ptr %7, align 8, !dbg !944
  %47 = shl i64 %46, 1, !dbg !945
  %48 = load i64, ptr %6, align 8, !dbg !946
  %49 = lshr i64 %48, 3, !dbg !947
  %50 = mul i64 %49, 3, !dbg !948
  %51 = xor i64 %47, %50, !dbg !949
  store i64 %51, ptr %7, align 8, !dbg !950
  %52 = load i64, ptr %7, align 8, !dbg !951
  %53 = load i64, ptr %8, align 8, !dbg !952
  %54 = lshr i64 %53, 2, !dbg !953
  %55 = and i64 %54, 1, !dbg !954
  %56 = mul i64 %52, %55, !dbg !955
  %57 = load i64, ptr %9, align 8, !dbg !956
  %58 = xor i64 %57, %56, !dbg !956
  store i64 %58, ptr %9, align 8, !dbg !956
  %59 = load i64, ptr %7, align 8, !dbg !957
  %60 = load i64, ptr %5, align 8, !dbg !958
  %61 = and i64 %59, %60, !dbg !959
  store i64 %61, ptr %6, align 8, !dbg !960
  %62 = load i64, ptr %6, align 8, !dbg !961
  %63 = load i64, ptr %7, align 8, !dbg !962
  %64 = xor i64 %63, %62, !dbg !962
  store i64 %64, ptr %7, align 8, !dbg !962
  %65 = load i64, ptr %7, align 8, !dbg !963
  %66 = shl i64 %65, 1, !dbg !964
  %67 = load i64, ptr %6, align 8, !dbg !965
  %68 = lshr i64 %67, 3, !dbg !966
  %69 = mul i64 %68, 3, !dbg !967
  %70 = xor i64 %66, %69, !dbg !968
  store i64 %70, ptr %7, align 8, !dbg !969
  %71 = load i64, ptr %7, align 8, !dbg !970
  %72 = load i64, ptr %8, align 8, !dbg !971
  %73 = lshr i64 %72, 3, !dbg !972
  %74 = and i64 %73, 1, !dbg !973
  %75 = mul i64 %71, %74, !dbg !974
  %76 = load i64, ptr %9, align 8, !dbg !975
  %77 = xor i64 %76, %75, !dbg !975
  store i64 %77, ptr %9, align 8, !dbg !975
  %78 = load i64, ptr %9, align 8, !dbg !976
  ret i64 %78, !dbg !977
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #0 !dbg !978 {
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
    #dbg_declare(ptr %9, !981, !DIExpression(), !982)
  store ptr %1, ptr %10, align 8
    #dbg_declare(ptr %10, !983, !DIExpression(), !984)
  store ptr %2, ptr %11, align 8
    #dbg_declare(ptr %11, !985, !DIExpression(), !986)
  store ptr %3, ptr %12, align 8
    #dbg_declare(ptr %12, !987, !DIExpression(), !988)
  store i32 %4, ptr %13, align 4
    #dbg_declare(ptr %13, !989, !DIExpression(), !990)
  store i32 %5, ptr %14, align 4
    #dbg_declare(ptr %14, !991, !DIExpression(), !992)
  store i32 %6, ptr %15, align 4
    #dbg_declare(ptr %15, !993, !DIExpression(), !994)
  store i32 %7, ptr %16, align 4
    #dbg_declare(ptr %16, !995, !DIExpression(), !996)
    #dbg_declare(ptr %17, !997, !DIExpression(), !998)
  store i32 0, ptr %17, align 4, !dbg !998
    #dbg_declare(ptr %18, !999, !DIExpression(), !1001)
  store i32 0, ptr %18, align 4, !dbg !1001
  br label %21, !dbg !1002

21:                                               ; preds = %75, %8
  %22 = load i32, ptr %18, align 4, !dbg !1003
  %23 = load i32, ptr %13, align 4, !dbg !1005
  %24 = icmp slt i32 %22, %23, !dbg !1006
  br i1 %24, label %25, label %78, !dbg !1007

25:                                               ; preds = %21
    #dbg_declare(ptr %19, !1008, !DIExpression(), !1011)
  %26 = load i32, ptr %16, align 4, !dbg !1012
  %27 = load i32, ptr %18, align 4, !dbg !1013
  %28 = mul nsw i32 %26, %27, !dbg !1014
  store i32 %28, ptr %19, align 4, !dbg !1011
  br label %29, !dbg !1015

29:                                               ; preds = %71, %25
  %30 = load i32, ptr %19, align 4, !dbg !1016
  %31 = load i32, ptr %14, align 4, !dbg !1018
  %32 = icmp slt i32 %30, %31, !dbg !1019
  br i1 %32, label %33, label %74, !dbg !1020

33:                                               ; preds = %29
    #dbg_declare(ptr %20, !1021, !DIExpression(), !1024)
  store i32 0, ptr %20, align 4, !dbg !1024
  br label %34, !dbg !1025

34:                                               ; preds = %65, %33
  %35 = load i32, ptr %20, align 4, !dbg !1026
  %36 = load i32, ptr %15, align 4, !dbg !1028
  %37 = icmp slt i32 %35, %36, !dbg !1029
  br i1 %37, label %38, label %68, !dbg !1030

38:                                               ; preds = %34
  %39 = load i32, ptr %9, align 4, !dbg !1031
  %40 = load ptr, ptr %10, align 8, !dbg !1033
  %41 = load i32, ptr %9, align 4, !dbg !1034
  %42 = load i32, ptr %17, align 4, !dbg !1035
  %43 = mul nsw i32 %41, %42, !dbg !1036
  %44 = sext i32 %43 to i64, !dbg !1037
  %45 = getelementptr inbounds i64, ptr %40, i64 %44, !dbg !1037
  %46 = load ptr, ptr %11, align 8, !dbg !1038
  %47 = load i32, ptr %19, align 4, !dbg !1039
  %48 = load i32, ptr %15, align 4, !dbg !1040
  %49 = mul nsw i32 %47, %48, !dbg !1041
  %50 = load i32, ptr %20, align 4, !dbg !1042
  %51 = add nsw i32 %49, %50, !dbg !1043
  %52 = sext i32 %51 to i64, !dbg !1038
  %53 = getelementptr inbounds i8, ptr %46, i64 %52, !dbg !1038
  %54 = load i8, ptr %53, align 1, !dbg !1038
  %55 = load ptr, ptr %12, align 8, !dbg !1044
  %56 = load i32, ptr %9, align 4, !dbg !1045
  %57 = load i32, ptr %18, align 4, !dbg !1046
  %58 = load i32, ptr %15, align 4, !dbg !1047
  %59 = mul nsw i32 %57, %58, !dbg !1048
  %60 = load i32, ptr %20, align 4, !dbg !1049
  %61 = add nsw i32 %59, %60, !dbg !1050
  %62 = mul nsw i32 %56, %61, !dbg !1051
  %63 = sext i32 %62 to i64, !dbg !1052
  %64 = getelementptr inbounds i64, ptr %55, i64 %63, !dbg !1052
  call void @m_vec_mul_add(i32 noundef %39, ptr noundef %45, i8 noundef zeroext %54, ptr noundef %64), !dbg !1053
  br label %65, !dbg !1054

65:                                               ; preds = %38
  %66 = load i32, ptr %20, align 4, !dbg !1055
  %67 = add nsw i32 %66, 1, !dbg !1055
  store i32 %67, ptr %20, align 4, !dbg !1055
  br label %34, !dbg !1056, !llvm.loop !1057

68:                                               ; preds = %34
  %69 = load i32, ptr %17, align 4, !dbg !1059
  %70 = add nsw i32 %69, 1, !dbg !1059
  store i32 %70, ptr %17, align 4, !dbg !1059
  br label %71, !dbg !1060

71:                                               ; preds = %68
  %72 = load i32, ptr %19, align 4, !dbg !1061
  %73 = add nsw i32 %72, 1, !dbg !1061
  store i32 %73, ptr %19, align 4, !dbg !1061
  br label %29, !dbg !1062, !llvm.loop !1063

74:                                               ; preds = %29
  br label %75, !dbg !1065

75:                                               ; preds = %74
  %76 = load i32, ptr %18, align 4, !dbg !1066
  %77 = add nsw i32 %76, 1, !dbg !1066
  store i32 %77, ptr %18, align 4, !dbg !1066
  br label %21, !dbg !1067, !llvm.loop !1068

78:                                               ; preds = %21
  ret void, !dbg !1070
}

declare i32 @AES_128_CTR(ptr noundef, i64 noundef, ptr noundef, i64 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @unpack_m_vecs(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !1071 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca [9 x i64], align 16
  %12 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !1074, !DIExpression(), !1075)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1076, !DIExpression(), !1077)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !1078, !DIExpression(), !1079)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !1080, !DIExpression(), !1081)
    #dbg_declare(ptr %9, !1082, !DIExpression(), !1083)
  %13 = load i32, ptr %8, align 4, !dbg !1084
  %14 = add nsw i32 %13, 15, !dbg !1085
  %15 = sdiv i32 %14, 16, !dbg !1086
  store i32 %15, ptr %9, align 4, !dbg !1083
    #dbg_declare(ptr %10, !1087, !DIExpression(), !1088)
  %16 = load ptr, ptr %6, align 8, !dbg !1089
  store ptr %16, ptr %10, align 8, !dbg !1088
    #dbg_declare(ptr %11, !1090, !DIExpression(), !1094)
  call void @llvm.memset.p0.i64(ptr align 16 %11, i8 0, i64 72, i1 false), !dbg !1094
    #dbg_declare(ptr %12, !1095, !DIExpression(), !1097)
  %17 = load i32, ptr %7, align 4, !dbg !1098
  %18 = sub nsw i32 %17, 1, !dbg !1099
  store i32 %18, ptr %12, align 4, !dbg !1097
  br label %19, !dbg !1100

19:                                               ; preds = %45, %4
  %20 = load i32, ptr %12, align 4, !dbg !1101
  %21 = icmp sge i32 %20, 0, !dbg !1103
  br i1 %21, label %22, label %48, !dbg !1104

22:                                               ; preds = %19
  %23 = getelementptr inbounds [9 x i64], ptr %11, i64 0, i64 0, !dbg !1105
  %24 = load ptr, ptr %5, align 8, !dbg !1107
  %25 = load i32, ptr %12, align 4, !dbg !1108
  %26 = load i32, ptr %8, align 4, !dbg !1109
  %27 = mul nsw i32 %25, %26, !dbg !1110
  %28 = sdiv i32 %27, 2, !dbg !1111
  %29 = sext i32 %28 to i64, !dbg !1105
  %30 = getelementptr inbounds i8, ptr %24, i64 %29, !dbg !1105
  %31 = load i32, ptr %8, align 4, !dbg !1112
  %32 = sdiv i32 %31, 2, !dbg !1113
  %33 = sext i32 %32 to i64, !dbg !1112
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %23, ptr align 1 %30, i64 %33, i1 false), !dbg !1105
  %34 = load ptr, ptr %10, align 8, !dbg !1114
  %35 = load i32, ptr %12, align 4, !dbg !1115
  %36 = load i32, ptr %9, align 4, !dbg !1116
  %37 = mul nsw i32 %35, %36, !dbg !1117
  %38 = sext i32 %37 to i64, !dbg !1115
  %39 = mul i64 %38, 8, !dbg !1118
  %40 = getelementptr inbounds nuw i8, ptr %34, i64 %39, !dbg !1119
  %41 = getelementptr inbounds [9 x i64], ptr %11, i64 0, i64 0, !dbg !1119
  %42 = load i32, ptr %9, align 4, !dbg !1120
  %43 = sext i32 %42 to i64, !dbg !1120
  %44 = mul i64 %43, 8, !dbg !1121
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %40, ptr align 16 %41, i64 %44, i1 false), !dbg !1119
  br label %45, !dbg !1122

45:                                               ; preds = %22
  %46 = load i32, ptr %12, align 4, !dbg !1123
  %47 = add nsw i32 %46, -1, !dbg !1123
  store i32 %47, ptr %12, align 4, !dbg !1123
  br label %19, !dbg !1124, !llvm.loop !1125

48:                                               ; preds = %19
  ret void, !dbg !1127
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_expand_sk(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !1128 {
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
    #dbg_declare(ptr %4, !1137, !DIExpression(), !1138)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !1139, !DIExpression(), !1140)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !1141, !DIExpression(), !1142)
    #dbg_declare(ptr %7, !1143, !DIExpression(), !1144)
  store i32 0, ptr %7, align 4, !dbg !1144
    #dbg_declare(ptr %8, !1145, !DIExpression(), !1146)
    #dbg_declare(ptr %9, !1147, !DIExpression(), !1148)
  %21 = load ptr, ptr %6, align 8, !dbg !1149
  %22 = getelementptr inbounds nuw %struct.sk_t, ptr %21, i32 0, i32 0, !dbg !1150
  %23 = getelementptr inbounds [113103 x i64], ptr %22, i64 0, i64 0, !dbg !1149
  store ptr %23, ptr %9, align 8, !dbg !1148
    #dbg_declare(ptr %10, !1151, !DIExpression(), !1152)
  %24 = load ptr, ptr %6, align 8, !dbg !1153
  %25 = getelementptr inbounds nuw %struct.sk_t, ptr %24, i32 0, i32 1, !dbg !1154
  %26 = getelementptr inbounds [2414 x i8], ptr %25, i64 0, i64 0, !dbg !1153
  store ptr %26, ptr %10, align 8, !dbg !1152
    #dbg_declare(ptr %11, !1155, !DIExpression(), !1156)
  %27 = load ptr, ptr %4, align 8, !dbg !1157
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2, !dbg !1158
  %29 = load i32, ptr %28, align 8, !dbg !1158
  store i32 %29, ptr %11, align 4, !dbg !1156
    #dbg_declare(ptr %12, !1159, !DIExpression(), !1160)
  %30 = load ptr, ptr %4, align 8, !dbg !1161
  %31 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 1, !dbg !1162
  %32 = load i32, ptr %31, align 4, !dbg !1162
  %33 = load ptr, ptr %4, align 8, !dbg !1161
  %34 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 2, !dbg !1162
  %35 = load i32, ptr %34, align 8, !dbg !1162
  %36 = sub nsw i32 %32, %35, !dbg !1162
  store i32 %36, ptr %12, align 4, !dbg !1160
    #dbg_declare(ptr %13, !1163, !DIExpression(), !1164)
  %37 = load ptr, ptr %4, align 8, !dbg !1165
  %38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 7, !dbg !1166
  %39 = load i32, ptr %38, align 4, !dbg !1166
  store i32 %39, ptr %13, align 4, !dbg !1164
    #dbg_declare(ptr %14, !1167, !DIExpression(), !1168)
  %40 = load ptr, ptr %4, align 8, !dbg !1169
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 20, !dbg !1170
  %42 = load i32, ptr %41, align 8, !dbg !1170
  store i32 %42, ptr %14, align 4, !dbg !1168
    #dbg_declare(ptr %15, !1171, !DIExpression(), !1172)
  %43 = load ptr, ptr %4, align 8, !dbg !1173
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 18, !dbg !1174
  %45 = load i32, ptr %44, align 8, !dbg !1174
  store i32 %45, ptr %15, align 4, !dbg !1172
    #dbg_declare(ptr %16, !1175, !DIExpression(), !1176)
  %46 = load ptr, ptr %5, align 8, !dbg !1177
  store ptr %46, ptr %16, align 8, !dbg !1176
    #dbg_declare(ptr %17, !1178, !DIExpression(), !1179)
  %47 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0, !dbg !1180
  store ptr %47, ptr %17, align 8, !dbg !1179
  %48 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0, !dbg !1181
  %49 = load i32, ptr %14, align 4, !dbg !1182
  %50 = load i32, ptr %13, align 4, !dbg !1183
  %51 = add nsw i32 %49, %50, !dbg !1184
  %52 = sext i32 %51 to i64, !dbg !1182
  %53 = load ptr, ptr %16, align 8, !dbg !1185
  %54 = load i32, ptr %15, align 4, !dbg !1186
  %55 = sext i32 %54 to i64, !dbg !1186
  %56 = call i32 @shake256(ptr noundef %48, i64 noundef %52, ptr noundef %53, i64 noundef %55), !dbg !1187
  %57 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0, !dbg !1188
  %58 = load i32, ptr %14, align 4, !dbg !1189
  %59 = sext i32 %58 to i64, !dbg !1190
  %60 = getelementptr inbounds i8, ptr %57, i64 %59, !dbg !1190
  %61 = load ptr, ptr %10, align 8, !dbg !1191
  %62 = load i32, ptr %12, align 4, !dbg !1192
  %63 = load i32, ptr %11, align 4, !dbg !1193
  %64 = mul nsw i32 %62, %63, !dbg !1194
  call void @decode(ptr noundef %60, ptr noundef %61, i32 noundef %64), !dbg !1195
  %65 = load ptr, ptr %4, align 8, !dbg !1196
  %66 = load ptr, ptr %9, align 8, !dbg !1197
  %67 = load ptr, ptr %17, align 8, !dbg !1198
  call void @expand_P1_P2(ptr noundef %65, ptr noundef %66, ptr noundef %67), !dbg !1199
    #dbg_declare(ptr %18, !1200, !DIExpression(), !1201)
  %68 = load ptr, ptr %9, align 8, !dbg !1202
  %69 = load ptr, ptr %4, align 8, !dbg !1203
  %70 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %69, i32 0, i32 1, !dbg !1204
  %71 = load i32, ptr %70, align 4, !dbg !1204
  %72 = load ptr, ptr %4, align 8, !dbg !1203
  %73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %72, i32 0, i32 2, !dbg !1204
  %74 = load i32, ptr %73, align 8, !dbg !1204
  %75 = sub nsw i32 %71, %74, !dbg !1204
  %76 = load ptr, ptr %4, align 8, !dbg !1203
  %77 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %76, i32 0, i32 1, !dbg !1204
  %78 = load i32, ptr %77, align 4, !dbg !1204
  %79 = load ptr, ptr %4, align 8, !dbg !1203
  %80 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %79, i32 0, i32 2, !dbg !1204
  %81 = load i32, ptr %80, align 8, !dbg !1204
  %82 = sub nsw i32 %78, %81, !dbg !1204
  %83 = add nsw i32 %82, 1, !dbg !1204
  %84 = mul nsw i32 %75, %83, !dbg !1204
  %85 = sdiv i32 %84, 2, !dbg !1204
  %86 = load ptr, ptr %4, align 8, !dbg !1203
  %87 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %86, i32 0, i32 21, !dbg !1204
  %88 = load i32, ptr %87, align 4, !dbg !1204
  %89 = mul nsw i32 %85, %88, !dbg !1204
  %90 = sext i32 %89 to i64, !dbg !1205
  %91 = getelementptr inbounds i64, ptr %68, i64 %90, !dbg !1205
  store ptr %91, ptr %18, align 8, !dbg !1201
    #dbg_declare(ptr %19, !1206, !DIExpression(), !1207)
  %92 = load ptr, ptr %9, align 8, !dbg !1208
  store ptr %92, ptr %19, align 8, !dbg !1207
    #dbg_declare(ptr %20, !1209, !DIExpression(), !1210)
  %93 = load ptr, ptr %18, align 8, !dbg !1211
  store ptr %93, ptr %20, align 8, !dbg !1210
  %94 = load ptr, ptr %4, align 8, !dbg !1212
  %95 = load ptr, ptr %19, align 8, !dbg !1213
  %96 = load ptr, ptr %10, align 8, !dbg !1214
  %97 = load ptr, ptr %20, align 8, !dbg !1215
  call void @P1P1t_times_O(ptr noundef %94, ptr noundef %95, ptr noundef %96, ptr noundef %97), !dbg !1216
  %98 = getelementptr inbounds [868 x i8], ptr %8, i64 0, i64 0, !dbg !1217
  call void @mayo_secure_clear(ptr noundef %98, i64 noundef 868), !dbg !1218
  %99 = load i32, ptr %7, align 4, !dbg !1219
  ret i32 %99, !dbg !1220
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @P1P1t_times_O(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !1221 {
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
    #dbg_declare(ptr %5, !1222, !DIExpression(), !1223)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1224, !DIExpression(), !1225)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !1226, !DIExpression(), !1227)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !1228, !DIExpression(), !1229)
    #dbg_declare(ptr %9, !1230, !DIExpression(), !1231)
  %16 = load ptr, ptr %5, align 8, !dbg !1232
  %17 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 2, !dbg !1233
  %18 = load i32, ptr %17, align 8, !dbg !1233
  store i32 %18, ptr %9, align 4, !dbg !1231
    #dbg_declare(ptr %10, !1234, !DIExpression(), !1235)
  %19 = load ptr, ptr %5, align 8, !dbg !1236
  %20 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %19, i32 0, i32 1, !dbg !1237
  %21 = load i32, ptr %20, align 4, !dbg !1237
  %22 = load ptr, ptr %5, align 8, !dbg !1236
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 2, !dbg !1237
  %24 = load i32, ptr %23, align 8, !dbg !1237
  %25 = sub nsw i32 %21, %24, !dbg !1237
  store i32 %25, ptr %10, align 4, !dbg !1235
    #dbg_declare(ptr %11, !1238, !DIExpression(), !1239)
  %26 = load ptr, ptr %5, align 8, !dbg !1240
  %27 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %26, i32 0, i32 21, !dbg !1241
  %28 = load i32, ptr %27, align 4, !dbg !1241
  store i32 %28, ptr %11, align 4, !dbg !1239
    #dbg_declare(ptr %12, !1242, !DIExpression(), !1243)
  store i32 0, ptr %12, align 4, !dbg !1243
    #dbg_declare(ptr %13, !1244, !DIExpression(), !1246)
  store i32 0, ptr %13, align 4, !dbg !1246
  br label %29, !dbg !1247

29:                                               ; preds = %114, %4
  %30 = load i32, ptr %13, align 4, !dbg !1248
  %31 = load i32, ptr %10, align 4, !dbg !1250
  %32 = icmp slt i32 %30, %31, !dbg !1251
  br i1 %32, label %33, label %117, !dbg !1252

33:                                               ; preds = %29
    #dbg_declare(ptr %14, !1253, !DIExpression(), !1256)
  %34 = load i32, ptr %13, align 4, !dbg !1257
  store i32 %34, ptr %14, align 4, !dbg !1256
  br label %35, !dbg !1258

35:                                               ; preds = %110, %33
  %36 = load i32, ptr %14, align 4, !dbg !1259
  %37 = load i32, ptr %10, align 4, !dbg !1261
  %38 = icmp slt i32 %36, %37, !dbg !1262
  br i1 %38, label %39, label %113, !dbg !1263

39:                                               ; preds = %35
  %40 = load i32, ptr %14, align 4, !dbg !1264
  %41 = load i32, ptr %13, align 4, !dbg !1267
  %42 = icmp eq i32 %40, %41, !dbg !1268
  br i1 %42, label %43, label %46, !dbg !1268

43:                                               ; preds = %39
  %44 = load i32, ptr %12, align 4, !dbg !1269
  %45 = add nsw i32 %44, 1, !dbg !1269
  store i32 %45, ptr %12, align 4, !dbg !1269
  br label %110, !dbg !1271

46:                                               ; preds = %39
    #dbg_declare(ptr %15, !1272, !DIExpression(), !1274)
  store i32 0, ptr %15, align 4, !dbg !1274
  br label %47, !dbg !1275

47:                                               ; preds = %104, %46
  %48 = load i32, ptr %15, align 4, !dbg !1276
  %49 = load i32, ptr %9, align 4, !dbg !1278
  %50 = icmp slt i32 %48, %49, !dbg !1279
  br i1 %50, label %51, label %107, !dbg !1280

51:                                               ; preds = %47
  %52 = load i32, ptr %11, align 4, !dbg !1281
  %53 = load ptr, ptr %6, align 8, !dbg !1283
  %54 = load i32, ptr %11, align 4, !dbg !1284
  %55 = load i32, ptr %12, align 4, !dbg !1285
  %56 = mul nsw i32 %54, %55, !dbg !1286
  %57 = sext i32 %56 to i64, !dbg !1287
  %58 = getelementptr inbounds i64, ptr %53, i64 %57, !dbg !1287
  %59 = load ptr, ptr %7, align 8, !dbg !1288
  %60 = load i32, ptr %14, align 4, !dbg !1289
  %61 = load i32, ptr %9, align 4, !dbg !1290
  %62 = mul nsw i32 %60, %61, !dbg !1291
  %63 = load i32, ptr %15, align 4, !dbg !1292
  %64 = add nsw i32 %62, %63, !dbg !1293
  %65 = sext i32 %64 to i64, !dbg !1288
  %66 = getelementptr inbounds i8, ptr %59, i64 %65, !dbg !1288
  %67 = load i8, ptr %66, align 1, !dbg !1288
  %68 = load ptr, ptr %8, align 8, !dbg !1294
  %69 = load i32, ptr %11, align 4, !dbg !1295
  %70 = load i32, ptr %13, align 4, !dbg !1296
  %71 = load i32, ptr %9, align 4, !dbg !1297
  %72 = mul nsw i32 %70, %71, !dbg !1298
  %73 = load i32, ptr %15, align 4, !dbg !1299
  %74 = add nsw i32 %72, %73, !dbg !1300
  %75 = mul nsw i32 %69, %74, !dbg !1301
  %76 = sext i32 %75 to i64, !dbg !1302
  %77 = getelementptr inbounds i64, ptr %68, i64 %76, !dbg !1302
  call void @m_vec_mul_add(i32 noundef %52, ptr noundef %58, i8 noundef zeroext %67, ptr noundef %77), !dbg !1303
  %78 = load i32, ptr %11, align 4, !dbg !1304
  %79 = load ptr, ptr %6, align 8, !dbg !1305
  %80 = load i32, ptr %11, align 4, !dbg !1306
  %81 = load i32, ptr %12, align 4, !dbg !1307
  %82 = mul nsw i32 %80, %81, !dbg !1308
  %83 = sext i32 %82 to i64, !dbg !1309
  %84 = getelementptr inbounds i64, ptr %79, i64 %83, !dbg !1309
  %85 = load ptr, ptr %7, align 8, !dbg !1310
  %86 = load i32, ptr %13, align 4, !dbg !1311
  %87 = load i32, ptr %9, align 4, !dbg !1312
  %88 = mul nsw i32 %86, %87, !dbg !1313
  %89 = load i32, ptr %15, align 4, !dbg !1314
  %90 = add nsw i32 %88, %89, !dbg !1315
  %91 = sext i32 %90 to i64, !dbg !1310
  %92 = getelementptr inbounds i8, ptr %85, i64 %91, !dbg !1310
  %93 = load i8, ptr %92, align 1, !dbg !1310
  %94 = load ptr, ptr %8, align 8, !dbg !1316
  %95 = load i32, ptr %11, align 4, !dbg !1317
  %96 = load i32, ptr %14, align 4, !dbg !1318
  %97 = load i32, ptr %9, align 4, !dbg !1319
  %98 = mul nsw i32 %96, %97, !dbg !1320
  %99 = load i32, ptr %15, align 4, !dbg !1321
  %100 = add nsw i32 %98, %99, !dbg !1322
  %101 = mul nsw i32 %95, %100, !dbg !1323
  %102 = sext i32 %101 to i64, !dbg !1324
  %103 = getelementptr inbounds i64, ptr %94, i64 %102, !dbg !1324
  call void @m_vec_mul_add(i32 noundef %78, ptr noundef %84, i8 noundef zeroext %93, ptr noundef %103), !dbg !1325
  br label %104, !dbg !1326

104:                                              ; preds = %51
  %105 = load i32, ptr %15, align 4, !dbg !1327
  %106 = add nsw i32 %105, 1, !dbg !1327
  store i32 %106, ptr %15, align 4, !dbg !1327
  br label %47, !dbg !1328, !llvm.loop !1329

107:                                              ; preds = %47
  %108 = load i32, ptr %12, align 4, !dbg !1331
  %109 = add nsw i32 %108, 1, !dbg !1331
  store i32 %109, ptr %12, align 4, !dbg !1331
  br label %110, !dbg !1332

110:                                              ; preds = %107, %43
  %111 = load i32, ptr %14, align 4, !dbg !1333
  %112 = add nsw i32 %111, 1, !dbg !1333
  store i32 %112, ptr %14, align 4, !dbg !1333
  br label %35, !dbg !1334, !llvm.loop !1335

113:                                              ; preds = %35
  br label %114, !dbg !1337

114:                                              ; preds = %113
  %115 = load i32, ptr %13, align 4, !dbg !1338
  %116 = add nsw i32 %115, 1, !dbg !1338
  store i32 %116, ptr %13, align 4, !dbg !1338
  br label %29, !dbg !1339, !llvm.loop !1340

117:                                              ; preds = %29
  ret void, !dbg !1342
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_sign_signature(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4, ptr noundef %5) #0 !dbg !1343 {
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
    #dbg_declare(ptr %7, !1347, !DIExpression(), !1348)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !1349, !DIExpression(), !1350)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !1351, !DIExpression(), !1352)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !1353, !DIExpression(), !1354)
  store i64 %4, ptr %11, align 8
    #dbg_declare(ptr %11, !1355, !DIExpression(), !1356)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !1357, !DIExpression(), !1358)
    #dbg_declare(ptr %13, !1359, !DIExpression(), !1360)
  store i32 0, ptr %13, align 4, !dbg !1360
    #dbg_declare(ptr %14, !1361, !DIExpression(), !1365)
    #dbg_declare(ptr %15, !1366, !DIExpression(), !1370)
    #dbg_declare(ptr %16, !1371, !DIExpression(), !1372)
    #dbg_declare(ptr %17, !1373, !DIExpression(), !1377)
    #dbg_declare(ptr %18, !1378, !DIExpression(), !1382)
    #dbg_declare(ptr %19, !1383, !DIExpression(), !1387)
    #dbg_declare(ptr %20, !1388, !DIExpression(), !1392)
  call void @llvm.memset.p0.i64(ptr align 16 %20, i8 0, i64 29520, i1 false), !dbg !1392
    #dbg_declare(ptr %21, !1393, !DIExpression(), !1397)
    #dbg_declare(ptr %22, !1398, !DIExpression(), !1402)
  call void @llvm.memset.p0.i64(ptr align 16 %22, i8 0, i64 205, i1 false), !dbg !1402
    #dbg_declare(ptr %23, !1403, !DIExpression(), !1404)
    #dbg_declare(ptr %24, !1405, !DIExpression(), !1406)
    #dbg_declare(ptr %25, !1407, !DIExpression(), !1408)
    #dbg_declare(ptr %26, !1409, !DIExpression(), !1410)
    #dbg_declare(ptr %27, !1411, !DIExpression(), !1415)
    #dbg_declare(ptr %28, !1416, !DIExpression(), !1417)
    #dbg_declare(ptr %29, !1418, !DIExpression(), !1419)
    #dbg_declare(ptr %30, !1420, !DIExpression(), !1421)
  %50 = load ptr, ptr %7, align 8, !dbg !1422
  %51 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %50, i32 0, i32 0, !dbg !1423
  %52 = load i32, ptr %51, align 8, !dbg !1423
  store i32 %52, ptr %30, align 4, !dbg !1421
    #dbg_declare(ptr %31, !1424, !DIExpression(), !1425)
  %53 = load ptr, ptr %7, align 8, !dbg !1426
  %54 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %53, i32 0, i32 1, !dbg !1427
  %55 = load i32, ptr %54, align 4, !dbg !1427
  store i32 %55, ptr %31, align 4, !dbg !1425
    #dbg_declare(ptr %32, !1428, !DIExpression(), !1429)
  %56 = load ptr, ptr %7, align 8, !dbg !1430
  %57 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %56, i32 0, i32 2, !dbg !1431
  %58 = load i32, ptr %57, align 8, !dbg !1431
  store i32 %58, ptr %32, align 4, !dbg !1429
    #dbg_declare(ptr %33, !1432, !DIExpression(), !1433)
  %59 = load ptr, ptr %7, align 8, !dbg !1434
  %60 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %59, i32 0, i32 3, !dbg !1435
  %61 = load i32, ptr %60, align 4, !dbg !1435
  store i32 %61, ptr %33, align 4, !dbg !1433
    #dbg_declare(ptr %34, !1436, !DIExpression(), !1437)
  %62 = load ptr, ptr %7, align 8, !dbg !1438
  %63 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %62, i32 0, i32 1, !dbg !1439
  %64 = load i32, ptr %63, align 4, !dbg !1439
  %65 = load ptr, ptr %7, align 8, !dbg !1438
  %66 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %65, i32 0, i32 2, !dbg !1439
  %67 = load i32, ptr %66, align 8, !dbg !1439
  %68 = sub nsw i32 %64, %67, !dbg !1439
  store i32 %68, ptr %34, align 4, !dbg !1437
    #dbg_declare(ptr %35, !1440, !DIExpression(), !1441)
  %69 = load ptr, ptr %7, align 8, !dbg !1442
  %70 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %69, i32 0, i32 6, !dbg !1443
  %71 = load i32, ptr %70, align 8, !dbg !1443
  store i32 %71, ptr %35, align 4, !dbg !1441
    #dbg_declare(ptr %36, !1444, !DIExpression(), !1445)
  %72 = load ptr, ptr %7, align 8, !dbg !1446
  %73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %72, i32 0, i32 8, !dbg !1447
  %74 = load i32, ptr %73, align 8, !dbg !1447
  store i32 %74, ptr %36, align 4, !dbg !1445
    #dbg_declare(ptr %37, !1448, !DIExpression(), !1449)
  %75 = load ptr, ptr %7, align 8, !dbg !1450
  %76 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %75, i32 0, i32 9, !dbg !1451
  %77 = load i32, ptr %76, align 4, !dbg !1451
  store i32 %77, ptr %37, align 4, !dbg !1449
    #dbg_declare(ptr %38, !1452, !DIExpression(), !1453)
  %78 = load ptr, ptr %7, align 8, !dbg !1454
  %79 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %78, i32 0, i32 16, !dbg !1455
  %80 = load i32, ptr %79, align 8, !dbg !1455
  store i32 %80, ptr %38, align 4, !dbg !1453
    #dbg_declare(ptr %39, !1456, !DIExpression(), !1457)
  %81 = load ptr, ptr %7, align 8, !dbg !1458
  %82 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %81, i32 0, i32 3, !dbg !1459
  %83 = load i32, ptr %82, align 4, !dbg !1459
  %84 = load ptr, ptr %7, align 8, !dbg !1458
  %85 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %84, i32 0, i32 2, !dbg !1459
  %86 = load i32, ptr %85, align 8, !dbg !1459
  %87 = mul nsw i32 %83, %86, !dbg !1459
  %88 = add nsw i32 %87, 1, !dbg !1459
  store i32 %88, ptr %39, align 4, !dbg !1457
    #dbg_declare(ptr %40, !1460, !DIExpression(), !1461)
  %89 = load ptr, ptr %7, align 8, !dbg !1462
  %90 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %89, i32 0, i32 19, !dbg !1463
  %91 = load i32, ptr %90, align 4, !dbg !1463
  store i32 %91, ptr %40, align 4, !dbg !1461
    #dbg_declare(ptr %41, !1464, !DIExpression(), !1465)
  %92 = load ptr, ptr %7, align 8, !dbg !1466
  %93 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %92, i32 0, i32 18, !dbg !1467
  %94 = load i32, ptr %93, align 8, !dbg !1467
  store i32 %94, ptr %41, align 4, !dbg !1465
    #dbg_declare(ptr %42, !1468, !DIExpression(), !1469)
  %95 = load ptr, ptr %7, align 8, !dbg !1470
  %96 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %95, i32 0, i32 17, !dbg !1471
  %97 = load i32, ptr %96, align 4, !dbg !1471
  store i32 %97, ptr %42, align 4, !dbg !1469
  %98 = load ptr, ptr %7, align 8, !dbg !1472
  %99 = load ptr, ptr %12, align 8, !dbg !1473
  %100 = call i32 @mayo_expand_sk(ptr noundef %98, ptr noundef %99, ptr noundef %25), !dbg !1474
  store i32 %100, ptr %13, align 4, !dbg !1475
  %101 = load i32, ptr %13, align 4, !dbg !1476
  %102 = icmp ne i32 %101, 0, !dbg !1478
  br i1 %102, label %103, label %104, !dbg !1478

103:                                              ; preds = %6
  br label %386, !dbg !1479

104:                                              ; preds = %6
  %105 = load ptr, ptr %12, align 8, !dbg !1481
  store ptr %105, ptr %24, align 8, !dbg !1482
  %106 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1483
  %107 = load i32, ptr %40, align 4, !dbg !1484
  %108 = sext i32 %107 to i64, !dbg !1484
  %109 = load ptr, ptr %10, align 8, !dbg !1485
  %110 = load i64, ptr %11, align 8, !dbg !1486
  %111 = call i32 @shake256(ptr noundef %106, i64 noundef %108, ptr noundef %109, i64 noundef %110), !dbg !1487
    #dbg_declare(ptr %43, !1488, !DIExpression(), !1489)
  %112 = getelementptr inbounds nuw %struct.sk_t, ptr %25, i32 0, i32 0, !dbg !1490
  %113 = getelementptr inbounds [113103 x i64], ptr %112, i64 0, i64 0, !dbg !1491
  store ptr %113, ptr %43, align 8, !dbg !1489
    #dbg_declare(ptr %44, !1492, !DIExpression(), !1493)
  %114 = load ptr, ptr %43, align 8, !dbg !1494
  %115 = load ptr, ptr %7, align 8, !dbg !1495
  %116 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %115, i32 0, i32 1, !dbg !1496
  %117 = load i32, ptr %116, align 4, !dbg !1496
  %118 = load ptr, ptr %7, align 8, !dbg !1495
  %119 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %118, i32 0, i32 2, !dbg !1496
  %120 = load i32, ptr %119, align 8, !dbg !1496
  %121 = sub nsw i32 %117, %120, !dbg !1496
  %122 = load ptr, ptr %7, align 8, !dbg !1495
  %123 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %122, i32 0, i32 1, !dbg !1496
  %124 = load i32, ptr %123, align 4, !dbg !1496
  %125 = load ptr, ptr %7, align 8, !dbg !1495
  %126 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %125, i32 0, i32 2, !dbg !1496
  %127 = load i32, ptr %126, align 8, !dbg !1496
  %128 = sub nsw i32 %124, %127, !dbg !1496
  %129 = add nsw i32 %128, 1, !dbg !1496
  %130 = mul nsw i32 %121, %129, !dbg !1496
  %131 = sdiv i32 %130, 2, !dbg !1496
  %132 = load ptr, ptr %7, align 8, !dbg !1495
  %133 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %132, i32 0, i32 21, !dbg !1496
  %134 = load i32, ptr %133, align 4, !dbg !1496
  %135 = mul nsw i32 %131, %134, !dbg !1496
  %136 = sext i32 %135 to i64, !dbg !1497
  %137 = getelementptr inbounds i64, ptr %114, i64 %136, !dbg !1497
  store ptr %137, ptr %44, align 8, !dbg !1493
    #dbg_declare(ptr %45, !1498, !DIExpression(), !1502)
  call void @llvm.memset.p0.i64(ptr align 16 %45, i8 0, i64 14688, i1 false), !dbg !1502
  %138 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1503
  %139 = load i32, ptr %40, align 4, !dbg !1505
  %140 = sext i32 %139 to i64, !dbg !1506
  %141 = getelementptr inbounds i8, ptr %138, i64 %140, !dbg !1506
  %142 = load i32, ptr %42, align 4, !dbg !1507
  %143 = sext i32 %142 to i64, !dbg !1507
  %144 = call i32 @randombytes(ptr noundef %141, i64 noundef %143), !dbg !1508
  %145 = icmp ne i32 %144, 0, !dbg !1509
  br i1 %145, label %146, label %147, !dbg !1509

146:                                              ; preds = %104
  store i32 1, ptr %13, align 4, !dbg !1510
  br label %386, !dbg !1512

147:                                              ; preds = %104
  %148 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1513
  %149 = load i32, ptr %40, align 4, !dbg !1514
  %150 = sext i32 %149 to i64, !dbg !1513
  %151 = getelementptr inbounds i8, ptr %148, i64 %150, !dbg !1513
  %152 = load i32, ptr %42, align 4, !dbg !1515
  %153 = sext i32 %152 to i64, !dbg !1513
  %154 = getelementptr inbounds i8, ptr %151, i64 %153, !dbg !1513
  %155 = load ptr, ptr %24, align 8, !dbg !1516
  %156 = load i32, ptr %41, align 4, !dbg !1517
  %157 = sext i32 %156 to i64, !dbg !1517
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %154, ptr align 1 %155, i64 %157, i1 false), !dbg !1513
  %158 = getelementptr inbounds [40 x i8], ptr %17, i64 0, i64 0, !dbg !1518
  %159 = load i32, ptr %42, align 4, !dbg !1519
  %160 = sext i32 %159 to i64, !dbg !1519
  %161 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1520
  %162 = load i32, ptr %40, align 4, !dbg !1521
  %163 = load i32, ptr %42, align 4, !dbg !1522
  %164 = add nsw i32 %162, %163, !dbg !1523
  %165 = load i32, ptr %41, align 4, !dbg !1524
  %166 = add nsw i32 %164, %165, !dbg !1525
  %167 = sext i32 %166 to i64, !dbg !1521
  %168 = call i32 @shake256(ptr noundef %158, i64 noundef %160, ptr noundef %161, i64 noundef %167), !dbg !1526
  %169 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1527
  %170 = load i32, ptr %40, align 4, !dbg !1528
  %171 = sext i32 %170 to i64, !dbg !1527
  %172 = getelementptr inbounds i8, ptr %169, i64 %171, !dbg !1527
  %173 = getelementptr inbounds [40 x i8], ptr %17, i64 0, i64 0, !dbg !1527
  %174 = load i32, ptr %42, align 4, !dbg !1529
  %175 = sext i32 %174 to i64, !dbg !1529
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %172, ptr align 16 %173, i64 %175, i1 false), !dbg !1527
  %176 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1530
  %177 = load i32, ptr %40, align 4, !dbg !1531
  %178 = sext i32 %177 to i64, !dbg !1532
  %179 = getelementptr inbounds i8, ptr %176, i64 %178, !dbg !1532
  %180 = load i32, ptr %42, align 4, !dbg !1533
  %181 = sext i32 %180 to i64, !dbg !1534
  %182 = getelementptr inbounds i8, ptr %179, i64 %181, !dbg !1534
  %183 = load i32, ptr %41, align 4, !dbg !1535
  %184 = sext i32 %183 to i64, !dbg !1536
  %185 = getelementptr inbounds i8, ptr %182, i64 %184, !dbg !1536
  store ptr %185, ptr %28, align 8, !dbg !1537
  %186 = getelementptr inbounds [71 x i8], ptr %14, i64 0, i64 0, !dbg !1538
  %187 = load i32, ptr %35, align 4, !dbg !1539
  %188 = sext i32 %187 to i64, !dbg !1539
  %189 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1540
  %190 = load i32, ptr %40, align 4, !dbg !1541
  %191 = load i32, ptr %42, align 4, !dbg !1542
  %192 = add nsw i32 %190, %191, !dbg !1543
  %193 = sext i32 %192 to i64, !dbg !1541
  %194 = call i32 @shake256(ptr noundef %186, i64 noundef %188, ptr noundef %189, i64 noundef %193), !dbg !1544
  %195 = getelementptr inbounds [71 x i8], ptr %14, i64 0, i64 0, !dbg !1545
  %196 = getelementptr inbounds [142 x i8], ptr %15, i64 0, i64 0, !dbg !1546
  %197 = load i32, ptr %30, align 4, !dbg !1547
  call void @decode(ptr noundef %195, ptr noundef %196, i32 noundef %197), !dbg !1548
    #dbg_declare(ptr %46, !1549, !DIExpression(), !1551)
  store i32 0, ptr %46, align 4, !dbg !1551
  br label %198, !dbg !1552

198:                                              ; preds = %302, %147
  %199 = load i32, ptr %46, align 4, !dbg !1553
  %200 = icmp sle i32 %199, 255, !dbg !1555
  br i1 %200, label %201, label %305, !dbg !1556

201:                                              ; preds = %198
  %202 = load i32, ptr %46, align 4, !dbg !1557
  %203 = trunc i32 %202 to i8, !dbg !1559
  %204 = load ptr, ptr %28, align 8, !dbg !1560
  store i8 %203, ptr %204, align 1, !dbg !1561
  %205 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0, !dbg !1562
  %206 = load i32, ptr %33, align 4, !dbg !1563
  %207 = load i32, ptr %36, align 4, !dbg !1564
  %208 = mul nsw i32 %206, %207, !dbg !1565
  %209 = load i32, ptr %37, align 4, !dbg !1566
  %210 = add nsw i32 %208, %209, !dbg !1567
  %211 = sext i32 %210 to i64, !dbg !1563
  %212 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1568
  %213 = load i32, ptr %40, align 4, !dbg !1569
  %214 = load i32, ptr %42, align 4, !dbg !1570
  %215 = add nsw i32 %213, %214, !dbg !1571
  %216 = load i32, ptr %41, align 4, !dbg !1572
  %217 = add nsw i32 %215, %216, !dbg !1573
  %218 = add nsw i32 %217, 1, !dbg !1574
  %219 = sext i32 %218 to i64, !dbg !1569
  %220 = call i32 @shake256(ptr noundef %205, i64 noundef %211, ptr noundef %212, i64 noundef %219), !dbg !1575
    #dbg_declare(ptr %47, !1576, !DIExpression(), !1578)
  store i32 0, ptr %47, align 4, !dbg !1578
  br label %221, !dbg !1579

221:                                              ; preds = %240, %201
  %222 = load i32, ptr %47, align 4, !dbg !1580
  %223 = load i32, ptr %33, align 4, !dbg !1582
  %224 = sub nsw i32 %223, 1, !dbg !1583
  %225 = icmp sle i32 %222, %224, !dbg !1584
  br i1 %225, label %226, label %243, !dbg !1585

226:                                              ; preds = %221
  %227 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0, !dbg !1586
  %228 = load i32, ptr %47, align 4, !dbg !1588
  %229 = load i32, ptr %36, align 4, !dbg !1589
  %230 = mul nsw i32 %228, %229, !dbg !1590
  %231 = sext i32 %230 to i64, !dbg !1591
  %232 = getelementptr inbounds i8, ptr %227, i64 %231, !dbg !1591
  %233 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0, !dbg !1592
  %234 = load i32, ptr %47, align 4, !dbg !1593
  %235 = load i32, ptr %34, align 4, !dbg !1594
  %236 = mul nsw i32 %234, %235, !dbg !1595
  %237 = sext i32 %236 to i64, !dbg !1596
  %238 = getelementptr inbounds i8, ptr %233, i64 %237, !dbg !1596
  %239 = load i32, ptr %34, align 4, !dbg !1597
  call void @decode(ptr noundef %232, ptr noundef %238, i32 noundef %239), !dbg !1598
  br label %240, !dbg !1599

240:                                              ; preds = %226
  %241 = load i32, ptr %47, align 4, !dbg !1600
  %242 = add nsw i32 %241, 1, !dbg !1600
  store i32 %242, ptr %47, align 4, !dbg !1600
  br label %221, !dbg !1601, !llvm.loop !1602

243:                                              ; preds = %221
  %244 = load ptr, ptr %7, align 8, !dbg !1604
  %245 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0, !dbg !1605
  %246 = load ptr, ptr %44, align 8, !dbg !1606
  %247 = load ptr, ptr %43, align 8, !dbg !1607
  %248 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0, !dbg !1608
  %249 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0, !dbg !1609
  call void @compute_M_and_VPV(ptr noundef %244, ptr noundef %245, ptr noundef %246, ptr noundef %247, ptr noundef %248, ptr noundef %249), !dbg !1610
  %250 = load ptr, ptr %7, align 8, !dbg !1611
  %251 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0, !dbg !1612
  %252 = getelementptr inbounds [142 x i8], ptr %15, i64 0, i64 0, !dbg !1613
  %253 = getelementptr inbounds [142 x i8], ptr %16, i64 0, i64 0, !dbg !1614
  call void @compute_rhs(ptr noundef %250, ptr noundef %251, ptr noundef %252, ptr noundef %253), !dbg !1615
  %254 = load ptr, ptr %7, align 8, !dbg !1616
  %255 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0, !dbg !1617
  %256 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0, !dbg !1618
  call void @compute_A(ptr noundef %254, ptr noundef %255, ptr noundef %256), !dbg !1619
    #dbg_declare(ptr %48, !1620, !DIExpression(), !1622)
  store i32 0, ptr %48, align 4, !dbg !1622
  br label %257, !dbg !1623

257:                                              ; preds = %272, %243
  %258 = load i32, ptr %48, align 4, !dbg !1624
  %259 = load i32, ptr %30, align 4, !dbg !1626
  %260 = icmp slt i32 %258, %259, !dbg !1627
  br i1 %260, label %261, label %275, !dbg !1628

261:                                              ; preds = %257
  %262 = load i32, ptr %48, align 4, !dbg !1629
  %263 = add nsw i32 1, %262, !dbg !1631
  %264 = load i32, ptr %33, align 4, !dbg !1632
  %265 = load i32, ptr %32, align 4, !dbg !1633
  %266 = mul nsw i32 %264, %265, !dbg !1634
  %267 = add nsw i32 %266, 1, !dbg !1635
  %268 = mul nsw i32 %263, %267, !dbg !1636
  %269 = sub nsw i32 %268, 1, !dbg !1637
  %270 = sext i32 %269 to i64, !dbg !1638
  %271 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 %270, !dbg !1638
  store i8 0, ptr %271, align 1, !dbg !1639
  br label %272, !dbg !1640

272:                                              ; preds = %261
  %273 = load i32, ptr %48, align 4, !dbg !1641
  %274 = add nsw i32 %273, 1, !dbg !1641
  store i32 %274, ptr %48, align 4, !dbg !1641
  br label %257, !dbg !1642, !llvm.loop !1643

275:                                              ; preds = %257
  %276 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0, !dbg !1645
  %277 = load i32, ptr %33, align 4, !dbg !1646
  %278 = load i32, ptr %36, align 4, !dbg !1647
  %279 = mul nsw i32 %277, %278, !dbg !1648
  %280 = sext i32 %279 to i64, !dbg !1649
  %281 = getelementptr inbounds i8, ptr %276, i64 %280, !dbg !1649
  %282 = getelementptr inbounds [205 x i8], ptr %22, i64 0, i64 0, !dbg !1650
  %283 = load i32, ptr %33, align 4, !dbg !1651
  %284 = load i32, ptr %32, align 4, !dbg !1652
  %285 = mul nsw i32 %283, %284, !dbg !1653
  call void @decode(ptr noundef %281, ptr noundef %282, i32 noundef %285), !dbg !1654
  %286 = load ptr, ptr %7, align 8, !dbg !1655
  %287 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0, !dbg !1657
  %288 = getelementptr inbounds [142 x i8], ptr %16, i64 0, i64 0, !dbg !1658
  %289 = getelementptr inbounds [205 x i8], ptr %22, i64 0, i64 0, !dbg !1659
  %290 = getelementptr inbounds [1848 x i8], ptr %21, i64 0, i64 0, !dbg !1660
  %291 = load i32, ptr %33, align 4, !dbg !1661
  %292 = load i32, ptr %32, align 4, !dbg !1662
  %293 = load i32, ptr %30, align 4, !dbg !1663
  %294 = load i32, ptr %39, align 4, !dbg !1664
  %295 = call i32 @sample_solution(ptr noundef %286, ptr noundef %287, ptr noundef %288, ptr noundef %289, ptr noundef %290, i32 noundef %291, i32 noundef %292, i32 noundef %293, i32 noundef %294), !dbg !1665
  %296 = icmp ne i32 %295, 0, !dbg !1665
  br i1 %296, label %297, label %298, !dbg !1665

297:                                              ; preds = %275
  br label %305, !dbg !1666

298:                                              ; preds = %275
  %299 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0, !dbg !1668
  call void @llvm.memset.p0.i64(ptr align 16 %299, i8 0, i64 14688, i1 false), !dbg !1668
  %300 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0, !dbg !1670
  call void @llvm.memset.p0.i64(ptr align 16 %300, i8 0, i64 29520, i1 false), !dbg !1670
  br label %301

301:                                              ; preds = %298
  br label %302, !dbg !1671

302:                                              ; preds = %301
  %303 = load i32, ptr %46, align 4, !dbg !1672
  %304 = add nsw i32 %303, 1, !dbg !1672
  store i32 %304, ptr %46, align 4, !dbg !1672
  br label %198, !dbg !1673, !llvm.loop !1674

305:                                              ; preds = %297, %198
    #dbg_declare(ptr %49, !1676, !DIExpression(), !1678)
  store i32 0, ptr %49, align 4, !dbg !1678
  br label %306, !dbg !1679

306:                                              ; preds = %363, %305
  %307 = load i32, ptr %49, align 4, !dbg !1680
  %308 = load i32, ptr %33, align 4, !dbg !1682
  %309 = sub nsw i32 %308, 1, !dbg !1683
  %310 = icmp sle i32 %307, %309, !dbg !1684
  br i1 %310, label %311, label %366, !dbg !1685

311:                                              ; preds = %306
  %312 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0, !dbg !1686
  %313 = load i32, ptr %49, align 4, !dbg !1688
  %314 = load i32, ptr %31, align 4, !dbg !1689
  %315 = load i32, ptr %32, align 4, !dbg !1690
  %316 = sub nsw i32 %314, %315, !dbg !1691
  %317 = mul nsw i32 %313, %316, !dbg !1692
  %318 = sext i32 %317 to i64, !dbg !1693
  %319 = getelementptr inbounds i8, ptr %312, i64 %318, !dbg !1693
  store ptr %319, ptr %29, align 8, !dbg !1694
  %320 = getelementptr inbounds nuw %struct.sk_t, ptr %25, i32 0, i32 1, !dbg !1695
  %321 = getelementptr inbounds [2414 x i8], ptr %320, i64 0, i64 0, !dbg !1696
  %322 = getelementptr inbounds [1848 x i8], ptr %21, i64 0, i64 0, !dbg !1697
  %323 = load i32, ptr %49, align 4, !dbg !1698
  %324 = load i32, ptr %32, align 4, !dbg !1699
  %325 = mul nsw i32 %323, %324, !dbg !1700
  %326 = sext i32 %325 to i64, !dbg !1701
  %327 = getelementptr inbounds i8, ptr %322, i64 %326, !dbg !1701
  %328 = getelementptr inbounds [142 x i8], ptr %26, i64 0, i64 0, !dbg !1702
  %329 = load i32, ptr %32, align 4, !dbg !1703
  %330 = load i32, ptr %31, align 4, !dbg !1704
  %331 = load i32, ptr %32, align 4, !dbg !1705
  %332 = sub nsw i32 %330, %331, !dbg !1706
  call void @mat_mul(ptr noundef %321, ptr noundef %327, ptr noundef %328, i32 noundef %329, i32 noundef %332, i32 noundef 1), !dbg !1707
  %333 = load ptr, ptr %29, align 8, !dbg !1708
  %334 = getelementptr inbounds [142 x i8], ptr %26, i64 0, i64 0, !dbg !1709
  %335 = getelementptr inbounds [1848 x i8], ptr %23, i64 0, i64 0, !dbg !1710
  %336 = load i32, ptr %49, align 4, !dbg !1711
  %337 = load i32, ptr %31, align 4, !dbg !1712
  %338 = mul nsw i32 %336, %337, !dbg !1713
  %339 = sext i32 %338 to i64, !dbg !1714
  %340 = getelementptr inbounds i8, ptr %335, i64 %339, !dbg !1714
  %341 = load i32, ptr %31, align 4, !dbg !1715
  %342 = load i32, ptr %32, align 4, !dbg !1716
  %343 = sub nsw i32 %341, %342, !dbg !1717
  call void @mat_add(ptr noundef %333, ptr noundef %334, ptr noundef %340, i32 noundef %343, i32 noundef 1), !dbg !1718
  %344 = getelementptr inbounds [1848 x i8], ptr %23, i64 0, i64 0, !dbg !1719
  %345 = load i32, ptr %49, align 4, !dbg !1720
  %346 = load i32, ptr %31, align 4, !dbg !1721
  %347 = mul nsw i32 %345, %346, !dbg !1722
  %348 = sext i32 %347 to i64, !dbg !1719
  %349 = getelementptr inbounds i8, ptr %344, i64 %348, !dbg !1719
  %350 = load i32, ptr %31, align 4, !dbg !1723
  %351 = load i32, ptr %32, align 4, !dbg !1724
  %352 = sub nsw i32 %350, %351, !dbg !1725
  %353 = sext i32 %352 to i64, !dbg !1719
  %354 = getelementptr inbounds i8, ptr %349, i64 %353, !dbg !1719
  %355 = getelementptr inbounds [1848 x i8], ptr %21, i64 0, i64 0, !dbg !1719
  %356 = load i32, ptr %49, align 4, !dbg !1726
  %357 = load i32, ptr %32, align 4, !dbg !1727
  %358 = mul nsw i32 %356, %357, !dbg !1728
  %359 = sext i32 %358 to i64, !dbg !1719
  %360 = getelementptr inbounds i8, ptr %355, i64 %359, !dbg !1719
  %361 = load i32, ptr %32, align 4, !dbg !1729
  %362 = sext i32 %361 to i64, !dbg !1729
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %354, ptr align 1 %360, i64 %362, i1 false), !dbg !1719
  br label %363, !dbg !1730

363:                                              ; preds = %311
  %364 = load i32, ptr %49, align 4, !dbg !1731
  %365 = add nsw i32 %364, 1, !dbg !1731
  store i32 %365, ptr %49, align 4, !dbg !1731
  br label %306, !dbg !1732, !llvm.loop !1733

366:                                              ; preds = %306
  %367 = getelementptr inbounds [1848 x i8], ptr %23, i64 0, i64 0, !dbg !1735
  %368 = load ptr, ptr %8, align 8, !dbg !1736
  %369 = load i32, ptr %31, align 4, !dbg !1737
  %370 = load i32, ptr %33, align 4, !dbg !1738
  %371 = mul nsw i32 %369, %370, !dbg !1739
  call void @encode(ptr noundef %367, ptr noundef %368, i32 noundef %371), !dbg !1740
  %372 = load ptr, ptr %8, align 8, !dbg !1741
  %373 = load i32, ptr %38, align 4, !dbg !1742
  %374 = sext i32 %373 to i64, !dbg !1743
  %375 = getelementptr inbounds i8, ptr %372, i64 %374, !dbg !1743
  %376 = load i32, ptr %42, align 4, !dbg !1744
  %377 = sext i32 %376 to i64, !dbg !1743
  %378 = sub i64 0, %377, !dbg !1743
  %379 = getelementptr inbounds i8, ptr %375, i64 %378, !dbg !1743
  %380 = getelementptr inbounds [40 x i8], ptr %17, i64 0, i64 0, !dbg !1743
  %381 = load i32, ptr %42, align 4, !dbg !1745
  %382 = sext i32 %381 to i64, !dbg !1745
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %379, ptr align 16 %380, i64 %382, i1 false), !dbg !1743
  %383 = load i32, ptr %38, align 4, !dbg !1746
  %384 = sext i32 %383 to i64, !dbg !1746
  %385 = load ptr, ptr %9, align 8, !dbg !1747
  store i64 %384, ptr %385, align 8, !dbg !1748
  br label %386, !dbg !1749

386:                                              ; preds = %366, %146, %103
    #dbg_label(!1750, !1751)
  %387 = getelementptr inbounds [924 x i8], ptr %18, i64 0, i64 0, !dbg !1752
  call void @mayo_secure_clear(ptr noundef %387, i64 noundef 924), !dbg !1753
  %388 = getelementptr inbounds [1704 x i8], ptr %19, i64 0, i64 0, !dbg !1754
  call void @mayo_secure_clear(ptr noundef %388, i64 noundef 1704), !dbg !1755
  %389 = getelementptr inbounds [29520 x i8], ptr %20, i64 0, i64 0, !dbg !1756
  call void @mayo_secure_clear(ptr noundef %389, i64 noundef 29520), !dbg !1757
  %390 = getelementptr inbounds [205 x i8], ptr %22, i64 0, i64 0, !dbg !1758
  call void @mayo_secure_clear(ptr noundef %390, i64 noundef 205), !dbg !1759
  %391 = getelementptr inbounds nuw %struct.sk_t, ptr %25, i32 0, i32 1, !dbg !1760
  %392 = getelementptr inbounds [2414 x i8], ptr %391, i64 0, i64 0, !dbg !1761
  call void @mayo_secure_clear(ptr noundef %392, i64 noundef 2414), !dbg !1762
  call void @mayo_secure_clear(ptr noundef %25, i64 noundef 907240), !dbg !1763
  %393 = getelementptr inbounds [142 x i8], ptr %26, i64 0, i64 0, !dbg !1764
  call void @mayo_secure_clear(ptr noundef %393, i64 noundef 142), !dbg !1765
  %394 = getelementptr inbounds [145 x i8], ptr %27, i64 0, i64 0, !dbg !1766
  call void @mayo_secure_clear(ptr noundef %394, i64 noundef 145), !dbg !1767
  %395 = getelementptr inbounds [1836 x i64], ptr %45, i64 0, i64 0, !dbg !1768
  call void @mayo_secure_clear(ptr noundef %395, i64 noundef 14688), !dbg !1769
  %396 = load i32, ptr %13, align 4, !dbg !1770
  ret i32 %396, !dbg !1771
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_M_and_VPV(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 !dbg !1772 {
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
    #dbg_declare(ptr %7, !1775, !DIExpression(), !1776)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !1777, !DIExpression(), !1778)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !1779, !DIExpression(), !1780)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !1781, !DIExpression(), !1782)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !1783, !DIExpression(), !1784)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !1785, !DIExpression(), !1786)
    #dbg_declare(ptr %13, !1787, !DIExpression(), !1788)
  %17 = load ptr, ptr %7, align 8, !dbg !1789
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 3, !dbg !1790
  %19 = load i32, ptr %18, align 4, !dbg !1790
  store i32 %19, ptr %13, align 4, !dbg !1788
    #dbg_declare(ptr %14, !1791, !DIExpression(), !1792)
  %20 = load ptr, ptr %7, align 8, !dbg !1793
  %21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 1, !dbg !1794
  %22 = load i32, ptr %21, align 4, !dbg !1794
  %23 = load ptr, ptr %7, align 8, !dbg !1793
  %24 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %23, i32 0, i32 2, !dbg !1794
  %25 = load i32, ptr %24, align 8, !dbg !1794
  %26 = sub nsw i32 %22, %25, !dbg !1794
  store i32 %26, ptr %14, align 4, !dbg !1792
    #dbg_declare(ptr %15, !1795, !DIExpression(), !1796)
  %27 = load ptr, ptr %7, align 8, !dbg !1797
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2, !dbg !1798
  %29 = load i32, ptr %28, align 8, !dbg !1798
  store i32 %29, ptr %15, align 4, !dbg !1796
  %30 = load ptr, ptr %7, align 8, !dbg !1799
  %31 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %30, i32 0, i32 21, !dbg !1800
  %32 = load i32, ptr %31, align 4, !dbg !1800
  %33 = load ptr, ptr %8, align 8, !dbg !1801
  %34 = load ptr, ptr %9, align 8, !dbg !1802
  %35 = load ptr, ptr %11, align 8, !dbg !1803
  %36 = load i32, ptr %13, align 4, !dbg !1804
  %37 = load i32, ptr %14, align 4, !dbg !1805
  %38 = load i32, ptr %15, align 4, !dbg !1806
  call void @mul_add_mat_x_m_mat(i32 noundef %32, ptr noundef %33, ptr noundef %34, ptr noundef %35, i32 noundef %36, i32 noundef %37, i32 noundef %38), !dbg !1807
    #dbg_declare(ptr %16, !1808, !DIExpression(), !1812)
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 122688, i1 false), !dbg !1812
  %39 = load ptr, ptr %7, align 8, !dbg !1813
  %40 = load ptr, ptr %10, align 8, !dbg !1814
  %41 = load ptr, ptr %8, align 8, !dbg !1815
  %42 = getelementptr inbounds [15336 x i64], ptr %16, i64 0, i64 0, !dbg !1816
  call void @P1_times_Vt(ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %42), !dbg !1817
  %43 = load ptr, ptr %7, align 8, !dbg !1818
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 21, !dbg !1819
  %45 = load i32, ptr %44, align 4, !dbg !1819
  %46 = load ptr, ptr %8, align 8, !dbg !1820
  %47 = getelementptr inbounds [15336 x i64], ptr %16, i64 0, i64 0, !dbg !1821
  %48 = load ptr, ptr %12, align 8, !dbg !1822
  %49 = load i32, ptr %13, align 4, !dbg !1823
  %50 = load i32, ptr %14, align 4, !dbg !1824
  %51 = load i32, ptr %13, align 4, !dbg !1825
  call void @mul_add_mat_x_m_mat(i32 noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef %48, i32 noundef %49, i32 noundef %50, i32 noundef %51), !dbg !1826
  ret void, !dbg !1827
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_rhs(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !1828 {
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
    #dbg_declare(ptr %5, !1831, !DIExpression(), !1832)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !1833, !DIExpression(), !1834)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !1835, !DIExpression(), !1836)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !1837, !DIExpression(), !1838)
    #dbg_declare(ptr %9, !1839, !DIExpression(), !1841)
  %22 = load ptr, ptr %5, align 8, !dbg !1842
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 0, !dbg !1843
  %24 = load i32, ptr %23, align 8, !dbg !1843
  %25 = sub nsw i32 %24, 1, !dbg !1844
  %26 = srem i32 %25, 16, !dbg !1845
  %27 = mul nsw i32 %26, 4, !dbg !1846
  %28 = sext i32 %27 to i64, !dbg !1847
  store i64 %28, ptr %9, align 8, !dbg !1841
    #dbg_declare(ptr %10, !1848, !DIExpression(), !1849)
  %29 = load ptr, ptr %5, align 8, !dbg !1850
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 21, !dbg !1851
  %31 = load i32, ptr %30, align 4, !dbg !1851
  %32 = sext i32 %31 to i64, !dbg !1851
  store i64 %32, ptr %10, align 8, !dbg !1849
  %33 = load ptr, ptr %5, align 8, !dbg !1852
  %34 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %33, i32 0, i32 0, !dbg !1854
  %35 = load i32, ptr %34, align 8, !dbg !1854
  %36 = srem i32 %35, 16, !dbg !1855
  %37 = icmp ne i32 %36, 0, !dbg !1856
  br i1 %37, label %38, label %76, !dbg !1856

38:                                               ; preds = %4
    #dbg_declare(ptr %11, !1857, !DIExpression(), !1859)
  store i64 1, ptr %11, align 8, !dbg !1859
  %39 = load ptr, ptr %5, align 8, !dbg !1860
  %40 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %39, i32 0, i32 0, !dbg !1861
  %41 = load i32, ptr %40, align 8, !dbg !1861
  %42 = srem i32 %41, 16, !dbg !1862
  %43 = mul nsw i32 %42, 4, !dbg !1863
  %44 = load i64, ptr %11, align 8, !dbg !1864
  %45 = zext i32 %43 to i64, !dbg !1864
  %46 = shl i64 %44, %45, !dbg !1864
  store i64 %46, ptr %11, align 8, !dbg !1864
  %47 = load i64, ptr %11, align 8, !dbg !1865
  %48 = sub i64 %47, 1, !dbg !1865
  store i64 %48, ptr %11, align 8, !dbg !1865
    #dbg_declare(ptr %12, !1866, !DIExpression(), !1868)
  store i32 0, ptr %12, align 4, !dbg !1868
  br label %49, !dbg !1869

49:                                               ; preds = %72, %38
  %50 = load i32, ptr %12, align 4, !dbg !1870
  %51 = load ptr, ptr %5, align 8, !dbg !1872
  %52 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %51, i32 0, i32 3, !dbg !1873
  %53 = load i32, ptr %52, align 4, !dbg !1873
  %54 = load ptr, ptr %5, align 8, !dbg !1874
  %55 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %54, i32 0, i32 3, !dbg !1875
  %56 = load i32, ptr %55, align 4, !dbg !1875
  %57 = mul nsw i32 %53, %56, !dbg !1876
  %58 = icmp slt i32 %50, %57, !dbg !1877
  br i1 %58, label %59, label %75, !dbg !1878

59:                                               ; preds = %49
  %60 = load i64, ptr %11, align 8, !dbg !1879
  %61 = load ptr, ptr %6, align 8, !dbg !1881
  %62 = load i32, ptr %12, align 4, !dbg !1882
  %63 = sext i32 %62 to i64, !dbg !1882
  %64 = load i64, ptr %10, align 8, !dbg !1883
  %65 = mul i64 %63, %64, !dbg !1884
  %66 = load i64, ptr %10, align 8, !dbg !1885
  %67 = add i64 %65, %66, !dbg !1886
  %68 = sub i64 %67, 1, !dbg !1887
  %69 = getelementptr inbounds nuw i64, ptr %61, i64 %68, !dbg !1881
  %70 = load i64, ptr %69, align 8, !dbg !1888
  %71 = and i64 %70, %60, !dbg !1888
  store i64 %71, ptr %69, align 8, !dbg !1888
  br label %72, !dbg !1889

72:                                               ; preds = %59
  %73 = load i32, ptr %12, align 4, !dbg !1890
  %74 = add nsw i32 %73, 1, !dbg !1890
  store i32 %74, ptr %12, align 4, !dbg !1890
  br label %49, !dbg !1891, !llvm.loop !1892

75:                                               ; preds = %49
  br label %76, !dbg !1894

76:                                               ; preds = %75, %4
    #dbg_declare(ptr %13, !1895, !DIExpression(), !1896)
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 72, i1 false), !dbg !1896
    #dbg_declare(ptr %14, !1897, !DIExpression(), !1898)
  %77 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 0, !dbg !1899
  store ptr %77, ptr %14, align 8, !dbg !1898
    #dbg_declare(ptr %15, !1900, !DIExpression(), !1902)
  %78 = load ptr, ptr %5, align 8, !dbg !1903
  %79 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %78, i32 0, i32 3, !dbg !1904
  %80 = load i32, ptr %79, align 4, !dbg !1904
  %81 = sub nsw i32 %80, 1, !dbg !1905
  store i32 %81, ptr %15, align 4, !dbg !1902
  br label %82, !dbg !1906

82:                                               ; preds = %241, %76
  %83 = load i32, ptr %15, align 4, !dbg !1907
  %84 = icmp sge i32 %83, 0, !dbg !1909
  br i1 %84, label %85, label %244, !dbg !1910

85:                                               ; preds = %82
    #dbg_declare(ptr %16, !1911, !DIExpression(), !1914)
  %86 = load i32, ptr %15, align 4, !dbg !1915
  store i32 %86, ptr %16, align 4, !dbg !1914
  br label %87, !dbg !1916

87:                                               ; preds = %237, %85
  %88 = load i32, ptr %16, align 4, !dbg !1917
  %89 = load ptr, ptr %5, align 8, !dbg !1919
  %90 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %89, i32 0, i32 3, !dbg !1920
  %91 = load i32, ptr %90, align 4, !dbg !1920
  %92 = icmp slt i32 %88, %91, !dbg !1921
  br i1 %92, label %93, label %240, !dbg !1922

93:                                               ; preds = %87
    #dbg_declare(ptr %17, !1923, !DIExpression(), !1925)
  %94 = load i64, ptr %10, align 8, !dbg !1926
  %95 = sub i64 %94, 1, !dbg !1927
  %96 = getelementptr inbounds nuw [9 x i64], ptr %13, i64 0, i64 %95, !dbg !1928
  %97 = load i64, ptr %96, align 8, !dbg !1928
  %98 = load i64, ptr %9, align 8, !dbg !1929
  %99 = lshr i64 %97, %98, !dbg !1930
  %100 = urem i64 %99, 16, !dbg !1931
  %101 = trunc i64 %100 to i8, !dbg !1932
  store i8 %101, ptr %17, align 1, !dbg !1925
  %102 = load i64, ptr %10, align 8, !dbg !1933
  %103 = sub i64 %102, 1, !dbg !1934
  %104 = getelementptr inbounds nuw [9 x i64], ptr %13, i64 0, i64 %103, !dbg !1935
  %105 = load i64, ptr %104, align 8, !dbg !1936
  %106 = shl i64 %105, 4, !dbg !1936
  store i64 %106, ptr %104, align 8, !dbg !1936
    #dbg_declare(ptr %18, !1937, !DIExpression(), !1939)
  %107 = load i64, ptr %10, align 8, !dbg !1940
  %108 = sub i64 %107, 2, !dbg !1941
  %109 = trunc i64 %108 to i32, !dbg !1940
  store i32 %109, ptr %18, align 4, !dbg !1939
  br label %110, !dbg !1942

110:                                              ; preds = %130, %93
  %111 = load i32, ptr %18, align 4, !dbg !1943
  %112 = icmp sge i32 %111, 0, !dbg !1945
  br i1 %112, label %113, label %133, !dbg !1946

113:                                              ; preds = %110
  %114 = load i32, ptr %18, align 4, !dbg !1947
  %115 = sext i32 %114 to i64, !dbg !1949
  %116 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 %115, !dbg !1949
  %117 = load i64, ptr %116, align 8, !dbg !1949
  %118 = lshr i64 %117, 60, !dbg !1950
  %119 = load i32, ptr %18, align 4, !dbg !1951
  %120 = add nsw i32 %119, 1, !dbg !1952
  %121 = sext i32 %120 to i64, !dbg !1953
  %122 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 %121, !dbg !1953
  %123 = load i64, ptr %122, align 8, !dbg !1954
  %124 = xor i64 %123, %118, !dbg !1954
  store i64 %124, ptr %122, align 8, !dbg !1954
  %125 = load i32, ptr %18, align 4, !dbg !1955
  %126 = sext i32 %125 to i64, !dbg !1956
  %127 = getelementptr inbounds [9 x i64], ptr %13, i64 0, i64 %126, !dbg !1956
  %128 = load i64, ptr %127, align 8, !dbg !1957
  %129 = shl i64 %128, 4, !dbg !1957
  store i64 %129, ptr %127, align 8, !dbg !1957
  br label %130, !dbg !1958

130:                                              ; preds = %113
  %131 = load i32, ptr %18, align 4, !dbg !1959
  %132 = add nsw i32 %131, -1, !dbg !1959
  store i32 %132, ptr %18, align 4, !dbg !1959
  br label %110, !dbg !1960, !llvm.loop !1961

133:                                              ; preds = %110
    #dbg_declare(ptr %19, !1963, !DIExpression(), !1965)
  store i32 0, ptr %19, align 4, !dbg !1965
  br label %134, !dbg !1966

134:                                              ; preds = %183, %133
  %135 = load i32, ptr %19, align 4, !dbg !1967
  %136 = icmp slt i32 %135, 4, !dbg !1969
  br i1 %136, label %137, label %186, !dbg !1970

137:                                              ; preds = %134
  %138 = load i32, ptr %19, align 4, !dbg !1971
  %139 = srem i32 %138, 2, !dbg !1974
  %140 = icmp eq i32 %139, 0, !dbg !1975
  br i1 %140, label %141, label %161, !dbg !1975

141:                                              ; preds = %137
  %142 = load i8, ptr %17, align 1, !dbg !1976
  %143 = load ptr, ptr %5, align 8, !dbg !1978
  %144 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %143, i32 0, i32 5, !dbg !1979
  %145 = load ptr, ptr %144, align 8, !dbg !1979
  %146 = load i32, ptr %19, align 4, !dbg !1980
  %147 = sext i32 %146 to i64, !dbg !1979
  %148 = getelementptr inbounds i8, ptr %145, i64 %147, !dbg !1979
  %149 = load i8, ptr %148, align 1, !dbg !1979
  %150 = call zeroext i8 @mul_f(i8 noundef zeroext %142, i8 noundef zeroext %149), !dbg !1981
  %151 = zext i8 %150 to i32, !dbg !1981
  %152 = load ptr, ptr %14, align 8, !dbg !1982
  %153 = load i32, ptr %19, align 4, !dbg !1983
  %154 = sdiv i32 %153, 2, !dbg !1984
  %155 = sext i32 %154 to i64, !dbg !1982
  %156 = getelementptr inbounds i8, ptr %152, i64 %155, !dbg !1982
  %157 = load i8, ptr %156, align 1, !dbg !1985
  %158 = zext i8 %157 to i32, !dbg !1985
  %159 = xor i32 %158, %151, !dbg !1985
  %160 = trunc i32 %159 to i8, !dbg !1985
  store i8 %160, ptr %156, align 1, !dbg !1985
  br label %182, !dbg !1986

161:                                              ; preds = %137
  %162 = load i8, ptr %17, align 1, !dbg !1987
  %163 = load ptr, ptr %5, align 8, !dbg !1989
  %164 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %163, i32 0, i32 5, !dbg !1990
  %165 = load ptr, ptr %164, align 8, !dbg !1990
  %166 = load i32, ptr %19, align 4, !dbg !1991
  %167 = sext i32 %166 to i64, !dbg !1990
  %168 = getelementptr inbounds i8, ptr %165, i64 %167, !dbg !1990
  %169 = load i8, ptr %168, align 1, !dbg !1990
  %170 = call zeroext i8 @mul_f(i8 noundef zeroext %162, i8 noundef zeroext %169), !dbg !1992
  %171 = zext i8 %170 to i32, !dbg !1992
  %172 = shl i32 %171, 4, !dbg !1993
  %173 = load ptr, ptr %14, align 8, !dbg !1994
  %174 = load i32, ptr %19, align 4, !dbg !1995
  %175 = sdiv i32 %174, 2, !dbg !1996
  %176 = sext i32 %175 to i64, !dbg !1994
  %177 = getelementptr inbounds i8, ptr %173, i64 %176, !dbg !1994
  %178 = load i8, ptr %177, align 1, !dbg !1997
  %179 = zext i8 %178 to i32, !dbg !1997
  %180 = xor i32 %179, %172, !dbg !1997
  %181 = trunc i32 %180 to i8, !dbg !1997
  store i8 %181, ptr %177, align 1, !dbg !1997
  br label %182

182:                                              ; preds = %161, %141
  br label %183, !dbg !1998

183:                                              ; preds = %182
  %184 = load i32, ptr %19, align 4, !dbg !1999
  %185 = add nsw i32 %184, 1, !dbg !1999
  store i32 %185, ptr %19, align 4, !dbg !1999
  br label %134, !dbg !2000, !llvm.loop !2001

186:                                              ; preds = %134
    #dbg_declare(ptr %20, !2003, !DIExpression(), !2005)
  store i64 0, ptr %20, align 8, !dbg !2005
  br label %187, !dbg !2006

187:                                              ; preds = %233, %186
  %188 = load i64, ptr %20, align 8, !dbg !2007
  %189 = load i64, ptr %10, align 8, !dbg !2009
  %190 = icmp ult i64 %188, %189, !dbg !2010
  br i1 %190, label %191, label %236, !dbg !2011

191:                                              ; preds = %187
  %192 = load ptr, ptr %6, align 8, !dbg !2012
  %193 = load i32, ptr %15, align 4, !dbg !2014
  %194 = load ptr, ptr %5, align 8, !dbg !2015
  %195 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %194, i32 0, i32 3, !dbg !2016
  %196 = load i32, ptr %195, align 4, !dbg !2016
  %197 = mul nsw i32 %193, %196, !dbg !2017
  %198 = load i32, ptr %16, align 4, !dbg !2018
  %199 = add nsw i32 %197, %198, !dbg !2019
  %200 = sext i32 %199 to i64, !dbg !2020
  %201 = load i64, ptr %10, align 8, !dbg !2021
  %202 = mul i64 %200, %201, !dbg !2022
  %203 = load i64, ptr %20, align 8, !dbg !2023
  %204 = add i64 %202, %203, !dbg !2024
  %205 = getelementptr inbounds nuw i64, ptr %192, i64 %204, !dbg !2012
  %206 = load i64, ptr %205, align 8, !dbg !2012
  %207 = load i32, ptr %15, align 4, !dbg !2025
  %208 = load i32, ptr %16, align 4, !dbg !2026
  %209 = icmp ne i32 %207, %208, !dbg !2027
  %210 = zext i1 %209 to i32, !dbg !2027
  %211 = sext i32 %210 to i64, !dbg !2028
  %212 = load ptr, ptr %6, align 8, !dbg !2029
  %213 = load i32, ptr %16, align 4, !dbg !2030
  %214 = load ptr, ptr %5, align 8, !dbg !2031
  %215 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %214, i32 0, i32 3, !dbg !2032
  %216 = load i32, ptr %215, align 4, !dbg !2032
  %217 = mul nsw i32 %213, %216, !dbg !2033
  %218 = load i32, ptr %15, align 4, !dbg !2034
  %219 = add nsw i32 %217, %218, !dbg !2035
  %220 = sext i32 %219 to i64, !dbg !2036
  %221 = load i64, ptr %10, align 8, !dbg !2037
  %222 = mul i64 %220, %221, !dbg !2038
  %223 = load i64, ptr %20, align 8, !dbg !2039
  %224 = add i64 %222, %223, !dbg !2040
  %225 = getelementptr inbounds nuw i64, ptr %212, i64 %224, !dbg !2029
  %226 = load i64, ptr %225, align 8, !dbg !2029
  %227 = mul i64 %211, %226, !dbg !2041
  %228 = xor i64 %206, %227, !dbg !2042
  %229 = load i64, ptr %20, align 8, !dbg !2043
  %230 = getelementptr inbounds nuw [9 x i64], ptr %13, i64 0, i64 %229, !dbg !2044
  %231 = load i64, ptr %230, align 8, !dbg !2045
  %232 = xor i64 %231, %228, !dbg !2045
  store i64 %232, ptr %230, align 8, !dbg !2045
  br label %233, !dbg !2046

233:                                              ; preds = %191
  %234 = load i64, ptr %20, align 8, !dbg !2047
  %235 = add i64 %234, 1, !dbg !2047
  store i64 %235, ptr %20, align 8, !dbg !2047
  br label %187, !dbg !2048, !llvm.loop !2049

236:                                              ; preds = %187
  br label %237, !dbg !2051

237:                                              ; preds = %236
  %238 = load i32, ptr %16, align 4, !dbg !2052
  %239 = add nsw i32 %238, 1, !dbg !2052
  store i32 %239, ptr %16, align 4, !dbg !2052
  br label %87, !dbg !2053, !llvm.loop !2054

240:                                              ; preds = %87
  br label %241, !dbg !2056

241:                                              ; preds = %240
  %242 = load i32, ptr %15, align 4, !dbg !2057
  %243 = add nsw i32 %242, -1, !dbg !2057
  store i32 %243, ptr %15, align 4, !dbg !2057
  br label %82, !dbg !2058, !llvm.loop !2059

244:                                              ; preds = %82
    #dbg_declare(ptr %21, !2061, !DIExpression(), !2063)
  store i32 0, ptr %21, align 4, !dbg !2063
  br label %245, !dbg !2064

245:                                              ; preds = %294, %244
  %246 = load i32, ptr %21, align 4, !dbg !2065
  %247 = load ptr, ptr %5, align 8, !dbg !2067
  %248 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %247, i32 0, i32 0, !dbg !2068
  %249 = load i32, ptr %248, align 8, !dbg !2068
  %250 = icmp slt i32 %246, %249, !dbg !2069
  br i1 %250, label %251, label %297, !dbg !2070

251:                                              ; preds = %245
  %252 = load ptr, ptr %7, align 8, !dbg !2071
  %253 = load i32, ptr %21, align 4, !dbg !2073
  %254 = sext i32 %253 to i64, !dbg !2071
  %255 = getelementptr inbounds i8, ptr %252, i64 %254, !dbg !2071
  %256 = load i8, ptr %255, align 1, !dbg !2071
  %257 = zext i8 %256 to i32, !dbg !2071
  %258 = load ptr, ptr %14, align 8, !dbg !2074
  %259 = load i32, ptr %21, align 4, !dbg !2075
  %260 = sdiv i32 %259, 2, !dbg !2076
  %261 = sext i32 %260 to i64, !dbg !2074
  %262 = getelementptr inbounds i8, ptr %258, i64 %261, !dbg !2074
  %263 = load i8, ptr %262, align 1, !dbg !2074
  %264 = zext i8 %263 to i32, !dbg !2074
  %265 = and i32 %264, 15, !dbg !2077
  %266 = xor i32 %257, %265, !dbg !2078
  %267 = trunc i32 %266 to i8, !dbg !2071
  %268 = load ptr, ptr %8, align 8, !dbg !2079
  %269 = load i32, ptr %21, align 4, !dbg !2080
  %270 = sext i32 %269 to i64, !dbg !2079
  %271 = getelementptr inbounds i8, ptr %268, i64 %270, !dbg !2079
  store i8 %267, ptr %271, align 1, !dbg !2081
  %272 = load ptr, ptr %7, align 8, !dbg !2082
  %273 = load i32, ptr %21, align 4, !dbg !2083
  %274 = add nsw i32 %273, 1, !dbg !2084
  %275 = sext i32 %274 to i64, !dbg !2082
  %276 = getelementptr inbounds i8, ptr %272, i64 %275, !dbg !2082
  %277 = load i8, ptr %276, align 1, !dbg !2082
  %278 = zext i8 %277 to i32, !dbg !2082
  %279 = load ptr, ptr %14, align 8, !dbg !2085
  %280 = load i32, ptr %21, align 4, !dbg !2086
  %281 = sdiv i32 %280, 2, !dbg !2087
  %282 = sext i32 %281 to i64, !dbg !2085
  %283 = getelementptr inbounds i8, ptr %279, i64 %282, !dbg !2085
  %284 = load i8, ptr %283, align 1, !dbg !2085
  %285 = zext i8 %284 to i32, !dbg !2085
  %286 = ashr i32 %285, 4, !dbg !2088
  %287 = xor i32 %278, %286, !dbg !2089
  %288 = trunc i32 %287 to i8, !dbg !2082
  %289 = load ptr, ptr %8, align 8, !dbg !2090
  %290 = load i32, ptr %21, align 4, !dbg !2091
  %291 = add nsw i32 %290, 1, !dbg !2092
  %292 = sext i32 %291 to i64, !dbg !2090
  %293 = getelementptr inbounds i8, ptr %289, i64 %292, !dbg !2090
  store i8 %288, ptr %293, align 1, !dbg !2093
  br label %294, !dbg !2094

294:                                              ; preds = %251
  %295 = load i32, ptr %21, align 4, !dbg !2095
  %296 = add nsw i32 %295, 2, !dbg !2095
  store i32 %296, ptr %21, align 4, !dbg !2095
  br label %245, !dbg !2096, !llvm.loop !2097

297:                                              ; preds = %245
  ret void, !dbg !2099
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @compute_A(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2100 {
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
    #dbg_declare(ptr %4, !2103, !DIExpression(), !2104)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2105, !DIExpression(), !2106)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !2107, !DIExpression(), !2108)
    #dbg_declare(ptr %7, !2109, !DIExpression(), !2110)
  store i32 0, ptr %7, align 4, !dbg !2110
    #dbg_declare(ptr %8, !2111, !DIExpression(), !2112)
  store i32 0, ptr %8, align 4, !dbg !2112
    #dbg_declare(ptr %9, !2113, !DIExpression(), !2114)
  %37 = load ptr, ptr %4, align 8, !dbg !2115
  %38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 21, !dbg !2116
  %39 = load i32, ptr %38, align 4, !dbg !2116
  store i32 %39, ptr %9, align 4, !dbg !2114
    #dbg_declare(ptr %10, !2117, !DIExpression(), !2121)
  call void @llvm.memset.p0.i64(ptr align 16 %10, i8 0, i64 29952, i1 false), !dbg !2121
    #dbg_declare(ptr %11, !2122, !DIExpression(), !2123)
  %40 = load ptr, ptr %4, align 8, !dbg !2124
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 2, !dbg !2125
  %42 = load i32, ptr %41, align 8, !dbg !2125
  %43 = load ptr, ptr %4, align 8, !dbg !2126
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 3, !dbg !2127
  %45 = load i32, ptr %44, align 4, !dbg !2127
  %46 = mul nsw i32 %42, %45, !dbg !2128
  %47 = add nsw i32 %46, 15, !dbg !2129
  %48 = sdiv i32 %47, 16, !dbg !2130
  %49 = mul nsw i32 %48, 16, !dbg !2131
  %50 = sext i32 %49 to i64, !dbg !2132
  store i64 %50, ptr %11, align 8, !dbg !2123
    #dbg_declare(ptr %12, !2133, !DIExpression(), !2134)
    #dbg_declare(ptr %13, !2135, !DIExpression(), !2136)
  %51 = load ptr, ptr %4, align 8, !dbg !2137
  %52 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %51, i32 0, i32 0, !dbg !2139
  %53 = load i32, ptr %52, align 8, !dbg !2139
  %54 = srem i32 %53, 16, !dbg !2140
  %55 = icmp ne i32 %54, 0, !dbg !2141
  br i1 %55, label %56, label %94, !dbg !2141

56:                                               ; preds = %3
    #dbg_declare(ptr %14, !2142, !DIExpression(), !2144)
  store i64 1, ptr %14, align 8, !dbg !2144
  %57 = load ptr, ptr %4, align 8, !dbg !2145
  %58 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %57, i32 0, i32 0, !dbg !2146
  %59 = load i32, ptr %58, align 8, !dbg !2146
  %60 = srem i32 %59, 16, !dbg !2147
  %61 = mul nsw i32 %60, 4, !dbg !2148
  %62 = load i64, ptr %14, align 8, !dbg !2149
  %63 = zext i32 %61 to i64, !dbg !2149
  %64 = shl i64 %62, %63, !dbg !2149
  store i64 %64, ptr %14, align 8, !dbg !2149
  %65 = load i64, ptr %14, align 8, !dbg !2150
  %66 = sub i64 %65, 1, !dbg !2150
  store i64 %66, ptr %14, align 8, !dbg !2150
    #dbg_declare(ptr %15, !2151, !DIExpression(), !2153)
  store i32 0, ptr %15, align 4, !dbg !2153
  br label %67, !dbg !2154

67:                                               ; preds = %90, %56
  %68 = load i32, ptr %15, align 4, !dbg !2155
  %69 = load ptr, ptr %4, align 8, !dbg !2157
  %70 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %69, i32 0, i32 2, !dbg !2158
  %71 = load i32, ptr %70, align 8, !dbg !2158
  %72 = load ptr, ptr %4, align 8, !dbg !2159
  %73 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %72, i32 0, i32 3, !dbg !2160
  %74 = load i32, ptr %73, align 4, !dbg !2160
  %75 = mul nsw i32 %71, %74, !dbg !2161
  %76 = icmp slt i32 %68, %75, !dbg !2162
  br i1 %76, label %77, label %93, !dbg !2163

77:                                               ; preds = %67
  %78 = load i64, ptr %14, align 8, !dbg !2164
  %79 = load ptr, ptr %5, align 8, !dbg !2166
  %80 = load i32, ptr %15, align 4, !dbg !2167
  %81 = load i32, ptr %9, align 4, !dbg !2168
  %82 = mul nsw i32 %80, %81, !dbg !2169
  %83 = load i32, ptr %9, align 4, !dbg !2170
  %84 = add nsw i32 %82, %83, !dbg !2171
  %85 = sub nsw i32 %84, 1, !dbg !2172
  %86 = sext i32 %85 to i64, !dbg !2166
  %87 = getelementptr inbounds i64, ptr %79, i64 %86, !dbg !2166
  %88 = load i64, ptr %87, align 8, !dbg !2173
  %89 = and i64 %88, %78, !dbg !2173
  store i64 %89, ptr %87, align 8, !dbg !2173
  br label %90, !dbg !2174

90:                                               ; preds = %77
  %91 = load i32, ptr %15, align 4, !dbg !2175
  %92 = add nsw i32 %91, 1, !dbg !2175
  store i32 %92, ptr %15, align 4, !dbg !2175
  br label %67, !dbg !2176, !llvm.loop !2177

93:                                               ; preds = %67
  br label %94, !dbg !2179

94:                                               ; preds = %93, %3
    #dbg_declare(ptr %16, !2180, !DIExpression(), !2182)
  store i32 0, ptr %16, align 4, !dbg !2182
  br label %95, !dbg !2183

95:                                               ; preds = %321, %94
  %96 = load i32, ptr %16, align 4, !dbg !2184
  %97 = load ptr, ptr %4, align 8, !dbg !2186
  %98 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %97, i32 0, i32 3, !dbg !2187
  %99 = load i32, ptr %98, align 4, !dbg !2187
  %100 = sub nsw i32 %99, 1, !dbg !2188
  %101 = icmp sle i32 %96, %100, !dbg !2189
  br i1 %101, label %102, label %324, !dbg !2190

102:                                              ; preds = %95
    #dbg_declare(ptr %17, !2191, !DIExpression(), !2194)
  %103 = load ptr, ptr %4, align 8, !dbg !2195
  %104 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %103, i32 0, i32 3, !dbg !2196
  %105 = load i32, ptr %104, align 4, !dbg !2196
  %106 = sub nsw i32 %105, 1, !dbg !2197
  store i32 %106, ptr %17, align 4, !dbg !2194
  br label %107, !dbg !2198

107:                                              ; preds = %317, %102
  %108 = load i32, ptr %17, align 4, !dbg !2199
  %109 = load i32, ptr %16, align 4, !dbg !2201
  %110 = icmp sge i32 %108, %109, !dbg !2202
  br i1 %110, label %111, label %320, !dbg !2203

111:                                              ; preds = %107
  %112 = load ptr, ptr %5, align 8, !dbg !2204
  %113 = load i32, ptr %17, align 4, !dbg !2206
  %114 = load i32, ptr %9, align 4, !dbg !2207
  %115 = mul nsw i32 %113, %114, !dbg !2208
  %116 = load ptr, ptr %4, align 8, !dbg !2209
  %117 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %116, i32 0, i32 2, !dbg !2210
  %118 = load i32, ptr %117, align 8, !dbg !2210
  %119 = mul nsw i32 %115, %118, !dbg !2211
  %120 = sext i32 %119 to i64, !dbg !2212
  %121 = getelementptr inbounds i64, ptr %112, i64 %120, !dbg !2212
  store ptr %121, ptr %13, align 8, !dbg !2213
    #dbg_declare(ptr %18, !2214, !DIExpression(), !2216)
  store i32 0, ptr %18, align 4, !dbg !2216
  br label %122, !dbg !2217

122:                                              ; preds = %204, %111
  %123 = load i32, ptr %18, align 4, !dbg !2218
  %124 = load ptr, ptr %4, align 8, !dbg !2220
  %125 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %124, i32 0, i32 2, !dbg !2221
  %126 = load i32, ptr %125, align 8, !dbg !2221
  %127 = icmp slt i32 %123, %126, !dbg !2222
  br i1 %127, label %128, label %207, !dbg !2223

128:                                              ; preds = %122
    #dbg_declare(ptr %19, !2224, !DIExpression(), !2227)
  store i32 0, ptr %19, align 4, !dbg !2227
  br label %129, !dbg !2228

129:                                              ; preds = %200, %128
  %130 = load i32, ptr %19, align 4, !dbg !2229
  %131 = load i32, ptr %9, align 4, !dbg !2231
  %132 = icmp slt i32 %130, %131, !dbg !2232
  br i1 %132, label %133, label %203, !dbg !2233

133:                                              ; preds = %129
  %134 = load ptr, ptr %13, align 8, !dbg !2234
  %135 = load i32, ptr %19, align 4, !dbg !2236
  %136 = load i32, ptr %18, align 4, !dbg !2237
  %137 = load i32, ptr %9, align 4, !dbg !2238
  %138 = mul nsw i32 %136, %137, !dbg !2239
  %139 = add nsw i32 %135, %138, !dbg !2240
  %140 = sext i32 %139 to i64, !dbg !2234
  %141 = getelementptr inbounds i64, ptr %134, i64 %140, !dbg !2234
  %142 = load i64, ptr %141, align 8, !dbg !2234
  %143 = load i32, ptr %7, align 4, !dbg !2241
  %144 = zext i32 %143 to i64, !dbg !2242
  %145 = shl i64 %142, %144, !dbg !2242
  %146 = load ptr, ptr %4, align 8, !dbg !2243
  %147 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %146, i32 0, i32 2, !dbg !2244
  %148 = load i32, ptr %147, align 8, !dbg !2244
  %149 = load i32, ptr %16, align 4, !dbg !2245
  %150 = mul nsw i32 %148, %149, !dbg !2246
  %151 = load i32, ptr %18, align 4, !dbg !2247
  %152 = add nsw i32 %150, %151, !dbg !2248
  %153 = sext i32 %152 to i64, !dbg !2244
  %154 = load i32, ptr %19, align 4, !dbg !2249
  %155 = load i32, ptr %8, align 4, !dbg !2250
  %156 = add nsw i32 %154, %155, !dbg !2251
  %157 = sext i32 %156 to i64, !dbg !2252
  %158 = load i64, ptr %11, align 8, !dbg !2253
  %159 = mul i64 %157, %158, !dbg !2254
  %160 = add i64 %153, %159, !dbg !2255
  %161 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %160, !dbg !2256
  %162 = load i64, ptr %161, align 8, !dbg !2257
  %163 = xor i64 %162, %145, !dbg !2257
  store i64 %163, ptr %161, align 8, !dbg !2257
  %164 = load i32, ptr %7, align 4, !dbg !2258
  %165 = icmp sgt i32 %164, 0, !dbg !2260
  br i1 %165, label %166, label %199, !dbg !2260

166:                                              ; preds = %133
  %167 = load ptr, ptr %13, align 8, !dbg !2261
  %168 = load i32, ptr %19, align 4, !dbg !2263
  %169 = load i32, ptr %18, align 4, !dbg !2264
  %170 = load i32, ptr %9, align 4, !dbg !2265
  %171 = mul nsw i32 %169, %170, !dbg !2266
  %172 = add nsw i32 %168, %171, !dbg !2267
  %173 = sext i32 %172 to i64, !dbg !2261
  %174 = getelementptr inbounds i64, ptr %167, i64 %173, !dbg !2261
  %175 = load i64, ptr %174, align 8, !dbg !2261
  %176 = load i32, ptr %7, align 4, !dbg !2268
  %177 = sub nsw i32 64, %176, !dbg !2269
  %178 = zext i32 %177 to i64, !dbg !2270
  %179 = lshr i64 %175, %178, !dbg !2270
  %180 = load ptr, ptr %4, align 8, !dbg !2271
  %181 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %180, i32 0, i32 2, !dbg !2272
  %182 = load i32, ptr %181, align 8, !dbg !2272
  %183 = load i32, ptr %16, align 4, !dbg !2273
  %184 = mul nsw i32 %182, %183, !dbg !2274
  %185 = load i32, ptr %18, align 4, !dbg !2275
  %186 = add nsw i32 %184, %185, !dbg !2276
  %187 = sext i32 %186 to i64, !dbg !2272
  %188 = load i32, ptr %19, align 4, !dbg !2277
  %189 = load i32, ptr %8, align 4, !dbg !2278
  %190 = add nsw i32 %188, %189, !dbg !2279
  %191 = add nsw i32 %190, 1, !dbg !2280
  %192 = sext i32 %191 to i64, !dbg !2281
  %193 = load i64, ptr %11, align 8, !dbg !2282
  %194 = mul i64 %192, %193, !dbg !2283
  %195 = add i64 %187, %194, !dbg !2284
  %196 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %195, !dbg !2285
  %197 = load i64, ptr %196, align 8, !dbg !2286
  %198 = xor i64 %197, %179, !dbg !2286
  store i64 %198, ptr %196, align 8, !dbg !2286
  br label %199, !dbg !2287

199:                                              ; preds = %166, %133
  br label %200, !dbg !2288

200:                                              ; preds = %199
  %201 = load i32, ptr %19, align 4, !dbg !2289
  %202 = add nsw i32 %201, 1, !dbg !2289
  store i32 %202, ptr %19, align 4, !dbg !2289
  br label %129, !dbg !2290, !llvm.loop !2291

203:                                              ; preds = %129
  br label %204, !dbg !2293

204:                                              ; preds = %203
  %205 = load i32, ptr %18, align 4, !dbg !2294
  %206 = add nsw i32 %205, 1, !dbg !2294
  store i32 %206, ptr %18, align 4, !dbg !2294
  br label %122, !dbg !2295, !llvm.loop !2296

207:                                              ; preds = %122
  %208 = load i32, ptr %16, align 4, !dbg !2298
  %209 = load i32, ptr %17, align 4, !dbg !2300
  %210 = icmp ne i32 %208, %209, !dbg !2301
  br i1 %210, label %211, label %308, !dbg !2301

211:                                              ; preds = %207
  %212 = load ptr, ptr %5, align 8, !dbg !2302
  %213 = load i32, ptr %16, align 4, !dbg !2304
  %214 = load i32, ptr %9, align 4, !dbg !2305
  %215 = mul nsw i32 %213, %214, !dbg !2306
  %216 = load ptr, ptr %4, align 8, !dbg !2307
  %217 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %216, i32 0, i32 2, !dbg !2308
  %218 = load i32, ptr %217, align 8, !dbg !2308
  %219 = mul nsw i32 %215, %218, !dbg !2309
  %220 = sext i32 %219 to i64, !dbg !2310
  %221 = getelementptr inbounds i64, ptr %212, i64 %220, !dbg !2310
  store ptr %221, ptr %12, align 8, !dbg !2311
    #dbg_declare(ptr %20, !2312, !DIExpression(), !2314)
  store i32 0, ptr %20, align 4, !dbg !2314
  br label %222, !dbg !2315

222:                                              ; preds = %304, %211
  %223 = load i32, ptr %20, align 4, !dbg !2316
  %224 = load ptr, ptr %4, align 8, !dbg !2318
  %225 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %224, i32 0, i32 2, !dbg !2319
  %226 = load i32, ptr %225, align 8, !dbg !2319
  %227 = icmp slt i32 %223, %226, !dbg !2320
  br i1 %227, label %228, label %307, !dbg !2321

228:                                              ; preds = %222
    #dbg_declare(ptr %21, !2322, !DIExpression(), !2325)
  store i32 0, ptr %21, align 4, !dbg !2325
  br label %229, !dbg !2326

229:                                              ; preds = %300, %228
  %230 = load i32, ptr %21, align 4, !dbg !2327
  %231 = load i32, ptr %9, align 4, !dbg !2329
  %232 = icmp slt i32 %230, %231, !dbg !2330
  br i1 %232, label %233, label %303, !dbg !2331

233:                                              ; preds = %229
  %234 = load ptr, ptr %12, align 8, !dbg !2332
  %235 = load i32, ptr %21, align 4, !dbg !2334
  %236 = load i32, ptr %20, align 4, !dbg !2335
  %237 = load i32, ptr %9, align 4, !dbg !2336
  %238 = mul nsw i32 %236, %237, !dbg !2337
  %239 = add nsw i32 %235, %238, !dbg !2338
  %240 = sext i32 %239 to i64, !dbg !2332
  %241 = getelementptr inbounds i64, ptr %234, i64 %240, !dbg !2332
  %242 = load i64, ptr %241, align 8, !dbg !2332
  %243 = load i32, ptr %7, align 4, !dbg !2339
  %244 = zext i32 %243 to i64, !dbg !2340
  %245 = shl i64 %242, %244, !dbg !2340
  %246 = load ptr, ptr %4, align 8, !dbg !2341
  %247 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %246, i32 0, i32 2, !dbg !2342
  %248 = load i32, ptr %247, align 8, !dbg !2342
  %249 = load i32, ptr %17, align 4, !dbg !2343
  %250 = mul nsw i32 %248, %249, !dbg !2344
  %251 = load i32, ptr %20, align 4, !dbg !2345
  %252 = add nsw i32 %250, %251, !dbg !2346
  %253 = sext i32 %252 to i64, !dbg !2342
  %254 = load i32, ptr %21, align 4, !dbg !2347
  %255 = load i32, ptr %8, align 4, !dbg !2348
  %256 = add nsw i32 %254, %255, !dbg !2349
  %257 = sext i32 %256 to i64, !dbg !2350
  %258 = load i64, ptr %11, align 8, !dbg !2351
  %259 = mul i64 %257, %258, !dbg !2352
  %260 = add i64 %253, %259, !dbg !2353
  %261 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %260, !dbg !2354
  %262 = load i64, ptr %261, align 8, !dbg !2355
  %263 = xor i64 %262, %245, !dbg !2355
  store i64 %263, ptr %261, align 8, !dbg !2355
  %264 = load i32, ptr %7, align 4, !dbg !2356
  %265 = icmp sgt i32 %264, 0, !dbg !2358
  br i1 %265, label %266, label %299, !dbg !2358

266:                                              ; preds = %233
  %267 = load ptr, ptr %12, align 8, !dbg !2359
  %268 = load i32, ptr %21, align 4, !dbg !2361
  %269 = load i32, ptr %20, align 4, !dbg !2362
  %270 = load i32, ptr %9, align 4, !dbg !2363
  %271 = mul nsw i32 %269, %270, !dbg !2364
  %272 = add nsw i32 %268, %271, !dbg !2365
  %273 = sext i32 %272 to i64, !dbg !2359
  %274 = getelementptr inbounds i64, ptr %267, i64 %273, !dbg !2359
  %275 = load i64, ptr %274, align 8, !dbg !2359
  %276 = load i32, ptr %7, align 4, !dbg !2366
  %277 = sub nsw i32 64, %276, !dbg !2367
  %278 = zext i32 %277 to i64, !dbg !2368
  %279 = lshr i64 %275, %278, !dbg !2368
  %280 = load ptr, ptr %4, align 8, !dbg !2369
  %281 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %280, i32 0, i32 2, !dbg !2370
  %282 = load i32, ptr %281, align 8, !dbg !2370
  %283 = load i32, ptr %17, align 4, !dbg !2371
  %284 = mul nsw i32 %282, %283, !dbg !2372
  %285 = load i32, ptr %20, align 4, !dbg !2373
  %286 = add nsw i32 %284, %285, !dbg !2374
  %287 = sext i32 %286 to i64, !dbg !2370
  %288 = load i32, ptr %21, align 4, !dbg !2375
  %289 = load i32, ptr %8, align 4, !dbg !2376
  %290 = add nsw i32 %288, %289, !dbg !2377
  %291 = add nsw i32 %290, 1, !dbg !2378
  %292 = sext i32 %291 to i64, !dbg !2379
  %293 = load i64, ptr %11, align 8, !dbg !2380
  %294 = mul i64 %292, %293, !dbg !2381
  %295 = add i64 %287, %294, !dbg !2382
  %296 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %295, !dbg !2383
  %297 = load i64, ptr %296, align 8, !dbg !2384
  %298 = xor i64 %297, %279, !dbg !2384
  store i64 %298, ptr %296, align 8, !dbg !2384
  br label %299, !dbg !2385

299:                                              ; preds = %266, %233
  br label %300, !dbg !2386

300:                                              ; preds = %299
  %301 = load i32, ptr %21, align 4, !dbg !2387
  %302 = add nsw i32 %301, 1, !dbg !2387
  store i32 %302, ptr %21, align 4, !dbg !2387
  br label %229, !dbg !2388, !llvm.loop !2389

303:                                              ; preds = %229
  br label %304, !dbg !2391

304:                                              ; preds = %303
  %305 = load i32, ptr %20, align 4, !dbg !2392
  %306 = add nsw i32 %305, 1, !dbg !2392
  store i32 %306, ptr %20, align 4, !dbg !2392
  br label %222, !dbg !2393, !llvm.loop !2394

307:                                              ; preds = %222
  br label %308, !dbg !2396

308:                                              ; preds = %307, %207
  %309 = load i32, ptr %7, align 4, !dbg !2397
  %310 = add nsw i32 %309, 4, !dbg !2397
  store i32 %310, ptr %7, align 4, !dbg !2397
  %311 = load i32, ptr %7, align 4, !dbg !2398
  %312 = icmp eq i32 %311, 64, !dbg !2400
  br i1 %312, label %313, label %316, !dbg !2400

313:                                              ; preds = %308
  %314 = load i32, ptr %8, align 4, !dbg !2401
  %315 = add nsw i32 %314, 1, !dbg !2401
  store i32 %315, ptr %8, align 4, !dbg !2401
  store i32 0, ptr %7, align 4, !dbg !2403
  br label %316, !dbg !2404

316:                                              ; preds = %313, %308
  br label %317, !dbg !2405

317:                                              ; preds = %316
  %318 = load i32, ptr %17, align 4, !dbg !2406
  %319 = add nsw i32 %318, -1, !dbg !2406
  store i32 %319, ptr %17, align 4, !dbg !2406
  br label %107, !dbg !2407, !llvm.loop !2408

320:                                              ; preds = %107
  br label %321, !dbg !2410

321:                                              ; preds = %320
  %322 = load i32, ptr %16, align 4, !dbg !2411
  %323 = add nsw i32 %322, 1, !dbg !2411
  store i32 %323, ptr %16, align 4, !dbg !2411
  br label %95, !dbg !2412, !llvm.loop !2413

324:                                              ; preds = %95
    #dbg_declare(ptr %22, !2415, !DIExpression(), !2417)
  store i64 0, ptr %22, align 8, !dbg !2417
  br label %325, !dbg !2418

325:                                              ; preds = %350, %324
  %326 = load i64, ptr %22, align 8, !dbg !2419
  %327 = load i64, ptr %11, align 8, !dbg !2421
  %328 = load ptr, ptr %4, align 8, !dbg !2422
  %329 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %328, i32 0, i32 0, !dbg !2423
  %330 = load i32, ptr %329, align 8, !dbg !2423
  %331 = load ptr, ptr %4, align 8, !dbg !2424
  %332 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %331, i32 0, i32 3, !dbg !2425
  %333 = load i32, ptr %332, align 4, !dbg !2425
  %334 = add nsw i32 %333, 1, !dbg !2426
  %335 = load ptr, ptr %4, align 8, !dbg !2427
  %336 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %335, i32 0, i32 3, !dbg !2428
  %337 = load i32, ptr %336, align 4, !dbg !2428
  %338 = mul nsw i32 %334, %337, !dbg !2429
  %339 = sdiv i32 %338, 2, !dbg !2430
  %340 = add nsw i32 %330, %339, !dbg !2431
  %341 = add nsw i32 %340, 15, !dbg !2432
  %342 = sdiv i32 %341, 16, !dbg !2433
  %343 = sext i32 %342 to i64, !dbg !2434
  %344 = mul i64 %327, %343, !dbg !2435
  %345 = icmp ult i64 %326, %344, !dbg !2436
  br i1 %345, label %346, label %353, !dbg !2437

346:                                              ; preds = %325
  %347 = getelementptr inbounds [3744 x i64], ptr %10, i64 0, i64 0, !dbg !2438
  %348 = load i64, ptr %22, align 8, !dbg !2440
  %349 = getelementptr inbounds nuw i64, ptr %347, i64 %348, !dbg !2441
  call void @transpose_16x16_nibbles(ptr noundef %349), !dbg !2442
  br label %350, !dbg !2443

350:                                              ; preds = %346
  %351 = load i64, ptr %22, align 8, !dbg !2444
  %352 = add i64 %351, 16, !dbg !2444
  store i64 %352, ptr %22, align 8, !dbg !2444
  br label %325, !dbg !2445, !llvm.loop !2446

353:                                              ; preds = %325
    #dbg_declare(ptr %23, !2448, !DIExpression(), !2452)
  call void @llvm.memset.p0.i64(ptr align 16 %23, i8 0, i64 16, i1 false), !dbg !2452
    #dbg_declare(ptr %24, !2453, !DIExpression(), !2455)
  store i64 0, ptr %24, align 8, !dbg !2455
  br label %354, !dbg !2456

354:                                              ; preds = %401, %353
  %355 = load i64, ptr %24, align 8, !dbg !2457
  %356 = icmp ult i64 %355, 4, !dbg !2459
  br i1 %356, label %357, label %404, !dbg !2460

357:                                              ; preds = %354
  %358 = load ptr, ptr %4, align 8, !dbg !2461
  %359 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %358, i32 0, i32 5, !dbg !2463
  %360 = load ptr, ptr %359, align 8, !dbg !2463
  %361 = load i64, ptr %24, align 8, !dbg !2464
  %362 = getelementptr inbounds nuw i8, ptr %360, i64 %361, !dbg !2463
  %363 = load i8, ptr %362, align 1, !dbg !2463
  %364 = call zeroext i8 @mul_f(i8 noundef zeroext %363, i8 noundef zeroext 1), !dbg !2465
  %365 = load i64, ptr %24, align 8, !dbg !2466
  %366 = mul i64 4, %365, !dbg !2467
  %367 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %366, !dbg !2468
  store i8 %364, ptr %367, align 1, !dbg !2469
  %368 = load ptr, ptr %4, align 8, !dbg !2470
  %369 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %368, i32 0, i32 5, !dbg !2471
  %370 = load ptr, ptr %369, align 8, !dbg !2471
  %371 = load i64, ptr %24, align 8, !dbg !2472
  %372 = getelementptr inbounds nuw i8, ptr %370, i64 %371, !dbg !2471
  %373 = load i8, ptr %372, align 1, !dbg !2471
  %374 = call zeroext i8 @mul_f(i8 noundef zeroext %373, i8 noundef zeroext 2), !dbg !2473
  %375 = load i64, ptr %24, align 8, !dbg !2474
  %376 = mul i64 4, %375, !dbg !2475
  %377 = add i64 %376, 1, !dbg !2476
  %378 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %377, !dbg !2477
  store i8 %374, ptr %378, align 1, !dbg !2478
  %379 = load ptr, ptr %4, align 8, !dbg !2479
  %380 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %379, i32 0, i32 5, !dbg !2480
  %381 = load ptr, ptr %380, align 8, !dbg !2480
  %382 = load i64, ptr %24, align 8, !dbg !2481
  %383 = getelementptr inbounds nuw i8, ptr %381, i64 %382, !dbg !2480
  %384 = load i8, ptr %383, align 1, !dbg !2480
  %385 = call zeroext i8 @mul_f(i8 noundef zeroext %384, i8 noundef zeroext 4), !dbg !2482
  %386 = load i64, ptr %24, align 8, !dbg !2483
  %387 = mul i64 4, %386, !dbg !2484
  %388 = add i64 %387, 2, !dbg !2485
  %389 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %388, !dbg !2486
  store i8 %385, ptr %389, align 1, !dbg !2487
  %390 = load ptr, ptr %4, align 8, !dbg !2488
  %391 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %390, i32 0, i32 5, !dbg !2489
  %392 = load ptr, ptr %391, align 8, !dbg !2489
  %393 = load i64, ptr %24, align 8, !dbg !2490
  %394 = getelementptr inbounds nuw i8, ptr %392, i64 %393, !dbg !2489
  %395 = load i8, ptr %394, align 1, !dbg !2489
  %396 = call zeroext i8 @mul_f(i8 noundef zeroext %395, i8 noundef zeroext 8), !dbg !2491
  %397 = load i64, ptr %24, align 8, !dbg !2492
  %398 = mul i64 4, %397, !dbg !2493
  %399 = add i64 %398, 3, !dbg !2494
  %400 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %399, !dbg !2495
  store i8 %396, ptr %400, align 1, !dbg !2496
  br label %401, !dbg !2497

401:                                              ; preds = %357
  %402 = load i64, ptr %24, align 8, !dbg !2498
  %403 = add i64 %402, 1, !dbg !2498
  store i64 %403, ptr %24, align 8, !dbg !2498
  br label %354, !dbg !2499, !llvm.loop !2500

404:                                              ; preds = %354
    #dbg_declare(ptr %25, !2502, !DIExpression(), !2503)
  store i64 1229782938247303441, ptr %25, align 8, !dbg !2503
    #dbg_declare(ptr %26, !2504, !DIExpression(), !2506)
  store i64 0, ptr %26, align 8, !dbg !2506
  br label %405, !dbg !2507

405:                                              ; preds = %539, %404
  %406 = load i64, ptr %26, align 8, !dbg !2508
  %407 = load i64, ptr %11, align 8, !dbg !2510
  %408 = icmp ult i64 %406, %407, !dbg !2511
  br i1 %408, label %409, label %542, !dbg !2512

409:                                              ; preds = %405
    #dbg_declare(ptr %27, !2513, !DIExpression(), !2516)
  %410 = load ptr, ptr %4, align 8, !dbg !2517
  %411 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %410, i32 0, i32 0, !dbg !2518
  %412 = load i32, ptr %411, align 8, !dbg !2518
  store i32 %412, ptr %27, align 4, !dbg !2516
  br label %413, !dbg !2519

413:                                              ; preds = %535, %409
  %414 = load i32, ptr %27, align 4, !dbg !2520
  %415 = load ptr, ptr %4, align 8, !dbg !2522
  %416 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %415, i32 0, i32 0, !dbg !2523
  %417 = load i32, ptr %416, align 8, !dbg !2523
  %418 = load ptr, ptr %4, align 8, !dbg !2524
  %419 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %418, i32 0, i32 3, !dbg !2525
  %420 = load i32, ptr %419, align 4, !dbg !2525
  %421 = add nsw i32 %420, 1, !dbg !2526
  %422 = load ptr, ptr %4, align 8, !dbg !2527
  %423 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %422, i32 0, i32 3, !dbg !2528
  %424 = load i32, ptr %423, align 4, !dbg !2528
  %425 = mul nsw i32 %421, %424, !dbg !2529
  %426 = sdiv i32 %425, 2, !dbg !2530
  %427 = add nsw i32 %417, %426, !dbg !2531
  %428 = icmp slt i32 %414, %427, !dbg !2532
  br i1 %428, label %429, label %538, !dbg !2533

429:                                              ; preds = %413
    #dbg_declare(ptr %28, !2534, !DIExpression(), !2536)
  %430 = load i32, ptr %27, align 4, !dbg !2537
  %431 = sdiv i32 %430, 16, !dbg !2538
  %432 = sext i32 %431 to i64, !dbg !2539
  %433 = load i64, ptr %11, align 8, !dbg !2540
  %434 = mul i64 %432, %433, !dbg !2541
  %435 = load i64, ptr %26, align 8, !dbg !2542
  %436 = add i64 %434, %435, !dbg !2543
  %437 = load i32, ptr %27, align 4, !dbg !2544
  %438 = srem i32 %437, 16, !dbg !2545
  %439 = sext i32 %438 to i64, !dbg !2546
  %440 = add i64 %436, %439, !dbg !2547
  store i64 %440, ptr %28, align 8, !dbg !2536
    #dbg_declare(ptr %29, !2548, !DIExpression(), !2549)
  %441 = load i64, ptr %28, align 8, !dbg !2550
  %442 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %441, !dbg !2551
  %443 = load i64, ptr %442, align 8, !dbg !2551
  %444 = load i64, ptr %25, align 8, !dbg !2552
  %445 = and i64 %443, %444, !dbg !2553
  store i64 %445, ptr %29, align 8, !dbg !2549
    #dbg_declare(ptr %30, !2554, !DIExpression(), !2555)
  %446 = load i64, ptr %28, align 8, !dbg !2556
  %447 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %446, !dbg !2557
  %448 = load i64, ptr %447, align 8, !dbg !2557
  %449 = lshr i64 %448, 1, !dbg !2558
  %450 = load i64, ptr %25, align 8, !dbg !2559
  %451 = and i64 %449, %450, !dbg !2560
  store i64 %451, ptr %30, align 8, !dbg !2555
    #dbg_declare(ptr %31, !2561, !DIExpression(), !2562)
  %452 = load i64, ptr %28, align 8, !dbg !2563
  %453 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %452, !dbg !2564
  %454 = load i64, ptr %453, align 8, !dbg !2564
  %455 = lshr i64 %454, 2, !dbg !2565
  %456 = load i64, ptr %25, align 8, !dbg !2566
  %457 = and i64 %455, %456, !dbg !2567
  store i64 %457, ptr %31, align 8, !dbg !2562
    #dbg_declare(ptr %32, !2568, !DIExpression(), !2569)
  %458 = load i64, ptr %28, align 8, !dbg !2570
  %459 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %458, !dbg !2571
  %460 = load i64, ptr %459, align 8, !dbg !2571
  %461 = lshr i64 %460, 3, !dbg !2572
  %462 = load i64, ptr %25, align 8, !dbg !2573
  %463 = and i64 %461, %462, !dbg !2574
  store i64 %463, ptr %32, align 8, !dbg !2569
    #dbg_declare(ptr %33, !2575, !DIExpression(), !2577)
  store i64 0, ptr %33, align 8, !dbg !2577
  br label %464, !dbg !2578

464:                                              ; preds = %531, %429
  %465 = load i64, ptr %33, align 8, !dbg !2579
  %466 = icmp ult i64 %465, 4, !dbg !2581
  br i1 %466, label %467, label %534, !dbg !2582

467:                                              ; preds = %464
  %468 = load i64, ptr %29, align 8, !dbg !2583
  %469 = load i64, ptr %33, align 8, !dbg !2585
  %470 = mul i64 4, %469, !dbg !2586
  %471 = add i64 %470, 0, !dbg !2587
  %472 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %471, !dbg !2588
  %473 = load i8, ptr %472, align 1, !dbg !2588
  %474 = zext i8 %473 to i64, !dbg !2588
  %475 = mul i64 %468, %474, !dbg !2589
  %476 = load i64, ptr %30, align 8, !dbg !2590
  %477 = load i64, ptr %33, align 8, !dbg !2591
  %478 = mul i64 4, %477, !dbg !2592
  %479 = add i64 %478, 1, !dbg !2593
  %480 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %479, !dbg !2594
  %481 = load i8, ptr %480, align 1, !dbg !2594
  %482 = zext i8 %481 to i64, !dbg !2594
  %483 = mul i64 %476, %482, !dbg !2595
  %484 = xor i64 %475, %483, !dbg !2596
  %485 = load i64, ptr %31, align 8, !dbg !2597
  %486 = load i64, ptr %33, align 8, !dbg !2598
  %487 = mul i64 4, %486, !dbg !2599
  %488 = add i64 %487, 2, !dbg !2600
  %489 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %488, !dbg !2601
  %490 = load i8, ptr %489, align 1, !dbg !2601
  %491 = zext i8 %490 to i64, !dbg !2601
  %492 = mul i64 %485, %491, !dbg !2602
  %493 = xor i64 %484, %492, !dbg !2603
  %494 = load i64, ptr %32, align 8, !dbg !2604
  %495 = load i64, ptr %33, align 8, !dbg !2605
  %496 = mul i64 4, %495, !dbg !2606
  %497 = add i64 %496, 3, !dbg !2607
  %498 = getelementptr inbounds nuw [16 x i8], ptr %23, i64 0, i64 %497, !dbg !2608
  %499 = load i8, ptr %498, align 1, !dbg !2608
  %500 = zext i8 %499 to i64, !dbg !2608
  %501 = mul i64 %494, %500, !dbg !2609
  %502 = xor i64 %493, %501, !dbg !2610
  %503 = load i32, ptr %27, align 4, !dbg !2611
  %504 = sext i32 %503 to i64, !dbg !2611
  %505 = load i64, ptr %33, align 8, !dbg !2612
  %506 = add i64 %504, %505, !dbg !2613
  %507 = load ptr, ptr %4, align 8, !dbg !2614
  %508 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %507, i32 0, i32 0, !dbg !2615
  %509 = load i32, ptr %508, align 8, !dbg !2615
  %510 = sext i32 %509 to i64, !dbg !2615
  %511 = sub i64 %506, %510, !dbg !2616
  %512 = udiv i64 %511, 16, !dbg !2617
  %513 = load i64, ptr %11, align 8, !dbg !2618
  %514 = mul i64 %512, %513, !dbg !2619
  %515 = load i64, ptr %26, align 8, !dbg !2620
  %516 = add i64 %514, %515, !dbg !2621
  %517 = load i32, ptr %27, align 4, !dbg !2622
  %518 = sext i32 %517 to i64, !dbg !2622
  %519 = load i64, ptr %33, align 8, !dbg !2623
  %520 = add i64 %518, %519, !dbg !2624
  %521 = load ptr, ptr %4, align 8, !dbg !2625
  %522 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %521, i32 0, i32 0, !dbg !2626
  %523 = load i32, ptr %522, align 8, !dbg !2626
  %524 = sext i32 %523 to i64, !dbg !2626
  %525 = sub i64 %520, %524, !dbg !2627
  %526 = urem i64 %525, 16, !dbg !2628
  %527 = add i64 %516, %526, !dbg !2629
  %528 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %527, !dbg !2630
  %529 = load i64, ptr %528, align 8, !dbg !2631
  %530 = xor i64 %529, %502, !dbg !2631
  store i64 %530, ptr %528, align 8, !dbg !2631
  br label %531, !dbg !2632

531:                                              ; preds = %467
  %532 = load i64, ptr %33, align 8, !dbg !2633
  %533 = add i64 %532, 1, !dbg !2633
  store i64 %533, ptr %33, align 8, !dbg !2633
  br label %464, !dbg !2634, !llvm.loop !2635

534:                                              ; preds = %464
  br label %535, !dbg !2637

535:                                              ; preds = %534
  %536 = load i32, ptr %27, align 4, !dbg !2638
  %537 = add nsw i32 %536, 1, !dbg !2638
  store i32 %537, ptr %27, align 4, !dbg !2638
  br label %413, !dbg !2639, !llvm.loop !2640

538:                                              ; preds = %413
  br label %539, !dbg !2642

539:                                              ; preds = %538
  %540 = load i64, ptr %26, align 8, !dbg !2643
  %541 = add i64 %540, 16, !dbg !2643
  store i64 %541, ptr %26, align 8, !dbg !2643
  br label %405, !dbg !2644, !llvm.loop !2645

542:                                              ; preds = %405
    #dbg_declare(ptr %34, !2647, !DIExpression(), !2649)
  store i32 0, ptr %34, align 4, !dbg !2649
  br label %543, !dbg !2650

543:                                              ; preds = %637, %542
  %544 = load i32, ptr %34, align 4, !dbg !2651
  %545 = load ptr, ptr %4, align 8, !dbg !2653
  %546 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %545, i32 0, i32 0, !dbg !2654
  %547 = load i32, ptr %546, align 8, !dbg !2654
  %548 = icmp slt i32 %544, %547, !dbg !2655
  br i1 %548, label %549, label %640, !dbg !2656

549:                                              ; preds = %543
    #dbg_declare(ptr %35, !2657, !DIExpression(), !2660)
  store i32 0, ptr %35, align 4, !dbg !2660
  br label %550, !dbg !2661

550:                                              ; preds = %633, %549
  %551 = load i32, ptr %35, align 4, !dbg !2662
  %552 = load ptr, ptr %4, align 8, !dbg !2664
  %553 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %552, i32 0, i32 3, !dbg !2665
  %554 = load i32, ptr %553, align 4, !dbg !2665
  %555 = load ptr, ptr %4, align 8, !dbg !2664
  %556 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %555, i32 0, i32 2, !dbg !2665
  %557 = load i32, ptr %556, align 8, !dbg !2665
  %558 = mul nsw i32 %554, %557, !dbg !2665
  %559 = add nsw i32 %558, 1, !dbg !2665
  %560 = sub nsw i32 %559, 1, !dbg !2666
  %561 = icmp slt i32 %551, %560, !dbg !2667
  br i1 %561, label %562, label %636, !dbg !2668

562:                                              ; preds = %550
    #dbg_declare(ptr %36, !2669, !DIExpression(), !2672)
  store i32 0, ptr %36, align 4, !dbg !2672
  br label %563, !dbg !2673

563:                                              ; preds = %629, %562
  %564 = load i32, ptr %36, align 4, !dbg !2674
  %565 = load i32, ptr %34, align 4, !dbg !2676
  %566 = add nsw i32 %564, %565, !dbg !2677
  %567 = load ptr, ptr %4, align 8, !dbg !2678
  %568 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %567, i32 0, i32 0, !dbg !2679
  %569 = load i32, ptr %568, align 8, !dbg !2679
  %570 = icmp slt i32 %566, %569, !dbg !2680
  br i1 %570, label %571, label %632, !dbg !2681

571:                                              ; preds = %563
  %572 = load i32, ptr %34, align 4, !dbg !2682
  %573 = sext i32 %572 to i64, !dbg !2682
  %574 = load i64, ptr %11, align 8, !dbg !2684
  %575 = mul i64 %573, %574, !dbg !2685
  %576 = udiv i64 %575, 16, !dbg !2686
  %577 = load i32, ptr %35, align 4, !dbg !2687
  %578 = sext i32 %577 to i64, !dbg !2687
  %579 = add i64 %576, %578, !dbg !2688
  %580 = load i32, ptr %36, align 4, !dbg !2689
  %581 = sext i32 %580 to i64, !dbg !2689
  %582 = add i64 %579, %581, !dbg !2690
  %583 = getelementptr inbounds nuw [3744 x i64], ptr %10, i64 0, i64 %582, !dbg !2691
  %584 = load ptr, ptr %6, align 8, !dbg !2692
  %585 = load ptr, ptr %4, align 8, !dbg !2693
  %586 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %585, i32 0, i32 3, !dbg !2694
  %587 = load i32, ptr %586, align 4, !dbg !2694
  %588 = load ptr, ptr %4, align 8, !dbg !2693
  %589 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %588, i32 0, i32 2, !dbg !2694
  %590 = load i32, ptr %589, align 8, !dbg !2694
  %591 = mul nsw i32 %587, %590, !dbg !2694
  %592 = add nsw i32 %591, 1, !dbg !2694
  %593 = load i32, ptr %34, align 4, !dbg !2695
  %594 = load i32, ptr %36, align 4, !dbg !2696
  %595 = add nsw i32 %593, %594, !dbg !2697
  %596 = mul nsw i32 %592, %595, !dbg !2698
  %597 = sext i32 %596 to i64, !dbg !2699
  %598 = getelementptr inbounds i8, ptr %584, i64 %597, !dbg !2699
  %599 = load i32, ptr %35, align 4, !dbg !2700
  %600 = sext i32 %599 to i64, !dbg !2701
  %601 = getelementptr inbounds i8, ptr %598, i64 %600, !dbg !2701
  %602 = load ptr, ptr %4, align 8, !dbg !2702
  %603 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %602, i32 0, i32 3, !dbg !2703
  %604 = load i32, ptr %603, align 4, !dbg !2703
  %605 = load ptr, ptr %4, align 8, !dbg !2702
  %606 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %605, i32 0, i32 2, !dbg !2703
  %607 = load i32, ptr %606, align 8, !dbg !2703
  %608 = mul nsw i32 %604, %607, !dbg !2703
  %609 = add nsw i32 %608, 1, !dbg !2703
  %610 = sub nsw i32 %609, 1, !dbg !2704
  %611 = load i32, ptr %35, align 4, !dbg !2705
  %612 = sub nsw i32 %610, %611, !dbg !2706
  %613 = icmp slt i32 16, %612, !dbg !2707
  br i1 %613, label %614, label %615, !dbg !2707

614:                                              ; preds = %571
  br label %627, !dbg !2707

615:                                              ; preds = %571
  %616 = load ptr, ptr %4, align 8, !dbg !2702
  %617 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %616, i32 0, i32 3, !dbg !2703
  %618 = load i32, ptr %617, align 4, !dbg !2703
  %619 = load ptr, ptr %4, align 8, !dbg !2702
  %620 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %619, i32 0, i32 2, !dbg !2703
  %621 = load i32, ptr %620, align 8, !dbg !2703
  %622 = mul nsw i32 %618, %621, !dbg !2703
  %623 = add nsw i32 %622, 1, !dbg !2703
  %624 = sub nsw i32 %623, 1, !dbg !2704
  %625 = load i32, ptr %35, align 4, !dbg !2705
  %626 = sub nsw i32 %624, %625, !dbg !2706
  br label %627, !dbg !2707

627:                                              ; preds = %615, %614
  %628 = phi i32 [ 16, %614 ], [ %626, %615 ], !dbg !2707
  call void @decode(ptr noundef %583, ptr noundef %601, i32 noundef %628), !dbg !2708
  br label %629, !dbg !2709

629:                                              ; preds = %627
  %630 = load i32, ptr %36, align 4, !dbg !2710
  %631 = add nsw i32 %630, 1, !dbg !2710
  store i32 %631, ptr %36, align 4, !dbg !2710
  br label %563, !dbg !2711, !llvm.loop !2712

632:                                              ; preds = %563
  br label %633, !dbg !2714

633:                                              ; preds = %632
  %634 = load i32, ptr %35, align 4, !dbg !2715
  %635 = add nsw i32 %634, 16, !dbg !2715
  store i32 %635, ptr %35, align 4, !dbg !2715
  br label %550, !dbg !2716, !llvm.loop !2717

636:                                              ; preds = %550
  br label %637, !dbg !2719

637:                                              ; preds = %636
  %638 = load i32, ptr %34, align 4, !dbg !2720
  %639 = add nsw i32 %638, 16, !dbg !2720
  store i32 %639, ptr %34, align 4, !dbg !2720
  br label %543, !dbg !2721, !llvm.loop !2722

640:                                              ; preds = %543
  ret void, !dbg !2724
}

declare i32 @sample_solution(ptr noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mat_mul(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5) #0 !dbg !2725 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !2728, !DIExpression(), !2729)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !2730, !DIExpression(), !2731)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !2732, !DIExpression(), !2733)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !2734, !DIExpression(), !2735)
  store i32 %4, ptr %11, align 4
    #dbg_declare(ptr %11, !2736, !DIExpression(), !2737)
  store i32 %5, ptr %12, align 4
    #dbg_declare(ptr %12, !2738, !DIExpression(), !2739)
    #dbg_declare(ptr %13, !2740, !DIExpression(), !2742)
  store i32 0, ptr %13, align 4, !dbg !2742
  br label %15, !dbg !2743

15:                                               ; preds = %40, %6
  %16 = load i32, ptr %13, align 4, !dbg !2744
  %17 = load i32, ptr %11, align 4, !dbg !2746
  %18 = icmp slt i32 %16, %17, !dbg !2747
  br i1 %18, label %19, label %47, !dbg !2748

19:                                               ; preds = %15
    #dbg_declare(ptr %14, !2749, !DIExpression(), !2752)
  store i32 0, ptr %14, align 4, !dbg !2752
  br label %20, !dbg !2753

20:                                               ; preds = %34, %19
  %21 = load i32, ptr %14, align 4, !dbg !2754
  %22 = load i32, ptr %12, align 4, !dbg !2756
  %23 = icmp slt i32 %21, %22, !dbg !2757
  br i1 %23, label %24, label %39, !dbg !2758

24:                                               ; preds = %20
  %25 = load ptr, ptr %7, align 8, !dbg !2759
  %26 = load ptr, ptr %8, align 8, !dbg !2761
  %27 = load i32, ptr %14, align 4, !dbg !2762
  %28 = sext i32 %27 to i64, !dbg !2763
  %29 = getelementptr inbounds i8, ptr %26, i64 %28, !dbg !2763
  %30 = load i32, ptr %10, align 4, !dbg !2764
  %31 = load i32, ptr %12, align 4, !dbg !2765
  %32 = call zeroext i8 @lincomb(ptr noundef %25, ptr noundef %29, i32 noundef %30, i32 noundef %31), !dbg !2766
  %33 = load ptr, ptr %9, align 8, !dbg !2767
  store i8 %32, ptr %33, align 1, !dbg !2768
  br label %34, !dbg !2769

34:                                               ; preds = %24
  %35 = load i32, ptr %14, align 4, !dbg !2770
  %36 = add nsw i32 %35, 1, !dbg !2770
  store i32 %36, ptr %14, align 4, !dbg !2770
  %37 = load ptr, ptr %9, align 8, !dbg !2771
  %38 = getelementptr inbounds nuw i8, ptr %37, i32 1, !dbg !2771
  store ptr %38, ptr %9, align 8, !dbg !2771
  br label %20, !dbg !2772, !llvm.loop !2773

39:                                               ; preds = %20
  br label %40, !dbg !2775

40:                                               ; preds = %39
  %41 = load i32, ptr %13, align 4, !dbg !2776
  %42 = add nsw i32 %41, 1, !dbg !2776
  store i32 %42, ptr %13, align 4, !dbg !2776
  %43 = load i32, ptr %10, align 4, !dbg !2777
  %44 = load ptr, ptr %7, align 8, !dbg !2778
  %45 = sext i32 %43 to i64, !dbg !2778
  %46 = getelementptr inbounds i8, ptr %44, i64 %45, !dbg !2778
  store ptr %46, ptr %7, align 8, !dbg !2778
  br label %15, !dbg !2779, !llvm.loop !2780

47:                                               ; preds = %15
  ret void, !dbg !2782
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mat_add(ptr noundef %0, ptr noundef %1, ptr noundef %2, i32 noundef %3, i32 noundef %4) #0 !dbg !2783 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store ptr %0, ptr %6, align 8
    #dbg_declare(ptr %6, !2786, !DIExpression(), !2787)
  store ptr %1, ptr %7, align 8
    #dbg_declare(ptr %7, !2788, !DIExpression(), !2789)
  store ptr %2, ptr %8, align 8
    #dbg_declare(ptr %8, !2790, !DIExpression(), !2791)
  store i32 %3, ptr %9, align 4
    #dbg_declare(ptr %9, !2792, !DIExpression(), !2793)
  store i32 %4, ptr %10, align 4
    #dbg_declare(ptr %10, !2794, !DIExpression(), !2795)
    #dbg_declare(ptr %11, !2796, !DIExpression(), !2798)
  store i32 0, ptr %11, align 4, !dbg !2798
  br label %13, !dbg !2799

13:                                               ; preds = %57, %5
  %14 = load i32, ptr %11, align 4, !dbg !2800
  %15 = load i32, ptr %9, align 4, !dbg !2802
  %16 = icmp slt i32 %14, %15, !dbg !2803
  br i1 %16, label %17, label %60, !dbg !2804

17:                                               ; preds = %13
    #dbg_declare(ptr %12, !2805, !DIExpression(), !2808)
  store i32 0, ptr %12, align 4, !dbg !2808
  br label %18, !dbg !2809

18:                                               ; preds = %53, %17
  %19 = load i32, ptr %12, align 4, !dbg !2810
  %20 = load i32, ptr %10, align 4, !dbg !2812
  %21 = icmp slt i32 %19, %20, !dbg !2813
  br i1 %21, label %22, label %56, !dbg !2814

22:                                               ; preds = %18
  %23 = load ptr, ptr %6, align 8, !dbg !2815
  %24 = load i32, ptr %11, align 4, !dbg !2817
  %25 = load i32, ptr %10, align 4, !dbg !2818
  %26 = mul nsw i32 %24, %25, !dbg !2819
  %27 = sext i32 %26 to i64, !dbg !2820
  %28 = getelementptr inbounds i8, ptr %23, i64 %27, !dbg !2820
  %29 = load i32, ptr %12, align 4, !dbg !2821
  %30 = sext i32 %29 to i64, !dbg !2820
  %31 = getelementptr inbounds i8, ptr %28, i64 %30, !dbg !2820
  %32 = load i8, ptr %31, align 1, !dbg !2820
  %33 = load ptr, ptr %7, align 8, !dbg !2822
  %34 = load i32, ptr %11, align 4, !dbg !2823
  %35 = load i32, ptr %10, align 4, !dbg !2824
  %36 = mul nsw i32 %34, %35, !dbg !2825
  %37 = sext i32 %36 to i64, !dbg !2826
  %38 = getelementptr inbounds i8, ptr %33, i64 %37, !dbg !2826
  %39 = load i32, ptr %12, align 4, !dbg !2827
  %40 = sext i32 %39 to i64, !dbg !2826
  %41 = getelementptr inbounds i8, ptr %38, i64 %40, !dbg !2826
  %42 = load i8, ptr %41, align 1, !dbg !2826
  %43 = call zeroext i8 @add_f(i8 noundef zeroext %32, i8 noundef zeroext %42), !dbg !2828
  %44 = load ptr, ptr %8, align 8, !dbg !2829
  %45 = load i32, ptr %11, align 4, !dbg !2830
  %46 = load i32, ptr %10, align 4, !dbg !2831
  %47 = mul nsw i32 %45, %46, !dbg !2832
  %48 = sext i32 %47 to i64, !dbg !2833
  %49 = getelementptr inbounds i8, ptr %44, i64 %48, !dbg !2833
  %50 = load i32, ptr %12, align 4, !dbg !2834
  %51 = sext i32 %50 to i64, !dbg !2833
  %52 = getelementptr inbounds i8, ptr %49, i64 %51, !dbg !2833
  store i8 %43, ptr %52, align 1, !dbg !2835
  br label %53, !dbg !2836

53:                                               ; preds = %22
  %54 = load i32, ptr %12, align 4, !dbg !2837
  %55 = add nsw i32 %54, 1, !dbg !2837
  store i32 %55, ptr %12, align 4, !dbg !2837
  br label %18, !dbg !2838, !llvm.loop !2839

56:                                               ; preds = %18
  br label %57, !dbg !2841

57:                                               ; preds = %56
  %58 = load i32, ptr %11, align 4, !dbg !2842
  %59 = add nsw i32 %58, 1, !dbg !2842
  store i32 %59, ptr %11, align 4, !dbg !2842
  br label %13, !dbg !2843, !llvm.loop !2844

60:                                               ; preds = %13
  ret void, !dbg !2846
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @encode(ptr noundef %0, ptr noundef %1, i32 noundef %2) #0 !dbg !2847 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !2848, !DIExpression(), !2849)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !2850, !DIExpression(), !2851)
  store i32 %2, ptr %6, align 4
    #dbg_declare(ptr %6, !2852, !DIExpression(), !2853)
    #dbg_declare(ptr %7, !2854, !DIExpression(), !2855)
  store i32 0, ptr %7, align 4, !dbg !2856
  br label %8, !dbg !2858

8:                                                ; preds = %28, %3
  %9 = load i32, ptr %7, align 4, !dbg !2859
  %10 = load i32, ptr %6, align 4, !dbg !2861
  %11 = sdiv i32 %10, 2, !dbg !2862
  %12 = icmp slt i32 %9, %11, !dbg !2863
  br i1 %12, label %13, label %33, !dbg !2864

13:                                               ; preds = %8
  %14 = load ptr, ptr %4, align 8, !dbg !2865
  %15 = load i8, ptr %14, align 1, !dbg !2867
  %16 = zext i8 %15 to i32, !dbg !2868
  %17 = load ptr, ptr %4, align 8, !dbg !2869
  %18 = getelementptr inbounds i8, ptr %17, i64 1, !dbg !2870
  %19 = load i8, ptr %18, align 1, !dbg !2870
  %20 = zext i8 %19 to i32, !dbg !2870
  %21 = shl i32 %20, 4, !dbg !2871
  %22 = or i32 %16, %21, !dbg !2872
  %23 = trunc i32 %22 to i8, !dbg !2868
  %24 = load ptr, ptr %5, align 8, !dbg !2873
  %25 = load i32, ptr %7, align 4, !dbg !2874
  %26 = sext i32 %25 to i64, !dbg !2873
  %27 = getelementptr inbounds i8, ptr %24, i64 %26, !dbg !2873
  store i8 %23, ptr %27, align 1, !dbg !2875
  br label %28, !dbg !2876

28:                                               ; preds = %13
  %29 = load i32, ptr %7, align 4, !dbg !2877
  %30 = add nsw i32 %29, 1, !dbg !2877
  store i32 %30, ptr %7, align 4, !dbg !2877
  %31 = load ptr, ptr %4, align 8, !dbg !2878
  %32 = getelementptr inbounds i8, ptr %31, i64 2, !dbg !2878
  store ptr %32, ptr %4, align 8, !dbg !2878
  br label %8, !dbg !2879, !llvm.loop !2880

33:                                               ; preds = %8
  %34 = load i32, ptr %6, align 4, !dbg !2882
  %35 = srem i32 %34, 2, !dbg !2884
  %36 = icmp eq i32 %35, 1, !dbg !2885
  br i1 %36, label %37, label %44, !dbg !2885

37:                                               ; preds = %33
  %38 = load ptr, ptr %4, align 8, !dbg !2886
  %39 = load i8, ptr %38, align 1, !dbg !2888
  %40 = load ptr, ptr %5, align 8, !dbg !2889
  %41 = load i32, ptr %7, align 4, !dbg !2890
  %42 = sext i32 %41 to i64, !dbg !2889
  %43 = getelementptr inbounds i8, ptr %40, i64 %42, !dbg !2889
  store i8 %39, ptr %43, align 1, !dbg !2891
  br label %44, !dbg !2892

44:                                               ; preds = %37, %33
  ret void, !dbg !2893
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #0 !dbg !2894 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
    #dbg_declare(ptr %3, !2897, !DIExpression(), !2898)
  store i8 %1, ptr %4, align 1
    #dbg_declare(ptr %4, !2899, !DIExpression(), !2900)
  %5 = load i8, ptr %3, align 1, !dbg !2901
  %6 = zext i8 %5 to i32, !dbg !2901
  %7 = load i8, ptr %4, align 1, !dbg !2902
  %8 = zext i8 %7 to i32, !dbg !2902
  %9 = xor i32 %6, %8, !dbg !2903
  %10 = trunc i32 %9 to i8, !dbg !2901
  ret i8 %10, !dbg !2904
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @lincomb(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2905 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !2908, !DIExpression(), !2909)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !2910, !DIExpression(), !2911)
  store i32 %2, ptr %7, align 4
    #dbg_declare(ptr %7, !2912, !DIExpression(), !2913)
  store i32 %3, ptr %8, align 4
    #dbg_declare(ptr %8, !2914, !DIExpression(), !2915)
    #dbg_declare(ptr %9, !2916, !DIExpression(), !2917)
  store i8 0, ptr %9, align 1, !dbg !2917
    #dbg_declare(ptr %10, !2918, !DIExpression(), !2920)
  store i32 0, ptr %10, align 4, !dbg !2920
  br label %11, !dbg !2921

11:                                               ; preds = %26, %4
  %12 = load i32, ptr %10, align 4, !dbg !2922
  %13 = load i32, ptr %7, align 4, !dbg !2924
  %14 = icmp slt i32 %12, %13, !dbg !2925
  br i1 %14, label %15, label %33, !dbg !2926

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8, !dbg !2927
  %17 = load i32, ptr %10, align 4, !dbg !2929
  %18 = sext i32 %17 to i64, !dbg !2927
  %19 = getelementptr inbounds i8, ptr %16, i64 %18, !dbg !2927
  %20 = load i8, ptr %19, align 1, !dbg !2927
  %21 = load ptr, ptr %6, align 8, !dbg !2930
  %22 = load i8, ptr %21, align 1, !dbg !2931
  %23 = call zeroext i8 @mul_f(i8 noundef zeroext %20, i8 noundef zeroext %22), !dbg !2932
  %24 = load i8, ptr %9, align 1, !dbg !2933
  %25 = call zeroext i8 @add_f(i8 noundef zeroext %23, i8 noundef zeroext %24), !dbg !2934
  store i8 %25, ptr %9, align 1, !dbg !2935
  br label %26, !dbg !2936

26:                                               ; preds = %15
  %27 = load i32, ptr %10, align 4, !dbg !2937
  %28 = add nsw i32 %27, 1, !dbg !2937
  store i32 %28, ptr %10, align 4, !dbg !2937
  %29 = load i32, ptr %8, align 4, !dbg !2938
  %30 = load ptr, ptr %6, align 8, !dbg !2939
  %31 = sext i32 %29 to i64, !dbg !2939
  %32 = getelementptr inbounds i8, ptr %30, i64 %31, !dbg !2939
  store ptr %32, ptr %6, align 8, !dbg !2939
  br label %11, !dbg !2940, !llvm.loop !2941

33:                                               ; preds = %11
  %34 = load i8, ptr %9, align 1, !dbg !2943
  ret i8 %34, !dbg !2944
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #0 !dbg !2945 {
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %6 = alloca i8, align 1
  %7 = alloca i8, align 1
  store i8 %0, ptr %3, align 1
    #dbg_declare(ptr %3, !2946, !DIExpression(), !2947)
  store i8 %1, ptr %4, align 1
    #dbg_declare(ptr %4, !2948, !DIExpression(), !2949)
    #dbg_declare(ptr %5, !2950, !DIExpression(), !2951)
  %8 = load volatile i8, ptr @unsigned_char_blocker, align 1, !dbg !2952
  %9 = zext i8 %8 to i32, !dbg !2952
  %10 = load i8, ptr %3, align 1, !dbg !2953
  %11 = zext i8 %10 to i32, !dbg !2953
  %12 = xor i32 %11, %9, !dbg !2953
  %13 = trunc i32 %12 to i8, !dbg !2953
  store i8 %13, ptr %3, align 1, !dbg !2953
  %14 = load i8, ptr %3, align 1, !dbg !2954
  %15 = zext i8 %14 to i32, !dbg !2954
  %16 = and i32 %15, 1, !dbg !2955
  %17 = load i8, ptr %4, align 1, !dbg !2956
  %18 = zext i8 %17 to i32, !dbg !2956
  %19 = mul nsw i32 %16, %18, !dbg !2957
  %20 = trunc i32 %19 to i8, !dbg !2958
  store i8 %20, ptr %5, align 1, !dbg !2959
  %21 = load i8, ptr %3, align 1, !dbg !2960
  %22 = zext i8 %21 to i32, !dbg !2960
  %23 = and i32 %22, 2, !dbg !2961
  %24 = load i8, ptr %4, align 1, !dbg !2962
  %25 = zext i8 %24 to i32, !dbg !2962
  %26 = mul nsw i32 %23, %25, !dbg !2963
  %27 = load i8, ptr %5, align 1, !dbg !2964
  %28 = zext i8 %27 to i32, !dbg !2964
  %29 = xor i32 %28, %26, !dbg !2964
  %30 = trunc i32 %29 to i8, !dbg !2964
  store i8 %30, ptr %5, align 1, !dbg !2964
  %31 = load i8, ptr %3, align 1, !dbg !2965
  %32 = zext i8 %31 to i32, !dbg !2965
  %33 = and i32 %32, 4, !dbg !2966
  %34 = load i8, ptr %4, align 1, !dbg !2967
  %35 = zext i8 %34 to i32, !dbg !2967
  %36 = mul nsw i32 %33, %35, !dbg !2968
  %37 = load i8, ptr %5, align 1, !dbg !2969
  %38 = zext i8 %37 to i32, !dbg !2969
  %39 = xor i32 %38, %36, !dbg !2969
  %40 = trunc i32 %39 to i8, !dbg !2969
  store i8 %40, ptr %5, align 1, !dbg !2969
  %41 = load i8, ptr %3, align 1, !dbg !2970
  %42 = zext i8 %41 to i32, !dbg !2970
  %43 = and i32 %42, 8, !dbg !2971
  %44 = load i8, ptr %4, align 1, !dbg !2972
  %45 = zext i8 %44 to i32, !dbg !2972
  %46 = mul nsw i32 %43, %45, !dbg !2973
  %47 = load i8, ptr %5, align 1, !dbg !2974
  %48 = zext i8 %47 to i32, !dbg !2974
  %49 = xor i32 %48, %46, !dbg !2974
  %50 = trunc i32 %49 to i8, !dbg !2974
  store i8 %50, ptr %5, align 1, !dbg !2974
    #dbg_declare(ptr %6, !2975, !DIExpression(), !2976)
  %51 = load i8, ptr %5, align 1, !dbg !2977
  %52 = zext i8 %51 to i32, !dbg !2977
  %53 = and i32 %52, 240, !dbg !2978
  %54 = trunc i32 %53 to i8, !dbg !2977
  store i8 %54, ptr %6, align 1, !dbg !2976
    #dbg_declare(ptr %7, !2979, !DIExpression(), !2980)
  %55 = load i8, ptr %5, align 1, !dbg !2981
  %56 = zext i8 %55 to i32, !dbg !2981
  %57 = load i8, ptr %6, align 1, !dbg !2982
  %58 = zext i8 %57 to i32, !dbg !2982
  %59 = ashr i32 %58, 4, !dbg !2983
  %60 = xor i32 %56, %59, !dbg !2984
  %61 = load i8, ptr %6, align 1, !dbg !2985
  %62 = zext i8 %61 to i32, !dbg !2985
  %63 = ashr i32 %62, 3, !dbg !2986
  %64 = xor i32 %60, %63, !dbg !2987
  %65 = and i32 %64, 15, !dbg !2988
  %66 = trunc i32 %65 to i8, !dbg !2989
  store i8 %66, ptr %7, align 1, !dbg !2980
  %67 = load i8, ptr %7, align 1, !dbg !2990
  ret i8 %67, !dbg !2991
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @transpose_16x16_nibbles(ptr noundef %0) #0 !dbg !63 {
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
    #dbg_declare(ptr %2, !2992, !DIExpression(), !2993)
    #dbg_declare(ptr %3, !2994, !DIExpression(), !2996)
  store i64 0, ptr %3, align 8, !dbg !2996
  br label %13, !dbg !2997

13:                                               ; preds = %43, %1
  %14 = load i64, ptr %3, align 8, !dbg !2998
  %15 = icmp ult i64 %14, 16, !dbg !3000
  br i1 %15, label %16, label %46, !dbg !3001

16:                                               ; preds = %13
    #dbg_declare(ptr %4, !3002, !DIExpression(), !3004)
  %17 = load ptr, ptr %2, align 8, !dbg !3005
  %18 = load i64, ptr %3, align 8, !dbg !3006
  %19 = getelementptr inbounds nuw i64, ptr %17, i64 %18, !dbg !3005
  %20 = load i64, ptr %19, align 8, !dbg !3005
  %21 = lshr i64 %20, 4, !dbg !3007
  %22 = load ptr, ptr %2, align 8, !dbg !3008
  %23 = load i64, ptr %3, align 8, !dbg !3009
  %24 = add i64 %23, 1, !dbg !3010
  %25 = getelementptr inbounds nuw i64, ptr %22, i64 %24, !dbg !3008
  %26 = load i64, ptr %25, align 8, !dbg !3008
  %27 = xor i64 %21, %26, !dbg !3011
  %28 = and i64 %27, 1085102592571150095, !dbg !3012
  store i64 %28, ptr %4, align 8, !dbg !3004
  %29 = load i64, ptr %4, align 8, !dbg !3013
  %30 = shl i64 %29, 4, !dbg !3014
  %31 = load ptr, ptr %2, align 8, !dbg !3015
  %32 = load i64, ptr %3, align 8, !dbg !3016
  %33 = getelementptr inbounds nuw i64, ptr %31, i64 %32, !dbg !3015
  %34 = load i64, ptr %33, align 8, !dbg !3017
  %35 = xor i64 %34, %30, !dbg !3017
  store i64 %35, ptr %33, align 8, !dbg !3017
  %36 = load i64, ptr %4, align 8, !dbg !3018
  %37 = load ptr, ptr %2, align 8, !dbg !3019
  %38 = load i64, ptr %3, align 8, !dbg !3020
  %39 = add i64 %38, 1, !dbg !3021
  %40 = getelementptr inbounds nuw i64, ptr %37, i64 %39, !dbg !3019
  %41 = load i64, ptr %40, align 8, !dbg !3022
  %42 = xor i64 %41, %36, !dbg !3022
  store i64 %42, ptr %40, align 8, !dbg !3022
  br label %43, !dbg !3023

43:                                               ; preds = %16
  %44 = load i64, ptr %3, align 8, !dbg !3024
  %45 = add i64 %44, 2, !dbg !3024
  store i64 %45, ptr %3, align 8, !dbg !3024
  br label %13, !dbg !3025, !llvm.loop !3026

46:                                               ; preds = %13
    #dbg_declare(ptr %5, !3028, !DIExpression(), !3030)
  store i64 0, ptr %5, align 8, !dbg !3030
  br label %47, !dbg !3031

47:                                               ; preds = %105, %46
  %48 = load i64, ptr %5, align 8, !dbg !3032
  %49 = icmp ult i64 %48, 16, !dbg !3034
  br i1 %49, label %50, label %108, !dbg !3035

50:                                               ; preds = %47
    #dbg_declare(ptr %6, !3036, !DIExpression(), !3038)
  %51 = load ptr, ptr %2, align 8, !dbg !3039
  %52 = load i64, ptr %5, align 8, !dbg !3040
  %53 = getelementptr inbounds nuw i64, ptr %51, i64 %52, !dbg !3039
  %54 = load i64, ptr %53, align 8, !dbg !3039
  %55 = lshr i64 %54, 8, !dbg !3041
  %56 = load ptr, ptr %2, align 8, !dbg !3042
  %57 = load i64, ptr %5, align 8, !dbg !3043
  %58 = add i64 %57, 2, !dbg !3044
  %59 = getelementptr inbounds nuw i64, ptr %56, i64 %58, !dbg !3042
  %60 = load i64, ptr %59, align 8, !dbg !3042
  %61 = xor i64 %55, %60, !dbg !3045
  %62 = and i64 %61, 71777214294589695, !dbg !3046
  store i64 %62, ptr %6, align 8, !dbg !3038
    #dbg_declare(ptr %7, !3047, !DIExpression(), !3048)
  %63 = load ptr, ptr %2, align 8, !dbg !3049
  %64 = load i64, ptr %5, align 8, !dbg !3050
  %65 = add i64 %64, 1, !dbg !3051
  %66 = getelementptr inbounds nuw i64, ptr %63, i64 %65, !dbg !3049
  %67 = load i64, ptr %66, align 8, !dbg !3049
  %68 = lshr i64 %67, 8, !dbg !3052
  %69 = load ptr, ptr %2, align 8, !dbg !3053
  %70 = load i64, ptr %5, align 8, !dbg !3054
  %71 = add i64 %70, 3, !dbg !3055
  %72 = getelementptr inbounds nuw i64, ptr %69, i64 %71, !dbg !3053
  %73 = load i64, ptr %72, align 8, !dbg !3053
  %74 = xor i64 %68, %73, !dbg !3056
  %75 = and i64 %74, 71777214294589695, !dbg !3057
  store i64 %75, ptr %7, align 8, !dbg !3048
  %76 = load i64, ptr %6, align 8, !dbg !3058
  %77 = shl i64 %76, 8, !dbg !3059
  %78 = load ptr, ptr %2, align 8, !dbg !3060
  %79 = load i64, ptr %5, align 8, !dbg !3061
  %80 = getelementptr inbounds nuw i64, ptr %78, i64 %79, !dbg !3060
  %81 = load i64, ptr %80, align 8, !dbg !3062
  %82 = xor i64 %81, %77, !dbg !3062
  store i64 %82, ptr %80, align 8, !dbg !3062
  %83 = load i64, ptr %7, align 8, !dbg !3063
  %84 = shl i64 %83, 8, !dbg !3064
  %85 = load ptr, ptr %2, align 8, !dbg !3065
  %86 = load i64, ptr %5, align 8, !dbg !3066
  %87 = add i64 %86, 1, !dbg !3067
  %88 = getelementptr inbounds nuw i64, ptr %85, i64 %87, !dbg !3065
  %89 = load i64, ptr %88, align 8, !dbg !3068
  %90 = xor i64 %89, %84, !dbg !3068
  store i64 %90, ptr %88, align 8, !dbg !3068
  %91 = load i64, ptr %6, align 8, !dbg !3069
  %92 = load ptr, ptr %2, align 8, !dbg !3070
  %93 = load i64, ptr %5, align 8, !dbg !3071
  %94 = add i64 %93, 2, !dbg !3072
  %95 = getelementptr inbounds nuw i64, ptr %92, i64 %94, !dbg !3070
  %96 = load i64, ptr %95, align 8, !dbg !3073
  %97 = xor i64 %96, %91, !dbg !3073
  store i64 %97, ptr %95, align 8, !dbg !3073
  %98 = load i64, ptr %7, align 8, !dbg !3074
  %99 = load ptr, ptr %2, align 8, !dbg !3075
  %100 = load i64, ptr %5, align 8, !dbg !3076
  %101 = add i64 %100, 3, !dbg !3077
  %102 = getelementptr inbounds nuw i64, ptr %99, i64 %101, !dbg !3075
  %103 = load i64, ptr %102, align 8, !dbg !3078
  %104 = xor i64 %103, %98, !dbg !3078
  store i64 %104, ptr %102, align 8, !dbg !3078
  br label %105, !dbg !3079

105:                                              ; preds = %50
  %106 = load i64, ptr %5, align 8, !dbg !3080
  %107 = add i64 %106, 4, !dbg !3080
  store i64 %107, ptr %5, align 8, !dbg !3080
  br label %47, !dbg !3081, !llvm.loop !3082

108:                                              ; preds = %47
    #dbg_declare(ptr %8, !3084, !DIExpression(), !3086)
  store i64 0, ptr %8, align 8, !dbg !3086
  br label %109, !dbg !3087

109:                                              ; preds = %167, %108
  %110 = load i64, ptr %8, align 8, !dbg !3088
  %111 = icmp ult i64 %110, 4, !dbg !3090
  br i1 %111, label %112, label %170, !dbg !3091

112:                                              ; preds = %109
    #dbg_declare(ptr %9, !3092, !DIExpression(), !3094)
  %113 = load ptr, ptr %2, align 8, !dbg !3095
  %114 = load i64, ptr %8, align 8, !dbg !3096
  %115 = getelementptr inbounds nuw i64, ptr %113, i64 %114, !dbg !3095
  %116 = load i64, ptr %115, align 8, !dbg !3095
  %117 = lshr i64 %116, 16, !dbg !3097
  %118 = load ptr, ptr %2, align 8, !dbg !3098
  %119 = load i64, ptr %8, align 8, !dbg !3099
  %120 = add i64 %119, 4, !dbg !3100
  %121 = getelementptr inbounds nuw i64, ptr %118, i64 %120, !dbg !3098
  %122 = load i64, ptr %121, align 8, !dbg !3098
  %123 = xor i64 %117, %122, !dbg !3101
  %124 = and i64 %123, 281470681808895, !dbg !3102
  store i64 %124, ptr %9, align 8, !dbg !3094
    #dbg_declare(ptr %10, !3103, !DIExpression(), !3104)
  %125 = load ptr, ptr %2, align 8, !dbg !3105
  %126 = load i64, ptr %8, align 8, !dbg !3106
  %127 = add i64 %126, 8, !dbg !3107
  %128 = getelementptr inbounds nuw i64, ptr %125, i64 %127, !dbg !3105
  %129 = load i64, ptr %128, align 8, !dbg !3105
  %130 = lshr i64 %129, 16, !dbg !3108
  %131 = load ptr, ptr %2, align 8, !dbg !3109
  %132 = load i64, ptr %8, align 8, !dbg !3110
  %133 = add i64 %132, 12, !dbg !3111
  %134 = getelementptr inbounds nuw i64, ptr %131, i64 %133, !dbg !3109
  %135 = load i64, ptr %134, align 8, !dbg !3109
  %136 = xor i64 %130, %135, !dbg !3112
  %137 = and i64 %136, 281470681808895, !dbg !3113
  store i64 %137, ptr %10, align 8, !dbg !3104
  %138 = load i64, ptr %9, align 8, !dbg !3114
  %139 = shl i64 %138, 16, !dbg !3115
  %140 = load ptr, ptr %2, align 8, !dbg !3116
  %141 = load i64, ptr %8, align 8, !dbg !3117
  %142 = getelementptr inbounds nuw i64, ptr %140, i64 %141, !dbg !3116
  %143 = load i64, ptr %142, align 8, !dbg !3118
  %144 = xor i64 %143, %139, !dbg !3118
  store i64 %144, ptr %142, align 8, !dbg !3118
  %145 = load i64, ptr %10, align 8, !dbg !3119
  %146 = shl i64 %145, 16, !dbg !3120
  %147 = load ptr, ptr %2, align 8, !dbg !3121
  %148 = load i64, ptr %8, align 8, !dbg !3122
  %149 = add i64 %148, 8, !dbg !3123
  %150 = getelementptr inbounds nuw i64, ptr %147, i64 %149, !dbg !3121
  %151 = load i64, ptr %150, align 8, !dbg !3124
  %152 = xor i64 %151, %146, !dbg !3124
  store i64 %152, ptr %150, align 8, !dbg !3124
  %153 = load i64, ptr %9, align 8, !dbg !3125
  %154 = load ptr, ptr %2, align 8, !dbg !3126
  %155 = load i64, ptr %8, align 8, !dbg !3127
  %156 = add i64 %155, 4, !dbg !3128
  %157 = getelementptr inbounds nuw i64, ptr %154, i64 %156, !dbg !3126
  %158 = load i64, ptr %157, align 8, !dbg !3129
  %159 = xor i64 %158, %153, !dbg !3129
  store i64 %159, ptr %157, align 8, !dbg !3129
  %160 = load i64, ptr %10, align 8, !dbg !3130
  %161 = load ptr, ptr %2, align 8, !dbg !3131
  %162 = load i64, ptr %8, align 8, !dbg !3132
  %163 = add i64 %162, 12, !dbg !3133
  %164 = getelementptr inbounds nuw i64, ptr %161, i64 %163, !dbg !3131
  %165 = load i64, ptr %164, align 8, !dbg !3134
  %166 = xor i64 %165, %160, !dbg !3134
  store i64 %166, ptr %164, align 8, !dbg !3134
  br label %167, !dbg !3135

167:                                              ; preds = %112
  %168 = load i64, ptr %8, align 8, !dbg !3136
  %169 = add i64 %168, 1, !dbg !3136
  store i64 %169, ptr %8, align 8, !dbg !3136
  br label %109, !dbg !3137, !llvm.loop !3138

170:                                              ; preds = %109
    #dbg_declare(ptr %11, !3140, !DIExpression(), !3142)
  store i64 0, ptr %11, align 8, !dbg !3142
  br label %171, !dbg !3143

171:                                              ; preds = %201, %170
  %172 = load i64, ptr %11, align 8, !dbg !3144
  %173 = icmp ult i64 %172, 8, !dbg !3146
  br i1 %173, label %174, label %204, !dbg !3147

174:                                              ; preds = %171
    #dbg_declare(ptr %12, !3148, !DIExpression(), !3150)
  %175 = load ptr, ptr %2, align 8, !dbg !3151
  %176 = load i64, ptr %11, align 8, !dbg !3152
  %177 = getelementptr inbounds nuw i64, ptr %175, i64 %176, !dbg !3151
  %178 = load i64, ptr %177, align 8, !dbg !3151
  %179 = lshr i64 %178, 32, !dbg !3153
  %180 = load ptr, ptr %2, align 8, !dbg !3154
  %181 = load i64, ptr %11, align 8, !dbg !3155
  %182 = add i64 %181, 8, !dbg !3156
  %183 = getelementptr inbounds nuw i64, ptr %180, i64 %182, !dbg !3154
  %184 = load i64, ptr %183, align 8, !dbg !3154
  %185 = xor i64 %179, %184, !dbg !3157
  %186 = and i64 %185, 4294967295, !dbg !3158
  store i64 %186, ptr %12, align 8, !dbg !3150
  %187 = load i64, ptr %12, align 8, !dbg !3159
  %188 = shl i64 %187, 32, !dbg !3160
  %189 = load ptr, ptr %2, align 8, !dbg !3161
  %190 = load i64, ptr %11, align 8, !dbg !3162
  %191 = getelementptr inbounds nuw i64, ptr %189, i64 %190, !dbg !3161
  %192 = load i64, ptr %191, align 8, !dbg !3163
  %193 = xor i64 %192, %188, !dbg !3163
  store i64 %193, ptr %191, align 8, !dbg !3163
  %194 = load i64, ptr %12, align 8, !dbg !3164
  %195 = load ptr, ptr %2, align 8, !dbg !3165
  %196 = load i64, ptr %11, align 8, !dbg !3166
  %197 = add i64 %196, 8, !dbg !3167
  %198 = getelementptr inbounds nuw i64, ptr %195, i64 %197, !dbg !3165
  %199 = load i64, ptr %198, align 8, !dbg !3168
  %200 = xor i64 %199, %194, !dbg !3168
  store i64 %200, ptr %198, align 8, !dbg !3168
  br label %201, !dbg !3169

201:                                              ; preds = %174
  %202 = load i64, ptr %11, align 8, !dbg !3170
  %203 = add i64 %202, 1, !dbg !3170
  store i64 %203, ptr %11, align 8, !dbg !3170
  br label %171, !dbg !3171, !llvm.loop !3172

204:                                              ; preds = %171
  ret void, !dbg !3174
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_mat_x_m_mat(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6) #0 !dbg !3175 {
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
    #dbg_declare(ptr %8, !3176, !DIExpression(), !3177)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !3178, !DIExpression(), !3179)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !3180, !DIExpression(), !3181)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !3182, !DIExpression(), !3183)
  store i32 %4, ptr %12, align 4
    #dbg_declare(ptr %12, !3184, !DIExpression(), !3185)
  store i32 %5, ptr %13, align 4
    #dbg_declare(ptr %13, !3186, !DIExpression(), !3187)
  store i32 %6, ptr %14, align 4
    #dbg_declare(ptr %14, !3188, !DIExpression(), !3189)
    #dbg_declare(ptr %15, !3190, !DIExpression(), !3192)
  store i32 0, ptr %15, align 4, !dbg !3192
  br label %18, !dbg !3193

18:                                               ; preds = %71, %7
  %19 = load i32, ptr %15, align 4, !dbg !3194
  %20 = load i32, ptr %12, align 4, !dbg !3196
  %21 = icmp slt i32 %19, %20, !dbg !3197
  br i1 %21, label %22, label %74, !dbg !3198

22:                                               ; preds = %18
    #dbg_declare(ptr %16, !3199, !DIExpression(), !3202)
  store i32 0, ptr %16, align 4, !dbg !3202
  br label %23, !dbg !3203

23:                                               ; preds = %67, %22
  %24 = load i32, ptr %16, align 4, !dbg !3204
  %25 = load i32, ptr %13, align 4, !dbg !3206
  %26 = icmp slt i32 %24, %25, !dbg !3207
  br i1 %26, label %27, label %70, !dbg !3208

27:                                               ; preds = %23
    #dbg_declare(ptr %17, !3209, !DIExpression(), !3212)
  store i32 0, ptr %17, align 4, !dbg !3212
  br label %28, !dbg !3213

28:                                               ; preds = %63, %27
  %29 = load i32, ptr %17, align 4, !dbg !3214
  %30 = load i32, ptr %14, align 4, !dbg !3216
  %31 = icmp slt i32 %29, %30, !dbg !3217
  br i1 %31, label %32, label %66, !dbg !3218

32:                                               ; preds = %28
  %33 = load i32, ptr %8, align 4, !dbg !3219
  %34 = load ptr, ptr %10, align 8, !dbg !3221
  %35 = load i32, ptr %8, align 4, !dbg !3222
  %36 = load i32, ptr %16, align 4, !dbg !3223
  %37 = load i32, ptr %14, align 4, !dbg !3224
  %38 = mul nsw i32 %36, %37, !dbg !3225
  %39 = load i32, ptr %17, align 4, !dbg !3226
  %40 = add nsw i32 %38, %39, !dbg !3227
  %41 = mul nsw i32 %35, %40, !dbg !3228
  %42 = sext i32 %41 to i64, !dbg !3229
  %43 = getelementptr inbounds i64, ptr %34, i64 %42, !dbg !3229
  %44 = load ptr, ptr %9, align 8, !dbg !3230
  %45 = load i32, ptr %15, align 4, !dbg !3231
  %46 = load i32, ptr %13, align 4, !dbg !3232
  %47 = mul nsw i32 %45, %46, !dbg !3233
  %48 = load i32, ptr %16, align 4, !dbg !3234
  %49 = add nsw i32 %47, %48, !dbg !3235
  %50 = sext i32 %49 to i64, !dbg !3230
  %51 = getelementptr inbounds i8, ptr %44, i64 %50, !dbg !3230
  %52 = load i8, ptr %51, align 1, !dbg !3230
  %53 = load ptr, ptr %11, align 8, !dbg !3236
  %54 = load i32, ptr %8, align 4, !dbg !3237
  %55 = load i32, ptr %15, align 4, !dbg !3238
  %56 = load i32, ptr %14, align 4, !dbg !3239
  %57 = mul nsw i32 %55, %56, !dbg !3240
  %58 = load i32, ptr %17, align 4, !dbg !3241
  %59 = add nsw i32 %57, %58, !dbg !3242
  %60 = mul nsw i32 %54, %59, !dbg !3243
  %61 = sext i32 %60 to i64, !dbg !3244
  %62 = getelementptr inbounds i64, ptr %53, i64 %61, !dbg !3244
  call void @m_vec_mul_add(i32 noundef %33, ptr noundef %43, i8 noundef zeroext %52, ptr noundef %62), !dbg !3245
  br label %63, !dbg !3246

63:                                               ; preds = %32
  %64 = load i32, ptr %17, align 4, !dbg !3247
  %65 = add nsw i32 %64, 1, !dbg !3247
  store i32 %65, ptr %17, align 4, !dbg !3247
  br label %28, !dbg !3248, !llvm.loop !3249

66:                                               ; preds = %28
  br label %67, !dbg !3251

67:                                               ; preds = %66
  %68 = load i32, ptr %16, align 4, !dbg !3252
  %69 = add nsw i32 %68, 1, !dbg !3252
  store i32 %69, ptr %16, align 4, !dbg !3252
  br label %23, !dbg !3253, !llvm.loop !3254

70:                                               ; preds = %23
  br label %71, !dbg !3256

71:                                               ; preds = %70
  %72 = load i32, ptr %15, align 4, !dbg !3257
  %73 = add nsw i32 %72, 1, !dbg !3257
  store i32 %73, ptr %15, align 4, !dbg !3257
  br label %18, !dbg !3258, !llvm.loop !3259

74:                                               ; preds = %18
  ret void, !dbg !3261
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @P1_times_Vt(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !3262 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8
    #dbg_declare(ptr %5, !3263, !DIExpression(), !3264)
  store ptr %1, ptr %6, align 8
    #dbg_declare(ptr %6, !3265, !DIExpression(), !3266)
  store ptr %2, ptr %7, align 8
    #dbg_declare(ptr %7, !3267, !DIExpression(), !3268)
  store ptr %3, ptr %8, align 8
    #dbg_declare(ptr %8, !3269, !DIExpression(), !3270)
  %9 = load ptr, ptr %5, align 8, !dbg !3271
  %10 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %9, i32 0, i32 21, !dbg !3272
  %11 = load i32, ptr %10, align 4, !dbg !3272
  %12 = load ptr, ptr %6, align 8, !dbg !3273
  %13 = load ptr, ptr %7, align 8, !dbg !3274
  %14 = load ptr, ptr %8, align 8, !dbg !3275
  %15 = load ptr, ptr %5, align 8, !dbg !3276
  %16 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %15, i32 0, i32 1, !dbg !3277
  %17 = load i32, ptr %16, align 4, !dbg !3277
  %18 = load ptr, ptr %5, align 8, !dbg !3276
  %19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 2, !dbg !3277
  %20 = load i32, ptr %19, align 8, !dbg !3277
  %21 = sub nsw i32 %17, %20, !dbg !3277
  %22 = load ptr, ptr %5, align 8, !dbg !3278
  %23 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %22, i32 0, i32 1, !dbg !3279
  %24 = load i32, ptr %23, align 4, !dbg !3279
  %25 = load ptr, ptr %5, align 8, !dbg !3278
  %26 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %25, i32 0, i32 2, !dbg !3279
  %27 = load i32, ptr %26, align 8, !dbg !3279
  %28 = sub nsw i32 %24, %27, !dbg !3279
  %29 = load ptr, ptr %5, align 8, !dbg !3280
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 3, !dbg !3281
  %31 = load i32, ptr %30, align 4, !dbg !3281
  call void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %11, ptr noundef %12, ptr noundef %13, ptr noundef %14, i32 noundef %21, i32 noundef %28, i32 noundef %31, i32 noundef 1), !dbg !3282
  ret void, !dbg !3283
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7) #0 !dbg !3284 {
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
    #dbg_declare(ptr %9, !3285, !DIExpression(), !3286)
  store ptr %1, ptr %10, align 8
    #dbg_declare(ptr %10, !3287, !DIExpression(), !3288)
  store ptr %2, ptr %11, align 8
    #dbg_declare(ptr %11, !3289, !DIExpression(), !3290)
  store ptr %3, ptr %12, align 8
    #dbg_declare(ptr %12, !3291, !DIExpression(), !3292)
  store i32 %4, ptr %13, align 4
    #dbg_declare(ptr %13, !3293, !DIExpression(), !3294)
  store i32 %5, ptr %14, align 4
    #dbg_declare(ptr %14, !3295, !DIExpression(), !3296)
  store i32 %6, ptr %15, align 4
    #dbg_declare(ptr %15, !3297, !DIExpression(), !3298)
  store i32 %7, ptr %16, align 4
    #dbg_declare(ptr %16, !3299, !DIExpression(), !3300)
    #dbg_declare(ptr %17, !3301, !DIExpression(), !3302)
  store i32 0, ptr %17, align 4, !dbg !3302
    #dbg_declare(ptr %18, !3303, !DIExpression(), !3305)
  store i32 0, ptr %18, align 4, !dbg !3305
  br label %21, !dbg !3306

21:                                               ; preds = %75, %8
  %22 = load i32, ptr %18, align 4, !dbg !3307
  %23 = load i32, ptr %13, align 4, !dbg !3309
  %24 = icmp slt i32 %22, %23, !dbg !3310
  br i1 %24, label %25, label %78, !dbg !3311

25:                                               ; preds = %21
    #dbg_declare(ptr %19, !3312, !DIExpression(), !3315)
  %26 = load i32, ptr %16, align 4, !dbg !3316
  %27 = load i32, ptr %18, align 4, !dbg !3317
  %28 = mul nsw i32 %26, %27, !dbg !3318
  store i32 %28, ptr %19, align 4, !dbg !3315
  br label %29, !dbg !3319

29:                                               ; preds = %71, %25
  %30 = load i32, ptr %19, align 4, !dbg !3320
  %31 = load i32, ptr %14, align 4, !dbg !3322
  %32 = icmp slt i32 %30, %31, !dbg !3323
  br i1 %32, label %33, label %74, !dbg !3324

33:                                               ; preds = %29
    #dbg_declare(ptr %20, !3325, !DIExpression(), !3328)
  store i32 0, ptr %20, align 4, !dbg !3328
  br label %34, !dbg !3329

34:                                               ; preds = %65, %33
  %35 = load i32, ptr %20, align 4, !dbg !3330
  %36 = load i32, ptr %15, align 4, !dbg !3332
  %37 = icmp slt i32 %35, %36, !dbg !3333
  br i1 %37, label %38, label %68, !dbg !3334

38:                                               ; preds = %34
  %39 = load i32, ptr %9, align 4, !dbg !3335
  %40 = load ptr, ptr %10, align 8, !dbg !3337
  %41 = load i32, ptr %9, align 4, !dbg !3338
  %42 = load i32, ptr %17, align 4, !dbg !3339
  %43 = mul nsw i32 %41, %42, !dbg !3340
  %44 = sext i32 %43 to i64, !dbg !3341
  %45 = getelementptr inbounds i64, ptr %40, i64 %44, !dbg !3341
  %46 = load ptr, ptr %11, align 8, !dbg !3342
  %47 = load i32, ptr %20, align 4, !dbg !3343
  %48 = load i32, ptr %14, align 4, !dbg !3344
  %49 = mul nsw i32 %47, %48, !dbg !3345
  %50 = load i32, ptr %19, align 4, !dbg !3346
  %51 = add nsw i32 %49, %50, !dbg !3347
  %52 = sext i32 %51 to i64, !dbg !3342
  %53 = getelementptr inbounds i8, ptr %46, i64 %52, !dbg !3342
  %54 = load i8, ptr %53, align 1, !dbg !3342
  %55 = load ptr, ptr %12, align 8, !dbg !3348
  %56 = load i32, ptr %9, align 4, !dbg !3349
  %57 = load i32, ptr %18, align 4, !dbg !3350
  %58 = load i32, ptr %15, align 4, !dbg !3351
  %59 = mul nsw i32 %57, %58, !dbg !3352
  %60 = load i32, ptr %20, align 4, !dbg !3353
  %61 = add nsw i32 %59, %60, !dbg !3354
  %62 = mul nsw i32 %56, %61, !dbg !3355
  %63 = sext i32 %62 to i64, !dbg !3356
  %64 = getelementptr inbounds i64, ptr %55, i64 %63, !dbg !3356
  call void @m_vec_mul_add(i32 noundef %39, ptr noundef %45, i8 noundef zeroext %54, ptr noundef %64), !dbg !3357
  br label %65, !dbg !3358

65:                                               ; preds = %38
  %66 = load i32, ptr %20, align 4, !dbg !3359
  %67 = add nsw i32 %66, 1, !dbg !3359
  store i32 %67, ptr %20, align 4, !dbg !3359
  br label %34, !dbg !3360, !llvm.loop !3361

68:                                               ; preds = %34
  %69 = load i32, ptr %17, align 4, !dbg !3363
  %70 = add nsw i32 %69, 1, !dbg !3363
  store i32 %70, ptr %17, align 4, !dbg !3363
  br label %71, !dbg !3364

71:                                               ; preds = %68
  %72 = load i32, ptr %19, align 4, !dbg !3365
  %73 = add nsw i32 %72, 1, !dbg !3365
  store i32 %73, ptr %19, align 4, !dbg !3365
  br label %29, !dbg !3366, !llvm.loop !3367

74:                                               ; preds = %29
  br label %75, !dbg !3369

75:                                               ; preds = %74
  %76 = load i32, ptr %18, align 4, !dbg !3370
  %77 = add nsw i32 %76, 1, !dbg !3370
  store i32 %77, ptr %18, align 4, !dbg !3370
  br label %21, !dbg !3371, !llvm.loop !3372

78:                                               ; preds = %21
  ret void, !dbg !3374
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_sign(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4, ptr noundef %5) #0 !dbg !3375 {
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
    #dbg_declare(ptr %7, !3376, !DIExpression(), !3377)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !3378, !DIExpression(), !3379)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !3380, !DIExpression(), !3381)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !3382, !DIExpression(), !3383)
  store i64 %4, ptr %11, align 8
    #dbg_declare(ptr %11, !3384, !DIExpression(), !3385)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !3386, !DIExpression(), !3387)
    #dbg_declare(ptr %13, !3388, !DIExpression(), !3389)
  store i32 0, ptr %13, align 4, !dbg !3389
    #dbg_declare(ptr %14, !3390, !DIExpression(), !3391)
  %16 = load ptr, ptr %7, align 8, !dbg !3392
  %17 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 16, !dbg !3393
  %18 = load i32, ptr %17, align 8, !dbg !3393
  store i32 %18, ptr %14, align 4, !dbg !3391
    #dbg_declare(ptr %15, !3394, !DIExpression(), !3395)
  %19 = load ptr, ptr %8, align 8, !dbg !3396
  %20 = load i32, ptr %14, align 4, !dbg !3397
  %21 = sext i32 %20 to i64, !dbg !3398
  %22 = getelementptr inbounds i8, ptr %19, i64 %21, !dbg !3398
  %23 = load ptr, ptr %10, align 8, !dbg !3399
  %24 = load i64, ptr %11, align 8, !dbg !3400
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %22, ptr align 1 %23, i64 %24, i1 false), !dbg !3398
  %25 = load ptr, ptr %7, align 8, !dbg !3401
  %26 = load ptr, ptr %8, align 8, !dbg !3402
  %27 = load ptr, ptr %8, align 8, !dbg !3403
  %28 = load i32, ptr %14, align 4, !dbg !3404
  %29 = sext i32 %28 to i64, !dbg !3405
  %30 = getelementptr inbounds i8, ptr %27, i64 %29, !dbg !3405
  %31 = load i64, ptr %11, align 8, !dbg !3406
  %32 = load ptr, ptr %12, align 8, !dbg !3407
  %33 = call i32 @mayo_sign_signature(ptr noundef %25, ptr noundef %26, ptr noundef %15, ptr noundef %30, i64 noundef %31, ptr noundef %32), !dbg !3408
  store i32 %33, ptr %13, align 4, !dbg !3409
  %34 = load i32, ptr %13, align 4, !dbg !3410
  %35 = icmp ne i32 %34, 0, !dbg !3412
  br i1 %35, label %41, label %36, !dbg !3413

36:                                               ; preds = %6
  %37 = load i64, ptr %15, align 8, !dbg !3414
  %38 = load i32, ptr %14, align 4, !dbg !3415
  %39 = sext i32 %38 to i64, !dbg !3416
  %40 = icmp ne i64 %37, %39, !dbg !3417
  br i1 %40, label %41, label %46, !dbg !3413

41:                                               ; preds = %36, %6
  %42 = load ptr, ptr %8, align 8, !dbg !3418
  %43 = load i64, ptr %15, align 8, !dbg !3420
  %44 = load i64, ptr %11, align 8, !dbg !3421
  %45 = add i64 %43, %44, !dbg !3422
  call void @llvm.memset.p0.i64(ptr align 1 %42, i8 0, i64 %45, i1 false), !dbg !3423
  br label %51, !dbg !3424

46:                                               ; preds = %36
  %47 = load i64, ptr %15, align 8, !dbg !3425
  %48 = load i64, ptr %11, align 8, !dbg !3426
  %49 = add i64 %47, %48, !dbg !3427
  %50 = load ptr, ptr %9, align 8, !dbg !3428
  store i64 %49, ptr %50, align 8, !dbg !3429
  br label %51, !dbg !3430

51:                                               ; preds = %46, %41
    #dbg_label(!3431, !3432)
  %52 = load i32, ptr %13, align 4, !dbg !3433
  ret i32 %52, !dbg !3434
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_open(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i64 noundef %4, ptr noundef %5) #0 !dbg !3435 {
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
    #dbg_declare(ptr %8, !3436, !DIExpression(), !3437)
  store ptr %1, ptr %9, align 8
    #dbg_declare(ptr %9, !3438, !DIExpression(), !3439)
  store ptr %2, ptr %10, align 8
    #dbg_declare(ptr %10, !3440, !DIExpression(), !3441)
  store ptr %3, ptr %11, align 8
    #dbg_declare(ptr %11, !3442, !DIExpression(), !3443)
  store i64 %4, ptr %12, align 8
    #dbg_declare(ptr %12, !3444, !DIExpression(), !3445)
  store ptr %5, ptr %13, align 8
    #dbg_declare(ptr %13, !3446, !DIExpression(), !3447)
    #dbg_declare(ptr %14, !3448, !DIExpression(), !3449)
  %16 = load ptr, ptr %8, align 8, !dbg !3450
  %17 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %16, i32 0, i32 16, !dbg !3451
  %18 = load i32, ptr %17, align 8, !dbg !3451
  store i32 %18, ptr %14, align 4, !dbg !3449
  %19 = load i64, ptr %12, align 8, !dbg !3452
  %20 = load i32, ptr %14, align 4, !dbg !3454
  %21 = sext i32 %20 to i64, !dbg !3455
  %22 = icmp ult i64 %19, %21, !dbg !3456
  br i1 %22, label %23, label %24, !dbg !3456

23:                                               ; preds = %6
  store i32 1, ptr %7, align 4, !dbg !3457
  br label %54, !dbg !3457

24:                                               ; preds = %6
    #dbg_declare(ptr %15, !3459, !DIExpression(), !3460)
  %25 = load ptr, ptr %8, align 8, !dbg !3461
  %26 = load ptr, ptr %11, align 8, !dbg !3462
  %27 = load i32, ptr %14, align 4, !dbg !3463
  %28 = sext i32 %27 to i64, !dbg !3464
  %29 = getelementptr inbounds i8, ptr %26, i64 %28, !dbg !3464
  %30 = load i64, ptr %12, align 8, !dbg !3465
  %31 = load i32, ptr %14, align 4, !dbg !3466
  %32 = sext i32 %31 to i64, !dbg !3466
  %33 = sub i64 %30, %32, !dbg !3467
  %34 = load ptr, ptr %11, align 8, !dbg !3468
  %35 = load ptr, ptr %13, align 8, !dbg !3469
  %36 = call i32 @mayo_verify(ptr noundef %25, ptr noundef %29, i64 noundef %33, ptr noundef %34, ptr noundef %35), !dbg !3470
  store i32 %36, ptr %15, align 4, !dbg !3460
  %37 = load i32, ptr %15, align 4, !dbg !3471
  %38 = icmp eq i32 %37, 0, !dbg !3473
  br i1 %38, label %39, label %52, !dbg !3473

39:                                               ; preds = %24
  %40 = load i64, ptr %12, align 8, !dbg !3474
  %41 = load i32, ptr %14, align 4, !dbg !3476
  %42 = sext i32 %41 to i64, !dbg !3476
  %43 = sub i64 %40, %42, !dbg !3477
  %44 = load ptr, ptr %10, align 8, !dbg !3478
  store i64 %43, ptr %44, align 8, !dbg !3479
  %45 = load ptr, ptr %9, align 8, !dbg !3480
  %46 = load ptr, ptr %11, align 8, !dbg !3481
  %47 = load i32, ptr %14, align 4, !dbg !3482
  %48 = sext i32 %47 to i64, !dbg !3483
  %49 = getelementptr inbounds i8, ptr %46, i64 %48, !dbg !3483
  %50 = load ptr, ptr %10, align 8, !dbg !3484
  %51 = load i64, ptr %50, align 8, !dbg !3485
  call void @llvm.memmove.p0.p0.i64(ptr align 1 %45, ptr align 1 %49, i64 %51, i1 false), !dbg !3483
  br label %52, !dbg !3486

52:                                               ; preds = %39, %24
  %53 = load i32, ptr %15, align 4, !dbg !3487
  store i32 %53, ptr %7, align 4, !dbg !3488
  br label %54, !dbg !3488

54:                                               ; preds = %52, %23
  %55 = load i32, ptr %7, align 4, !dbg !3489
  ret i32 %55, !dbg !3489
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_verify(ptr noundef %0, ptr noundef %1, i64 noundef %2, ptr noundef %3, ptr noundef %4) #0 !dbg !3490 {
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
    #dbg_declare(ptr %7, !3493, !DIExpression(), !3494)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !3495, !DIExpression(), !3496)
  store i64 %2, ptr %9, align 8
    #dbg_declare(ptr %9, !3497, !DIExpression(), !3498)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !3499, !DIExpression(), !3500)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !3501, !DIExpression(), !3502)
    #dbg_declare(ptr %12, !3503, !DIExpression(), !3504)
    #dbg_declare(ptr %13, !3505, !DIExpression(), !3506)
    #dbg_declare(ptr %14, !3507, !DIExpression(), !3511)
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 284, i1 false), !dbg !3511
    #dbg_declare(ptr %15, !3512, !DIExpression(), !3513)
    #dbg_declare(ptr %16, !3514, !DIExpression(), !3518)
  call void @llvm.memset.p0.i64(ptr align 16 %16, i8 0, i64 915840, i1 false), !dbg !3518
    #dbg_declare(ptr %17, !3519, !DIExpression(), !3523)
    #dbg_declare(ptr %18, !3524, !DIExpression(), !3525)
  %29 = load ptr, ptr %7, align 8, !dbg !3526
  %30 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %29, i32 0, i32 0, !dbg !3527
  %31 = load i32, ptr %30, align 8, !dbg !3527
  store i32 %31, ptr %18, align 4, !dbg !3525
    #dbg_declare(ptr %19, !3528, !DIExpression(), !3529)
  %32 = load ptr, ptr %7, align 8, !dbg !3530
  %33 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %32, i32 0, i32 1, !dbg !3531
  %34 = load i32, ptr %33, align 4, !dbg !3531
  store i32 %34, ptr %19, align 4, !dbg !3529
    #dbg_declare(ptr %20, !3532, !DIExpression(), !3533)
  %35 = load ptr, ptr %7, align 8, !dbg !3534
  %36 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %35, i32 0, i32 3, !dbg !3535
  %37 = load i32, ptr %36, align 4, !dbg !3535
  store i32 %37, ptr %20, align 4, !dbg !3533
    #dbg_declare(ptr %21, !3536, !DIExpression(), !3537)
  %38 = load ptr, ptr %7, align 8, !dbg !3538
  %39 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %38, i32 0, i32 6, !dbg !3539
  %40 = load i32, ptr %39, align 8, !dbg !3539
  store i32 %40, ptr %21, align 4, !dbg !3537
    #dbg_declare(ptr %22, !3540, !DIExpression(), !3541)
  %41 = load ptr, ptr %7, align 8, !dbg !3542
  %42 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %41, i32 0, i32 16, !dbg !3543
  %43 = load i32, ptr %42, align 8, !dbg !3543
  store i32 %43, ptr %22, align 4, !dbg !3541
    #dbg_declare(ptr %23, !3544, !DIExpression(), !3545)
  %44 = load ptr, ptr %7, align 8, !dbg !3546
  %45 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %44, i32 0, i32 19, !dbg !3547
  %46 = load i32, ptr %45, align 4, !dbg !3547
  store i32 %46, ptr %23, align 4, !dbg !3545
    #dbg_declare(ptr %24, !3548, !DIExpression(), !3549)
  %47 = load ptr, ptr %7, align 8, !dbg !3550
  %48 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %47, i32 0, i32 17, !dbg !3551
  %49 = load i32, ptr %48, align 4, !dbg !3551
  store i32 %49, ptr %24, align 4, !dbg !3549
    #dbg_declare(ptr %25, !3552, !DIExpression(), !3553)
  %50 = load ptr, ptr %7, align 8, !dbg !3554
  %51 = load ptr, ptr %11, align 8, !dbg !3555
  %52 = getelementptr inbounds [114480 x i64], ptr %16, i64 0, i64 0, !dbg !3556
  %53 = call i32 @mayo_expand_pk(ptr noundef %50, ptr noundef %51, ptr noundef %52), !dbg !3557
  store i32 %53, ptr %25, align 4, !dbg !3553
  %54 = load i32, ptr %25, align 4, !dbg !3558
  %55 = icmp ne i32 %54, 0, !dbg !3560
  br i1 %55, label %56, label %57, !dbg !3560

56:                                               ; preds = %5
  store i32 1, ptr %6, align 4, !dbg !3561
  br label %152, !dbg !3561

57:                                               ; preds = %5
    #dbg_declare(ptr %26, !3563, !DIExpression(), !3564)
  %58 = getelementptr inbounds [114480 x i64], ptr %16, i64 0, i64 0, !dbg !3565
  store ptr %58, ptr %26, align 8, !dbg !3564
    #dbg_declare(ptr %27, !3566, !DIExpression(), !3567)
  %59 = load ptr, ptr %26, align 8, !dbg !3568
  %60 = load ptr, ptr %7, align 8, !dbg !3569
  %61 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %60, i32 0, i32 1, !dbg !3570
  %62 = load i32, ptr %61, align 4, !dbg !3570
  %63 = load ptr, ptr %7, align 8, !dbg !3569
  %64 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %63, i32 0, i32 2, !dbg !3570
  %65 = load i32, ptr %64, align 8, !dbg !3570
  %66 = sub nsw i32 %62, %65, !dbg !3570
  %67 = load ptr, ptr %7, align 8, !dbg !3569
  %68 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %67, i32 0, i32 1, !dbg !3570
  %69 = load i32, ptr %68, align 4, !dbg !3570
  %70 = load ptr, ptr %7, align 8, !dbg !3569
  %71 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %70, i32 0, i32 2, !dbg !3570
  %72 = load i32, ptr %71, align 8, !dbg !3570
  %73 = sub nsw i32 %69, %72, !dbg !3570
  %74 = add nsw i32 %73, 1, !dbg !3570
  %75 = mul nsw i32 %66, %74, !dbg !3570
  %76 = sdiv i32 %75, 2, !dbg !3570
  %77 = load ptr, ptr %7, align 8, !dbg !3569
  %78 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %77, i32 0, i32 21, !dbg !3570
  %79 = load i32, ptr %78, align 4, !dbg !3570
  %80 = mul nsw i32 %76, %79, !dbg !3570
  %81 = sext i32 %80 to i64, !dbg !3571
  %82 = getelementptr inbounds i64, ptr %59, i64 %81, !dbg !3571
  store ptr %82, ptr %27, align 8, !dbg !3567
    #dbg_declare(ptr %28, !3572, !DIExpression(), !3573)
  %83 = load ptr, ptr %27, align 8, !dbg !3574
  %84 = load ptr, ptr %7, align 8, !dbg !3575
  %85 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %84, i32 0, i32 1, !dbg !3576
  %86 = load i32, ptr %85, align 4, !dbg !3576
  %87 = load ptr, ptr %7, align 8, !dbg !3575
  %88 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %87, i32 0, i32 2, !dbg !3576
  %89 = load i32, ptr %88, align 8, !dbg !3576
  %90 = sub nsw i32 %86, %89, !dbg !3576
  %91 = load ptr, ptr %7, align 8, !dbg !3575
  %92 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %91, i32 0, i32 2, !dbg !3576
  %93 = load i32, ptr %92, align 8, !dbg !3576
  %94 = mul nsw i32 %90, %93, !dbg !3576
  %95 = load ptr, ptr %7, align 8, !dbg !3575
  %96 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %95, i32 0, i32 21, !dbg !3576
  %97 = load i32, ptr %96, align 4, !dbg !3576
  %98 = mul nsw i32 %94, %97, !dbg !3576
  %99 = sext i32 %98 to i64, !dbg !3577
  %100 = getelementptr inbounds i64, ptr %83, i64 %99, !dbg !3577
  store ptr %100, ptr %28, align 8, !dbg !3573
  %101 = getelementptr inbounds [104 x i8], ptr %17, i64 0, i64 0, !dbg !3578
  %102 = load i32, ptr %23, align 4, !dbg !3579
  %103 = sext i32 %102 to i64, !dbg !3579
  %104 = load ptr, ptr %8, align 8, !dbg !3580
  %105 = load i64, ptr %9, align 8, !dbg !3581
  %106 = call i32 @shake256(ptr noundef %101, i64 noundef %103, ptr noundef %104, i64 noundef %105), !dbg !3582
  %107 = getelementptr inbounds [104 x i8], ptr %17, i64 0, i64 0, !dbg !3583
  %108 = load i32, ptr %23, align 4, !dbg !3584
  %109 = sext i32 %108 to i64, !dbg !3583
  %110 = getelementptr inbounds i8, ptr %107, i64 %109, !dbg !3583
  %111 = load ptr, ptr %10, align 8, !dbg !3585
  %112 = load i32, ptr %22, align 4, !dbg !3586
  %113 = sext i32 %112 to i64, !dbg !3583
  %114 = getelementptr inbounds i8, ptr %111, i64 %113, !dbg !3583
  %115 = load i32, ptr %24, align 4, !dbg !3587
  %116 = sext i32 %115 to i64, !dbg !3583
  %117 = sub i64 0, %116, !dbg !3583
  %118 = getelementptr inbounds i8, ptr %114, i64 %117, !dbg !3583
  %119 = load i32, ptr %24, align 4, !dbg !3588
  %120 = sext i32 %119 to i64, !dbg !3588
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %110, ptr align 1 %118, i64 %120, i1 false), !dbg !3583
  %121 = getelementptr inbounds [71 x i8], ptr %12, i64 0, i64 0, !dbg !3589
  %122 = load i32, ptr %21, align 4, !dbg !3590
  %123 = sext i32 %122 to i64, !dbg !3590
  %124 = getelementptr inbounds [104 x i8], ptr %17, i64 0, i64 0, !dbg !3591
  %125 = load i32, ptr %23, align 4, !dbg !3592
  %126 = load i32, ptr %24, align 4, !dbg !3593
  %127 = add nsw i32 %125, %126, !dbg !3594
  %128 = sext i32 %127 to i64, !dbg !3592
  %129 = call i32 @shake256(ptr noundef %121, i64 noundef %123, ptr noundef %124, i64 noundef %128), !dbg !3595
  %130 = getelementptr inbounds [71 x i8], ptr %12, i64 0, i64 0, !dbg !3596
  %131 = getelementptr inbounds [142 x i8], ptr %13, i64 0, i64 0, !dbg !3597
  %132 = load i32, ptr %18, align 4, !dbg !3598
  call void @decode(ptr noundef %130, ptr noundef %131, i32 noundef %132), !dbg !3599
  %133 = load ptr, ptr %10, align 8, !dbg !3600
  %134 = getelementptr inbounds [1848 x i8], ptr %15, i64 0, i64 0, !dbg !3601
  %135 = load i32, ptr %20, align 4, !dbg !3602
  %136 = load i32, ptr %19, align 4, !dbg !3603
  %137 = mul nsw i32 %135, %136, !dbg !3604
  call void @decode(ptr noundef %133, ptr noundef %134, i32 noundef %137), !dbg !3605
  %138 = load ptr, ptr %7, align 8, !dbg !3606
  %139 = getelementptr inbounds [1848 x i8], ptr %15, i64 0, i64 0, !dbg !3607
  %140 = load ptr, ptr %26, align 8, !dbg !3608
  %141 = load ptr, ptr %27, align 8, !dbg !3609
  %142 = load ptr, ptr %28, align 8, !dbg !3610
  %143 = getelementptr inbounds [284 x i8], ptr %14, i64 0, i64 0, !dbg !3611
  call void @eval_public_map(ptr noundef %138, ptr noundef %139, ptr noundef %140, ptr noundef %141, ptr noundef %142, ptr noundef %143), !dbg !3612
  %144 = getelementptr inbounds [284 x i8], ptr %14, i64 0, i64 0, !dbg !3613
  %145 = getelementptr inbounds [142 x i8], ptr %13, i64 0, i64 0, !dbg !3615
  %146 = load i32, ptr %18, align 4, !dbg !3616
  %147 = sext i32 %146 to i64, !dbg !3616
  %148 = call i32 @memcmp(ptr noundef %144, ptr noundef %145, i64 noundef %147) #8, !dbg !3617
  %149 = icmp eq i32 %148, 0, !dbg !3618
  br i1 %149, label %150, label %151, !dbg !3618

150:                                              ; preds = %57
  store i32 0, ptr %6, align 4, !dbg !3619
  br label %152, !dbg !3619

151:                                              ; preds = %57
  store i32 1, ptr %6, align 4, !dbg !3621
  br label %152, !dbg !3621

152:                                              ; preds = %151, %150, %56
  %153 = load i32, ptr %6, align 4, !dbg !3622
  ret i32 %153, !dbg !3622
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @mayo_expand_pk(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !3623 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8
    #dbg_declare(ptr %4, !3626, !DIExpression(), !3627)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !3628, !DIExpression(), !3629)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !3630, !DIExpression(), !3631)
  %7 = load ptr, ptr %4, align 8, !dbg !3632
  %8 = load ptr, ptr %6, align 8, !dbg !3633
  %9 = load ptr, ptr %5, align 8, !dbg !3634
  call void @expand_P1_P2(ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !3635
  %10 = load ptr, ptr %5, align 8, !dbg !3636
  %11 = load ptr, ptr %4, align 8, !dbg !3637
  %12 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %11, i32 0, i32 20, !dbg !3638
  %13 = load i32, ptr %12, align 8, !dbg !3638
  %14 = sext i32 %13 to i64, !dbg !3639
  %15 = getelementptr inbounds i8, ptr %10, i64 %14, !dbg !3639
  %16 = load ptr, ptr %6, align 8, !dbg !3640
  %17 = load ptr, ptr %4, align 8, !dbg !3641
  %18 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %17, i32 0, i32 1, !dbg !3642
  %19 = load i32, ptr %18, align 4, !dbg !3642
  %20 = load ptr, ptr %4, align 8, !dbg !3641
  %21 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %20, i32 0, i32 2, !dbg !3642
  %22 = load i32, ptr %21, align 8, !dbg !3642
  %23 = sub nsw i32 %19, %22, !dbg !3642
  %24 = load ptr, ptr %4, align 8, !dbg !3641
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 1, !dbg !3642
  %26 = load i32, ptr %25, align 4, !dbg !3642
  %27 = load ptr, ptr %4, align 8, !dbg !3641
  %28 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %27, i32 0, i32 2, !dbg !3642
  %29 = load i32, ptr %28, align 8, !dbg !3642
  %30 = sub nsw i32 %26, %29, !dbg !3642
  %31 = add nsw i32 %30, 1, !dbg !3642
  %32 = mul nsw i32 %23, %31, !dbg !3642
  %33 = sdiv i32 %32, 2, !dbg !3642
  %34 = load ptr, ptr %4, align 8, !dbg !3641
  %35 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %34, i32 0, i32 21, !dbg !3642
  %36 = load i32, ptr %35, align 4, !dbg !3642
  %37 = mul nsw i32 %33, %36, !dbg !3642
  %38 = sext i32 %37 to i64, !dbg !3643
  %39 = getelementptr inbounds i64, ptr %16, i64 %38, !dbg !3643
  %40 = load ptr, ptr %4, align 8, !dbg !3644
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 1, !dbg !3645
  %42 = load i32, ptr %41, align 4, !dbg !3645
  %43 = load ptr, ptr %4, align 8, !dbg !3644
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 2, !dbg !3645
  %45 = load i32, ptr %44, align 8, !dbg !3645
  %46 = sub nsw i32 %42, %45, !dbg !3645
  %47 = load ptr, ptr %4, align 8, !dbg !3644
  %48 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %47, i32 0, i32 2, !dbg !3645
  %49 = load i32, ptr %48, align 8, !dbg !3645
  %50 = mul nsw i32 %46, %49, !dbg !3645
  %51 = load ptr, ptr %4, align 8, !dbg !3644
  %52 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %51, i32 0, i32 21, !dbg !3645
  %53 = load i32, ptr %52, align 4, !dbg !3645
  %54 = mul nsw i32 %50, %53, !dbg !3645
  %55 = sext i32 %54 to i64, !dbg !3646
  %56 = getelementptr inbounds i64, ptr %39, i64 %55, !dbg !3646
  %57 = load ptr, ptr %4, align 8, !dbg !3647
  %58 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %57, i32 0, i32 2, !dbg !3648
  %59 = load i32, ptr %58, align 8, !dbg !3648
  %60 = load ptr, ptr %4, align 8, !dbg !3647
  %61 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %60, i32 0, i32 2, !dbg !3648
  %62 = load i32, ptr %61, align 8, !dbg !3648
  %63 = add nsw i32 %62, 1, !dbg !3648
  %64 = mul nsw i32 %59, %63, !dbg !3648
  %65 = sdiv i32 %64, 2, !dbg !3648
  %66 = load ptr, ptr %4, align 8, !dbg !3647
  %67 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %66, i32 0, i32 21, !dbg !3648
  %68 = load i32, ptr %67, align 4, !dbg !3648
  %69 = mul nsw i32 %65, %68, !dbg !3648
  %70 = load ptr, ptr %4, align 8, !dbg !3649
  %71 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %70, i32 0, i32 21, !dbg !3650
  %72 = load i32, ptr %71, align 4, !dbg !3650
  %73 = sdiv i32 %69, %72, !dbg !3651
  %74 = load ptr, ptr %4, align 8, !dbg !3652
  %75 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %74, i32 0, i32 0, !dbg !3653
  %76 = load i32, ptr %75, align 8, !dbg !3653
  call void @unpack_m_vecs(ptr noundef %15, ptr noundef %56, i32 noundef %73, i32 noundef %76), !dbg !3654
  ret i32 0, !dbg !3655
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @eval_public_map(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 !dbg !3656 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca [1296 x i64], align 16
  %14 = alloca [142 x i8], align 16
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !3659, !DIExpression(), !3660)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !3661, !DIExpression(), !3662)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !3663, !DIExpression(), !3664)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !3665, !DIExpression(), !3666)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !3667, !DIExpression(), !3668)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !3669, !DIExpression(), !3670)
    #dbg_declare(ptr %13, !3671, !DIExpression(), !3675)
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 10368, i1 false), !dbg !3675
  %15 = load ptr, ptr %7, align 8, !dbg !3676
  %16 = load ptr, ptr %9, align 8, !dbg !3677
  %17 = load ptr, ptr %10, align 8, !dbg !3678
  %18 = load ptr, ptr %11, align 8, !dbg !3679
  %19 = load ptr, ptr %8, align 8, !dbg !3680
  %20 = getelementptr inbounds [1296 x i64], ptr %13, i64 0, i64 0, !dbg !3681
  call void @m_calculate_PS_SPS(ptr noundef %15, ptr noundef %16, ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %20), !dbg !3682
    #dbg_declare(ptr %14, !3683, !DIExpression(), !3684)
  call void @llvm.memset.p0.i64(ptr align 16 %14, i8 0, i64 142, i1 false), !dbg !3684
  %21 = load ptr, ptr %7, align 8, !dbg !3685
  %22 = getelementptr inbounds [1296 x i64], ptr %13, i64 0, i64 0, !dbg !3686
  %23 = getelementptr inbounds [142 x i8], ptr %14, i64 0, i64 0, !dbg !3687
  %24 = load ptr, ptr %12, align 8, !dbg !3688
  call void @compute_rhs(ptr noundef %21, ptr noundef %22, ptr noundef %23, ptr noundef %24), !dbg !3689
  ret void, !dbg !3690
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_calculate_PS_SPS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 !dbg !3691 {
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca [16632 x i64], align 16
  store ptr %0, ptr %7, align 8
    #dbg_declare(ptr %7, !3694, !DIExpression(), !3695)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !3696, !DIExpression(), !3697)
  store ptr %2, ptr %9, align 8
    #dbg_declare(ptr %9, !3698, !DIExpression(), !3699)
  store ptr %3, ptr %10, align 8
    #dbg_declare(ptr %10, !3700, !DIExpression(), !3701)
  store ptr %4, ptr %11, align 8
    #dbg_declare(ptr %11, !3702, !DIExpression(), !3703)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !3704, !DIExpression(), !3705)
    #dbg_declare(ptr %13, !3706, !DIExpression(), !3710)
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 133056, i1 false), !dbg !3710
  %14 = load ptr, ptr %8, align 8, !dbg !3711
  %15 = load ptr, ptr %9, align 8, !dbg !3712
  %16 = load ptr, ptr %10, align 8, !dbg !3713
  %17 = load ptr, ptr %11, align 8, !dbg !3714
  %18 = load ptr, ptr %7, align 8, !dbg !3715
  %19 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %18, i32 0, i32 0, !dbg !3716
  %20 = load i32, ptr %19, align 8, !dbg !3716
  %21 = load ptr, ptr %7, align 8, !dbg !3717
  %22 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %21, i32 0, i32 1, !dbg !3718
  %23 = load i32, ptr %22, align 4, !dbg !3718
  %24 = load ptr, ptr %7, align 8, !dbg !3717
  %25 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %24, i32 0, i32 2, !dbg !3718
  %26 = load i32, ptr %25, align 8, !dbg !3718
  %27 = sub nsw i32 %23, %26, !dbg !3718
  %28 = load ptr, ptr %7, align 8, !dbg !3719
  %29 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %28, i32 0, i32 2, !dbg !3720
  %30 = load i32, ptr %29, align 8, !dbg !3720
  %31 = load ptr, ptr %7, align 8, !dbg !3721
  %32 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %31, i32 0, i32 3, !dbg !3722
  %33 = load i32, ptr %32, align 4, !dbg !3722
  %34 = getelementptr inbounds [16632 x i64], ptr %13, i64 0, i64 0, !dbg !3723
  call void @mayo_generic_m_calculate_PS(ptr noundef %14, ptr noundef %15, ptr noundef %16, ptr noundef %17, i32 noundef %20, i32 noundef %27, i32 noundef %30, i32 noundef %33, ptr noundef %34), !dbg !3724
  %35 = getelementptr inbounds [16632 x i64], ptr %13, i64 0, i64 0, !dbg !3725
  %36 = load ptr, ptr %11, align 8, !dbg !3726
  %37 = load ptr, ptr %7, align 8, !dbg !3727
  %38 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %37, i32 0, i32 0, !dbg !3728
  %39 = load i32, ptr %38, align 8, !dbg !3728
  %40 = load ptr, ptr %7, align 8, !dbg !3729
  %41 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %40, i32 0, i32 3, !dbg !3730
  %42 = load i32, ptr %41, align 4, !dbg !3730
  %43 = load ptr, ptr %7, align 8, !dbg !3731
  %44 = getelementptr inbounds nuw %struct.mayo_params_t, ptr %43, i32 0, i32 1, !dbg !3732
  %45 = load i32, ptr %44, align 4, !dbg !3732
  %46 = load ptr, ptr %12, align 8, !dbg !3733
  call void @mayo_generic_m_calculate_SPS(ptr noundef %35, ptr noundef %36, i32 noundef %39, i32 noundef %42, i32 noundef %45, ptr noundef %46), !dbg !3734
  ret void, !dbg !3735
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mayo_generic_m_calculate_PS(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i32 noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, ptr noundef %8) #0 !dbg !3736 {
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
    #dbg_declare(ptr %10, !3739, !DIExpression(), !3740)
  store ptr %1, ptr %11, align 8
    #dbg_declare(ptr %11, !3741, !DIExpression(), !3742)
  store ptr %2, ptr %12, align 8
    #dbg_declare(ptr %12, !3743, !DIExpression(), !3744)
  store ptr %3, ptr %13, align 8
    #dbg_declare(ptr %13, !3745, !DIExpression(), !3746)
  store i32 %4, ptr %14, align 4
    #dbg_declare(ptr %14, !3747, !DIExpression(), !3748)
  store i32 %5, ptr %15, align 4
    #dbg_declare(ptr %15, !3749, !DIExpression(), !3750)
  store i32 %6, ptr %16, align 4
    #dbg_declare(ptr %16, !3751, !DIExpression(), !3752)
  store i32 %7, ptr %17, align 4
    #dbg_declare(ptr %17, !3753, !DIExpression(), !3754)
  store ptr %8, ptr %18, align 8
    #dbg_declare(ptr %18, !3755, !DIExpression(), !3756)
    #dbg_declare(ptr %19, !3757, !DIExpression(), !3758)
  %33 = load i32, ptr %16, align 4, !dbg !3759
  %34 = load i32, ptr %15, align 4, !dbg !3760
  %35 = add nsw i32 %33, %34, !dbg !3761
  store i32 %35, ptr %19, align 4, !dbg !3758
    #dbg_declare(ptr %20, !3762, !DIExpression(), !3763)
  %36 = load i32, ptr %14, align 4, !dbg !3764
  %37 = add nsw i32 %36, 15, !dbg !3765
  %38 = sdiv i32 %37, 16, !dbg !3766
  store i32 %38, ptr %20, align 4, !dbg !3763
    #dbg_declare(ptr %21, !3767, !DIExpression(), !3771)
  call void @llvm.memset.p0.i64(ptr align 16 %21, i8 0, i64 2128896, i1 false), !dbg !3771
    #dbg_declare(ptr %22, !3772, !DIExpression(), !3773)
  store i32 0, ptr %22, align 4, !dbg !3773
    #dbg_declare(ptr %23, !3774, !DIExpression(), !3776)
  store i32 0, ptr %23, align 4, !dbg !3776
  br label %39, !dbg !3777

39:                                               ; preds = %147, %9
  %40 = load i32, ptr %23, align 4, !dbg !3778
  %41 = load i32, ptr %15, align 4, !dbg !3780
  %42 = icmp slt i32 %40, %41, !dbg !3781
  br i1 %42, label %43, label %150, !dbg !3782

43:                                               ; preds = %39
    #dbg_declare(ptr %24, !3783, !DIExpression(), !3786)
  %44 = load i32, ptr %23, align 4, !dbg !3787
  store i32 %44, ptr %24, align 4, !dbg !3786
  br label %45, !dbg !3788

45:                                               ; preds = %90, %43
  %46 = load i32, ptr %24, align 4, !dbg !3789
  %47 = load i32, ptr %15, align 4, !dbg !3791
  %48 = icmp slt i32 %46, %47, !dbg !3792
  br i1 %48, label %49, label %93, !dbg !3793

49:                                               ; preds = %45
    #dbg_declare(ptr %25, !3794, !DIExpression(), !3797)
  store i32 0, ptr %25, align 4, !dbg !3797
  br label %50, !dbg !3798

50:                                               ; preds = %84, %49
  %51 = load i32, ptr %25, align 4, !dbg !3799
  %52 = load i32, ptr %17, align 4, !dbg !3801
  %53 = icmp slt i32 %51, %52, !dbg !3802
  br i1 %53, label %54, label %87, !dbg !3803

54:                                               ; preds = %50
  %55 = load i32, ptr %20, align 4, !dbg !3804
  %56 = load ptr, ptr %10, align 8, !dbg !3806
  %57 = load i32, ptr %22, align 4, !dbg !3807
  %58 = load i32, ptr %20, align 4, !dbg !3808
  %59 = mul nsw i32 %57, %58, !dbg !3809
  %60 = sext i32 %59 to i64, !dbg !3810
  %61 = getelementptr inbounds i64, ptr %56, i64 %60, !dbg !3810
  %62 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0, !dbg !3811
  %63 = load i32, ptr %23, align 4, !dbg !3812
  %64 = load i32, ptr %17, align 4, !dbg !3813
  %65 = mul nsw i32 %63, %64, !dbg !3814
  %66 = load i32, ptr %25, align 4, !dbg !3815
  %67 = add nsw i32 %65, %66, !dbg !3816
  %68 = mul nsw i32 %67, 16, !dbg !3817
  %69 = load ptr, ptr %13, align 8, !dbg !3818
  %70 = load i32, ptr %25, align 4, !dbg !3819
  %71 = load i32, ptr %19, align 4, !dbg !3820
  %72 = mul nsw i32 %70, %71, !dbg !3821
  %73 = load i32, ptr %24, align 4, !dbg !3822
  %74 = add nsw i32 %72, %73, !dbg !3823
  %75 = sext i32 %74 to i64, !dbg !3818
  %76 = getelementptr inbounds i8, ptr %69, i64 %75, !dbg !3818
  %77 = load i8, ptr %76, align 1, !dbg !3818
  %78 = zext i8 %77 to i32, !dbg !3818
  %79 = add nsw i32 %68, %78, !dbg !3824
  %80 = load i32, ptr %20, align 4, !dbg !3825
  %81 = mul nsw i32 %79, %80, !dbg !3826
  %82 = sext i32 %81 to i64, !dbg !3827
  %83 = getelementptr inbounds i64, ptr %62, i64 %82, !dbg !3827
  call void @m_vec_add(i32 noundef %55, ptr noundef %61, ptr noundef %83), !dbg !3828
  br label %84, !dbg !3829

84:                                               ; preds = %54
  %85 = load i32, ptr %25, align 4, !dbg !3830
  %86 = add nsw i32 %85, 1, !dbg !3830
  store i32 %86, ptr %25, align 4, !dbg !3830
  br label %50, !dbg !3831, !llvm.loop !3832

87:                                               ; preds = %50
  %88 = load i32, ptr %22, align 4, !dbg !3834
  %89 = add nsw i32 %88, 1, !dbg !3834
  store i32 %89, ptr %22, align 4, !dbg !3834
  br label %90, !dbg !3835

90:                                               ; preds = %87
  %91 = load i32, ptr %24, align 4, !dbg !3836
  %92 = add nsw i32 %91, 1, !dbg !3836
  store i32 %92, ptr %24, align 4, !dbg !3836
  br label %45, !dbg !3837, !llvm.loop !3838

93:                                               ; preds = %45
    #dbg_declare(ptr %26, !3840, !DIExpression(), !3842)
  store i32 0, ptr %26, align 4, !dbg !3842
  br label %94, !dbg !3843

94:                                               ; preds = %143, %93
  %95 = load i32, ptr %26, align 4, !dbg !3844
  %96 = load i32, ptr %16, align 4, !dbg !3846
  %97 = icmp slt i32 %95, %96, !dbg !3847
  br i1 %97, label %98, label %146, !dbg !3848

98:                                               ; preds = %94
    #dbg_declare(ptr %27, !3849, !DIExpression(), !3852)
  store i32 0, ptr %27, align 4, !dbg !3852
  br label %99, !dbg !3853

99:                                               ; preds = %139, %98
  %100 = load i32, ptr %27, align 4, !dbg !3854
  %101 = load i32, ptr %17, align 4, !dbg !3856
  %102 = icmp slt i32 %100, %101, !dbg !3857
  br i1 %102, label %103, label %142, !dbg !3858

103:                                              ; preds = %99
  %104 = load i32, ptr %20, align 4, !dbg !3859
  %105 = load ptr, ptr %11, align 8, !dbg !3861
  %106 = load i32, ptr %23, align 4, !dbg !3862
  %107 = load i32, ptr %16, align 4, !dbg !3863
  %108 = mul nsw i32 %106, %107, !dbg !3864
  %109 = load i32, ptr %26, align 4, !dbg !3865
  %110 = add nsw i32 %108, %109, !dbg !3866
  %111 = load i32, ptr %20, align 4, !dbg !3867
  %112 = mul nsw i32 %110, %111, !dbg !3868
  %113 = sext i32 %112 to i64, !dbg !3869
  %114 = getelementptr inbounds i64, ptr %105, i64 %113, !dbg !3869
  %115 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0, !dbg !3870
  %116 = load i32, ptr %23, align 4, !dbg !3871
  %117 = load i32, ptr %17, align 4, !dbg !3872
  %118 = mul nsw i32 %116, %117, !dbg !3873
  %119 = load i32, ptr %27, align 4, !dbg !3874
  %120 = add nsw i32 %118, %119, !dbg !3875
  %121 = mul nsw i32 %120, 16, !dbg !3876
  %122 = load ptr, ptr %13, align 8, !dbg !3877
  %123 = load i32, ptr %27, align 4, !dbg !3878
  %124 = load i32, ptr %19, align 4, !dbg !3879
  %125 = mul nsw i32 %123, %124, !dbg !3880
  %126 = load i32, ptr %26, align 4, !dbg !3881
  %127 = add nsw i32 %125, %126, !dbg !3882
  %128 = load i32, ptr %15, align 4, !dbg !3883
  %129 = add nsw i32 %127, %128, !dbg !3884
  %130 = sext i32 %129 to i64, !dbg !3877
  %131 = getelementptr inbounds i8, ptr %122, i64 %130, !dbg !3877
  %132 = load i8, ptr %131, align 1, !dbg !3877
  %133 = zext i8 %132 to i32, !dbg !3877
  %134 = add nsw i32 %121, %133, !dbg !3885
  %135 = load i32, ptr %20, align 4, !dbg !3886
  %136 = mul nsw i32 %134, %135, !dbg !3887
  %137 = sext i32 %136 to i64, !dbg !3888
  %138 = getelementptr inbounds i64, ptr %115, i64 %137, !dbg !3888
  call void @m_vec_add(i32 noundef %104, ptr noundef %114, ptr noundef %138), !dbg !3889
  br label %139, !dbg !3890

139:                                              ; preds = %103
  %140 = load i32, ptr %27, align 4, !dbg !3891
  %141 = add nsw i32 %140, 1, !dbg !3891
  store i32 %141, ptr %27, align 4, !dbg !3891
  br label %99, !dbg !3892, !llvm.loop !3893

142:                                              ; preds = %99
  br label %143, !dbg !3895

143:                                              ; preds = %142
  %144 = load i32, ptr %26, align 4, !dbg !3896
  %145 = add nsw i32 %144, 1, !dbg !3896
  store i32 %145, ptr %26, align 4, !dbg !3896
  br label %94, !dbg !3897, !llvm.loop !3898

146:                                              ; preds = %94
  br label %147, !dbg !3900

147:                                              ; preds = %146
  %148 = load i32, ptr %23, align 4, !dbg !3901
  %149 = add nsw i32 %148, 1, !dbg !3901
  store i32 %149, ptr %23, align 4, !dbg !3901
  br label %39, !dbg !3902, !llvm.loop !3903

150:                                              ; preds = %39
    #dbg_declare(ptr %28, !3905, !DIExpression(), !3906)
  store i32 0, ptr %28, align 4, !dbg !3906
    #dbg_declare(ptr %29, !3907, !DIExpression(), !3909)
  %151 = load i32, ptr %15, align 4, !dbg !3910
  store i32 %151, ptr %29, align 4, !dbg !3909
  br label %152, !dbg !3911

152:                                              ; preds = %207, %150
  %153 = load i32, ptr %29, align 4, !dbg !3912
  %154 = load i32, ptr %19, align 4, !dbg !3914
  %155 = icmp slt i32 %153, %154, !dbg !3915
  br i1 %155, label %156, label %210, !dbg !3916

156:                                              ; preds = %152
    #dbg_declare(ptr %30, !3917, !DIExpression(), !3920)
  %157 = load i32, ptr %29, align 4, !dbg !3921
  store i32 %157, ptr %30, align 4, !dbg !3920
  br label %158, !dbg !3922

158:                                              ; preds = %203, %156
  %159 = load i32, ptr %30, align 4, !dbg !3923
  %160 = load i32, ptr %19, align 4, !dbg !3925
  %161 = icmp slt i32 %159, %160, !dbg !3926
  br i1 %161, label %162, label %206, !dbg !3927

162:                                              ; preds = %158
    #dbg_declare(ptr %31, !3928, !DIExpression(), !3931)
  store i32 0, ptr %31, align 4, !dbg !3931
  br label %163, !dbg !3932

163:                                              ; preds = %197, %162
  %164 = load i32, ptr %31, align 4, !dbg !3933
  %165 = load i32, ptr %17, align 4, !dbg !3935
  %166 = icmp slt i32 %164, %165, !dbg !3936
  br i1 %166, label %167, label %200, !dbg !3937

167:                                              ; preds = %163
  %168 = load i32, ptr %20, align 4, !dbg !3938
  %169 = load ptr, ptr %12, align 8, !dbg !3940
  %170 = load i32, ptr %28, align 4, !dbg !3941
  %171 = load i32, ptr %20, align 4, !dbg !3942
  %172 = mul nsw i32 %170, %171, !dbg !3943
  %173 = sext i32 %172 to i64, !dbg !3944
  %174 = getelementptr inbounds i64, ptr %169, i64 %173, !dbg !3944
  %175 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0, !dbg !3945
  %176 = load i32, ptr %29, align 4, !dbg !3946
  %177 = load i32, ptr %17, align 4, !dbg !3947
  %178 = mul nsw i32 %176, %177, !dbg !3948
  %179 = load i32, ptr %31, align 4, !dbg !3949
  %180 = add nsw i32 %178, %179, !dbg !3950
  %181 = mul nsw i32 %180, 16, !dbg !3951
  %182 = load ptr, ptr %13, align 8, !dbg !3952
  %183 = load i32, ptr %31, align 4, !dbg !3953
  %184 = load i32, ptr %19, align 4, !dbg !3954
  %185 = mul nsw i32 %183, %184, !dbg !3955
  %186 = load i32, ptr %30, align 4, !dbg !3956
  %187 = add nsw i32 %185, %186, !dbg !3957
  %188 = sext i32 %187 to i64, !dbg !3952
  %189 = getelementptr inbounds i8, ptr %182, i64 %188, !dbg !3952
  %190 = load i8, ptr %189, align 1, !dbg !3952
  %191 = zext i8 %190 to i32, !dbg !3952
  %192 = add nsw i32 %181, %191, !dbg !3958
  %193 = load i32, ptr %20, align 4, !dbg !3959
  %194 = mul nsw i32 %192, %193, !dbg !3960
  %195 = sext i32 %194 to i64, !dbg !3961
  %196 = getelementptr inbounds i64, ptr %175, i64 %195, !dbg !3961
  call void @m_vec_add(i32 noundef %168, ptr noundef %174, ptr noundef %196), !dbg !3962
  br label %197, !dbg !3963

197:                                              ; preds = %167
  %198 = load i32, ptr %31, align 4, !dbg !3964
  %199 = add nsw i32 %198, 1, !dbg !3964
  store i32 %199, ptr %31, align 4, !dbg !3964
  br label %163, !dbg !3965, !llvm.loop !3966

200:                                              ; preds = %163
  %201 = load i32, ptr %28, align 4, !dbg !3968
  %202 = add nsw i32 %201, 1, !dbg !3968
  store i32 %202, ptr %28, align 4, !dbg !3968
  br label %203, !dbg !3969

203:                                              ; preds = %200
  %204 = load i32, ptr %30, align 4, !dbg !3970
  %205 = add nsw i32 %204, 1, !dbg !3970
  store i32 %205, ptr %30, align 4, !dbg !3970
  br label %158, !dbg !3971, !llvm.loop !3972

206:                                              ; preds = %158
  br label %207, !dbg !3974

207:                                              ; preds = %206
  %208 = load i32, ptr %29, align 4, !dbg !3975
  %209 = add nsw i32 %208, 1, !dbg !3975
  store i32 %209, ptr %29, align 4, !dbg !3975
  br label %152, !dbg !3976, !llvm.loop !3977

210:                                              ; preds = %152
    #dbg_declare(ptr %32, !3979, !DIExpression(), !3980)
  store i32 0, ptr %32, align 4, !dbg !3980
  br label %211, !dbg !3981

211:                                              ; preds = %217, %210
  %212 = load i32, ptr %32, align 4, !dbg !3982
  %213 = load i32, ptr %19, align 4, !dbg !3983
  %214 = load i32, ptr %17, align 4, !dbg !3984
  %215 = mul nsw i32 %213, %214, !dbg !3985
  %216 = icmp slt i32 %212, %215, !dbg !3986
  br i1 %216, label %217, label %234, !dbg !3981

217:                                              ; preds = %211
  %218 = load i32, ptr %20, align 4, !dbg !3987
  %219 = getelementptr inbounds [266112 x i64], ptr %21, i64 0, i64 0, !dbg !3989
  %220 = load i32, ptr %32, align 4, !dbg !3990
  %221 = mul nsw i32 %220, 16, !dbg !3991
  %222 = load i32, ptr %20, align 4, !dbg !3992
  %223 = mul nsw i32 %221, %222, !dbg !3993
  %224 = sext i32 %223 to i64, !dbg !3994
  %225 = getelementptr inbounds i64, ptr %219, i64 %224, !dbg !3994
  %226 = load ptr, ptr %18, align 8, !dbg !3995
  %227 = load i32, ptr %32, align 4, !dbg !3996
  %228 = load i32, ptr %20, align 4, !dbg !3997
  %229 = mul nsw i32 %227, %228, !dbg !3998
  %230 = sext i32 %229 to i64, !dbg !3999
  %231 = getelementptr inbounds i64, ptr %226, i64 %230, !dbg !3999
  call void @m_vec_multiply_bins(i32 noundef %218, ptr noundef %225, ptr noundef %231), !dbg !4000
  %232 = load i32, ptr %32, align 4, !dbg !4001
  %233 = add nsw i32 %232, 1, !dbg !4001
  store i32 %233, ptr %32, align 4, !dbg !4001
  br label %211, !dbg !3981, !llvm.loop !4002

234:                                              ; preds = %211
  ret void, !dbg !4004
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @mayo_generic_m_calculate_SPS(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, ptr noundef %5) #0 !dbg !4005 {
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
    #dbg_declare(ptr %7, !4008, !DIExpression(), !4009)
  store ptr %1, ptr %8, align 8
    #dbg_declare(ptr %8, !4010, !DIExpression(), !4011)
  store i32 %2, ptr %9, align 4
    #dbg_declare(ptr %9, !4012, !DIExpression(), !4013)
  store i32 %3, ptr %10, align 4
    #dbg_declare(ptr %10, !4014, !DIExpression(), !4015)
  store i32 %4, ptr %11, align 4
    #dbg_declare(ptr %11, !4016, !DIExpression(), !4017)
  store ptr %5, ptr %12, align 8
    #dbg_declare(ptr %12, !4018, !DIExpression(), !4019)
    #dbg_declare(ptr %13, !4020, !DIExpression(), !4024)
  call void @llvm.memset.p0.i64(ptr align 16 %13, i8 0, i64 165888, i1 false), !dbg !4024
    #dbg_declare(ptr %14, !4025, !DIExpression(), !4026)
  %19 = load i32, ptr %9, align 4, !dbg !4027
  %20 = add nsw i32 %19, 15, !dbg !4028
  %21 = sdiv i32 %20, 16, !dbg !4029
  store i32 %21, ptr %14, align 4, !dbg !4026
    #dbg_declare(ptr %15, !4030, !DIExpression(), !4032)
  store i32 0, ptr %15, align 4, !dbg !4032
  br label %22, !dbg !4033

22:                                               ; preds = %78, %6
  %23 = load i32, ptr %15, align 4, !dbg !4034
  %24 = load i32, ptr %10, align 4, !dbg !4036
  %25 = icmp slt i32 %23, %24, !dbg !4037
  br i1 %25, label %26, label %81, !dbg !4038

26:                                               ; preds = %22
    #dbg_declare(ptr %16, !4039, !DIExpression(), !4042)
  store i32 0, ptr %16, align 4, !dbg !4042
  br label %27, !dbg !4043

27:                                               ; preds = %74, %26
  %28 = load i32, ptr %16, align 4, !dbg !4044
  %29 = load i32, ptr %11, align 4, !dbg !4046
  %30 = icmp slt i32 %28, %29, !dbg !4047
  br i1 %30, label %31, label %77, !dbg !4048

31:                                               ; preds = %27
    #dbg_declare(ptr %17, !4049, !DIExpression(), !4052)
  store i32 0, ptr %17, align 4, !dbg !4052
  br label %32, !dbg !4053

32:                                               ; preds = %70, %31
  %33 = load i32, ptr %17, align 4, !dbg !4054
  %34 = load i32, ptr %10, align 4, !dbg !4056
  %35 = icmp slt i32 %33, %34, !dbg !4057
  br i1 %35, label %36, label %73, !dbg !4058

36:                                               ; preds = %32
  %37 = load i32, ptr %14, align 4, !dbg !4059
  %38 = load ptr, ptr %7, align 8, !dbg !4061
  %39 = load i32, ptr %16, align 4, !dbg !4062
  %40 = load i32, ptr %10, align 4, !dbg !4063
  %41 = mul nsw i32 %39, %40, !dbg !4064
  %42 = load i32, ptr %17, align 4, !dbg !4065
  %43 = add nsw i32 %41, %42, !dbg !4066
  %44 = load i32, ptr %14, align 4, !dbg !4067
  %45 = mul nsw i32 %43, %44, !dbg !4068
  %46 = sext i32 %45 to i64, !dbg !4069
  %47 = getelementptr inbounds i64, ptr %38, i64 %46, !dbg !4069
  %48 = getelementptr inbounds [20736 x i64], ptr %13, i64 0, i64 0, !dbg !4070
  %49 = load i32, ptr %15, align 4, !dbg !4071
  %50 = load i32, ptr %10, align 4, !dbg !4072
  %51 = mul nsw i32 %49, %50, !dbg !4073
  %52 = load i32, ptr %17, align 4, !dbg !4074
  %53 = add nsw i32 %51, %52, !dbg !4075
  %54 = mul nsw i32 %53, 16, !dbg !4076
  %55 = load ptr, ptr %8, align 8, !dbg !4077
  %56 = load i32, ptr %15, align 4, !dbg !4078
  %57 = load i32, ptr %11, align 4, !dbg !4079
  %58 = mul nsw i32 %56, %57, !dbg !4080
  %59 = load i32, ptr %16, align 4, !dbg !4081
  %60 = add nsw i32 %58, %59, !dbg !4082
  %61 = sext i32 %60 to i64, !dbg !4077
  %62 = getelementptr inbounds i8, ptr %55, i64 %61, !dbg !4077
  %63 = load i8, ptr %62, align 1, !dbg !4077
  %64 = zext i8 %63 to i32, !dbg !4077
  %65 = add nsw i32 %54, %64, !dbg !4083
  %66 = load i32, ptr %14, align 4, !dbg !4084
  %67 = mul nsw i32 %65, %66, !dbg !4085
  %68 = sext i32 %67 to i64, !dbg !4086
  %69 = getelementptr inbounds i64, ptr %48, i64 %68, !dbg !4086
  call void @m_vec_add(i32 noundef %37, ptr noundef %47, ptr noundef %69), !dbg !4087
  br label %70, !dbg !4088

70:                                               ; preds = %36
  %71 = load i32, ptr %17, align 4, !dbg !4089
  %72 = add nsw i32 %71, 1, !dbg !4089
  store i32 %72, ptr %17, align 4, !dbg !4089
  br label %32, !dbg !4090, !llvm.loop !4091

73:                                               ; preds = %32
  br label %74, !dbg !4093

74:                                               ; preds = %73
  %75 = load i32, ptr %16, align 4, !dbg !4094
  %76 = add nsw i32 %75, 1, !dbg !4094
  store i32 %76, ptr %16, align 4, !dbg !4094
  br label %27, !dbg !4095, !llvm.loop !4096

77:                                               ; preds = %27
  br label %78, !dbg !4098

78:                                               ; preds = %77
  %79 = load i32, ptr %15, align 4, !dbg !4099
  %80 = add nsw i32 %79, 1, !dbg !4099
  store i32 %80, ptr %15, align 4, !dbg !4099
  br label %22, !dbg !4100, !llvm.loop !4101

81:                                               ; preds = %22
    #dbg_declare(ptr %18, !4103, !DIExpression(), !4104)
  store i32 0, ptr %18, align 4, !dbg !4104
  br label %82, !dbg !4105

82:                                               ; preds = %88, %81
  %83 = load i32, ptr %18, align 4, !dbg !4106
  %84 = load i32, ptr %10, align 4, !dbg !4107
  %85 = load i32, ptr %10, align 4, !dbg !4108
  %86 = mul nsw i32 %84, %85, !dbg !4109
  %87 = icmp slt i32 %83, %86, !dbg !4110
  br i1 %87, label %88, label %105, !dbg !4105

88:                                               ; preds = %82
  %89 = load i32, ptr %14, align 4, !dbg !4111
  %90 = getelementptr inbounds [20736 x i64], ptr %13, i64 0, i64 0, !dbg !4113
  %91 = load i32, ptr %18, align 4, !dbg !4114
  %92 = mul nsw i32 %91, 16, !dbg !4115
  %93 = load i32, ptr %14, align 4, !dbg !4116
  %94 = mul nsw i32 %92, %93, !dbg !4117
  %95 = sext i32 %94 to i64, !dbg !4118
  %96 = getelementptr inbounds i64, ptr %90, i64 %95, !dbg !4118
  %97 = load ptr, ptr %12, align 8, !dbg !4119
  %98 = load i32, ptr %18, align 4, !dbg !4120
  %99 = load i32, ptr %14, align 4, !dbg !4121
  %100 = mul nsw i32 %98, %99, !dbg !4122
  %101 = sext i32 %100 to i64, !dbg !4123
  %102 = getelementptr inbounds i64, ptr %97, i64 %101, !dbg !4123
  call void @m_vec_multiply_bins(i32 noundef %89, ptr noundef %96, ptr noundef %102), !dbg !4124
  %103 = load i32, ptr %18, align 4, !dbg !4125
  %104 = add nsw i32 %103, 1, !dbg !4125
  store i32 %104, ptr %18, align 4, !dbg !4125
  br label %82, !dbg !4105, !llvm.loop !4126

105:                                              ; preds = %82
  ret void, !dbg !4128
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_add(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4129 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4132, !DIExpression(), !4133)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4134, !DIExpression(), !4135)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4136, !DIExpression(), !4137)
    #dbg_declare(ptr %7, !4138, !DIExpression(), !4140)
  store i32 0, ptr %7, align 4, !dbg !4140
  br label %8, !dbg !4141

8:                                                ; preds = %24, %3
  %9 = load i32, ptr %7, align 4, !dbg !4142
  %10 = load i32, ptr %4, align 4, !dbg !4144
  %11 = icmp slt i32 %9, %10, !dbg !4145
  br i1 %11, label %12, label %27, !dbg !4146

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8, !dbg !4147
  %14 = load i32, ptr %7, align 4, !dbg !4149
  %15 = sext i32 %14 to i64, !dbg !4147
  %16 = getelementptr inbounds i64, ptr %13, i64 %15, !dbg !4147
  %17 = load i64, ptr %16, align 8, !dbg !4147
  %18 = load ptr, ptr %6, align 8, !dbg !4150
  %19 = load i32, ptr %7, align 4, !dbg !4151
  %20 = sext i32 %19 to i64, !dbg !4150
  %21 = getelementptr inbounds i64, ptr %18, i64 %20, !dbg !4150
  %22 = load i64, ptr %21, align 8, !dbg !4152
  %23 = xor i64 %22, %17, !dbg !4152
  store i64 %23, ptr %21, align 8, !dbg !4152
  br label %24, !dbg !4153

24:                                               ; preds = %12
  %25 = load i32, ptr %7, align 4, !dbg !4154
  %26 = add nsw i32 %25, 1, !dbg !4154
  store i32 %26, ptr %7, align 4, !dbg !4154
  br label %8, !dbg !4155, !llvm.loop !4156

27:                                               ; preds = %8
  ret void, !dbg !4158
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_multiply_bins(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4159 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4162, !DIExpression(), !4163)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4164, !DIExpression(), !4165)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4166, !DIExpression(), !4167)
  %7 = load i32, ptr %4, align 4, !dbg !4168
  %8 = load ptr, ptr %5, align 8, !dbg !4169
  %9 = load i32, ptr %4, align 4, !dbg !4170
  %10 = mul nsw i32 5, %9, !dbg !4171
  %11 = sext i32 %10 to i64, !dbg !4172
  %12 = getelementptr inbounds i64, ptr %8, i64 %11, !dbg !4172
  %13 = load ptr, ptr %5, align 8, !dbg !4173
  %14 = load i32, ptr %4, align 4, !dbg !4174
  %15 = mul nsw i32 10, %14, !dbg !4175
  %16 = sext i32 %15 to i64, !dbg !4176
  %17 = getelementptr inbounds i64, ptr %13, i64 %16, !dbg !4176
  call void @m_vec_mul_add_x_inv(i32 noundef %7, ptr noundef %12, ptr noundef %17), !dbg !4177
  %18 = load i32, ptr %4, align 4, !dbg !4178
  %19 = load ptr, ptr %5, align 8, !dbg !4179
  %20 = load i32, ptr %4, align 4, !dbg !4180
  %21 = mul nsw i32 11, %20, !dbg !4181
  %22 = sext i32 %21 to i64, !dbg !4182
  %23 = getelementptr inbounds i64, ptr %19, i64 %22, !dbg !4182
  %24 = load ptr, ptr %5, align 8, !dbg !4183
  %25 = load i32, ptr %4, align 4, !dbg !4184
  %26 = mul nsw i32 12, %25, !dbg !4185
  %27 = sext i32 %26 to i64, !dbg !4186
  %28 = getelementptr inbounds i64, ptr %24, i64 %27, !dbg !4186
  call void @m_vec_mul_add_x(i32 noundef %18, ptr noundef %23, ptr noundef %28), !dbg !4187
  %29 = load i32, ptr %4, align 4, !dbg !4188
  %30 = load ptr, ptr %5, align 8, !dbg !4189
  %31 = load i32, ptr %4, align 4, !dbg !4190
  %32 = mul nsw i32 10, %31, !dbg !4191
  %33 = sext i32 %32 to i64, !dbg !4192
  %34 = getelementptr inbounds i64, ptr %30, i64 %33, !dbg !4192
  %35 = load ptr, ptr %5, align 8, !dbg !4193
  %36 = load i32, ptr %4, align 4, !dbg !4194
  %37 = mul nsw i32 7, %36, !dbg !4195
  %38 = sext i32 %37 to i64, !dbg !4196
  %39 = getelementptr inbounds i64, ptr %35, i64 %38, !dbg !4196
  call void @m_vec_mul_add_x_inv(i32 noundef %29, ptr noundef %34, ptr noundef %39), !dbg !4197
  %40 = load i32, ptr %4, align 4, !dbg !4198
  %41 = load ptr, ptr %5, align 8, !dbg !4199
  %42 = load i32, ptr %4, align 4, !dbg !4200
  %43 = mul nsw i32 12, %42, !dbg !4201
  %44 = sext i32 %43 to i64, !dbg !4202
  %45 = getelementptr inbounds i64, ptr %41, i64 %44, !dbg !4202
  %46 = load ptr, ptr %5, align 8, !dbg !4203
  %47 = load i32, ptr %4, align 4, !dbg !4204
  %48 = mul nsw i32 6, %47, !dbg !4205
  %49 = sext i32 %48 to i64, !dbg !4206
  %50 = getelementptr inbounds i64, ptr %46, i64 %49, !dbg !4206
  call void @m_vec_mul_add_x(i32 noundef %40, ptr noundef %45, ptr noundef %50), !dbg !4207
  %51 = load i32, ptr %4, align 4, !dbg !4208
  %52 = load ptr, ptr %5, align 8, !dbg !4209
  %53 = load i32, ptr %4, align 4, !dbg !4210
  %54 = mul nsw i32 7, %53, !dbg !4211
  %55 = sext i32 %54 to i64, !dbg !4212
  %56 = getelementptr inbounds i64, ptr %52, i64 %55, !dbg !4212
  %57 = load ptr, ptr %5, align 8, !dbg !4213
  %58 = load i32, ptr %4, align 4, !dbg !4214
  %59 = mul nsw i32 14, %58, !dbg !4215
  %60 = sext i32 %59 to i64, !dbg !4216
  %61 = getelementptr inbounds i64, ptr %57, i64 %60, !dbg !4216
  call void @m_vec_mul_add_x_inv(i32 noundef %51, ptr noundef %56, ptr noundef %61), !dbg !4217
  %62 = load i32, ptr %4, align 4, !dbg !4218
  %63 = load ptr, ptr %5, align 8, !dbg !4219
  %64 = load i32, ptr %4, align 4, !dbg !4220
  %65 = mul nsw i32 6, %64, !dbg !4221
  %66 = sext i32 %65 to i64, !dbg !4222
  %67 = getelementptr inbounds i64, ptr %63, i64 %66, !dbg !4222
  %68 = load ptr, ptr %5, align 8, !dbg !4223
  %69 = load i32, ptr %4, align 4, !dbg !4224
  %70 = mul nsw i32 3, %69, !dbg !4225
  %71 = sext i32 %70 to i64, !dbg !4226
  %72 = getelementptr inbounds i64, ptr %68, i64 %71, !dbg !4226
  call void @m_vec_mul_add_x(i32 noundef %62, ptr noundef %67, ptr noundef %72), !dbg !4227
  %73 = load i32, ptr %4, align 4, !dbg !4228
  %74 = load ptr, ptr %5, align 8, !dbg !4229
  %75 = load i32, ptr %4, align 4, !dbg !4230
  %76 = mul nsw i32 14, %75, !dbg !4231
  %77 = sext i32 %76 to i64, !dbg !4232
  %78 = getelementptr inbounds i64, ptr %74, i64 %77, !dbg !4232
  %79 = load ptr, ptr %5, align 8, !dbg !4233
  %80 = load i32, ptr %4, align 4, !dbg !4234
  %81 = mul nsw i32 15, %80, !dbg !4235
  %82 = sext i32 %81 to i64, !dbg !4236
  %83 = getelementptr inbounds i64, ptr %79, i64 %82, !dbg !4236
  call void @m_vec_mul_add_x_inv(i32 noundef %73, ptr noundef %78, ptr noundef %83), !dbg !4237
  %84 = load i32, ptr %4, align 4, !dbg !4238
  %85 = load ptr, ptr %5, align 8, !dbg !4239
  %86 = load i32, ptr %4, align 4, !dbg !4240
  %87 = mul nsw i32 3, %86, !dbg !4241
  %88 = sext i32 %87 to i64, !dbg !4242
  %89 = getelementptr inbounds i64, ptr %85, i64 %88, !dbg !4242
  %90 = load ptr, ptr %5, align 8, !dbg !4243
  %91 = load i32, ptr %4, align 4, !dbg !4244
  %92 = mul nsw i32 8, %91, !dbg !4245
  %93 = sext i32 %92 to i64, !dbg !4246
  %94 = getelementptr inbounds i64, ptr %90, i64 %93, !dbg !4246
  call void @m_vec_mul_add_x(i32 noundef %84, ptr noundef %89, ptr noundef %94), !dbg !4247
  %95 = load i32, ptr %4, align 4, !dbg !4248
  %96 = load ptr, ptr %5, align 8, !dbg !4249
  %97 = load i32, ptr %4, align 4, !dbg !4250
  %98 = mul nsw i32 15, %97, !dbg !4251
  %99 = sext i32 %98 to i64, !dbg !4252
  %100 = getelementptr inbounds i64, ptr %96, i64 %99, !dbg !4252
  %101 = load ptr, ptr %5, align 8, !dbg !4253
  %102 = load i32, ptr %4, align 4, !dbg !4254
  %103 = mul nsw i32 13, %102, !dbg !4255
  %104 = sext i32 %103 to i64, !dbg !4256
  %105 = getelementptr inbounds i64, ptr %101, i64 %104, !dbg !4256
  call void @m_vec_mul_add_x_inv(i32 noundef %95, ptr noundef %100, ptr noundef %105), !dbg !4257
  %106 = load i32, ptr %4, align 4, !dbg !4258
  %107 = load ptr, ptr %5, align 8, !dbg !4259
  %108 = load i32, ptr %4, align 4, !dbg !4260
  %109 = mul nsw i32 8, %108, !dbg !4261
  %110 = sext i32 %109 to i64, !dbg !4262
  %111 = getelementptr inbounds i64, ptr %107, i64 %110, !dbg !4262
  %112 = load ptr, ptr %5, align 8, !dbg !4263
  %113 = load i32, ptr %4, align 4, !dbg !4264
  %114 = mul nsw i32 4, %113, !dbg !4265
  %115 = sext i32 %114 to i64, !dbg !4266
  %116 = getelementptr inbounds i64, ptr %112, i64 %115, !dbg !4266
  call void @m_vec_mul_add_x(i32 noundef %106, ptr noundef %111, ptr noundef %116), !dbg !4267
  %117 = load i32, ptr %4, align 4, !dbg !4268
  %118 = load ptr, ptr %5, align 8, !dbg !4269
  %119 = load i32, ptr %4, align 4, !dbg !4270
  %120 = mul nsw i32 13, %119, !dbg !4271
  %121 = sext i32 %120 to i64, !dbg !4272
  %122 = getelementptr inbounds i64, ptr %118, i64 %121, !dbg !4272
  %123 = load ptr, ptr %5, align 8, !dbg !4273
  %124 = load i32, ptr %4, align 4, !dbg !4274
  %125 = mul nsw i32 9, %124, !dbg !4275
  %126 = sext i32 %125 to i64, !dbg !4276
  %127 = getelementptr inbounds i64, ptr %123, i64 %126, !dbg !4276
  call void @m_vec_mul_add_x_inv(i32 noundef %117, ptr noundef %122, ptr noundef %127), !dbg !4277
  %128 = load i32, ptr %4, align 4, !dbg !4278
  %129 = load ptr, ptr %5, align 8, !dbg !4279
  %130 = load i32, ptr %4, align 4, !dbg !4280
  %131 = mul nsw i32 4, %130, !dbg !4281
  %132 = sext i32 %131 to i64, !dbg !4282
  %133 = getelementptr inbounds i64, ptr %129, i64 %132, !dbg !4282
  %134 = load ptr, ptr %5, align 8, !dbg !4283
  %135 = load i32, ptr %4, align 4, !dbg !4284
  %136 = mul nsw i32 2, %135, !dbg !4285
  %137 = sext i32 %136 to i64, !dbg !4286
  %138 = getelementptr inbounds i64, ptr %134, i64 %137, !dbg !4286
  call void @m_vec_mul_add_x(i32 noundef %128, ptr noundef %133, ptr noundef %138), !dbg !4287
  %139 = load i32, ptr %4, align 4, !dbg !4288
  %140 = load ptr, ptr %5, align 8, !dbg !4289
  %141 = load i32, ptr %4, align 4, !dbg !4290
  %142 = mul nsw i32 9, %141, !dbg !4291
  %143 = sext i32 %142 to i64, !dbg !4292
  %144 = getelementptr inbounds i64, ptr %140, i64 %143, !dbg !4292
  %145 = load ptr, ptr %5, align 8, !dbg !4293
  %146 = load i32, ptr %4, align 4, !dbg !4294
  %147 = mul nsw i32 1, %146, !dbg !4295
  %148 = sext i32 %147 to i64, !dbg !4296
  %149 = getelementptr inbounds i64, ptr %145, i64 %148, !dbg !4296
  call void @m_vec_mul_add_x_inv(i32 noundef %139, ptr noundef %144, ptr noundef %149), !dbg !4297
  %150 = load i32, ptr %4, align 4, !dbg !4298
  %151 = load ptr, ptr %5, align 8, !dbg !4299
  %152 = load i32, ptr %4, align 4, !dbg !4300
  %153 = mul nsw i32 2, %152, !dbg !4301
  %154 = sext i32 %153 to i64, !dbg !4302
  %155 = getelementptr inbounds i64, ptr %151, i64 %154, !dbg !4302
  %156 = load ptr, ptr %5, align 8, !dbg !4303
  %157 = load i32, ptr %4, align 4, !dbg !4304
  %158 = mul nsw i32 1, %157, !dbg !4305
  %159 = sext i32 %158 to i64, !dbg !4306
  %160 = getelementptr inbounds i64, ptr %156, i64 %159, !dbg !4306
  call void @m_vec_mul_add_x(i32 noundef %150, ptr noundef %155, ptr noundef %160), !dbg !4307
  %161 = load i32, ptr %4, align 4, !dbg !4308
  %162 = load ptr, ptr %5, align 8, !dbg !4309
  %163 = load i32, ptr %4, align 4, !dbg !4310
  %164 = sext i32 %163 to i64, !dbg !4311
  %165 = getelementptr inbounds i64, ptr %162, i64 %164, !dbg !4311
  %166 = load ptr, ptr %6, align 8, !dbg !4312
  call void @m_vec_copy(i32 noundef %161, ptr noundef %165, ptr noundef %166), !dbg !4313
  ret void, !dbg !4314
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_mul_add_x_inv(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4315 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4316, !DIExpression(), !4317)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4318, !DIExpression(), !4319)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4320, !DIExpression(), !4321)
    #dbg_declare(ptr %7, !4322, !DIExpression(), !4323)
  store i64 1229782938247303441, ptr %7, align 8, !dbg !4323
    #dbg_declare(ptr %8, !4324, !DIExpression(), !4326)
  store i32 0, ptr %8, align 4, !dbg !4326
  br label %10, !dbg !4327

10:                                               ; preds = %39, %3
  %11 = load i32, ptr %8, align 4, !dbg !4328
  %12 = load i32, ptr %4, align 4, !dbg !4330
  %13 = icmp slt i32 %11, %12, !dbg !4331
  br i1 %13, label %14, label %42, !dbg !4332

14:                                               ; preds = %10
    #dbg_declare(ptr %9, !4333, !DIExpression(), !4335)
  %15 = load ptr, ptr %5, align 8, !dbg !4336
  %16 = load i32, ptr %8, align 4, !dbg !4337
  %17 = sext i32 %16 to i64, !dbg !4336
  %18 = getelementptr inbounds i64, ptr %15, i64 %17, !dbg !4336
  %19 = load i64, ptr %18, align 8, !dbg !4336
  %20 = load i64, ptr %7, align 8, !dbg !4338
  %21 = and i64 %19, %20, !dbg !4339
  store i64 %21, ptr %9, align 8, !dbg !4335
  %22 = load ptr, ptr %5, align 8, !dbg !4340
  %23 = load i32, ptr %8, align 4, !dbg !4341
  %24 = sext i32 %23 to i64, !dbg !4340
  %25 = getelementptr inbounds i64, ptr %22, i64 %24, !dbg !4340
  %26 = load i64, ptr %25, align 8, !dbg !4340
  %27 = load i64, ptr %9, align 8, !dbg !4342
  %28 = xor i64 %26, %27, !dbg !4343
  %29 = lshr i64 %28, 1, !dbg !4344
  %30 = load i64, ptr %9, align 8, !dbg !4345
  %31 = mul i64 %30, 9, !dbg !4346
  %32 = xor i64 %29, %31, !dbg !4347
  %33 = load ptr, ptr %6, align 8, !dbg !4348
  %34 = load i32, ptr %8, align 4, !dbg !4349
  %35 = sext i32 %34 to i64, !dbg !4348
  %36 = getelementptr inbounds i64, ptr %33, i64 %35, !dbg !4348
  %37 = load i64, ptr %36, align 8, !dbg !4350
  %38 = xor i64 %37, %32, !dbg !4350
  store i64 %38, ptr %36, align 8, !dbg !4350
  br label %39, !dbg !4351

39:                                               ; preds = %14
  %40 = load i32, ptr %8, align 4, !dbg !4352
  %41 = add nsw i32 %40, 1, !dbg !4352
  store i32 %41, ptr %8, align 4, !dbg !4352
  br label %10, !dbg !4353, !llvm.loop !4354

42:                                               ; preds = %10
  ret void, !dbg !4356
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_mul_add_x(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4357 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4358, !DIExpression(), !4359)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4360, !DIExpression(), !4361)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4362, !DIExpression(), !4363)
    #dbg_declare(ptr %7, !4364, !DIExpression(), !4365)
  store i64 -8608480567731124088, ptr %7, align 8, !dbg !4365
    #dbg_declare(ptr %8, !4366, !DIExpression(), !4368)
  store i32 0, ptr %8, align 4, !dbg !4368
  br label %10, !dbg !4369

10:                                               ; preds = %40, %3
  %11 = load i32, ptr %8, align 4, !dbg !4370
  %12 = load i32, ptr %4, align 4, !dbg !4372
  %13 = icmp slt i32 %11, %12, !dbg !4373
  br i1 %13, label %14, label %43, !dbg !4374

14:                                               ; preds = %10
    #dbg_declare(ptr %9, !4375, !DIExpression(), !4377)
  %15 = load ptr, ptr %5, align 8, !dbg !4378
  %16 = load i32, ptr %8, align 4, !dbg !4379
  %17 = sext i32 %16 to i64, !dbg !4378
  %18 = getelementptr inbounds i64, ptr %15, i64 %17, !dbg !4378
  %19 = load i64, ptr %18, align 8, !dbg !4378
  %20 = load i64, ptr %7, align 8, !dbg !4380
  %21 = and i64 %19, %20, !dbg !4381
  store i64 %21, ptr %9, align 8, !dbg !4377
  %22 = load ptr, ptr %5, align 8, !dbg !4382
  %23 = load i32, ptr %8, align 4, !dbg !4383
  %24 = sext i32 %23 to i64, !dbg !4382
  %25 = getelementptr inbounds i64, ptr %22, i64 %24, !dbg !4382
  %26 = load i64, ptr %25, align 8, !dbg !4382
  %27 = load i64, ptr %9, align 8, !dbg !4384
  %28 = xor i64 %26, %27, !dbg !4385
  %29 = shl i64 %28, 1, !dbg !4386
  %30 = load i64, ptr %9, align 8, !dbg !4387
  %31 = lshr i64 %30, 3, !dbg !4388
  %32 = mul i64 %31, 3, !dbg !4389
  %33 = xor i64 %29, %32, !dbg !4390
  %34 = load ptr, ptr %6, align 8, !dbg !4391
  %35 = load i32, ptr %8, align 4, !dbg !4392
  %36 = sext i32 %35 to i64, !dbg !4391
  %37 = getelementptr inbounds i64, ptr %34, i64 %36, !dbg !4391
  %38 = load i64, ptr %37, align 8, !dbg !4393
  %39 = xor i64 %38, %33, !dbg !4393
  store i64 %39, ptr %37, align 8, !dbg !4393
  br label %40, !dbg !4394

40:                                               ; preds = %14
  %41 = load i32, ptr %8, align 4, !dbg !4395
  %42 = add nsw i32 %41, 1, !dbg !4395
  store i32 %42, ptr %8, align 4, !dbg !4395
  br label %10, !dbg !4396, !llvm.loop !4397

43:                                               ; preds = %10
  ret void, !dbg !4399
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @m_vec_copy(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4400 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %4, align 4
    #dbg_declare(ptr %4, !4401, !DIExpression(), !4402)
  store ptr %1, ptr %5, align 8
    #dbg_declare(ptr %5, !4403, !DIExpression(), !4404)
  store ptr %2, ptr %6, align 8
    #dbg_declare(ptr %6, !4405, !DIExpression(), !4406)
    #dbg_declare(ptr %7, !4407, !DIExpression(), !4409)
  store i32 0, ptr %7, align 4, !dbg !4409
  br label %8, !dbg !4410

8:                                                ; preds = %22, %3
  %9 = load i32, ptr %7, align 4, !dbg !4411
  %10 = load i32, ptr %4, align 4, !dbg !4413
  %11 = icmp slt i32 %9, %10, !dbg !4414
  br i1 %11, label %12, label %25, !dbg !4415

12:                                               ; preds = %8
  %13 = load ptr, ptr %5, align 8, !dbg !4416
  %14 = load i32, ptr %7, align 4, !dbg !4418
  %15 = sext i32 %14 to i64, !dbg !4416
  %16 = getelementptr inbounds i64, ptr %13, i64 %15, !dbg !4416
  %17 = load i64, ptr %16, align 8, !dbg !4416
  %18 = load ptr, ptr %6, align 8, !dbg !4419
  %19 = load i32, ptr %7, align 4, !dbg !4420
  %20 = sext i32 %19 to i64, !dbg !4419
  %21 = getelementptr inbounds i64, ptr %18, i64 %20, !dbg !4419
  store i64 %17, ptr %21, align 8, !dbg !4421
  br label %22, !dbg !4422

22:                                               ; preds = %12
  %23 = load i32, ptr %7, align 4, !dbg !4423
  %24 = add nsw i32 %23, 1, !dbg !4423
  store i32 %24, ptr %7, align 4, !dbg !4423
  br label %8, !dbg !4424, !llvm.loop !4425

25:                                               ; preds = %8
  ret void, !dbg !4427
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

!llvm.dbg.cu = !{!45, !47}
!llvm.ident = !{!74}
!llvm.module.flags = !{!75, !76, !77, !78, !79, !80, !81}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 41, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "example.c", directory: "/home/siddhesh/Desktop/Mayo_C_LLVM/MAYO-C/apps", checksumkind: CSK_MD5, checksum: "b901a3a442bebb1c0fa04f2af59d3c59")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 17)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 43, type: !3, isLocal: true, isDefinition: true)
!9 = !DIGlobalVariableExpression(var: !10, expr: !DIExpression())
!10 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !11, isLocal: true, isDefinition: true)
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 6)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 4)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !21, isLocal: true, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 19)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 63, type: !21, isLocal: true, isDefinition: true)
!26 = !DIGlobalVariableExpression(var: !27, expr: !DIExpression())
!27 = distinct !DIGlobalVariable(scope: null, file: !2, line: 73, type: !28, isLocal: true, isDefinition: true)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 14)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !2, line: 83, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 39)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !2, line: 94, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 41)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(scope: null, file: !2, line: 105, type: !33, isLocal: true, isDefinition: true)
!43 = !DIGlobalVariableExpression(var: !44, expr: !DIExpression())
!44 = distinct !DIGlobalVariable(scope: null, file: !2, line: 118, type: !38, isLocal: true, isDefinition: true)
!45 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 23.0.0git (https://github.com/llvm/llvm-project.git 0d562c96689de6bce7ca06bd1890724c72d9c536)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !46, splitDebugInlining: false, nameTableKind: None)
!46 = !{!0, !7, !9, !14, !19, !24, !26, !31, !36, !41, !43}
!47 = distinct !DICompileUnit(language: DW_LANG_C11, file: !48, producer: "clang version 23.0.0git (https://github.com/llvm/llvm-project.git 0d562c96689de6bce7ca06bd1890724c72d9c536)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !49, globals: !60, splitDebugInlining: false, nameTableKind: None)
!48 = !DIFile(filename: "../src/mayo.c", directory: "/home/siddhesh/Desktop/Mayo_C_LLVM/MAYO-C/apps", checksumkind: CSK_MD5, checksum: "2d9bf746bad8f353d74f8eb61797ea0e")
!49 = !{!50, !51, !57, !59}
!50 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!51 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !52, size: 64)
!52 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !53, line: 27, baseType: !54)
!53 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "256fcabbefa27ca8cf5e6d37525e6e16")
!54 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !55, line: 45, baseType: !56)
!55 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "e1865d9fe29fe1b5ced550b7ba458f9e")
!56 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !58, line: 18, baseType: !56)
!58 = !DIFile(filename: "/usr/local/lib/clang/23/include/__stddef_size_t.h", directory: "", checksumkind: CSK_MD5, checksum: "2c44e821a2b1951cde2eb0fb2e656867")
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!60 = !{!61, !68, !70, !72}
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !63, file: !48, line: 112, type: !67, isLocal: true, isDefinition: true)
!63 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !48, file: !48, line: 111, type: !64, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!64 = !DISubroutineType(types: !65)
!65 = !{null, !51}
!66 = !{}
!67 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !52)
!68 = !DIGlobalVariableExpression(var: !69, expr: !DIExpression())
!69 = distinct !DIGlobalVariable(name: "even_bytes", scope: !63, file: !48, line: 113, type: !67, isLocal: true, isDefinition: true)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !63, file: !48, line: 114, type: !67, isLocal: true, isDefinition: true)
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "even_half", scope: !63, file: !48, line: 115, type: !67, isLocal: true, isDefinition: true)
!74 = !{!"clang version 23.0.0git (https://github.com/llvm/llvm-project.git 0d562c96689de6bce7ca06bd1890724c72d9c536)"}
!75 = !{i32 7, !"Dwarf Version", i32 5}
!76 = !{i32 2, !"Debug Info Version", i32 3}
!77 = !{i32 1, !"wchar_size", i32 4}
!78 = !{i32 8, !"PIC Level", i32 2}
!79 = !{i32 7, !"PIE Level", i32 2}
!80 = !{i32 7, !"uwtable", i32 2}
!81 = !{i32 7, !"frame-pointer", i32 2}
!82 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 138, type: !83, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !45, retainedNodes: !66)
!83 = !DISubroutineType(types: !84)
!84 = !{!85}
!85 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!86 = !DILocalVariable(name: "params", scope: !82, file: !2, line: 140, type: !87)
!87 = !DICompositeType(tag: DW_TAG_array_type, baseType: !88, size: 256, elements: !17)
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !90)
!90 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !91, line: 289, baseType: !92)
!91 = !DIFile(filename: "../include/mayo.h", directory: "/home/siddhesh/Desktop/Mayo_C_LLVM/MAYO-C/apps", checksumkind: CSK_MD5, checksum: "f989eb6a80120ad12fa916f6a2c77682")
!92 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !91, line: 265, size: 832, elements: !93)
!93 = !{!94, !95, !96, !97, !98, !99, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118}
!94 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !92, file: !91, line: 266, baseType: !85, size: 32)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !92, file: !91, line: 267, baseType: !85, size: 32, offset: 32)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !92, file: !91, line: 268, baseType: !85, size: 32, offset: 64)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !92, file: !91, line: 269, baseType: !85, size: 32, offset: 96)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !92, file: !91, line: 270, baseType: !85, size: 32, offset: 128)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !92, file: !91, line: 271, baseType: !100, size: 64, offset: 192)
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !101, size: 64)
!101 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !92, file: !91, line: 272, baseType: !85, size: 32, offset: 256)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !92, file: !91, line: 273, baseType: !85, size: 32, offset: 288)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !92, file: !91, line: 274, baseType: !85, size: 32, offset: 320)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !92, file: !91, line: 275, baseType: !85, size: 32, offset: 352)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !92, file: !91, line: 276, baseType: !85, size: 32, offset: 384)
!107 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !92, file: !91, line: 277, baseType: !85, size: 32, offset: 416)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !92, file: !91, line: 278, baseType: !85, size: 32, offset: 448)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !92, file: !91, line: 279, baseType: !85, size: 32, offset: 480)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !92, file: !91, line: 280, baseType: !85, size: 32, offset: 512)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !92, file: !91, line: 281, baseType: !85, size: 32, offset: 544)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !92, file: !91, line: 282, baseType: !85, size: 32, offset: 576)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !92, file: !91, line: 283, baseType: !85, size: 32, offset: 608)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !92, file: !91, line: 284, baseType: !85, size: 32, offset: 640)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !92, file: !91, line: 285, baseType: !85, size: 32, offset: 672)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !92, file: !91, line: 286, baseType: !85, size: 32, offset: 704)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !92, file: !91, line: 287, baseType: !85, size: 32, offset: 736)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !92, file: !91, line: 288, baseType: !119, size: 64, offset: 768)
!119 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !120, size: 64)
!120 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!121 = !DILocation(line: 140, column: 26, scope: !82)
!122 = !DILocalVariable(name: "paramslen", scope: !82, file: !2, line: 141, type: !85)
!123 = !DILocation(line: 141, column: 9, scope: !82)
!124 = !DILocalVariable(name: "i", scope: !125, file: !2, line: 142, type: !85)
!125 = distinct !DILexicalBlock(scope: !82, file: !2, line: 142, column: 5)
!126 = !DILocation(line: 142, column: 14, scope: !125)
!127 = !DILocation(line: 142, column: 10, scope: !125)
!128 = !DILocation(line: 142, column: 21, scope: !129)
!129 = distinct !DILexicalBlock(scope: !125, file: !2, line: 142, column: 5)
!130 = !DILocation(line: 142, column: 25, scope: !129)
!131 = !DILocation(line: 142, column: 23, scope: !129)
!132 = !DILocation(line: 142, column: 5, scope: !125)
!133 = !DILocation(line: 143, column: 33, scope: !134)
!134 = distinct !DILexicalBlock(scope: !135, file: !2, line: 143, column: 13)
!135 = distinct !DILexicalBlock(scope: !129, file: !2, line: 142, column: 41)
!136 = !DILocation(line: 143, column: 26, scope: !134)
!137 = !DILocation(line: 143, column: 13, scope: !134)
!138 = !DILocation(line: 143, column: 37, scope: !134)
!139 = !DILocation(line: 144, column: 13, scope: !140)
!140 = distinct !DILexicalBlock(scope: !134, file: !2, line: 143, column: 49)
!141 = !DILocation(line: 146, column: 5, scope: !135)
!142 = !DILocation(line: 142, column: 36, scope: !129)
!143 = !DILocation(line: 142, column: 5, scope: !129)
!144 = distinct !{!144, !132, !145, !146}
!145 = !DILocation(line: 146, column: 5, scope: !125)
!146 = !{!"llvm.loop.mustprogress"}
!147 = !DILocation(line: 150, column: 1, scope: !82)
!148 = distinct !DISubprogram(name: "example_mayo", scope: !2, file: !2, line: 25, type: !149, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !45, retainedNodes: !66)
!149 = !DISubroutineType(types: !150)
!150 = !{!85, !88}
!151 = !DILocalVariable(name: "p", arg: 1, scope: !148, file: !2, line: 25, type: !88)
!152 = !DILocation(line: 25, column: 46, scope: !148)
!153 = !DILocalVariable(name: "msglen", scope: !148, file: !2, line: 27, type: !57)
!154 = !DILocation(line: 27, column: 12, scope: !148)
!155 = !DILocalVariable(name: "smlen", scope: !148, file: !2, line: 28, type: !57)
!156 = !DILocation(line: 28, column: 12, scope: !148)
!157 = !DILocation(line: 28, column: 36, scope: !148)
!158 = !DILocation(line: 28, column: 20, scope: !148)
!159 = !DILocation(line: 28, column: 41, scope: !148)
!160 = !DILocation(line: 28, column: 39, scope: !148)
!161 = !DILocalVariable(name: "pk", scope: !148, file: !2, line: 30, type: !59)
!162 = !DILocation(line: 30, column: 20, scope: !148)
!163 = !DILocation(line: 30, column: 49, scope: !148)
!164 = !DILocation(line: 30, column: 33, scope: !148)
!165 = !DILocation(line: 30, column: 26, scope: !148)
!166 = !DILocalVariable(name: "sk", scope: !148, file: !2, line: 31, type: !59)
!167 = !DILocation(line: 31, column: 20, scope: !148)
!168 = !DILocation(line: 31, column: 49, scope: !148)
!169 = !DILocation(line: 31, column: 33, scope: !148)
!170 = !DILocation(line: 31, column: 26, scope: !148)
!171 = !DILocalVariable(name: "epk", scope: !148, file: !2, line: 33, type: !51)
!172 = !DILocation(line: 33, column: 15, scope: !148)
!173 = !DILocation(line: 33, column: 21, scope: !148)
!174 = !DILocalVariable(name: "esk", scope: !148, file: !2, line: 34, type: !175)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !91, line: 294, baseType: !177)
!177 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !91, line: 291, size: 7257920, elements: !178)
!178 = !{!179, !183}
!179 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !177, file: !91, line: 292, baseType: !180, size: 7238592)
!180 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 7238592, elements: !181)
!181 = !{!182}
!182 = !DISubrange(count: 113103)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !177, file: !91, line: 293, baseType: !184, size: 19312, offset: 7238592)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !185, size: 19312, elements: !187)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !53, line: 24, baseType: !186)
!186 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !55, line: 38, baseType: !50)
!187 = !{!188}
!188 = !DISubrange(count: 2414)
!189 = !DILocation(line: 34, column: 11, scope: !148)
!190 = !DILocation(line: 34, column: 17, scope: !148)
!191 = !DILocalVariable(name: "sig", scope: !148, file: !2, line: 36, type: !59)
!192 = !DILocation(line: 36, column: 20, scope: !148)
!193 = !DILocation(line: 36, column: 49, scope: !148)
!194 = !DILocation(line: 36, column: 33, scope: !148)
!195 = !DILocation(line: 36, column: 54, scope: !148)
!196 = !DILocation(line: 36, column: 52, scope: !148)
!197 = !DILocation(line: 36, column: 26, scope: !148)
!198 = !DILocalVariable(name: "msg", scope: !148, file: !2, line: 38, type: !199)
!199 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 256, elements: !200)
!200 = !{!201}
!201 = !DISubrange(count: 32)
!202 = !DILocation(line: 38, column: 19, scope: !148)
!203 = !DILocalVariable(name: "msg2", scope: !148, file: !2, line: 39, type: !199)
!204 = !DILocation(line: 39, column: 19, scope: !148)
!205 = !DILocation(line: 41, column: 44, scope: !148)
!206 = !DILocation(line: 41, column: 33, scope: !148)
!207 = !DILocation(line: 41, column: 5, scope: !148)
!208 = !DILocation(line: 43, column: 5, scope: !148)
!209 = !DILocalVariable(name: "res", scope: !148, file: !2, line: 44, type: !85)
!210 = !DILocation(line: 44, column: 9, scope: !148)
!211 = !DILocation(line: 44, column: 28, scope: !148)
!212 = !DILocation(line: 44, column: 31, scope: !148)
!213 = !DILocation(line: 44, column: 35, scope: !148)
!214 = !DILocation(line: 44, column: 15, scope: !148)
!215 = !DILocation(line: 45, column: 9, scope: !216)
!216 = distinct !DILexicalBlock(scope: !148, file: !2, line: 45, column: 9)
!217 = !DILocation(line: 45, column: 13, scope: !216)
!218 = !DILocation(line: 46, column: 9, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !2, line: 45, column: 25)
!220 = !DILocation(line: 47, column: 13, scope: !219)
!221 = !DILocation(line: 48, column: 9, scope: !219)
!222 = !DILocation(line: 50, column: 9, scope: !223)
!223 = distinct !DILexicalBlock(scope: !216, file: !2, line: 49, column: 12)
!224 = !DILocation(line: 53, column: 5, scope: !148)
!225 = !DILocation(line: 54, column: 26, scope: !148)
!226 = !DILocation(line: 54, column: 29, scope: !148)
!227 = !DILocation(line: 54, column: 33, scope: !148)
!228 = !DILocation(line: 54, column: 11, scope: !148)
!229 = !DILocation(line: 54, column: 9, scope: !148)
!230 = !DILocation(line: 55, column: 9, scope: !231)
!231 = distinct !DILexicalBlock(scope: !148, file: !2, line: 55, column: 9)
!232 = !DILocation(line: 55, column: 13, scope: !231)
!233 = !DILocation(line: 56, column: 9, scope: !234)
!234 = distinct !DILexicalBlock(scope: !231, file: !2, line: 55, column: 25)
!235 = !DILocation(line: 57, column: 13, scope: !234)
!236 = !DILocation(line: 58, column: 9, scope: !234)
!237 = !DILocation(line: 60, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !231, file: !2, line: 59, column: 12)
!239 = !DILocation(line: 63, column: 5, scope: !148)
!240 = !DILocation(line: 64, column: 26, scope: !148)
!241 = !DILocation(line: 64, column: 29, scope: !148)
!242 = !DILocation(line: 64, column: 33, scope: !148)
!243 = !DILocation(line: 64, column: 11, scope: !148)
!244 = !DILocation(line: 64, column: 9, scope: !148)
!245 = !DILocation(line: 65, column: 9, scope: !246)
!246 = distinct !DILexicalBlock(scope: !148, file: !2, line: 65, column: 9)
!247 = !DILocation(line: 65, column: 13, scope: !246)
!248 = !DILocation(line: 66, column: 9, scope: !249)
!249 = distinct !DILexicalBlock(scope: !246, file: !2, line: 65, column: 25)
!250 = !DILocation(line: 67, column: 13, scope: !249)
!251 = !DILocation(line: 68, column: 9, scope: !249)
!252 = !DILocation(line: 70, column: 9, scope: !253)
!253 = distinct !DILexicalBlock(scope: !246, file: !2, line: 69, column: 12)
!254 = !DILocation(line: 73, column: 5, scope: !148)
!255 = !DILocation(line: 74, column: 21, scope: !148)
!256 = !DILocation(line: 74, column: 24, scope: !148)
!257 = !DILocation(line: 74, column: 37, scope: !148)
!258 = !DILocation(line: 74, column: 42, scope: !148)
!259 = !DILocation(line: 74, column: 50, scope: !148)
!260 = !DILocation(line: 74, column: 11, scope: !148)
!261 = !DILocation(line: 74, column: 9, scope: !148)
!262 = !DILocation(line: 75, column: 9, scope: !263)
!263 = distinct !DILexicalBlock(scope: !148, file: !2, line: 75, column: 9)
!264 = !DILocation(line: 75, column: 13, scope: !263)
!265 = !DILocation(line: 76, column: 9, scope: !266)
!266 = distinct !DILexicalBlock(scope: !263, file: !2, line: 75, column: 25)
!267 = !DILocation(line: 77, column: 13, scope: !266)
!268 = !DILocation(line: 78, column: 9, scope: !266)
!269 = !DILocation(line: 80, column: 9, scope: !270)
!270 = distinct !DILexicalBlock(scope: !263, file: !2, line: 79, column: 12)
!271 = !DILocation(line: 83, column: 5, scope: !148)
!272 = !DILocation(line: 84, column: 21, scope: !148)
!273 = !DILocation(line: 84, column: 24, scope: !148)
!274 = !DILocation(line: 84, column: 39, scope: !148)
!275 = !DILocation(line: 84, column: 44, scope: !148)
!276 = !DILocation(line: 84, column: 51, scope: !148)
!277 = !DILocation(line: 84, column: 11, scope: !148)
!278 = !DILocation(line: 84, column: 9, scope: !148)
!279 = !DILocation(line: 85, column: 9, scope: !280)
!280 = distinct !DILexicalBlock(scope: !148, file: !2, line: 85, column: 9)
!281 = !DILocation(line: 85, column: 13, scope: !280)
!282 = !DILocation(line: 85, column: 24, scope: !280)
!283 = !DILocation(line: 85, column: 34, scope: !280)
!284 = !DILocation(line: 85, column: 39, scope: !280)
!285 = !DILocation(line: 85, column: 45, scope: !280)
!286 = !DILocation(line: 85, column: 27, scope: !280)
!287 = !DILocation(line: 86, column: 9, scope: !288)
!288 = distinct !DILexicalBlock(scope: !280, file: !2, line: 85, column: 54)
!289 = !DILocation(line: 87, column: 13, scope: !288)
!290 = !DILocation(line: 88, column: 9, scope: !288)
!291 = !DILocation(line: 90, column: 13, scope: !292)
!292 = distinct !DILexicalBlock(scope: !280, file: !2, line: 89, column: 12)
!293 = !DILocation(line: 91, column: 9, scope: !292)
!294 = !DILocation(line: 94, column: 5, scope: !148)
!295 = !DILocation(line: 95, column: 23, scope: !148)
!296 = !DILocation(line: 95, column: 26, scope: !148)
!297 = !DILocation(line: 95, column: 31, scope: !148)
!298 = !DILocation(line: 95, column: 39, scope: !148)
!299 = !DILocation(line: 95, column: 44, scope: !148)
!300 = !DILocation(line: 95, column: 11, scope: !148)
!301 = !DILocation(line: 95, column: 9, scope: !148)
!302 = !DILocation(line: 96, column: 9, scope: !303)
!303 = distinct !DILexicalBlock(scope: !148, file: !2, line: 96, column: 9)
!304 = !DILocation(line: 96, column: 13, scope: !303)
!305 = !DILocation(line: 97, column: 9, scope: !306)
!306 = distinct !DILexicalBlock(scope: !303, file: !2, line: 96, column: 25)
!307 = !DILocation(line: 98, column: 13, scope: !306)
!308 = !DILocation(line: 99, column: 9, scope: !306)
!309 = !DILocation(line: 101, column: 13, scope: !310)
!310 = distinct !DILexicalBlock(scope: !303, file: !2, line: 100, column: 12)
!311 = !DILocation(line: 102, column: 9, scope: !310)
!312 = !DILocation(line: 105, column: 5, scope: !148)
!313 = !DILocation(line: 106, column: 15, scope: !148)
!314 = !DILocation(line: 106, column: 14, scope: !148)
!315 = !DILocation(line: 106, column: 5, scope: !148)
!316 = !DILocation(line: 106, column: 12, scope: !148)
!317 = !DILocation(line: 107, column: 5, scope: !148)
!318 = !DILocation(line: 107, column: 21, scope: !148)
!319 = !DILocation(line: 108, column: 21, scope: !148)
!320 = !DILocation(line: 108, column: 24, scope: !148)
!321 = !DILocation(line: 108, column: 39, scope: !148)
!322 = !DILocation(line: 108, column: 44, scope: !148)
!323 = !DILocation(line: 108, column: 51, scope: !148)
!324 = !DILocation(line: 108, column: 11, scope: !148)
!325 = !DILocation(line: 108, column: 9, scope: !148)
!326 = !DILocation(line: 109, column: 9, scope: !327)
!327 = distinct !DILexicalBlock(scope: !148, file: !2, line: 109, column: 9)
!328 = !DILocation(line: 109, column: 13, scope: !327)
!329 = !DILocation(line: 109, column: 25, scope: !327)
!330 = !DILocation(line: 109, column: 36, scope: !327)
!331 = !DILocation(line: 109, column: 41, scope: !327)
!332 = !DILocation(line: 109, column: 47, scope: !327)
!333 = !DILocation(line: 109, column: 29, scope: !327)
!334 = !DILocation(line: 110, column: 9, scope: !335)
!335 = distinct !DILexicalBlock(scope: !327, file: !2, line: 109, column: 56)
!336 = !DILocation(line: 111, column: 13, scope: !335)
!337 = !DILocation(line: 112, column: 9, scope: !335)
!338 = !DILocation(line: 114, column: 13, scope: !339)
!339 = distinct !DILexicalBlock(scope: !327, file: !2, line: 113, column: 12)
!340 = !DILocation(line: 115, column: 9, scope: !339)
!341 = !DILocation(line: 118, column: 5, scope: !148)
!342 = !DILocation(line: 119, column: 23, scope: !148)
!343 = !DILocation(line: 119, column: 26, scope: !148)
!344 = !DILocation(line: 119, column: 31, scope: !148)
!345 = !DILocation(line: 119, column: 39, scope: !148)
!346 = !DILocation(line: 119, column: 44, scope: !148)
!347 = !DILocation(line: 119, column: 11, scope: !148)
!348 = !DILocation(line: 119, column: 9, scope: !148)
!349 = !DILocation(line: 120, column: 9, scope: !350)
!350 = distinct !DILexicalBlock(scope: !148, file: !2, line: 120, column: 9)
!351 = !DILocation(line: 120, column: 13, scope: !350)
!352 = !DILocation(line: 121, column: 9, scope: !353)
!353 = distinct !DILexicalBlock(scope: !350, file: !2, line: 120, column: 25)
!354 = !DILocation(line: 122, column: 13, scope: !353)
!355 = !DILocation(line: 123, column: 9, scope: !353)
!356 = !DILocation(line: 125, column: 13, scope: !357)
!357 = distinct !DILexicalBlock(scope: !350, file: !2, line: 124, column: 12)
!358 = !DILocation(line: 126, column: 9, scope: !357)
!359 = !DILocation(line: 120, column: 16, scope: !350)
!360 = !DILabel(scope: !148, name: "err", file: !2, line: 129, column: 1)
!361 = !DILocation(line: 129, column: 1, scope: !148)
!362 = !DILocation(line: 130, column: 10, scope: !148)
!363 = !DILocation(line: 130, column: 5, scope: !148)
!364 = !DILocation(line: 131, column: 10, scope: !148)
!365 = !DILocation(line: 131, column: 5, scope: !148)
!366 = !DILocation(line: 132, column: 22, scope: !148)
!367 = !DILocation(line: 132, column: 42, scope: !148)
!368 = !DILocation(line: 132, column: 26, scope: !148)
!369 = !DILocation(line: 132, column: 5, scope: !148)
!370 = !DILocation(line: 133, column: 22, scope: !148)
!371 = !DILocation(line: 133, column: 5, scope: !148)
!372 = !DILocation(line: 134, column: 10, scope: !148)
!373 = !DILocation(line: 134, column: 5, scope: !148)
!374 = !DILocation(line: 135, column: 12, scope: !148)
!375 = !DILocation(line: 135, column: 5, scope: !148)
!376 = distinct !DISubprogram(name: "mayo_keypair", scope: !48, file: !48, line: 298, type: !377, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!377 = !DISubroutineType(types: !378)
!378 = !{!85, !379, !59, !59}
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64)
!380 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !381)
!381 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !91, line: 289, baseType: !382)
!382 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !91, line: 265, size: 832, elements: !383)
!383 = !{!384, !385, !386, !387, !388, !389, !390, !391, !392, !393, !394, !395, !396, !397, !398, !399, !400, !401, !402, !403, !404, !405, !406}
!384 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !382, file: !91, line: 266, baseType: !85, size: 32)
!385 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !382, file: !91, line: 267, baseType: !85, size: 32, offset: 32)
!386 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !382, file: !91, line: 268, baseType: !85, size: 32, offset: 64)
!387 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !382, file: !91, line: 269, baseType: !85, size: 32, offset: 96)
!388 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !382, file: !91, line: 270, baseType: !85, size: 32, offset: 128)
!389 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !382, file: !91, line: 271, baseType: !100, size: 64, offset: 192)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !382, file: !91, line: 272, baseType: !85, size: 32, offset: 256)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !382, file: !91, line: 273, baseType: !85, size: 32, offset: 288)
!392 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !382, file: !91, line: 274, baseType: !85, size: 32, offset: 320)
!393 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !382, file: !91, line: 275, baseType: !85, size: 32, offset: 352)
!394 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !382, file: !91, line: 276, baseType: !85, size: 32, offset: 384)
!395 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !382, file: !91, line: 277, baseType: !85, size: 32, offset: 416)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !382, file: !91, line: 278, baseType: !85, size: 32, offset: 448)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !382, file: !91, line: 279, baseType: !85, size: 32, offset: 480)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !382, file: !91, line: 280, baseType: !85, size: 32, offset: 512)
!399 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !382, file: !91, line: 281, baseType: !85, size: 32, offset: 544)
!400 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !382, file: !91, line: 282, baseType: !85, size: 32, offset: 576)
!401 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !382, file: !91, line: 283, baseType: !85, size: 32, offset: 608)
!402 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !382, file: !91, line: 284, baseType: !85, size: 32, offset: 640)
!403 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !382, file: !91, line: 285, baseType: !85, size: 32, offset: 672)
!404 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !382, file: !91, line: 286, baseType: !85, size: 32, offset: 704)
!405 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !382, file: !91, line: 287, baseType: !85, size: 32, offset: 736)
!406 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !382, file: !91, line: 288, baseType: !119, size: 64, offset: 768)
!407 = !DILocalVariable(name: "p", arg: 1, scope: !376, file: !48, line: 298, type: !379)
!408 = !DILocation(line: 298, column: 39, scope: !376)
!409 = !DILocalVariable(name: "pk", arg: 2, scope: !376, file: !48, line: 298, type: !59)
!410 = !DILocation(line: 298, column: 57, scope: !376)
!411 = !DILocalVariable(name: "sk", arg: 3, scope: !376, file: !48, line: 298, type: !59)
!412 = !DILocation(line: 298, column: 76, scope: !376)
!413 = !DILocalVariable(name: "ret", scope: !376, file: !48, line: 299, type: !85)
!414 = !DILocation(line: 299, column: 9, scope: !376)
!415 = !DILocation(line: 301, column: 32, scope: !376)
!416 = !DILocation(line: 301, column: 35, scope: !376)
!417 = !DILocation(line: 301, column: 39, scope: !376)
!418 = !DILocation(line: 301, column: 11, scope: !376)
!419 = !DILocation(line: 301, column: 9, scope: !376)
!420 = !DILocation(line: 302, column: 9, scope: !421)
!421 = distinct !DILexicalBlock(scope: !376, file: !48, line: 302, column: 9)
!422 = !DILocation(line: 302, column: 13, scope: !421)
!423 = !DILocation(line: 303, column: 9, scope: !424)
!424 = distinct !DILexicalBlock(scope: !421, file: !48, line: 302, column: 25)
!425 = !DILocation(line: 302, column: 16, scope: !421)
!426 = !DILabel(scope: !376, name: "err", file: !48, line: 306, column: 1)
!427 = !DILocation(line: 306, column: 1, scope: !376)
!428 = !DILocation(line: 307, column: 12, scope: !376)
!429 = !DILocation(line: 307, column: 5, scope: !376)
!430 = distinct !DISubprogram(name: "mayo_keypair_compact", scope: !48, file: !48, line: 538, type: !377, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!431 = !DILocalVariable(name: "p", arg: 1, scope: !430, file: !48, line: 538, type: !379)
!432 = !DILocation(line: 538, column: 47, scope: !430)
!433 = !DILocalVariable(name: "cpk", arg: 2, scope: !430, file: !48, line: 538, type: !59)
!434 = !DILocation(line: 538, column: 65, scope: !430)
!435 = !DILocalVariable(name: "csk", arg: 3, scope: !430, file: !48, line: 539, type: !59)
!436 = !DILocation(line: 539, column: 41, scope: !430)
!437 = !DILocalVariable(name: "ret", scope: !430, file: !48, line: 540, type: !85)
!438 = !DILocation(line: 540, column: 9, scope: !430)
!439 = !DILocalVariable(name: "seed_sk", scope: !430, file: !48, line: 541, type: !59)
!440 = !DILocation(line: 541, column: 20, scope: !430)
!441 = !DILocation(line: 541, column: 30, scope: !430)
!442 = !DILocalVariable(name: "S", scope: !430, file: !48, line: 542, type: !443)
!443 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 6944, elements: !444)
!444 = !{!445}
!445 = !DISubrange(count: 868)
!446 = !DILocation(line: 542, column: 19, scope: !430)
!447 = !DILocalVariable(name: "P", scope: !430, file: !48, line: 543, type: !180)
!448 = !DILocation(line: 543, column: 14, scope: !430)
!449 = !DILocalVariable(name: "P3", scope: !430, file: !48, line: 544, type: !450)
!450 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 166464, elements: !451)
!451 = !{!452}
!452 = !DISubrange(count: 2601)
!453 = !DILocation(line: 544, column: 14, scope: !430)
!454 = !DILocalVariable(name: "seed_pk", scope: !430, file: !48, line: 546, type: !59)
!455 = !DILocation(line: 546, column: 20, scope: !430)
!456 = !DILocalVariable(name: "O", scope: !430, file: !48, line: 547, type: !457)
!457 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 19312, elements: !187)
!458 = !DILocation(line: 547, column: 19, scope: !430)
!459 = !DILocalVariable(name: "m_vec_limbs", scope: !430, file: !48, line: 549, type: !460)
!460 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !85)
!461 = !DILocation(line: 549, column: 15, scope: !430)
!462 = !DILocation(line: 549, column: 47, scope: !430)
!463 = !DILocation(line: 549, column: 29, scope: !430)
!464 = !DILocalVariable(name: "param_m", scope: !430, file: !48, line: 550, type: !460)
!465 = !DILocation(line: 550, column: 15, scope: !430)
!466 = !DILocation(line: 550, column: 33, scope: !430)
!467 = !DILocation(line: 550, column: 25, scope: !430)
!468 = !DILocalVariable(name: "param_v", scope: !430, file: !48, line: 551, type: !460)
!469 = !DILocation(line: 551, column: 15, scope: !430)
!470 = !DILocation(line: 551, column: 33, scope: !430)
!471 = !DILocation(line: 551, column: 25, scope: !430)
!472 = !DILocalVariable(name: "param_o", scope: !430, file: !48, line: 552, type: !460)
!473 = !DILocation(line: 552, column: 15, scope: !430)
!474 = !DILocation(line: 552, column: 33, scope: !430)
!475 = !DILocation(line: 552, column: 25, scope: !430)
!476 = !DILocalVariable(name: "param_O_bytes", scope: !430, file: !48, line: 553, type: !460)
!477 = !DILocation(line: 553, column: 15, scope: !430)
!478 = !DILocation(line: 553, column: 45, scope: !430)
!479 = !DILocation(line: 553, column: 31, scope: !430)
!480 = !DILocalVariable(name: "param_P1_limbs", scope: !430, file: !48, line: 554, type: !460)
!481 = !DILocation(line: 554, column: 15, scope: !430)
!482 = !DILocation(line: 554, column: 47, scope: !430)
!483 = !DILocation(line: 554, column: 32, scope: !430)
!484 = !DILocalVariable(name: "param_P3_limbs", scope: !430, file: !48, line: 555, type: !460)
!485 = !DILocation(line: 555, column: 15, scope: !430)
!486 = !DILocation(line: 555, column: 47, scope: !430)
!487 = !DILocation(line: 555, column: 32, scope: !430)
!488 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !430, file: !48, line: 556, type: !460)
!489 = !DILocation(line: 556, column: 15, scope: !430)
!490 = !DILocation(line: 556, column: 57, scope: !430)
!491 = !DILocation(line: 556, column: 37, scope: !430)
!492 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !430, file: !48, line: 557, type: !460)
!493 = !DILocation(line: 557, column: 15, scope: !430)
!494 = !DILocation(line: 557, column: 57, scope: !430)
!495 = !DILocation(line: 557, column: 37, scope: !430)
!496 = !DILocalVariable(name: "P1", scope: !430, file: !48, line: 559, type: !51)
!497 = !DILocation(line: 559, column: 15, scope: !430)
!498 = !DILocation(line: 559, column: 20, scope: !430)
!499 = !DILocalVariable(name: "P2", scope: !430, file: !48, line: 560, type: !51)
!500 = !DILocation(line: 560, column: 15, scope: !430)
!501 = !DILocation(line: 560, column: 20, scope: !430)
!502 = !DILocation(line: 560, column: 24, scope: !430)
!503 = !DILocation(line: 560, column: 22, scope: !430)
!504 = !DILocation(line: 566, column: 21, scope: !505)
!505 = distinct !DILexicalBlock(scope: !430, file: !48, line: 566, column: 9)
!506 = !DILocation(line: 566, column: 30, scope: !505)
!507 = !DILocation(line: 566, column: 9, scope: !505)
!508 = !DILocation(line: 566, column: 51, scope: !505)
!509 = !DILocation(line: 567, column: 13, scope: !510)
!510 = distinct !DILexicalBlock(scope: !505, file: !48, line: 566, column: 63)
!511 = !DILocation(line: 568, column: 9, scope: !510)
!512 = !DILocation(line: 573, column: 14, scope: !430)
!513 = !DILocation(line: 573, column: 17, scope: !430)
!514 = !DILocation(line: 573, column: 39, scope: !430)
!515 = !DILocation(line: 573, column: 37, scope: !430)
!516 = !DILocation(line: 573, column: 54, scope: !430)
!517 = !DILocation(line: 574, column: 14, scope: !430)
!518 = !DILocation(line: 573, column: 5, scope: !430)
!519 = !DILocation(line: 576, column: 15, scope: !430)
!520 = !DILocation(line: 576, column: 13, scope: !430)
!521 = !DILocation(line: 579, column: 12, scope: !430)
!522 = !DILocation(line: 579, column: 16, scope: !430)
!523 = !DILocation(line: 579, column: 14, scope: !430)
!524 = !DILocation(line: 579, column: 37, scope: !430)
!525 = !DILocation(line: 579, column: 40, scope: !430)
!526 = !DILocation(line: 579, column: 50, scope: !430)
!527 = !DILocation(line: 579, column: 48, scope: !430)
!528 = !DILocation(line: 579, column: 5, scope: !430)
!529 = !DILocation(line: 585, column: 18, scope: !430)
!530 = !DILocation(line: 585, column: 21, scope: !430)
!531 = !DILocation(line: 585, column: 24, scope: !430)
!532 = !DILocation(line: 585, column: 5, scope: !430)
!533 = !DILocation(line: 588, column: 16, scope: !430)
!534 = !DILocation(line: 588, column: 19, scope: !430)
!535 = !DILocation(line: 588, column: 23, scope: !430)
!536 = !DILocation(line: 588, column: 27, scope: !430)
!537 = !DILocation(line: 588, column: 30, scope: !430)
!538 = !DILocation(line: 588, column: 5, scope: !430)
!539 = !DILocation(line: 591, column: 12, scope: !430)
!540 = !DILocation(line: 591, column: 17, scope: !430)
!541 = !DILocation(line: 591, column: 26, scope: !430)
!542 = !DILocation(line: 591, column: 5, scope: !430)
!543 = !DILocalVariable(name: "P3_upper", scope: !430, file: !48, line: 593, type: !544)
!544 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 88128, elements: !545)
!545 = !{!546}
!546 = !DISubrange(count: 1377)
!547 = !DILocation(line: 593, column: 14, scope: !430)
!548 = !DILocation(line: 596, column: 13, scope: !430)
!549 = !DILocation(line: 596, column: 16, scope: !430)
!550 = !DILocation(line: 596, column: 20, scope: !430)
!551 = !DILocation(line: 596, column: 30, scope: !430)
!552 = !DILocation(line: 596, column: 5, scope: !430)
!553 = !DILocation(line: 597, column: 17, scope: !430)
!554 = !DILocation(line: 597, column: 27, scope: !430)
!555 = !DILocation(line: 597, column: 33, scope: !430)
!556 = !DILocation(line: 597, column: 31, scope: !430)
!557 = !DILocation(line: 597, column: 54, scope: !430)
!558 = !DILocation(line: 597, column: 69, scope: !430)
!559 = !DILocation(line: 597, column: 68, scope: !430)
!560 = !DILocation(line: 597, column: 82, scope: !430)
!561 = !DILocation(line: 597, column: 5, scope: !430)
!562 = !DILabel(scope: !430, name: "err", file: !48, line: 600, column: 5)
!563 = !DILocation(line: 600, column: 5, scope: !430)
!564 = !DILocation(line: 602, column: 23, scope: !430)
!565 = !DILocation(line: 602, column: 5, scope: !430)
!566 = !DILocation(line: 603, column: 23, scope: !430)
!567 = !DILocation(line: 603, column: 42, scope: !430)
!568 = !DILocation(line: 603, column: 27, scope: !430)
!569 = !DILocation(line: 603, column: 44, scope: !430)
!570 = !DILocation(line: 603, column: 5, scope: !430)
!571 = !DILocation(line: 604, column: 23, scope: !430)
!572 = !DILocation(line: 604, column: 5, scope: !430)
!573 = !DILocation(line: 605, column: 12, scope: !430)
!574 = !DILocation(line: 605, column: 5, scope: !430)
!575 = distinct !DISubprogram(name: "decode", scope: !48, file: !48, line: 20, type: !576, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !100, !59, !85}
!578 = !DILocalVariable(name: "m", arg: 1, scope: !575, file: !48, line: 20, type: !100)
!579 = !DILocation(line: 20, column: 41, scope: !575)
!580 = !DILocalVariable(name: "mdec", arg: 2, scope: !575, file: !48, line: 20, type: !59)
!581 = !DILocation(line: 20, column: 59, scope: !575)
!582 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !575, file: !48, line: 20, type: !85)
!583 = !DILocation(line: 20, column: 69, scope: !575)
!584 = !DILocalVariable(name: "i", scope: !575, file: !48, line: 21, type: !85)
!585 = !DILocation(line: 21, column: 9, scope: !575)
!586 = !DILocation(line: 22, column: 12, scope: !587)
!587 = distinct !DILexicalBlock(scope: !575, file: !48, line: 22, column: 5)
!588 = !DILocation(line: 22, column: 10, scope: !587)
!589 = !DILocation(line: 22, column: 17, scope: !590)
!590 = distinct !DILexicalBlock(scope: !587, file: !48, line: 22, column: 5)
!591 = !DILocation(line: 22, column: 21, scope: !590)
!592 = !DILocation(line: 22, column: 29, scope: !590)
!593 = !DILocation(line: 22, column: 19, scope: !590)
!594 = !DILocation(line: 22, column: 5, scope: !587)
!595 = !DILocation(line: 23, column: 19, scope: !596)
!596 = distinct !DILexicalBlock(scope: !590, file: !48, line: 22, column: 39)
!597 = !DILocation(line: 23, column: 21, scope: !596)
!598 = !DILocation(line: 23, column: 24, scope: !596)
!599 = !DILocation(line: 23, column: 14, scope: !596)
!600 = !DILocation(line: 23, column: 17, scope: !596)
!601 = !DILocation(line: 24, column: 19, scope: !596)
!602 = !DILocation(line: 24, column: 21, scope: !596)
!603 = !DILocation(line: 24, column: 24, scope: !596)
!604 = !DILocation(line: 24, column: 14, scope: !596)
!605 = !DILocation(line: 24, column: 17, scope: !596)
!606 = !DILocation(line: 25, column: 5, scope: !596)
!607 = !DILocation(line: 22, column: 34, scope: !590)
!608 = !DILocation(line: 22, column: 5, scope: !590)
!609 = distinct !{!609, !594, !610, !146}
!610 = !DILocation(line: 25, column: 5, scope: !587)
!611 = !DILocation(line: 27, column: 9, scope: !612)
!612 = distinct !DILexicalBlock(scope: !575, file: !48, line: 27, column: 9)
!613 = !DILocation(line: 27, column: 17, scope: !612)
!614 = !DILocation(line: 27, column: 21, scope: !612)
!615 = !DILocation(line: 28, column: 19, scope: !616)
!616 = distinct !DILexicalBlock(scope: !612, file: !48, line: 27, column: 27)
!617 = !DILocation(line: 28, column: 21, scope: !616)
!618 = !DILocation(line: 28, column: 24, scope: !616)
!619 = !DILocation(line: 28, column: 14, scope: !616)
!620 = !DILocation(line: 28, column: 17, scope: !616)
!621 = !DILocation(line: 29, column: 5, scope: !616)
!622 = !DILocation(line: 30, column: 1, scope: !575)
!623 = distinct !DISubprogram(name: "expand_P1_P2", scope: !48, file: !48, line: 280, type: !624, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!624 = !DISubroutineType(types: !625)
!625 = !{null, !379, !51, !100}
!626 = !DILocalVariable(name: "p", arg: 1, scope: !623, file: !48, line: 280, type: !379)
!627 = !DILocation(line: 280, column: 47, scope: !623)
!628 = !DILocalVariable(name: "P", arg: 2, scope: !623, file: !48, line: 280, type: !51)
!629 = !DILocation(line: 280, column: 60, scope: !623)
!630 = !DILocalVariable(name: "seed_pk", arg: 3, scope: !623, file: !48, line: 280, type: !100)
!631 = !DILocation(line: 280, column: 84, scope: !623)
!632 = !DILocation(line: 284, column: 29, scope: !623)
!633 = !DILocation(line: 284, column: 47, scope: !623)
!634 = !DILocation(line: 284, column: 32, scope: !623)
!635 = !DILocation(line: 284, column: 67, scope: !623)
!636 = !DILocation(line: 284, column: 52, scope: !623)
!637 = !DILocation(line: 284, column: 50, scope: !623)
!638 = !DILocation(line: 284, column: 71, scope: !623)
!639 = !DILocation(line: 284, column: 100, scope: !623)
!640 = !DILocation(line: 284, column: 80, scope: !623)
!641 = !DILocation(line: 284, column: 5, scope: !623)
!642 = !DILocation(line: 285, column: 36, scope: !623)
!643 = !DILocation(line: 285, column: 39, scope: !623)
!644 = !DILocation(line: 285, column: 58, scope: !623)
!645 = !DILocation(line: 285, column: 43, scope: !623)
!646 = !DILocation(line: 285, column: 78, scope: !623)
!647 = !DILocation(line: 285, column: 63, scope: !623)
!648 = !DILocation(line: 285, column: 61, scope: !623)
!649 = !DILocation(line: 285, column: 100, scope: !623)
!650 = !DILocation(line: 285, column: 82, scope: !623)
!651 = !DILocation(line: 285, column: 81, scope: !623)
!652 = !DILocation(line: 285, column: 112, scope: !623)
!653 = !DILocation(line: 285, column: 104, scope: !623)
!654 = !DILocation(line: 285, column: 5, scope: !623)
!655 = !DILocation(line: 286, column: 1, scope: !623)
!656 = distinct !DISubprogram(name: "compute_P3", scope: !657, file: !657, line: 260, type: !658, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!657 = !DIFile(filename: "../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/Mayo_C_LLVM/MAYO-C/apps", checksumkind: CSK_MD5, checksum: "c74b5e3736583c2887c9257ca8300a6c")
!658 = !DISubroutineType(types: !659)
!659 = !{null, !379, !660, !51, !100, !51}
!660 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!661 = !DILocalVariable(name: "p", arg: 1, scope: !656, file: !657, line: 260, type: !379)
!662 = !DILocation(line: 260, column: 38, scope: !656)
!663 = !DILocalVariable(name: "P1", arg: 2, scope: !656, file: !657, line: 260, type: !660)
!664 = !DILocation(line: 260, column: 57, scope: !656)
!665 = !DILocalVariable(name: "P2", arg: 3, scope: !656, file: !657, line: 260, type: !51)
!666 = !DILocation(line: 260, column: 71, scope: !656)
!667 = !DILocalVariable(name: "O", arg: 4, scope: !656, file: !657, line: 260, type: !100)
!668 = !DILocation(line: 260, column: 96, scope: !656)
!669 = !DILocalVariable(name: "P3", arg: 5, scope: !656, file: !657, line: 260, type: !51)
!670 = !DILocation(line: 260, column: 109, scope: !656)
!671 = !DILocalVariable(name: "m_vec_limbs", scope: !656, file: !657, line: 262, type: !460)
!672 = !DILocation(line: 262, column: 15, scope: !656)
!673 = !DILocation(line: 262, column: 47, scope: !656)
!674 = !DILocation(line: 262, column: 29, scope: !656)
!675 = !DILocalVariable(name: "param_v", scope: !656, file: !657, line: 263, type: !460)
!676 = !DILocation(line: 263, column: 15, scope: !656)
!677 = !DILocation(line: 263, column: 33, scope: !656)
!678 = !DILocation(line: 263, column: 25, scope: !656)
!679 = !DILocalVariable(name: "param_o", scope: !656, file: !657, line: 264, type: !460)
!680 = !DILocation(line: 264, column: 15, scope: !656)
!681 = !DILocation(line: 264, column: 33, scope: !656)
!682 = !DILocation(line: 264, column: 25, scope: !656)
!683 = !DILocation(line: 267, column: 16, scope: !656)
!684 = !DILocation(line: 267, column: 19, scope: !656)
!685 = !DILocation(line: 267, column: 23, scope: !656)
!686 = !DILocation(line: 267, column: 26, scope: !656)
!687 = !DILocation(line: 267, column: 5, scope: !656)
!688 = !DILocation(line: 270, column: 31, scope: !656)
!689 = !DILocation(line: 270, column: 44, scope: !656)
!690 = !DILocation(line: 270, column: 47, scope: !656)
!691 = !DILocation(line: 270, column: 51, scope: !656)
!692 = !DILocation(line: 270, column: 55, scope: !656)
!693 = !DILocation(line: 270, column: 64, scope: !656)
!694 = !DILocation(line: 270, column: 73, scope: !656)
!695 = !DILocation(line: 270, column: 5, scope: !656)
!696 = !DILocation(line: 271, column: 1, scope: !656)
!697 = distinct !DISubprogram(name: "pack_m_vecs", scope: !48, file: !48, line: 272, type: !698, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!698 = !DISubroutineType(types: !699)
!699 = !{null, !660, !59, !85, !85}
!700 = !DILocalVariable(name: "in", arg: 1, scope: !697, file: !48, line: 272, type: !660)
!701 = !DILocation(line: 272, column: 41, scope: !697)
!702 = !DILocalVariable(name: "out", arg: 2, scope: !697, file: !48, line: 272, type: !59)
!703 = !DILocation(line: 272, column: 60, scope: !697)
!704 = !DILocalVariable(name: "vecs", arg: 3, scope: !697, file: !48, line: 272, type: !85)
!705 = !DILocation(line: 272, column: 69, scope: !697)
!706 = !DILocalVariable(name: "m", arg: 4, scope: !697, file: !48, line: 272, type: !85)
!707 = !DILocation(line: 272, column: 79, scope: !697)
!708 = !DILocalVariable(name: "m_vec_limbs", scope: !697, file: !48, line: 273, type: !460)
!709 = !DILocation(line: 273, column: 15, scope: !697)
!710 = !DILocation(line: 273, column: 30, scope: !697)
!711 = !DILocation(line: 273, column: 32, scope: !697)
!712 = !DILocation(line: 273, column: 38, scope: !697)
!713 = !DILocalVariable(name: "_in", scope: !697, file: !48, line: 274, type: !59)
!714 = !DILocation(line: 274, column: 20, scope: !697)
!715 = !DILocation(line: 274, column: 44, scope: !697)
!716 = !DILocalVariable(name: "i", scope: !717, file: !48, line: 275, type: !85)
!717 = distinct !DILexicalBlock(scope: !697, file: !48, line: 275, column: 5)
!718 = !DILocation(line: 275, column: 14, scope: !717)
!719 = !DILocation(line: 275, column: 10, scope: !717)
!720 = !DILocation(line: 275, column: 21, scope: !721)
!721 = distinct !DILexicalBlock(scope: !717, file: !48, line: 275, column: 5)
!722 = !DILocation(line: 275, column: 25, scope: !721)
!723 = !DILocation(line: 275, column: 23, scope: !721)
!724 = !DILocation(line: 275, column: 5, scope: !717)
!725 = !DILocation(line: 277, column: 17, scope: !726)
!726 = distinct !DILexicalBlock(scope: !721, file: !48, line: 276, column: 5)
!727 = !DILocation(line: 277, column: 24, scope: !726)
!728 = !DILocation(line: 277, column: 26, scope: !726)
!729 = !DILocation(line: 277, column: 25, scope: !726)
!730 = !DILocation(line: 277, column: 27, scope: !726)
!731 = !DILocation(line: 277, column: 9, scope: !726)
!732 = !DILocation(line: 277, column: 32, scope: !726)
!733 = !DILocation(line: 277, column: 38, scope: !726)
!734 = !DILocation(line: 277, column: 40, scope: !726)
!735 = !DILocation(line: 277, column: 39, scope: !726)
!736 = !DILocation(line: 277, column: 51, scope: !726)
!737 = !DILocation(line: 277, column: 70, scope: !726)
!738 = !DILocation(line: 277, column: 71, scope: !726)
!739 = !DILocation(line: 278, column: 5, scope: !726)
!740 = !DILocation(line: 275, column: 32, scope: !721)
!741 = !DILocation(line: 275, column: 5, scope: !721)
!742 = distinct !{!742, !724, !743, !146}
!743 = !DILocation(line: 278, column: 5, scope: !717)
!744 = !DILocation(line: 279, column: 1, scope: !697)
!745 = distinct !DISubprogram(name: "P1_times_O", scope: !657, file: !657, line: 74, type: !746, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!746 = !DISubroutineType(types: !747)
!747 = !{null, !379, !660, !100, !51}
!748 = !DILocalVariable(name: "p", arg: 1, scope: !745, file: !657, line: 74, type: !379)
!749 = !DILocation(line: 74, column: 38, scope: !745)
!750 = !DILocalVariable(name: "P1", arg: 2, scope: !745, file: !657, line: 74, type: !660)
!751 = !DILocation(line: 74, column: 57, scope: !745)
!752 = !DILocalVariable(name: "O", arg: 3, scope: !745, file: !657, line: 74, type: !100)
!753 = !DILocation(line: 74, column: 82, scope: !745)
!754 = !DILocalVariable(name: "acc", arg: 4, scope: !745, file: !657, line: 74, type: !51)
!755 = !DILocation(line: 74, column: 95, scope: !745)
!756 = !DILocation(line: 78, column: 60, scope: !745)
!757 = !DILocation(line: 78, column: 42, scope: !745)
!758 = !DILocation(line: 78, column: 64, scope: !745)
!759 = !DILocation(line: 78, column: 68, scope: !745)
!760 = !DILocation(line: 78, column: 71, scope: !745)
!761 = !DILocation(line: 78, column: 84, scope: !745)
!762 = !DILocation(line: 78, column: 76, scope: !745)
!763 = !DILocation(line: 78, column: 96, scope: !745)
!764 = !DILocation(line: 78, column: 88, scope: !745)
!765 = !DILocation(line: 78, column: 108, scope: !745)
!766 = !DILocation(line: 78, column: 100, scope: !745)
!767 = !DILocation(line: 78, column: 5, scope: !745)
!768 = !DILocation(line: 79, column: 1, scope: !745)
!769 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !657, file: !657, line: 47, type: !770, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!770 = !DISubroutineType(types: !771)
!771 = !{null, !460, !100, !660, !51, !460, !460, !460}
!772 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !769, file: !657, line: 47, type: !460)
!773 = !DILocation(line: 47, column: 42, scope: !769)
!774 = !DILocalVariable(name: "mat", arg: 2, scope: !769, file: !657, line: 47, type: !100)
!775 = !DILocation(line: 47, column: 76, scope: !769)
!776 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !769, file: !657, line: 47, type: !660)
!777 = !DILocation(line: 47, column: 97, scope: !769)
!778 = !DILocalVariable(name: "acc", arg: 4, scope: !769, file: !657, line: 47, type: !51)
!779 = !DILocation(line: 47, column: 115, scope: !769)
!780 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !769, file: !657, line: 48, type: !460)
!781 = !DILocation(line: 48, column: 42, scope: !769)
!782 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !769, file: !657, line: 48, type: !460)
!783 = !DILocation(line: 48, column: 62, scope: !769)
!784 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !769, file: !657, line: 48, type: !460)
!785 = !DILocation(line: 48, column: 82, scope: !769)
!786 = !DILocalVariable(name: "r", scope: !787, file: !657, line: 50, type: !85)
!787 = distinct !DILexicalBlock(scope: !769, file: !657, line: 50, column: 5)
!788 = !DILocation(line: 50, column: 14, scope: !787)
!789 = !DILocation(line: 50, column: 10, scope: !787)
!790 = !DILocation(line: 50, column: 21, scope: !791)
!791 = distinct !DILexicalBlock(scope: !787, file: !657, line: 50, column: 5)
!792 = !DILocation(line: 50, column: 25, scope: !791)
!793 = !DILocation(line: 50, column: 23, scope: !791)
!794 = !DILocation(line: 50, column: 5, scope: !787)
!795 = !DILocalVariable(name: "c", scope: !796, file: !657, line: 51, type: !85)
!796 = distinct !DILexicalBlock(scope: !797, file: !657, line: 51, column: 9)
!797 = distinct !DILexicalBlock(scope: !791, file: !657, line: 50, column: 40)
!798 = !DILocation(line: 51, column: 18, scope: !796)
!799 = !DILocation(line: 51, column: 14, scope: !796)
!800 = !DILocation(line: 51, column: 25, scope: !801)
!801 = distinct !DILexicalBlock(scope: !796, file: !657, line: 51, column: 9)
!802 = !DILocation(line: 51, column: 29, scope: !801)
!803 = !DILocation(line: 51, column: 27, scope: !801)
!804 = !DILocation(line: 51, column: 9, scope: !796)
!805 = !DILocalVariable(name: "k", scope: !806, file: !657, line: 52, type: !85)
!806 = distinct !DILexicalBlock(scope: !807, file: !657, line: 52, column: 13)
!807 = distinct !DILexicalBlock(scope: !801, file: !657, line: 51, column: 44)
!808 = !DILocation(line: 52, column: 22, scope: !806)
!809 = !DILocation(line: 52, column: 18, scope: !806)
!810 = !DILocation(line: 52, column: 29, scope: !811)
!811 = distinct !DILexicalBlock(scope: !806, file: !657, line: 52, column: 13)
!812 = !DILocation(line: 52, column: 33, scope: !811)
!813 = !DILocation(line: 52, column: 31, scope: !811)
!814 = !DILocation(line: 52, column: 13, scope: !806)
!815 = !DILocation(line: 53, column: 31, scope: !816)
!816 = distinct !DILexicalBlock(scope: !811, file: !657, line: 52, column: 54)
!817 = !DILocation(line: 53, column: 44, scope: !816)
!818 = !DILocation(line: 53, column: 53, scope: !816)
!819 = !DILocation(line: 53, column: 68, scope: !816)
!820 = !DILocation(line: 53, column: 72, scope: !816)
!821 = !DILocation(line: 53, column: 70, scope: !816)
!822 = !DILocation(line: 53, column: 86, scope: !816)
!823 = !DILocation(line: 53, column: 84, scope: !816)
!824 = !DILocation(line: 53, column: 65, scope: !816)
!825 = !DILocation(line: 53, column: 51, scope: !816)
!826 = !DILocation(line: 53, column: 90, scope: !816)
!827 = !DILocation(line: 53, column: 94, scope: !816)
!828 = !DILocation(line: 53, column: 98, scope: !816)
!829 = !DILocation(line: 53, column: 96, scope: !816)
!830 = !DILocation(line: 53, column: 109, scope: !816)
!831 = !DILocation(line: 53, column: 107, scope: !816)
!832 = !DILocation(line: 53, column: 113, scope: !816)
!833 = !DILocation(line: 53, column: 119, scope: !816)
!834 = !DILocation(line: 53, column: 134, scope: !816)
!835 = !DILocation(line: 53, column: 138, scope: !816)
!836 = !DILocation(line: 53, column: 136, scope: !816)
!837 = !DILocation(line: 53, column: 152, scope: !816)
!838 = !DILocation(line: 53, column: 150, scope: !816)
!839 = !DILocation(line: 53, column: 131, scope: !816)
!840 = !DILocation(line: 53, column: 117, scope: !816)
!841 = !DILocation(line: 53, column: 17, scope: !816)
!842 = !DILocation(line: 54, column: 13, scope: !816)
!843 = !DILocation(line: 52, column: 48, scope: !811)
!844 = !DILocation(line: 52, column: 13, scope: !811)
!845 = distinct !{!845, !814, !846, !146}
!846 = !DILocation(line: 54, column: 13, scope: !806)
!847 = !DILocation(line: 55, column: 9, scope: !807)
!848 = !DILocation(line: 51, column: 40, scope: !801)
!849 = !DILocation(line: 51, column: 9, scope: !801)
!850 = distinct !{!850, !804, !851, !146}
!851 = !DILocation(line: 55, column: 9, scope: !796)
!852 = !DILocation(line: 56, column: 5, scope: !797)
!853 = !DILocation(line: 50, column: 36, scope: !791)
!854 = !DILocation(line: 50, column: 5, scope: !791)
!855 = distinct !{!855, !794, !856, !146}
!856 = !DILocation(line: 56, column: 5, scope: !787)
!857 = !DILocation(line: 57, column: 1, scope: !769)
!858 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !859, file: !859, line: 24, type: !860, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!859 = !DIFile(filename: "../src/generic/arithmetic_dynamic.h", directory: "/home/siddhesh/Desktop/Mayo_C_LLVM/MAYO-C/apps", checksumkind: CSK_MD5, checksum: "9d9b1605abeeb1f8f67cf314525f5a25")
!860 = !DISubroutineType(types: !861)
!861 = !{null, !85, !660, !50, !51}
!862 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !858, file: !859, line: 24, type: !85)
!863 = !DILocation(line: 24, column: 24, scope: !858)
!864 = !DILocalVariable(name: "in", arg: 2, scope: !858, file: !859, line: 24, type: !660)
!865 = !DILocation(line: 24, column: 53, scope: !858)
!866 = !DILocalVariable(name: "a", arg: 3, scope: !858, file: !859, line: 24, type: !50)
!867 = !DILocation(line: 24, column: 71, scope: !858)
!868 = !DILocalVariable(name: "acc", arg: 4, scope: !858, file: !859, line: 24, type: !51)
!869 = !DILocation(line: 24, column: 84, scope: !858)
!870 = !DILocalVariable(name: "i", scope: !871, file: !859, line: 25, type: !85)
!871 = distinct !DILexicalBlock(scope: !858, file: !859, line: 25, column: 5)
!872 = !DILocation(line: 25, column: 13, scope: !871)
!873 = !DILocation(line: 25, column: 9, scope: !871)
!874 = !DILocation(line: 25, column: 18, scope: !875)
!875 = distinct !DILexicalBlock(scope: !871, file: !859, line: 25, column: 5)
!876 = !DILocation(line: 25, column: 22, scope: !875)
!877 = !DILocation(line: 25, column: 20, scope: !875)
!878 = !DILocation(line: 25, column: 5, scope: !871)
!879 = !DILocation(line: 26, column: 33, scope: !880)
!880 = distinct !DILexicalBlock(scope: !875, file: !859, line: 25, column: 39)
!881 = !DILocation(line: 26, column: 36, scope: !880)
!882 = !DILocation(line: 26, column: 40, scope: !880)
!883 = !DILocation(line: 26, column: 19, scope: !880)
!884 = !DILocation(line: 26, column: 9, scope: !880)
!885 = !DILocation(line: 26, column: 13, scope: !880)
!886 = !DILocation(line: 26, column: 16, scope: !880)
!887 = !DILocation(line: 27, column: 5, scope: !880)
!888 = !DILocation(line: 25, column: 36, scope: !875)
!889 = !DILocation(line: 25, column: 5, scope: !875)
!890 = distinct !{!890, !878, !891, !146}
!891 = !DILocation(line: 27, column: 5, scope: !871)
!892 = !DILocation(line: 28, column: 1, scope: !858)
!893 = distinct !DISubprogram(name: "gf16v_mul_u64", scope: !894, file: !894, line: 96, type: !895, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!894 = !DIFile(filename: "../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/Mayo_C_LLVM/MAYO-C/apps", checksumkind: CSK_MD5, checksum: "7bd1b302fd4eda12f62b408ac2bb07c1")
!895 = !DISubroutineType(types: !896)
!896 = !{!52, !52, !185}
!897 = !DILocalVariable(name: "a", arg: 1, scope: !893, file: !894, line: 96, type: !52)
!898 = !DILocation(line: 96, column: 48, scope: !893)
!899 = !DILocalVariable(name: "b", arg: 2, scope: !893, file: !894, line: 96, type: !185)
!900 = !DILocation(line: 96, column: 59, scope: !893)
!901 = !DILocalVariable(name: "mask_msb", scope: !893, file: !894, line: 97, type: !52)
!902 = !DILocation(line: 97, column: 14, scope: !893)
!903 = !DILocalVariable(name: "a_msb", scope: !893, file: !894, line: 98, type: !52)
!904 = !DILocation(line: 98, column: 14, scope: !893)
!905 = !DILocalVariable(name: "a64", scope: !893, file: !894, line: 99, type: !52)
!906 = !DILocation(line: 99, column: 14, scope: !893)
!907 = !DILocation(line: 99, column: 20, scope: !893)
!908 = !DILocalVariable(name: "b32", scope: !893, file: !894, line: 101, type: !52)
!909 = !DILocation(line: 101, column: 14, scope: !893)
!910 = !DILocation(line: 101, column: 20, scope: !893)
!911 = !DILocation(line: 101, column: 24, scope: !893)
!912 = !DILocation(line: 101, column: 22, scope: !893)
!913 = !DILocalVariable(name: "r64", scope: !893, file: !894, line: 105, type: !52)
!914 = !DILocation(line: 105, column: 14, scope: !893)
!915 = !DILocation(line: 105, column: 20, scope: !893)
!916 = !DILocation(line: 105, column: 27, scope: !893)
!917 = !DILocation(line: 105, column: 31, scope: !893)
!918 = !DILocation(line: 105, column: 24, scope: !893)
!919 = !DILocation(line: 107, column: 13, scope: !893)
!920 = !DILocation(line: 107, column: 19, scope: !893)
!921 = !DILocation(line: 107, column: 17, scope: !893)
!922 = !DILocation(line: 107, column: 11, scope: !893)
!923 = !DILocation(line: 108, column: 12, scope: !893)
!924 = !DILocation(line: 108, column: 9, scope: !893)
!925 = !DILocation(line: 109, column: 12, scope: !893)
!926 = !DILocation(line: 109, column: 16, scope: !893)
!927 = !DILocation(line: 109, column: 26, scope: !893)
!928 = !DILocation(line: 109, column: 32, scope: !893)
!929 = !DILocation(line: 109, column: 38, scope: !893)
!930 = !DILocation(line: 109, column: 22, scope: !893)
!931 = !DILocation(line: 109, column: 9, scope: !893)
!932 = !DILocation(line: 110, column: 13, scope: !893)
!933 = !DILocation(line: 110, column: 22, scope: !893)
!934 = !DILocation(line: 110, column: 26, scope: !893)
!935 = !DILocation(line: 110, column: 32, scope: !893)
!936 = !DILocation(line: 110, column: 18, scope: !893)
!937 = !DILocation(line: 110, column: 9, scope: !893)
!938 = !DILocation(line: 112, column: 13, scope: !893)
!939 = !DILocation(line: 112, column: 19, scope: !893)
!940 = !DILocation(line: 112, column: 17, scope: !893)
!941 = !DILocation(line: 112, column: 11, scope: !893)
!942 = !DILocation(line: 113, column: 12, scope: !893)
!943 = !DILocation(line: 113, column: 9, scope: !893)
!944 = !DILocation(line: 114, column: 12, scope: !893)
!945 = !DILocation(line: 114, column: 16, scope: !893)
!946 = !DILocation(line: 114, column: 26, scope: !893)
!947 = !DILocation(line: 114, column: 32, scope: !893)
!948 = !DILocation(line: 114, column: 38, scope: !893)
!949 = !DILocation(line: 114, column: 22, scope: !893)
!950 = !DILocation(line: 114, column: 9, scope: !893)
!951 = !DILocation(line: 115, column: 13, scope: !893)
!952 = !DILocation(line: 115, column: 22, scope: !893)
!953 = !DILocation(line: 115, column: 26, scope: !893)
!954 = !DILocation(line: 115, column: 32, scope: !893)
!955 = !DILocation(line: 115, column: 18, scope: !893)
!956 = !DILocation(line: 115, column: 9, scope: !893)
!957 = !DILocation(line: 117, column: 13, scope: !893)
!958 = !DILocation(line: 117, column: 19, scope: !893)
!959 = !DILocation(line: 117, column: 17, scope: !893)
!960 = !DILocation(line: 117, column: 11, scope: !893)
!961 = !DILocation(line: 118, column: 12, scope: !893)
!962 = !DILocation(line: 118, column: 9, scope: !893)
!963 = !DILocation(line: 119, column: 12, scope: !893)
!964 = !DILocation(line: 119, column: 16, scope: !893)
!965 = !DILocation(line: 119, column: 26, scope: !893)
!966 = !DILocation(line: 119, column: 32, scope: !893)
!967 = !DILocation(line: 119, column: 38, scope: !893)
!968 = !DILocation(line: 119, column: 22, scope: !893)
!969 = !DILocation(line: 119, column: 9, scope: !893)
!970 = !DILocation(line: 120, column: 13, scope: !893)
!971 = !DILocation(line: 120, column: 22, scope: !893)
!972 = !DILocation(line: 120, column: 26, scope: !893)
!973 = !DILocation(line: 120, column: 32, scope: !893)
!974 = !DILocation(line: 120, column: 18, scope: !893)
!975 = !DILocation(line: 120, column: 9, scope: !893)
!976 = !DILocation(line: 122, column: 12, scope: !893)
!977 = !DILocation(line: 122, column: 5, scope: !893)
!978 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !657, file: !657, line: 16, type: !979, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!979 = !DISubroutineType(types: !980)
!980 = !{null, !460, !660, !100, !51, !460, !460, !460, !460}
!981 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !978, file: !657, line: 16, type: !460)
!982 = !DILocation(line: 16, column: 53, scope: !978)
!983 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !978, file: !657, line: 16, type: !660)
!984 = !DILocation(line: 16, column: 82, scope: !978)
!985 = !DILocalVariable(name: "mat", arg: 3, scope: !978, file: !657, line: 16, type: !100)
!986 = !DILocation(line: 16, column: 111, scope: !978)
!987 = !DILocalVariable(name: "acc", arg: 4, scope: !978, file: !657, line: 16, type: !51)
!988 = !DILocation(line: 16, column: 126, scope: !978)
!989 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !978, file: !657, line: 17, type: !460)
!990 = !DILocation(line: 17, column: 53, scope: !978)
!991 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !978, file: !657, line: 17, type: !460)
!992 = !DILocation(line: 17, column: 76, scope: !978)
!993 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !978, file: !657, line: 17, type: !460)
!994 = !DILocation(line: 17, column: 99, scope: !978)
!995 = !DILocalVariable(name: "triangular", arg: 8, scope: !978, file: !657, line: 17, type: !460)
!996 = !DILocation(line: 17, column: 119, scope: !978)
!997 = !DILocalVariable(name: "bs_mat_entries_used", scope: !978, file: !657, line: 19, type: !85)
!998 = !DILocation(line: 19, column: 9, scope: !978)
!999 = !DILocalVariable(name: "r", scope: !1000, file: !657, line: 20, type: !85)
!1000 = distinct !DILexicalBlock(scope: !978, file: !657, line: 20, column: 5)
!1001 = !DILocation(line: 20, column: 14, scope: !1000)
!1002 = !DILocation(line: 20, column: 10, scope: !1000)
!1003 = !DILocation(line: 20, column: 21, scope: !1004)
!1004 = distinct !DILexicalBlock(scope: !1000, file: !657, line: 20, column: 5)
!1005 = !DILocation(line: 20, column: 25, scope: !1004)
!1006 = !DILocation(line: 20, column: 23, scope: !1004)
!1007 = !DILocation(line: 20, column: 5, scope: !1000)
!1008 = !DILocalVariable(name: "c", scope: !1009, file: !657, line: 21, type: !85)
!1009 = distinct !DILexicalBlock(scope: !1010, file: !657, line: 21, column: 9)
!1010 = distinct !DILexicalBlock(scope: !1004, file: !657, line: 20, column: 43)
!1011 = !DILocation(line: 21, column: 18, scope: !1009)
!1012 = !DILocation(line: 21, column: 22, scope: !1009)
!1013 = !DILocation(line: 21, column: 35, scope: !1009)
!1014 = !DILocation(line: 21, column: 33, scope: !1009)
!1015 = !DILocation(line: 21, column: 14, scope: !1009)
!1016 = !DILocation(line: 21, column: 38, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1009, file: !657, line: 21, column: 9)
!1018 = !DILocation(line: 21, column: 42, scope: !1017)
!1019 = !DILocation(line: 21, column: 40, scope: !1017)
!1020 = !DILocation(line: 21, column: 9, scope: !1009)
!1021 = !DILocalVariable(name: "k", scope: !1022, file: !657, line: 22, type: !85)
!1022 = distinct !DILexicalBlock(scope: !1023, file: !657, line: 22, column: 13)
!1023 = distinct !DILexicalBlock(scope: !1017, file: !657, line: 21, column: 60)
!1024 = !DILocation(line: 22, column: 22, scope: !1022)
!1025 = !DILocation(line: 22, column: 18, scope: !1022)
!1026 = !DILocation(line: 22, column: 29, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !1022, file: !657, line: 22, column: 13)
!1028 = !DILocation(line: 22, column: 33, scope: !1027)
!1029 = !DILocation(line: 22, column: 31, scope: !1027)
!1030 = !DILocation(line: 22, column: 13, scope: !1022)
!1031 = !DILocation(line: 23, column: 31, scope: !1032)
!1032 = distinct !DILexicalBlock(scope: !1027, file: !657, line: 22, column: 51)
!1033 = !DILocation(line: 23, column: 44, scope: !1032)
!1034 = !DILocation(line: 23, column: 53, scope: !1032)
!1035 = !DILocation(line: 23, column: 67, scope: !1032)
!1036 = !DILocation(line: 23, column: 65, scope: !1032)
!1037 = !DILocation(line: 23, column: 51, scope: !1032)
!1038 = !DILocation(line: 23, column: 88, scope: !1032)
!1039 = !DILocation(line: 23, column: 92, scope: !1032)
!1040 = !DILocation(line: 23, column: 96, scope: !1032)
!1041 = !DILocation(line: 23, column: 94, scope: !1032)
!1042 = !DILocation(line: 23, column: 107, scope: !1032)
!1043 = !DILocation(line: 23, column: 105, scope: !1032)
!1044 = !DILocation(line: 23, column: 111, scope: !1032)
!1045 = !DILocation(line: 23, column: 117, scope: !1032)
!1046 = !DILocation(line: 23, column: 132, scope: !1032)
!1047 = !DILocation(line: 23, column: 136, scope: !1032)
!1048 = !DILocation(line: 23, column: 134, scope: !1032)
!1049 = !DILocation(line: 23, column: 147, scope: !1032)
!1050 = !DILocation(line: 23, column: 145, scope: !1032)
!1051 = !DILocation(line: 23, column: 129, scope: !1032)
!1052 = !DILocation(line: 23, column: 115, scope: !1032)
!1053 = !DILocation(line: 23, column: 17, scope: !1032)
!1054 = !DILocation(line: 24, column: 13, scope: !1032)
!1055 = !DILocation(line: 22, column: 45, scope: !1027)
!1056 = !DILocation(line: 22, column: 13, scope: !1027)
!1057 = distinct !{!1057, !1030, !1058, !146}
!1058 = !DILocation(line: 24, column: 13, scope: !1022)
!1059 = !DILocation(line: 25, column: 33, scope: !1023)
!1060 = !DILocation(line: 26, column: 9, scope: !1023)
!1061 = !DILocation(line: 21, column: 56, scope: !1017)
!1062 = !DILocation(line: 21, column: 9, scope: !1017)
!1063 = distinct !{!1063, !1020, !1064, !146}
!1064 = !DILocation(line: 26, column: 9, scope: !1009)
!1065 = !DILocation(line: 27, column: 5, scope: !1010)
!1066 = !DILocation(line: 20, column: 39, scope: !1004)
!1067 = !DILocation(line: 20, column: 5, scope: !1004)
!1068 = distinct !{!1068, !1007, !1069, !146}
!1069 = !DILocation(line: 27, column: 5, scope: !1000)
!1070 = !DILocation(line: 28, column: 1, scope: !978)
!1071 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !48, file: !48, line: 262, type: !1072, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1072 = !DISubroutineType(types: !1073)
!1073 = !{null, !100, !51, !85, !85}
!1074 = !DILocalVariable(name: "in", arg: 1, scope: !1071, file: !48, line: 262, type: !100)
!1075 = !DILocation(line: 262, column: 48, scope: !1071)
!1076 = !DILocalVariable(name: "out", arg: 2, scope: !1071, file: !48, line: 262, type: !51)
!1077 = !DILocation(line: 262, column: 62, scope: !1071)
!1078 = !DILocalVariable(name: "vecs", arg: 3, scope: !1071, file: !48, line: 262, type: !85)
!1079 = !DILocation(line: 262, column: 71, scope: !1071)
!1080 = !DILocalVariable(name: "m", arg: 4, scope: !1071, file: !48, line: 262, type: !85)
!1081 = !DILocation(line: 262, column: 81, scope: !1071)
!1082 = !DILocalVariable(name: "m_vec_limbs", scope: !1071, file: !48, line: 263, type: !460)
!1083 = !DILocation(line: 263, column: 15, scope: !1071)
!1084 = !DILocation(line: 263, column: 30, scope: !1071)
!1085 = !DILocation(line: 263, column: 32, scope: !1071)
!1086 = !DILocation(line: 263, column: 38, scope: !1071)
!1087 = !DILocalVariable(name: "_out", scope: !1071, file: !48, line: 264, type: !59)
!1088 = !DILocation(line: 264, column: 20, scope: !1071)
!1089 = !DILocation(line: 264, column: 45, scope: !1071)
!1090 = !DILocalVariable(name: "tmp", scope: !1071, file: !48, line: 265, type: !1091)
!1091 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 576, elements: !1092)
!1092 = !{!1093}
!1093 = !DISubrange(count: 9)
!1094 = !DILocation(line: 265, column: 14, scope: !1071)
!1095 = !DILocalVariable(name: "i", scope: !1096, file: !48, line: 266, type: !85)
!1096 = distinct !DILexicalBlock(scope: !1071, file: !48, line: 266, column: 5)
!1097 = !DILocation(line: 266, column: 14, scope: !1096)
!1098 = !DILocation(line: 266, column: 18, scope: !1096)
!1099 = !DILocation(line: 266, column: 22, scope: !1096)
!1100 = !DILocation(line: 266, column: 10, scope: !1096)
!1101 = !DILocation(line: 266, column: 26, scope: !1102)
!1102 = distinct !DILexicalBlock(scope: !1096, file: !48, line: 266, column: 5)
!1103 = !DILocation(line: 266, column: 28, scope: !1102)
!1104 = !DILocation(line: 266, column: 5, scope: !1096)
!1105 = !DILocation(line: 268, column: 9, scope: !1106)
!1106 = distinct !DILexicalBlock(scope: !1102, file: !48, line: 267, column: 5)
!1107 = !DILocation(line: 268, column: 21, scope: !1106)
!1108 = !DILocation(line: 268, column: 26, scope: !1106)
!1109 = !DILocation(line: 268, column: 28, scope: !1106)
!1110 = !DILocation(line: 268, column: 27, scope: !1106)
!1111 = !DILocation(line: 268, column: 29, scope: !1106)
!1112 = !DILocation(line: 268, column: 33, scope: !1106)
!1113 = !DILocation(line: 268, column: 34, scope: !1106)
!1114 = !DILocation(line: 269, column: 16, scope: !1106)
!1115 = !DILocation(line: 269, column: 23, scope: !1106)
!1116 = !DILocation(line: 269, column: 25, scope: !1106)
!1117 = !DILocation(line: 269, column: 24, scope: !1106)
!1118 = !DILocation(line: 269, column: 36, scope: !1106)
!1119 = !DILocation(line: 269, column: 9, scope: !1106)
!1120 = !DILocation(line: 269, column: 60, scope: !1106)
!1121 = !DILocation(line: 269, column: 71, scope: !1106)
!1122 = !DILocation(line: 270, column: 5, scope: !1106)
!1123 = !DILocation(line: 266, column: 35, scope: !1102)
!1124 = !DILocation(line: 266, column: 5, scope: !1102)
!1125 = distinct !{!1125, !1104, !1126, !146}
!1126 = !DILocation(line: 270, column: 5, scope: !1096)
!1127 = !DILocation(line: 271, column: 1, scope: !1071)
!1128 = distinct !DISubprogram(name: "mayo_expand_sk", scope: !48, file: !48, line: 310, type: !1129, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1129 = !DISubroutineType(types: !1130)
!1130 = !{!85, !379, !100, !1131}
!1131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1132, size: 64)
!1132 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !91, line: 294, baseType: !1133)
!1133 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !91, line: 291, size: 7257920, elements: !1134)
!1134 = !{!1135, !1136}
!1135 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !1133, file: !91, line: 292, baseType: !180, size: 7238592)
!1136 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !1133, file: !91, line: 293, baseType: !184, size: 19312, offset: 7238592)
!1137 = !DILocalVariable(name: "p", arg: 1, scope: !1128, file: !48, line: 310, type: !379)
!1138 = !DILocation(line: 310, column: 41, scope: !1128)
!1139 = !DILocalVariable(name: "csk", arg: 2, scope: !1128, file: !48, line: 310, type: !100)
!1140 = !DILocation(line: 310, column: 65, scope: !1128)
!1141 = !DILocalVariable(name: "sk", arg: 3, scope: !1128, file: !48, line: 311, type: !1131)
!1142 = !DILocation(line: 311, column: 26, scope: !1128)
!1143 = !DILocalVariable(name: "ret", scope: !1128, file: !48, line: 312, type: !85)
!1144 = !DILocation(line: 312, column: 9, scope: !1128)
!1145 = !DILocalVariable(name: "S", scope: !1128, file: !48, line: 313, type: !443)
!1146 = !DILocation(line: 313, column: 19, scope: !1128)
!1147 = !DILocalVariable(name: "P", scope: !1128, file: !48, line: 314, type: !51)
!1148 = !DILocation(line: 314, column: 15, scope: !1128)
!1149 = !DILocation(line: 314, column: 19, scope: !1128)
!1150 = !DILocation(line: 314, column: 23, scope: !1128)
!1151 = !DILocalVariable(name: "O", scope: !1128, file: !48, line: 315, type: !59)
!1152 = !DILocation(line: 315, column: 20, scope: !1128)
!1153 = !DILocation(line: 315, column: 24, scope: !1128)
!1154 = !DILocation(line: 315, column: 28, scope: !1128)
!1155 = !DILocalVariable(name: "param_o", scope: !1128, file: !48, line: 317, type: !460)
!1156 = !DILocation(line: 317, column: 15, scope: !1128)
!1157 = !DILocation(line: 317, column: 33, scope: !1128)
!1158 = !DILocation(line: 317, column: 25, scope: !1128)
!1159 = !DILocalVariable(name: "param_v", scope: !1128, file: !48, line: 318, type: !460)
!1160 = !DILocation(line: 318, column: 15, scope: !1128)
!1161 = !DILocation(line: 318, column: 33, scope: !1128)
!1162 = !DILocation(line: 318, column: 25, scope: !1128)
!1163 = !DILocalVariable(name: "param_O_bytes", scope: !1128, file: !48, line: 319, type: !460)
!1164 = !DILocation(line: 319, column: 15, scope: !1128)
!1165 = !DILocation(line: 319, column: 45, scope: !1128)
!1166 = !DILocation(line: 319, column: 31, scope: !1128)
!1167 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !1128, file: !48, line: 320, type: !460)
!1168 = !DILocation(line: 320, column: 15, scope: !1128)
!1169 = !DILocation(line: 320, column: 57, scope: !1128)
!1170 = !DILocation(line: 320, column: 37, scope: !1128)
!1171 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !1128, file: !48, line: 321, type: !460)
!1172 = !DILocation(line: 321, column: 15, scope: !1128)
!1173 = !DILocation(line: 321, column: 57, scope: !1128)
!1174 = !DILocation(line: 321, column: 37, scope: !1128)
!1175 = !DILocalVariable(name: "seed_sk", scope: !1128, file: !48, line: 323, type: !100)
!1176 = !DILocation(line: 323, column: 26, scope: !1128)
!1177 = !DILocation(line: 323, column: 36, scope: !1128)
!1178 = !DILocalVariable(name: "seed_pk", scope: !1128, file: !48, line: 324, type: !59)
!1179 = !DILocation(line: 324, column: 20, scope: !1128)
!1180 = !DILocation(line: 324, column: 30, scope: !1128)
!1181 = !DILocation(line: 326, column: 14, scope: !1128)
!1182 = !DILocation(line: 326, column: 17, scope: !1128)
!1183 = !DILocation(line: 326, column: 39, scope: !1128)
!1184 = !DILocation(line: 326, column: 37, scope: !1128)
!1185 = !DILocation(line: 326, column: 54, scope: !1128)
!1186 = !DILocation(line: 327, column: 14, scope: !1128)
!1187 = !DILocation(line: 326, column: 5, scope: !1128)
!1188 = !DILocation(line: 328, column: 12, scope: !1128)
!1189 = !DILocation(line: 328, column: 16, scope: !1128)
!1190 = !DILocation(line: 328, column: 14, scope: !1128)
!1191 = !DILocation(line: 328, column: 37, scope: !1128)
!1192 = !DILocation(line: 328, column: 40, scope: !1128)
!1193 = !DILocation(line: 328, column: 50, scope: !1128)
!1194 = !DILocation(line: 328, column: 48, scope: !1128)
!1195 = !DILocation(line: 328, column: 5, scope: !1128)
!1196 = !DILocation(line: 334, column: 18, scope: !1128)
!1197 = !DILocation(line: 334, column: 21, scope: !1128)
!1198 = !DILocation(line: 334, column: 24, scope: !1128)
!1199 = !DILocation(line: 334, column: 5, scope: !1128)
!1200 = !DILocalVariable(name: "P2", scope: !1128, file: !48, line: 341, type: !51)
!1201 = !DILocation(line: 341, column: 15, scope: !1128)
!1202 = !DILocation(line: 341, column: 20, scope: !1128)
!1203 = !DILocation(line: 341, column: 39, scope: !1128)
!1204 = !DILocation(line: 341, column: 24, scope: !1128)
!1205 = !DILocation(line: 341, column: 22, scope: !1128)
!1206 = !DILocalVariable(name: "P1", scope: !1128, file: !48, line: 343, type: !51)
!1207 = !DILocation(line: 343, column: 15, scope: !1128)
!1208 = !DILocation(line: 343, column: 20, scope: !1128)
!1209 = !DILocalVariable(name: "L", scope: !1128, file: !48, line: 346, type: !51)
!1210 = !DILocation(line: 346, column: 15, scope: !1128)
!1211 = !DILocation(line: 346, column: 19, scope: !1128)
!1212 = !DILocation(line: 347, column: 19, scope: !1128)
!1213 = !DILocation(line: 347, column: 22, scope: !1128)
!1214 = !DILocation(line: 347, column: 26, scope: !1128)
!1215 = !DILocation(line: 347, column: 29, scope: !1128)
!1216 = !DILocation(line: 347, column: 5, scope: !1128)
!1217 = !DILocation(line: 355, column: 23, scope: !1128)
!1218 = !DILocation(line: 355, column: 5, scope: !1128)
!1219 = !DILocation(line: 356, column: 12, scope: !1128)
!1220 = !DILocation(line: 356, column: 5, scope: !1128)
!1221 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !657, file: !657, line: 218, type: !746, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1222 = !DILocalVariable(name: "p", arg: 1, scope: !1221, file: !657, line: 218, type: !379)
!1223 = !DILocation(line: 218, column: 41, scope: !1221)
!1224 = !DILocalVariable(name: "P1", arg: 2, scope: !1221, file: !657, line: 218, type: !660)
!1225 = !DILocation(line: 218, column: 60, scope: !1221)
!1226 = !DILocalVariable(name: "O", arg: 3, scope: !1221, file: !657, line: 218, type: !100)
!1227 = !DILocation(line: 218, column: 85, scope: !1221)
!1228 = !DILocalVariable(name: "acc", arg: 4, scope: !1221, file: !657, line: 218, type: !51)
!1229 = !DILocation(line: 218, column: 98, scope: !1221)
!1230 = !DILocalVariable(name: "param_o", scope: !1221, file: !657, line: 222, type: !460)
!1231 = !DILocation(line: 222, column: 15, scope: !1221)
!1232 = !DILocation(line: 222, column: 33, scope: !1221)
!1233 = !DILocation(line: 222, column: 25, scope: !1221)
!1234 = !DILocalVariable(name: "param_v", scope: !1221, file: !657, line: 223, type: !460)
!1235 = !DILocation(line: 223, column: 15, scope: !1221)
!1236 = !DILocation(line: 223, column: 33, scope: !1221)
!1237 = !DILocation(line: 223, column: 25, scope: !1221)
!1238 = !DILocalVariable(name: "m_vec_limbs", scope: !1221, file: !657, line: 224, type: !460)
!1239 = !DILocation(line: 224, column: 15, scope: !1221)
!1240 = !DILocation(line: 224, column: 47, scope: !1221)
!1241 = !DILocation(line: 224, column: 29, scope: !1221)
!1242 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1221, file: !657, line: 226, type: !85)
!1243 = !DILocation(line: 226, column: 9, scope: !1221)
!1244 = !DILocalVariable(name: "r", scope: !1245, file: !657, line: 227, type: !85)
!1245 = distinct !DILexicalBlock(scope: !1221, file: !657, line: 227, column: 5)
!1246 = !DILocation(line: 227, column: 14, scope: !1245)
!1247 = !DILocation(line: 227, column: 10, scope: !1245)
!1248 = !DILocation(line: 227, column: 21, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1245, file: !657, line: 227, column: 5)
!1250 = !DILocation(line: 227, column: 25, scope: !1249)
!1251 = !DILocation(line: 227, column: 23, scope: !1249)
!1252 = !DILocation(line: 227, column: 5, scope: !1245)
!1253 = !DILocalVariable(name: "c", scope: !1254, file: !657, line: 228, type: !85)
!1254 = distinct !DILexicalBlock(scope: !1255, file: !657, line: 228, column: 9)
!1255 = distinct !DILexicalBlock(scope: !1249, file: !657, line: 227, column: 39)
!1256 = !DILocation(line: 228, column: 18, scope: !1254)
!1257 = !DILocation(line: 228, column: 22, scope: !1254)
!1258 = !DILocation(line: 228, column: 14, scope: !1254)
!1259 = !DILocation(line: 228, column: 25, scope: !1260)
!1260 = distinct !DILexicalBlock(scope: !1254, file: !657, line: 228, column: 9)
!1261 = !DILocation(line: 228, column: 29, scope: !1260)
!1262 = !DILocation(line: 228, column: 27, scope: !1260)
!1263 = !DILocation(line: 228, column: 9, scope: !1254)
!1264 = !DILocation(line: 229, column: 16, scope: !1265)
!1265 = distinct !DILexicalBlock(scope: !1266, file: !657, line: 229, column: 16)
!1266 = distinct !DILexicalBlock(scope: !1260, file: !657, line: 228, column: 43)
!1267 = !DILocation(line: 229, column: 19, scope: !1265)
!1268 = !DILocation(line: 229, column: 17, scope: !1265)
!1269 = !DILocation(line: 230, column: 37, scope: !1270)
!1270 = distinct !DILexicalBlock(scope: !1265, file: !657, line: 229, column: 22)
!1271 = !DILocation(line: 231, column: 17, scope: !1270)
!1272 = !DILocalVariable(name: "k", scope: !1273, file: !657, line: 233, type: !85)
!1273 = distinct !DILexicalBlock(scope: !1266, file: !657, line: 233, column: 13)
!1274 = !DILocation(line: 233, column: 22, scope: !1273)
!1275 = !DILocation(line: 233, column: 18, scope: !1273)
!1276 = !DILocation(line: 233, column: 29, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1273, file: !657, line: 233, column: 13)
!1278 = !DILocation(line: 233, column: 33, scope: !1277)
!1279 = !DILocation(line: 233, column: 31, scope: !1277)
!1280 = !DILocation(line: 233, column: 13, scope: !1273)
!1281 = !DILocation(line: 234, column: 31, scope: !1282)
!1282 = distinct !DILexicalBlock(scope: !1277, file: !657, line: 233, column: 50)
!1283 = !DILocation(line: 234, column: 44, scope: !1282)
!1284 = !DILocation(line: 234, column: 49, scope: !1282)
!1285 = !DILocation(line: 234, column: 63, scope: !1282)
!1286 = !DILocation(line: 234, column: 61, scope: !1282)
!1287 = !DILocation(line: 234, column: 47, scope: !1282)
!1288 = !DILocation(line: 234, column: 84, scope: !1282)
!1289 = !DILocation(line: 234, column: 86, scope: !1282)
!1290 = !DILocation(line: 234, column: 90, scope: !1282)
!1291 = !DILocation(line: 234, column: 88, scope: !1282)
!1292 = !DILocation(line: 234, column: 100, scope: !1282)
!1293 = !DILocation(line: 234, column: 98, scope: !1282)
!1294 = !DILocation(line: 234, column: 104, scope: !1282)
!1295 = !DILocation(line: 234, column: 110, scope: !1282)
!1296 = !DILocation(line: 234, column: 125, scope: !1282)
!1297 = !DILocation(line: 234, column: 129, scope: !1282)
!1298 = !DILocation(line: 234, column: 127, scope: !1282)
!1299 = !DILocation(line: 234, column: 139, scope: !1282)
!1300 = !DILocation(line: 234, column: 137, scope: !1282)
!1301 = !DILocation(line: 234, column: 122, scope: !1282)
!1302 = !DILocation(line: 234, column: 108, scope: !1282)
!1303 = !DILocation(line: 234, column: 17, scope: !1282)
!1304 = !DILocation(line: 235, column: 31, scope: !1282)
!1305 = !DILocation(line: 235, column: 44, scope: !1282)
!1306 = !DILocation(line: 235, column: 49, scope: !1282)
!1307 = !DILocation(line: 235, column: 63, scope: !1282)
!1308 = !DILocation(line: 235, column: 61, scope: !1282)
!1309 = !DILocation(line: 235, column: 47, scope: !1282)
!1310 = !DILocation(line: 235, column: 84, scope: !1282)
!1311 = !DILocation(line: 235, column: 86, scope: !1282)
!1312 = !DILocation(line: 235, column: 90, scope: !1282)
!1313 = !DILocation(line: 235, column: 88, scope: !1282)
!1314 = !DILocation(line: 235, column: 100, scope: !1282)
!1315 = !DILocation(line: 235, column: 98, scope: !1282)
!1316 = !DILocation(line: 235, column: 104, scope: !1282)
!1317 = !DILocation(line: 235, column: 110, scope: !1282)
!1318 = !DILocation(line: 235, column: 125, scope: !1282)
!1319 = !DILocation(line: 235, column: 129, scope: !1282)
!1320 = !DILocation(line: 235, column: 127, scope: !1282)
!1321 = !DILocation(line: 235, column: 139, scope: !1282)
!1322 = !DILocation(line: 235, column: 137, scope: !1282)
!1323 = !DILocation(line: 235, column: 122, scope: !1282)
!1324 = !DILocation(line: 235, column: 108, scope: !1282)
!1325 = !DILocation(line: 235, column: 17, scope: !1282)
!1326 = !DILocation(line: 236, column: 13, scope: !1282)
!1327 = !DILocation(line: 233, column: 44, scope: !1277)
!1328 = !DILocation(line: 233, column: 13, scope: !1277)
!1329 = distinct !{!1329, !1280, !1330, !146}
!1330 = !DILocation(line: 236, column: 13, scope: !1273)
!1331 = !DILocation(line: 237, column: 33, scope: !1266)
!1332 = !DILocation(line: 238, column: 9, scope: !1266)
!1333 = !DILocation(line: 228, column: 39, scope: !1260)
!1334 = !DILocation(line: 228, column: 9, scope: !1260)
!1335 = distinct !{!1335, !1263, !1336, !146}
!1336 = !DILocation(line: 238, column: 9, scope: !1254)
!1337 = !DILocation(line: 239, column: 5, scope: !1255)
!1338 = !DILocation(line: 227, column: 35, scope: !1249)
!1339 = !DILocation(line: 227, column: 5, scope: !1249)
!1340 = distinct !{!1340, !1252, !1341, !146}
!1341 = !DILocation(line: 239, column: 5, scope: !1245)
!1342 = !DILocation(line: 240, column: 1, scope: !1221)
!1343 = distinct !DISubprogram(name: "mayo_sign_signature", scope: !48, file: !48, line: 359, type: !1344, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1344 = !DISubroutineType(types: !1345)
!1345 = !{!85, !379, !59, !1346, !100, !57, !100}
!1346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!1347 = !DILocalVariable(name: "p", arg: 1, scope: !1343, file: !48, line: 359, type: !379)
!1348 = !DILocation(line: 359, column: 46, scope: !1343)
!1349 = !DILocalVariable(name: "sig", arg: 2, scope: !1343, file: !48, line: 359, type: !59)
!1350 = !DILocation(line: 359, column: 64, scope: !1343)
!1351 = !DILocalVariable(name: "siglen", arg: 3, scope: !1343, file: !48, line: 360, type: !1346)
!1352 = !DILocation(line: 360, column: 23, scope: !1343)
!1353 = !DILocalVariable(name: "m", arg: 4, scope: !1343, file: !48, line: 360, type: !100)
!1354 = !DILocation(line: 360, column: 52, scope: !1343)
!1355 = !DILocalVariable(name: "mlen", arg: 5, scope: !1343, file: !48, line: 361, type: !57)
!1356 = !DILocation(line: 361, column: 22, scope: !1343)
!1357 = !DILocalVariable(name: "csk", arg: 6, scope: !1343, file: !48, line: 361, type: !100)
!1358 = !DILocation(line: 361, column: 49, scope: !1343)
!1359 = !DILocalVariable(name: "ret", scope: !1343, file: !48, line: 362, type: !85)
!1360 = !DILocation(line: 362, column: 9, scope: !1343)
!1361 = !DILocalVariable(name: "tenc", scope: !1343, file: !48, line: 363, type: !1362)
!1362 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 568, elements: !1363)
!1363 = !{!1364}
!1364 = !DISubrange(count: 71)
!1365 = !DILocation(line: 363, column: 19, scope: !1343)
!1366 = !DILocalVariable(name: "t", scope: !1343, file: !48, line: 363, type: !1367)
!1367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 1136, elements: !1368)
!1368 = !{!1369}
!1369 = !DISubrange(count: 142)
!1370 = !DILocation(line: 363, column: 38, scope: !1343)
!1371 = !DILocalVariable(name: "y", scope: !1343, file: !48, line: 364, type: !1367)
!1372 = !DILocation(line: 364, column: 19, scope: !1343)
!1373 = !DILocalVariable(name: "salt", scope: !1343, file: !48, line: 365, type: !1374)
!1374 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 320, elements: !1375)
!1375 = !{!1376}
!1376 = !DISubrange(count: 40)
!1377 = !DILocation(line: 365, column: 19, scope: !1343)
!1378 = !DILocalVariable(name: "V", scope: !1343, file: !48, line: 366, type: !1379)
!1379 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 7392, elements: !1380)
!1380 = !{!1381}
!1381 = !DISubrange(count: 924)
!1382 = !DILocation(line: 366, column: 19, scope: !1343)
!1383 = !DILocalVariable(name: "Vdec", scope: !1343, file: !48, line: 366, type: !1384)
!1384 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 13632, elements: !1385)
!1385 = !{!1386}
!1386 = !DISubrange(count: 1704)
!1387 = !DILocation(line: 366, column: 57, scope: !1343)
!1388 = !DILocalVariable(name: "A", scope: !1343, file: !48, line: 367, type: !1389)
!1389 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 236160, elements: !1390)
!1390 = !{!1391}
!1391 = !DISubrange(count: 29520)
!1392 = !DILocation(line: 367, column: 19, scope: !1343)
!1393 = !DILocalVariable(name: "x", scope: !1343, file: !48, line: 368, type: !1394)
!1394 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 14784, elements: !1395)
!1395 = !{!1396}
!1396 = !DISubrange(count: 1848)
!1397 = !DILocation(line: 368, column: 19, scope: !1343)
!1398 = !DILocalVariable(name: "r", scope: !1343, file: !48, line: 369, type: !1399)
!1399 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 1640, elements: !1400)
!1400 = !{!1401}
!1401 = !DISubrange(count: 205)
!1402 = !DILocation(line: 369, column: 19, scope: !1343)
!1403 = !DILocalVariable(name: "s", scope: !1343, file: !48, line: 370, type: !1394)
!1404 = !DILocation(line: 370, column: 19, scope: !1343)
!1405 = !DILocalVariable(name: "seed_sk", scope: !1343, file: !48, line: 371, type: !100)
!1406 = !DILocation(line: 371, column: 26, scope: !1343)
!1407 = !DILocalVariable(name: "sk", scope: !1343, file: !48, line: 372, type: !1132, align: 256)
!1408 = !DILocation(line: 372, column: 22, scope: !1343)
!1409 = !DILocalVariable(name: "Ox", scope: !1343, file: !48, line: 373, type: !1367)
!1410 = !DILocation(line: 373, column: 19, scope: !1343)
!1411 = !DILocalVariable(name: "tmp", scope: !1343, file: !48, line: 374, type: !1412)
!1412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 1160, elements: !1413)
!1413 = !{!1414}
!1414 = !DISubrange(count: 145)
!1415 = !DILocation(line: 374, column: 19, scope: !1343)
!1416 = !DILocalVariable(name: "ctrbyte", scope: !1343, file: !48, line: 375, type: !59)
!1417 = !DILocation(line: 375, column: 20, scope: !1343)
!1418 = !DILocalVariable(name: "vi", scope: !1343, file: !48, line: 376, type: !59)
!1419 = !DILocation(line: 376, column: 20, scope: !1343)
!1420 = !DILocalVariable(name: "param_m", scope: !1343, file: !48, line: 378, type: !460)
!1421 = !DILocation(line: 378, column: 15, scope: !1343)
!1422 = !DILocation(line: 378, column: 33, scope: !1343)
!1423 = !DILocation(line: 378, column: 25, scope: !1343)
!1424 = !DILocalVariable(name: "param_n", scope: !1343, file: !48, line: 379, type: !460)
!1425 = !DILocation(line: 379, column: 15, scope: !1343)
!1426 = !DILocation(line: 379, column: 33, scope: !1343)
!1427 = !DILocation(line: 379, column: 25, scope: !1343)
!1428 = !DILocalVariable(name: "param_o", scope: !1343, file: !48, line: 380, type: !460)
!1429 = !DILocation(line: 380, column: 15, scope: !1343)
!1430 = !DILocation(line: 380, column: 33, scope: !1343)
!1431 = !DILocation(line: 380, column: 25, scope: !1343)
!1432 = !DILocalVariable(name: "param_k", scope: !1343, file: !48, line: 381, type: !460)
!1433 = !DILocation(line: 381, column: 15, scope: !1343)
!1434 = !DILocation(line: 381, column: 33, scope: !1343)
!1435 = !DILocation(line: 381, column: 25, scope: !1343)
!1436 = !DILocalVariable(name: "param_v", scope: !1343, file: !48, line: 382, type: !460)
!1437 = !DILocation(line: 382, column: 15, scope: !1343)
!1438 = !DILocation(line: 382, column: 33, scope: !1343)
!1439 = !DILocation(line: 382, column: 25, scope: !1343)
!1440 = !DILocalVariable(name: "param_m_bytes", scope: !1343, file: !48, line: 383, type: !460)
!1441 = !DILocation(line: 383, column: 15, scope: !1343)
!1442 = !DILocation(line: 383, column: 45, scope: !1343)
!1443 = !DILocation(line: 383, column: 31, scope: !1343)
!1444 = !DILocalVariable(name: "param_v_bytes", scope: !1343, file: !48, line: 384, type: !460)
!1445 = !DILocation(line: 384, column: 15, scope: !1343)
!1446 = !DILocation(line: 384, column: 45, scope: !1343)
!1447 = !DILocation(line: 384, column: 31, scope: !1343)
!1448 = !DILocalVariable(name: "param_r_bytes", scope: !1343, file: !48, line: 385, type: !460)
!1449 = !DILocation(line: 385, column: 15, scope: !1343)
!1450 = !DILocation(line: 385, column: 45, scope: !1343)
!1451 = !DILocation(line: 385, column: 31, scope: !1343)
!1452 = !DILocalVariable(name: "param_sig_bytes", scope: !1343, file: !48, line: 386, type: !460)
!1453 = !DILocation(line: 386, column: 15, scope: !1343)
!1454 = !DILocation(line: 386, column: 49, scope: !1343)
!1455 = !DILocation(line: 386, column: 33, scope: !1343)
!1456 = !DILocalVariable(name: "param_A_cols", scope: !1343, file: !48, line: 387, type: !460)
!1457 = !DILocation(line: 387, column: 15, scope: !1343)
!1458 = !DILocation(line: 387, column: 43, scope: !1343)
!1459 = !DILocation(line: 387, column: 30, scope: !1343)
!1460 = !DILocalVariable(name: "param_digest_bytes", scope: !1343, file: !48, line: 388, type: !460)
!1461 = !DILocation(line: 388, column: 15, scope: !1343)
!1462 = !DILocation(line: 388, column: 55, scope: !1343)
!1463 = !DILocation(line: 388, column: 36, scope: !1343)
!1464 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !1343, file: !48, line: 389, type: !460)
!1465 = !DILocation(line: 389, column: 15, scope: !1343)
!1466 = !DILocation(line: 389, column: 57, scope: !1343)
!1467 = !DILocation(line: 389, column: 37, scope: !1343)
!1468 = !DILocalVariable(name: "param_salt_bytes", scope: !1343, file: !48, line: 390, type: !460)
!1469 = !DILocation(line: 390, column: 15, scope: !1343)
!1470 = !DILocation(line: 390, column: 51, scope: !1343)
!1471 = !DILocation(line: 390, column: 34, scope: !1343)
!1472 = !DILocation(line: 392, column: 26, scope: !1343)
!1473 = !DILocation(line: 392, column: 29, scope: !1343)
!1474 = !DILocation(line: 392, column: 11, scope: !1343)
!1475 = !DILocation(line: 392, column: 9, scope: !1343)
!1476 = !DILocation(line: 393, column: 9, scope: !1477)
!1477 = distinct !DILexicalBlock(scope: !1343, file: !48, line: 393, column: 9)
!1478 = !DILocation(line: 393, column: 13, scope: !1477)
!1479 = !DILocation(line: 394, column: 9, scope: !1480)
!1480 = distinct !DILexicalBlock(scope: !1477, file: !48, line: 393, column: 25)
!1481 = !DILocation(line: 397, column: 15, scope: !1343)
!1482 = !DILocation(line: 397, column: 13, scope: !1343)
!1483 = !DILocation(line: 401, column: 14, scope: !1343)
!1484 = !DILocation(line: 401, column: 19, scope: !1343)
!1485 = !DILocation(line: 401, column: 39, scope: !1343)
!1486 = !DILocation(line: 401, column: 42, scope: !1343)
!1487 = !DILocation(line: 401, column: 5, scope: !1343)
!1488 = !DILocalVariable(name: "P1", scope: !1343, file: !48, line: 403, type: !51)
!1489 = !DILocation(line: 403, column: 15, scope: !1343)
!1490 = !DILocation(line: 403, column: 23, scope: !1343)
!1491 = !DILocation(line: 403, column: 20, scope: !1343)
!1492 = !DILocalVariable(name: "L", scope: !1343, file: !48, line: 404, type: !51)
!1493 = !DILocation(line: 404, column: 15, scope: !1343)
!1494 = !DILocation(line: 404, column: 20, scope: !1343)
!1495 = !DILocation(line: 404, column: 40, scope: !1343)
!1496 = !DILocation(line: 404, column: 25, scope: !1343)
!1497 = !DILocation(line: 404, column: 23, scope: !1343)
!1498 = !DILocalVariable(name: "Mtmp", scope: !1343, file: !48, line: 405, type: !1499)
!1499 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 117504, elements: !1500)
!1500 = !{!1501}
!1501 = !DISubrange(count: 1836)
!1502 = !DILocation(line: 405, column: 14, scope: !1343)
!1503 = !DILocation(line: 420, column: 21, scope: !1504)
!1504 = distinct !DILexicalBlock(scope: !1343, file: !48, line: 420, column: 9)
!1505 = !DILocation(line: 420, column: 27, scope: !1504)
!1506 = !DILocation(line: 420, column: 25, scope: !1504)
!1507 = !DILocation(line: 420, column: 47, scope: !1504)
!1508 = !DILocation(line: 420, column: 9, scope: !1504)
!1509 = !DILocation(line: 420, column: 65, scope: !1504)
!1510 = !DILocation(line: 421, column: 13, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1504, file: !48, line: 420, column: 77)
!1512 = !DILocation(line: 422, column: 9, scope: !1511)
!1513 = !DILocation(line: 427, column: 5, scope: !1343)
!1514 = !DILocation(line: 427, column: 18, scope: !1343)
!1515 = !DILocation(line: 427, column: 39, scope: !1343)
!1516 = !DILocation(line: 427, column: 57, scope: !1343)
!1517 = !DILocation(line: 428, column: 12, scope: !1343)
!1518 = !DILocation(line: 429, column: 14, scope: !1343)
!1519 = !DILocation(line: 429, column: 20, scope: !1343)
!1520 = !DILocation(line: 429, column: 38, scope: !1343)
!1521 = !DILocation(line: 430, column: 14, scope: !1343)
!1522 = !DILocation(line: 430, column: 35, scope: !1343)
!1523 = !DILocation(line: 430, column: 33, scope: !1343)
!1524 = !DILocation(line: 430, column: 54, scope: !1343)
!1525 = !DILocation(line: 430, column: 52, scope: !1343)
!1526 = !DILocation(line: 429, column: 5, scope: !1343)
!1527 = !DILocation(line: 437, column: 5, scope: !1343)
!1528 = !DILocation(line: 437, column: 18, scope: !1343)
!1529 = !DILocation(line: 437, column: 44, scope: !1343)
!1530 = !DILocation(line: 438, column: 15, scope: !1343)
!1531 = !DILocation(line: 438, column: 21, scope: !1343)
!1532 = !DILocation(line: 438, column: 19, scope: !1343)
!1533 = !DILocation(line: 438, column: 42, scope: !1343)
!1534 = !DILocation(line: 438, column: 40, scope: !1343)
!1535 = !DILocation(line: 438, column: 61, scope: !1343)
!1536 = !DILocation(line: 438, column: 59, scope: !1343)
!1537 = !DILocation(line: 438, column: 13, scope: !1343)
!1538 = !DILocation(line: 440, column: 14, scope: !1343)
!1539 = !DILocation(line: 440, column: 20, scope: !1343)
!1540 = !DILocation(line: 440, column: 35, scope: !1343)
!1541 = !DILocation(line: 440, column: 40, scope: !1343)
!1542 = !DILocation(line: 440, column: 61, scope: !1343)
!1543 = !DILocation(line: 440, column: 59, scope: !1343)
!1544 = !DILocation(line: 440, column: 5, scope: !1343)
!1545 = !DILocation(line: 442, column: 12, scope: !1343)
!1546 = !DILocation(line: 442, column: 18, scope: !1343)
!1547 = !DILocation(line: 442, column: 21, scope: !1343)
!1548 = !DILocation(line: 442, column: 5, scope: !1343)
!1549 = !DILocalVariable(name: "ctr", scope: !1550, file: !48, line: 444, type: !85)
!1550 = distinct !DILexicalBlock(scope: !1343, file: !48, line: 444, column: 5)
!1551 = !DILocation(line: 444, column: 14, scope: !1550)
!1552 = !DILocation(line: 444, column: 10, scope: !1550)
!1553 = !DILocation(line: 444, column: 23, scope: !1554)
!1554 = distinct !DILexicalBlock(scope: !1550, file: !48, line: 444, column: 5)
!1555 = !DILocation(line: 444, column: 27, scope: !1554)
!1556 = !DILocation(line: 444, column: 5, scope: !1550)
!1557 = !DILocation(line: 445, column: 35, scope: !1558)
!1558 = distinct !DILexicalBlock(scope: !1554, file: !48, line: 444, column: 42)
!1559 = !DILocation(line: 445, column: 20, scope: !1558)
!1560 = !DILocation(line: 445, column: 10, scope: !1558)
!1561 = !DILocation(line: 445, column: 18, scope: !1558)
!1562 = !DILocation(line: 447, column: 18, scope: !1558)
!1563 = !DILocation(line: 447, column: 21, scope: !1558)
!1564 = !DILocation(line: 447, column: 31, scope: !1558)
!1565 = !DILocation(line: 447, column: 29, scope: !1558)
!1566 = !DILocation(line: 447, column: 47, scope: !1558)
!1567 = !DILocation(line: 447, column: 45, scope: !1558)
!1568 = !DILocation(line: 447, column: 62, scope: !1558)
!1569 = !DILocation(line: 448, column: 18, scope: !1558)
!1570 = !DILocation(line: 448, column: 39, scope: !1558)
!1571 = !DILocation(line: 448, column: 37, scope: !1558)
!1572 = !DILocation(line: 448, column: 58, scope: !1558)
!1573 = !DILocation(line: 448, column: 56, scope: !1558)
!1574 = !DILocation(line: 448, column: 78, scope: !1558)
!1575 = !DILocation(line: 447, column: 9, scope: !1558)
!1576 = !DILocalVariable(name: "i", scope: !1577, file: !48, line: 451, type: !85)
!1577 = distinct !DILexicalBlock(scope: !1558, file: !48, line: 451, column: 9)
!1578 = !DILocation(line: 451, column: 18, scope: !1577)
!1579 = !DILocation(line: 451, column: 14, scope: !1577)
!1580 = !DILocation(line: 451, column: 25, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1577, file: !48, line: 451, column: 9)
!1582 = !DILocation(line: 451, column: 30, scope: !1581)
!1583 = !DILocation(line: 451, column: 38, scope: !1581)
!1584 = !DILocation(line: 451, column: 27, scope: !1581)
!1585 = !DILocation(line: 451, column: 9, scope: !1577)
!1586 = !DILocation(line: 452, column: 20, scope: !1587)
!1587 = distinct !DILexicalBlock(scope: !1581, file: !48, line: 451, column: 48)
!1588 = !DILocation(line: 452, column: 24, scope: !1587)
!1589 = !DILocation(line: 452, column: 28, scope: !1587)
!1590 = !DILocation(line: 452, column: 26, scope: !1587)
!1591 = !DILocation(line: 452, column: 22, scope: !1587)
!1592 = !DILocation(line: 452, column: 43, scope: !1587)
!1593 = !DILocation(line: 452, column: 50, scope: !1587)
!1594 = !DILocation(line: 452, column: 54, scope: !1587)
!1595 = !DILocation(line: 452, column: 52, scope: !1587)
!1596 = !DILocation(line: 452, column: 48, scope: !1587)
!1597 = !DILocation(line: 452, column: 63, scope: !1587)
!1598 = !DILocation(line: 452, column: 13, scope: !1587)
!1599 = !DILocation(line: 453, column: 9, scope: !1587)
!1600 = !DILocation(line: 451, column: 43, scope: !1581)
!1601 = !DILocation(line: 451, column: 9, scope: !1581)
!1602 = distinct !{!1602, !1585, !1603, !146}
!1603 = !DILocation(line: 453, column: 9, scope: !1577)
!1604 = !DILocation(line: 456, column: 27, scope: !1558)
!1605 = !DILocation(line: 456, column: 30, scope: !1558)
!1606 = !DILocation(line: 456, column: 36, scope: !1558)
!1607 = !DILocation(line: 456, column: 39, scope: !1558)
!1608 = !DILocation(line: 456, column: 43, scope: !1558)
!1609 = !DILocation(line: 456, column: 61, scope: !1558)
!1610 = !DILocation(line: 456, column: 9, scope: !1558)
!1611 = !DILocation(line: 458, column: 21, scope: !1558)
!1612 = !DILocation(line: 458, column: 36, scope: !1558)
!1613 = !DILocation(line: 458, column: 39, scope: !1558)
!1614 = !DILocation(line: 458, column: 42, scope: !1558)
!1615 = !DILocation(line: 458, column: 9, scope: !1558)
!1616 = !DILocation(line: 459, column: 19, scope: !1558)
!1617 = !DILocation(line: 459, column: 22, scope: !1558)
!1618 = !DILocation(line: 459, column: 28, scope: !1558)
!1619 = !DILocation(line: 459, column: 9, scope: !1558)
!1620 = !DILocalVariable(name: "i", scope: !1621, file: !48, line: 461, type: !85)
!1621 = distinct !DILexicalBlock(scope: !1558, file: !48, line: 461, column: 9)
!1622 = !DILocation(line: 461, column: 18, scope: !1621)
!1623 = !DILocation(line: 461, column: 14, scope: !1621)
!1624 = !DILocation(line: 461, column: 25, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1621, file: !48, line: 461, column: 9)
!1626 = !DILocation(line: 461, column: 29, scope: !1625)
!1627 = !DILocation(line: 461, column: 27, scope: !1625)
!1628 = !DILocation(line: 461, column: 9, scope: !1621)
!1629 = !DILocation(line: 463, column: 18, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1625, file: !48, line: 462, column: 9)
!1631 = !DILocation(line: 463, column: 17, scope: !1630)
!1632 = !DILocation(line: 463, column: 22, scope: !1630)
!1633 = !DILocation(line: 463, column: 30, scope: !1630)
!1634 = !DILocation(line: 463, column: 29, scope: !1630)
!1635 = !DILocation(line: 463, column: 38, scope: !1630)
!1636 = !DILocation(line: 463, column: 20, scope: !1630)
!1637 = !DILocation(line: 463, column: 43, scope: !1630)
!1638 = !DILocation(line: 463, column: 13, scope: !1630)
!1639 = !DILocation(line: 463, column: 48, scope: !1630)
!1640 = !DILocation(line: 464, column: 9, scope: !1630)
!1641 = !DILocation(line: 461, column: 39, scope: !1625)
!1642 = !DILocation(line: 461, column: 9, scope: !1625)
!1643 = distinct !{!1643, !1628, !1644, !146}
!1644 = !DILocation(line: 464, column: 9, scope: !1621)
!1645 = !DILocation(line: 466, column: 16, scope: !1558)
!1646 = !DILocation(line: 466, column: 20, scope: !1558)
!1647 = !DILocation(line: 466, column: 30, scope: !1558)
!1648 = !DILocation(line: 466, column: 28, scope: !1558)
!1649 = !DILocation(line: 466, column: 18, scope: !1558)
!1650 = !DILocation(line: 466, column: 45, scope: !1558)
!1651 = !DILocation(line: 467, column: 16, scope: !1558)
!1652 = !DILocation(line: 468, column: 16, scope: !1558)
!1653 = !DILocation(line: 467, column: 24, scope: !1558)
!1654 = !DILocation(line: 466, column: 9, scope: !1558)
!1655 = !DILocation(line: 470, column: 29, scope: !1656)
!1656 = distinct !DILexicalBlock(scope: !1558, file: !48, line: 470, column: 13)
!1657 = !DILocation(line: 470, column: 32, scope: !1656)
!1658 = !DILocation(line: 470, column: 35, scope: !1656)
!1659 = !DILocation(line: 470, column: 38, scope: !1656)
!1660 = !DILocation(line: 470, column: 41, scope: !1656)
!1661 = !DILocation(line: 470, column: 44, scope: !1656)
!1662 = !DILocation(line: 470, column: 53, scope: !1656)
!1663 = !DILocation(line: 470, column: 62, scope: !1656)
!1664 = !DILocation(line: 470, column: 71, scope: !1656)
!1665 = !DILocation(line: 470, column: 13, scope: !1656)
!1666 = !DILocation(line: 471, column: 13, scope: !1667)
!1667 = distinct !DILexicalBlock(scope: !1656, file: !48, line: 470, column: 86)
!1668 = !DILocation(line: 473, column: 13, scope: !1669)
!1669 = distinct !DILexicalBlock(scope: !1656, file: !48, line: 472, column: 16)
!1670 = !DILocation(line: 474, column: 13, scope: !1669)
!1671 = !DILocation(line: 476, column: 5, scope: !1558)
!1672 = !DILocation(line: 444, column: 35, scope: !1554)
!1673 = !DILocation(line: 444, column: 5, scope: !1554)
!1674 = distinct !{!1674, !1556, !1675, !146}
!1675 = !DILocation(line: 476, column: 5, scope: !1550)
!1676 = !DILocalVariable(name: "i", scope: !1677, file: !48, line: 478, type: !85)
!1677 = distinct !DILexicalBlock(scope: !1343, file: !48, line: 478, column: 5)
!1678 = !DILocation(line: 478, column: 14, scope: !1677)
!1679 = !DILocation(line: 478, column: 10, scope: !1677)
!1680 = !DILocation(line: 478, column: 21, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1677, file: !48, line: 478, column: 5)
!1682 = !DILocation(line: 478, column: 26, scope: !1681)
!1683 = !DILocation(line: 478, column: 34, scope: !1681)
!1684 = !DILocation(line: 478, column: 23, scope: !1681)
!1685 = !DILocation(line: 478, column: 5, scope: !1677)
!1686 = !DILocation(line: 479, column: 14, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1681, file: !48, line: 478, column: 44)
!1688 = !DILocation(line: 479, column: 21, scope: !1687)
!1689 = !DILocation(line: 479, column: 26, scope: !1687)
!1690 = !DILocation(line: 479, column: 36, scope: !1687)
!1691 = !DILocation(line: 479, column: 34, scope: !1687)
!1692 = !DILocation(line: 479, column: 23, scope: !1687)
!1693 = !DILocation(line: 479, column: 19, scope: !1687)
!1694 = !DILocation(line: 479, column: 12, scope: !1687)
!1695 = !DILocation(line: 480, column: 20, scope: !1687)
!1696 = !DILocation(line: 480, column: 17, scope: !1687)
!1697 = !DILocation(line: 480, column: 23, scope: !1687)
!1698 = !DILocation(line: 480, column: 27, scope: !1687)
!1699 = !DILocation(line: 480, column: 31, scope: !1687)
!1700 = !DILocation(line: 480, column: 29, scope: !1687)
!1701 = !DILocation(line: 480, column: 25, scope: !1687)
!1702 = !DILocation(line: 480, column: 40, scope: !1687)
!1703 = !DILocation(line: 480, column: 44, scope: !1687)
!1704 = !DILocation(line: 480, column: 53, scope: !1687)
!1705 = !DILocation(line: 480, column: 63, scope: !1687)
!1706 = !DILocation(line: 480, column: 61, scope: !1687)
!1707 = !DILocation(line: 480, column: 9, scope: !1687)
!1708 = !DILocation(line: 481, column: 17, scope: !1687)
!1709 = !DILocation(line: 481, column: 21, scope: !1687)
!1710 = !DILocation(line: 481, column: 25, scope: !1687)
!1711 = !DILocation(line: 481, column: 29, scope: !1687)
!1712 = !DILocation(line: 481, column: 33, scope: !1687)
!1713 = !DILocation(line: 481, column: 31, scope: !1687)
!1714 = !DILocation(line: 481, column: 27, scope: !1687)
!1715 = !DILocation(line: 481, column: 42, scope: !1687)
!1716 = !DILocation(line: 481, column: 52, scope: !1687)
!1717 = !DILocation(line: 481, column: 50, scope: !1687)
!1718 = !DILocation(line: 481, column: 9, scope: !1687)
!1719 = !DILocation(line: 482, column: 9, scope: !1687)
!1720 = !DILocation(line: 482, column: 20, scope: !1687)
!1721 = !DILocation(line: 482, column: 24, scope: !1687)
!1722 = !DILocation(line: 482, column: 22, scope: !1687)
!1723 = !DILocation(line: 482, column: 35, scope: !1687)
!1724 = !DILocation(line: 482, column: 45, scope: !1687)
!1725 = !DILocation(line: 482, column: 43, scope: !1687)
!1726 = !DILocation(line: 482, column: 59, scope: !1687)
!1727 = !DILocation(line: 482, column: 63, scope: !1687)
!1728 = !DILocation(line: 482, column: 61, scope: !1687)
!1729 = !DILocation(line: 482, column: 72, scope: !1687)
!1730 = !DILocation(line: 483, column: 5, scope: !1687)
!1731 = !DILocation(line: 478, column: 39, scope: !1681)
!1732 = !DILocation(line: 478, column: 5, scope: !1681)
!1733 = distinct !{!1733, !1685, !1734, !146}
!1734 = !DILocation(line: 483, column: 5, scope: !1677)
!1735 = !DILocation(line: 484, column: 12, scope: !1343)
!1736 = !DILocation(line: 484, column: 15, scope: !1343)
!1737 = !DILocation(line: 484, column: 20, scope: !1343)
!1738 = !DILocation(line: 484, column: 30, scope: !1343)
!1739 = !DILocation(line: 484, column: 28, scope: !1343)
!1740 = !DILocation(line: 484, column: 5, scope: !1343)
!1741 = !DILocation(line: 486, column: 12, scope: !1343)
!1742 = !DILocation(line: 486, column: 18, scope: !1343)
!1743 = !DILocation(line: 486, column: 5, scope: !1343)
!1744 = !DILocation(line: 486, column: 36, scope: !1343)
!1745 = !DILocation(line: 486, column: 60, scope: !1343)
!1746 = !DILocation(line: 487, column: 15, scope: !1343)
!1747 = !DILocation(line: 487, column: 6, scope: !1343)
!1748 = !DILocation(line: 487, column: 13, scope: !1343)
!1749 = !DILocation(line: 487, column: 5, scope: !1343)
!1750 = !DILabel(scope: !1343, name: "err", file: !48, line: 489, column: 1)
!1751 = !DILocation(line: 489, column: 1, scope: !1343)
!1752 = !DILocation(line: 490, column: 23, scope: !1343)
!1753 = !DILocation(line: 490, column: 5, scope: !1343)
!1754 = !DILocation(line: 491, column: 23, scope: !1343)
!1755 = !DILocation(line: 491, column: 5, scope: !1343)
!1756 = !DILocation(line: 492, column: 23, scope: !1343)
!1757 = !DILocation(line: 492, column: 5, scope: !1343)
!1758 = !DILocation(line: 493, column: 23, scope: !1343)
!1759 = !DILocation(line: 493, column: 5, scope: !1343)
!1760 = !DILocation(line: 494, column: 26, scope: !1343)
!1761 = !DILocation(line: 494, column: 23, scope: !1343)
!1762 = !DILocation(line: 494, column: 5, scope: !1343)
!1763 = !DILocation(line: 495, column: 5, scope: !1343)
!1764 = !DILocation(line: 496, column: 23, scope: !1343)
!1765 = !DILocation(line: 496, column: 5, scope: !1343)
!1766 = !DILocation(line: 497, column: 23, scope: !1343)
!1767 = !DILocation(line: 497, column: 5, scope: !1343)
!1768 = !DILocation(line: 498, column: 23, scope: !1343)
!1769 = !DILocation(line: 498, column: 5, scope: !1343)
!1770 = !DILocation(line: 499, column: 12, scope: !1343)
!1771 = !DILocation(line: 499, column: 5, scope: !1343)
!1772 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !657, file: !657, line: 244, type: !1773, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1773 = !DISubroutineType(types: !1774)
!1774 = !{null, !379, !100, !660, !660, !51, !51}
!1775 = !DILocalVariable(name: "p", arg: 1, scope: !1772, file: !657, line: 244, type: !379)
!1776 = !DILocation(line: 244, column: 45, scope: !1772)
!1777 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1772, file: !657, line: 244, type: !100)
!1778 = !DILocation(line: 244, column: 69, scope: !1772)
!1779 = !DILocalVariable(name: "L", arg: 3, scope: !1772, file: !657, line: 244, type: !660)
!1780 = !DILocation(line: 244, column: 91, scope: !1772)
!1781 = !DILocalVariable(name: "P1", arg: 4, scope: !1772, file: !657, line: 244, type: !660)
!1782 = !DILocation(line: 244, column: 110, scope: !1772)
!1783 = !DILocalVariable(name: "VL", arg: 5, scope: !1772, file: !657, line: 244, type: !51)
!1784 = !DILocation(line: 244, column: 124, scope: !1772)
!1785 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1772, file: !657, line: 244, type: !51)
!1786 = !DILocation(line: 244, column: 138, scope: !1772)
!1787 = !DILocalVariable(name: "param_k", scope: !1772, file: !657, line: 246, type: !460)
!1788 = !DILocation(line: 246, column: 15, scope: !1772)
!1789 = !DILocation(line: 246, column: 33, scope: !1772)
!1790 = !DILocation(line: 246, column: 25, scope: !1772)
!1791 = !DILocalVariable(name: "param_v", scope: !1772, file: !657, line: 247, type: !460)
!1792 = !DILocation(line: 247, column: 15, scope: !1772)
!1793 = !DILocation(line: 247, column: 33, scope: !1772)
!1794 = !DILocation(line: 247, column: 25, scope: !1772)
!1795 = !DILocalVariable(name: "param_o", scope: !1772, file: !657, line: 248, type: !460)
!1796 = !DILocation(line: 248, column: 15, scope: !1772)
!1797 = !DILocation(line: 248, column: 33, scope: !1772)
!1798 = !DILocation(line: 248, column: 25, scope: !1772)
!1799 = !DILocation(line: 251, column: 43, scope: !1772)
!1800 = !DILocation(line: 251, column: 25, scope: !1772)
!1801 = !DILocation(line: 251, column: 47, scope: !1772)
!1802 = !DILocation(line: 251, column: 53, scope: !1772)
!1803 = !DILocation(line: 251, column: 56, scope: !1772)
!1804 = !DILocation(line: 251, column: 60, scope: !1772)
!1805 = !DILocation(line: 251, column: 69, scope: !1772)
!1806 = !DILocation(line: 251, column: 78, scope: !1772)
!1807 = !DILocation(line: 251, column: 5, scope: !1772)
!1808 = !DILocalVariable(name: "Pv", scope: !1772, file: !657, line: 254, type: !1809)
!1809 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 981504, elements: !1810)
!1810 = !{!1811}
!1811 = !DISubrange(count: 15336)
!1812 = !DILocation(line: 254, column: 14, scope: !1772)
!1813 = !DILocation(line: 255, column: 17, scope: !1772)
!1814 = !DILocation(line: 255, column: 20, scope: !1772)
!1815 = !DILocation(line: 255, column: 24, scope: !1772)
!1816 = !DILocation(line: 255, column: 30, scope: !1772)
!1817 = !DILocation(line: 255, column: 5, scope: !1772)
!1818 = !DILocation(line: 256, column: 43, scope: !1772)
!1819 = !DILocation(line: 256, column: 25, scope: !1772)
!1820 = !DILocation(line: 256, column: 47, scope: !1772)
!1821 = !DILocation(line: 256, column: 53, scope: !1772)
!1822 = !DILocation(line: 256, column: 57, scope: !1772)
!1823 = !DILocation(line: 256, column: 63, scope: !1772)
!1824 = !DILocation(line: 256, column: 72, scope: !1772)
!1825 = !DILocation(line: 256, column: 81, scope: !1772)
!1826 = !DILocation(line: 256, column: 5, scope: !1772)
!1827 = !DILocation(line: 257, column: 1, scope: !1772)
!1828 = distinct !DISubprogram(name: "compute_rhs", scope: !48, file: !48, line: 43, type: !1829, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!1829 = !DISubroutineType(types: !1830)
!1830 = !{null, !379, !51, !100, !59}
!1831 = !DILocalVariable(name: "p", arg: 1, scope: !1828, file: !48, line: 43, type: !379)
!1832 = !DILocation(line: 43, column: 46, scope: !1828)
!1833 = !DILocalVariable(name: "vPv", arg: 2, scope: !1828, file: !48, line: 43, type: !51)
!1834 = !DILocation(line: 43, column: 59, scope: !1828)
!1835 = !DILocalVariable(name: "t", arg: 3, scope: !1828, file: !48, line: 43, type: !100)
!1836 = !DILocation(line: 43, column: 85, scope: !1828)
!1837 = !DILocalVariable(name: "y", arg: 4, scope: !1828, file: !48, line: 43, type: !59)
!1838 = !DILocation(line: 43, column: 103, scope: !1828)
!1839 = !DILocalVariable(name: "top_pos", scope: !1828, file: !48, line: 48, type: !1840)
!1840 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !57)
!1841 = !DILocation(line: 48, column: 18, scope: !1828)
!1842 = !DILocation(line: 48, column: 38, scope: !1828)
!1843 = !DILocation(line: 48, column: 30, scope: !1828)
!1844 = !DILocation(line: 48, column: 41, scope: !1828)
!1845 = !DILocation(line: 48, column: 46, scope: !1828)
!1846 = !DILocation(line: 48, column: 52, scope: !1828)
!1847 = !DILocation(line: 48, column: 28, scope: !1828)
!1848 = !DILocalVariable(name: "m_vec_limbs", scope: !1828, file: !48, line: 49, type: !1840)
!1849 = !DILocation(line: 49, column: 18, scope: !1828)
!1850 = !DILocation(line: 49, column: 50, scope: !1828)
!1851 = !DILocation(line: 49, column: 32, scope: !1828)
!1852 = !DILocation(line: 52, column: 16, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1828, file: !48, line: 52, column: 8)
!1854 = !DILocation(line: 52, column: 8, scope: !1853)
!1855 = !DILocation(line: 52, column: 19, scope: !1853)
!1856 = !DILocation(line: 52, column: 24, scope: !1853)
!1857 = !DILocalVariable(name: "mask", scope: !1858, file: !48, line: 53, type: !52)
!1858 = distinct !DILexicalBlock(scope: !1853, file: !48, line: 52, column: 29)
!1859 = !DILocation(line: 53, column: 18, scope: !1858)
!1860 = !DILocation(line: 54, column: 28, scope: !1858)
!1861 = !DILocation(line: 54, column: 20, scope: !1858)
!1862 = !DILocation(line: 54, column: 31, scope: !1858)
!1863 = !DILocation(line: 54, column: 36, scope: !1858)
!1864 = !DILocation(line: 54, column: 14, scope: !1858)
!1865 = !DILocation(line: 55, column: 14, scope: !1858)
!1866 = !DILocalVariable(name: "i", scope: !1867, file: !48, line: 56, type: !85)
!1867 = distinct !DILexicalBlock(scope: !1858, file: !48, line: 56, column: 9)
!1868 = !DILocation(line: 56, column: 18, scope: !1867)
!1869 = !DILocation(line: 56, column: 14, scope: !1867)
!1870 = !DILocation(line: 56, column: 25, scope: !1871)
!1871 = distinct !DILexicalBlock(scope: !1867, file: !48, line: 56, column: 9)
!1872 = !DILocation(line: 56, column: 37, scope: !1871)
!1873 = !DILocation(line: 56, column: 29, scope: !1871)
!1874 = !DILocation(line: 56, column: 48, scope: !1871)
!1875 = !DILocation(line: 56, column: 40, scope: !1871)
!1876 = !DILocation(line: 56, column: 39, scope: !1871)
!1877 = !DILocation(line: 56, column: 27, scope: !1871)
!1878 = !DILocation(line: 56, column: 9, scope: !1867)
!1879 = !DILocation(line: 58, column: 53, scope: !1880)
!1880 = distinct !DILexicalBlock(scope: !1871, file: !48, line: 57, column: 9)
!1881 = !DILocation(line: 58, column: 13, scope: !1880)
!1882 = !DILocation(line: 58, column: 17, scope: !1880)
!1883 = !DILocation(line: 58, column: 19, scope: !1880)
!1884 = !DILocation(line: 58, column: 18, scope: !1880)
!1885 = !DILocation(line: 58, column: 33, scope: !1880)
!1886 = !DILocation(line: 58, column: 31, scope: !1880)
!1887 = !DILocation(line: 58, column: 45, scope: !1880)
!1888 = !DILocation(line: 58, column: 50, scope: !1880)
!1889 = !DILocation(line: 59, column: 9, scope: !1880)
!1890 = !DILocation(line: 56, column: 53, scope: !1871)
!1891 = !DILocation(line: 56, column: 9, scope: !1871)
!1892 = distinct !{!1892, !1878, !1893, !146}
!1893 = !DILocation(line: 59, column: 9, scope: !1867)
!1894 = !DILocation(line: 60, column: 5, scope: !1858)
!1895 = !DILocalVariable(name: "temp", scope: !1828, file: !48, line: 62, type: !1091)
!1896 = !DILocation(line: 62, column: 14, scope: !1828)
!1897 = !DILocalVariable(name: "temp_bytes", scope: !1828, file: !48, line: 63, type: !59)
!1898 = !DILocation(line: 63, column: 20, scope: !1828)
!1899 = !DILocation(line: 63, column: 51, scope: !1828)
!1900 = !DILocalVariable(name: "i", scope: !1901, file: !48, line: 64, type: !85)
!1901 = distinct !DILexicalBlock(scope: !1828, file: !48, line: 64, column: 5)
!1902 = !DILocation(line: 64, column: 14, scope: !1901)
!1903 = !DILocation(line: 64, column: 26, scope: !1901)
!1904 = !DILocation(line: 64, column: 18, scope: !1901)
!1905 = !DILocation(line: 64, column: 29, scope: !1901)
!1906 = !DILocation(line: 64, column: 10, scope: !1901)
!1907 = !DILocation(line: 64, column: 34, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1901, file: !48, line: 64, column: 5)
!1909 = !DILocation(line: 64, column: 36, scope: !1908)
!1910 = !DILocation(line: 64, column: 5, scope: !1901)
!1911 = !DILocalVariable(name: "j", scope: !1912, file: !48, line: 65, type: !85)
!1912 = distinct !DILexicalBlock(scope: !1913, file: !48, line: 65, column: 9)
!1913 = distinct !DILexicalBlock(scope: !1908, file: !48, line: 64, column: 48)
!1914 = !DILocation(line: 65, column: 18, scope: !1912)
!1915 = !DILocation(line: 65, column: 22, scope: !1912)
!1916 = !DILocation(line: 65, column: 14, scope: !1912)
!1917 = !DILocation(line: 65, column: 25, scope: !1918)
!1918 = distinct !DILexicalBlock(scope: !1912, file: !48, line: 65, column: 9)
!1919 = !DILocation(line: 65, column: 37, scope: !1918)
!1920 = !DILocation(line: 65, column: 29, scope: !1918)
!1921 = !DILocation(line: 65, column: 27, scope: !1918)
!1922 = !DILocation(line: 65, column: 9, scope: !1912)
!1923 = !DILocalVariable(name: "top", scope: !1924, file: !48, line: 67, type: !50)
!1924 = distinct !DILexicalBlock(scope: !1918, file: !48, line: 65, column: 46)
!1925 = !DILocation(line: 67, column: 27, scope: !1924)
!1926 = !DILocation(line: 67, column: 39, scope: !1924)
!1927 = !DILocation(line: 67, column: 50, scope: !1924)
!1928 = !DILocation(line: 67, column: 34, scope: !1924)
!1929 = !DILocation(line: 67, column: 57, scope: !1924)
!1930 = !DILocation(line: 67, column: 54, scope: !1924)
!1931 = !DILocation(line: 67, column: 66, scope: !1924)
!1932 = !DILocation(line: 67, column: 33, scope: !1924)
!1933 = !DILocation(line: 68, column: 18, scope: !1924)
!1934 = !DILocation(line: 68, column: 29, scope: !1924)
!1935 = !DILocation(line: 68, column: 13, scope: !1924)
!1936 = !DILocation(line: 68, column: 33, scope: !1924)
!1937 = !DILocalVariable(name: "k", scope: !1938, file: !48, line: 69, type: !85)
!1938 = distinct !DILexicalBlock(scope: !1924, file: !48, line: 69, column: 13)
!1939 = !DILocation(line: 69, column: 21, scope: !1938)
!1940 = !DILocation(line: 69, column: 25, scope: !1938)
!1941 = !DILocation(line: 69, column: 37, scope: !1938)
!1942 = !DILocation(line: 69, column: 17, scope: !1938)
!1943 = !DILocation(line: 69, column: 42, scope: !1944)
!1944 = distinct !DILexicalBlock(scope: !1938, file: !48, line: 69, column: 13)
!1945 = !DILocation(line: 69, column: 43, scope: !1944)
!1946 = !DILocation(line: 69, column: 13, scope: !1938)
!1947 = !DILocation(line: 70, column: 35, scope: !1948)
!1948 = distinct !DILexicalBlock(scope: !1944, file: !48, line: 69, column: 52)
!1949 = !DILocation(line: 70, column: 30, scope: !1948)
!1950 = !DILocation(line: 70, column: 38, scope: !1948)
!1951 = !DILocation(line: 70, column: 22, scope: !1948)
!1952 = !DILocation(line: 70, column: 23, scope: !1948)
!1953 = !DILocation(line: 70, column: 17, scope: !1948)
!1954 = !DILocation(line: 70, column: 27, scope: !1948)
!1955 = !DILocation(line: 71, column: 22, scope: !1948)
!1956 = !DILocation(line: 71, column: 17, scope: !1948)
!1957 = !DILocation(line: 71, column: 25, scope: !1948)
!1958 = !DILocation(line: 72, column: 13, scope: !1948)
!1959 = !DILocation(line: 69, column: 49, scope: !1944)
!1960 = !DILocation(line: 69, column: 13, scope: !1944)
!1961 = distinct !{!1961, !1946, !1962, !146}
!1962 = !DILocation(line: 72, column: 13, scope: !1938)
!1963 = !DILocalVariable(name: "jj", scope: !1964, file: !48, line: 74, type: !85)
!1964 = distinct !DILexicalBlock(scope: !1924, file: !48, line: 74, column: 13)
!1965 = !DILocation(line: 74, column: 22, scope: !1964)
!1966 = !DILocation(line: 74, column: 18, scope: !1964)
!1967 = !DILocation(line: 74, column: 30, scope: !1968)
!1968 = distinct !DILexicalBlock(scope: !1964, file: !48, line: 74, column: 13)
!1969 = !DILocation(line: 74, column: 33, scope: !1968)
!1970 = !DILocation(line: 74, column: 13, scope: !1964)
!1971 = !DILocation(line: 75, column: 20, scope: !1972)
!1972 = distinct !DILexicalBlock(scope: !1973, file: !48, line: 75, column: 20)
!1973 = distinct !DILexicalBlock(scope: !1968, file: !48, line: 74, column: 53)
!1974 = !DILocation(line: 75, column: 22, scope: !1972)
!1975 = !DILocation(line: 75, column: 25, scope: !1972)
!1976 = !DILocation(line: 79, column: 47, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1972, file: !48, line: 75, column: 30)
!1978 = !DILocation(line: 79, column: 65, scope: !1977)
!1979 = !DILocation(line: 79, column: 52, scope: !1977)
!1980 = !DILocation(line: 79, column: 68, scope: !1977)
!1981 = !DILocation(line: 79, column: 41, scope: !1977)
!1982 = !DILocation(line: 79, column: 21, scope: !1977)
!1983 = !DILocation(line: 79, column: 32, scope: !1977)
!1984 = !DILocation(line: 79, column: 34, scope: !1977)
!1985 = !DILocation(line: 79, column: 38, scope: !1977)
!1986 = !DILocation(line: 81, column: 17, scope: !1977)
!1987 = !DILocation(line: 86, column: 47, scope: !1988)
!1988 = distinct !DILexicalBlock(scope: !1972, file: !48, line: 82, column: 22)
!1989 = !DILocation(line: 86, column: 65, scope: !1988)
!1990 = !DILocation(line: 86, column: 52, scope: !1988)
!1991 = !DILocation(line: 86, column: 68, scope: !1988)
!1992 = !DILocation(line: 86, column: 41, scope: !1988)
!1993 = !DILocation(line: 86, column: 73, scope: !1988)
!1994 = !DILocation(line: 86, column: 21, scope: !1988)
!1995 = !DILocation(line: 86, column: 32, scope: !1988)
!1996 = !DILocation(line: 86, column: 34, scope: !1988)
!1997 = !DILocation(line: 86, column: 38, scope: !1988)
!1998 = !DILocation(line: 89, column: 13, scope: !1973)
!1999 = !DILocation(line: 74, column: 49, scope: !1968)
!2000 = !DILocation(line: 74, column: 13, scope: !1968)
!2001 = distinct !{!2001, !1970, !2002, !146}
!2002 = !DILocation(line: 89, column: 13, scope: !1964)
!2003 = !DILocalVariable(name: "k", scope: !2004, file: !48, line: 92, type: !57)
!2004 = distinct !DILexicalBlock(scope: !1924, file: !48, line: 92, column: 13)
!2005 = !DILocation(line: 92, column: 24, scope: !2004)
!2006 = !DILocation(line: 92, column: 17, scope: !2004)
!2007 = !DILocation(line: 92, column: 29, scope: !2008)
!2008 = distinct !DILexicalBlock(scope: !2004, file: !48, line: 92, column: 13)
!2009 = !DILocation(line: 92, column: 33, scope: !2008)
!2010 = !DILocation(line: 92, column: 31, scope: !2008)
!2011 = !DILocation(line: 92, column: 13, scope: !2004)
!2012 = !DILocation(line: 93, column: 28, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2008, file: !48, line: 92, column: 51)
!2014 = !DILocation(line: 93, column: 34, scope: !2013)
!2015 = !DILocation(line: 93, column: 46, scope: !2013)
!2016 = !DILocation(line: 93, column: 38, scope: !2013)
!2017 = !DILocation(line: 93, column: 36, scope: !2013)
!2018 = !DILocation(line: 93, column: 51, scope: !2013)
!2019 = !DILocation(line: 93, column: 49, scope: !2013)
!2020 = !DILocation(line: 93, column: 32, scope: !2013)
!2021 = !DILocation(line: 93, column: 56, scope: !2013)
!2022 = !DILocation(line: 93, column: 54, scope: !2013)
!2023 = !DILocation(line: 93, column: 70, scope: !2013)
!2024 = !DILocation(line: 93, column: 68, scope: !2013)
!2025 = !DILocation(line: 93, column: 77, scope: !2013)
!2026 = !DILocation(line: 93, column: 80, scope: !2013)
!2027 = !DILocation(line: 93, column: 78, scope: !2013)
!2028 = !DILocation(line: 93, column: 76, scope: !2013)
!2029 = !DILocation(line: 93, column: 83, scope: !2013)
!2030 = !DILocation(line: 93, column: 89, scope: !2013)
!2031 = !DILocation(line: 93, column: 101, scope: !2013)
!2032 = !DILocation(line: 93, column: 93, scope: !2013)
!2033 = !DILocation(line: 93, column: 91, scope: !2013)
!2034 = !DILocation(line: 93, column: 106, scope: !2013)
!2035 = !DILocation(line: 93, column: 104, scope: !2013)
!2036 = !DILocation(line: 93, column: 87, scope: !2013)
!2037 = !DILocation(line: 93, column: 111, scope: !2013)
!2038 = !DILocation(line: 93, column: 109, scope: !2013)
!2039 = !DILocation(line: 93, column: 125, scope: !2013)
!2040 = !DILocation(line: 93, column: 123, scope: !2013)
!2041 = !DILocation(line: 93, column: 82, scope: !2013)
!2042 = !DILocation(line: 93, column: 73, scope: !2013)
!2043 = !DILocation(line: 93, column: 22, scope: !2013)
!2044 = !DILocation(line: 93, column: 17, scope: !2013)
!2045 = !DILocation(line: 93, column: 25, scope: !2013)
!2046 = !DILocation(line: 94, column: 13, scope: !2013)
!2047 = !DILocation(line: 92, column: 48, scope: !2008)
!2048 = !DILocation(line: 92, column: 13, scope: !2008)
!2049 = distinct !{!2049, !2011, !2050, !146}
!2050 = !DILocation(line: 94, column: 13, scope: !2004)
!2051 = !DILocation(line: 95, column: 9, scope: !1924)
!2052 = !DILocation(line: 65, column: 42, scope: !1918)
!2053 = !DILocation(line: 65, column: 9, scope: !1918)
!2054 = distinct !{!2054, !1922, !2055, !146}
!2055 = !DILocation(line: 95, column: 9, scope: !1912)
!2056 = !DILocation(line: 96, column: 5, scope: !1913)
!2057 = !DILocation(line: 64, column: 44, scope: !1908)
!2058 = !DILocation(line: 64, column: 5, scope: !1908)
!2059 = distinct !{!2059, !1910, !2060, !146}
!2060 = !DILocation(line: 96, column: 5, scope: !1901)
!2061 = !DILocalVariable(name: "i", scope: !2062, file: !48, line: 99, type: !85)
!2062 = distinct !DILexicalBlock(scope: !1828, file: !48, line: 99, column: 5)
!2063 = !DILocation(line: 99, column: 14, scope: !2062)
!2064 = !DILocation(line: 99, column: 10, scope: !2062)
!2065 = !DILocation(line: 99, column: 21, scope: !2066)
!2066 = distinct !DILexicalBlock(scope: !2062, file: !48, line: 99, column: 5)
!2067 = !DILocation(line: 99, column: 33, scope: !2066)
!2068 = !DILocation(line: 99, column: 25, scope: !2066)
!2069 = !DILocation(line: 99, column: 23, scope: !2066)
!2070 = !DILocation(line: 99, column: 5, scope: !2062)
!2071 = !DILocation(line: 105, column: 18, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2066, file: !48, line: 100, column: 5)
!2073 = !DILocation(line: 105, column: 20, scope: !2072)
!2074 = !DILocation(line: 105, column: 28, scope: !2072)
!2075 = !DILocation(line: 105, column: 39, scope: !2072)
!2076 = !DILocation(line: 105, column: 40, scope: !2072)
!2077 = !DILocation(line: 105, column: 44, scope: !2072)
!2078 = !DILocation(line: 105, column: 25, scope: !2072)
!2079 = !DILocation(line: 105, column: 9, scope: !2072)
!2080 = !DILocation(line: 105, column: 11, scope: !2072)
!2081 = !DILocation(line: 105, column: 16, scope: !2072)
!2082 = !DILocation(line: 106, column: 18, scope: !2072)
!2083 = !DILocation(line: 106, column: 20, scope: !2072)
!2084 = !DILocation(line: 106, column: 21, scope: !2072)
!2085 = !DILocation(line: 106, column: 28, scope: !2072)
!2086 = !DILocation(line: 106, column: 39, scope: !2072)
!2087 = !DILocation(line: 106, column: 40, scope: !2072)
!2088 = !DILocation(line: 106, column: 44, scope: !2072)
!2089 = !DILocation(line: 106, column: 25, scope: !2072)
!2090 = !DILocation(line: 106, column: 9, scope: !2072)
!2091 = !DILocation(line: 106, column: 11, scope: !2072)
!2092 = !DILocation(line: 106, column: 12, scope: !2072)
!2093 = !DILocation(line: 106, column: 16, scope: !2072)
!2094 = !DILocation(line: 108, column: 5, scope: !2072)
!2095 = !DILocation(line: 99, column: 38, scope: !2066)
!2096 = !DILocation(line: 99, column: 5, scope: !2066)
!2097 = distinct !{!2097, !2070, !2098, !146}
!2098 = !DILocation(line: 108, column: 5, scope: !2062)
!2099 = !DILocation(line: 109, column: 1, scope: !1828)
!2100 = distinct !DISubprogram(name: "compute_A", scope: !48, file: !48, line: 154, type: !2101, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2101 = !DISubroutineType(types: !2102)
!2102 = !{null, !379, !51, !59}
!2103 = !DILocalVariable(name: "p", arg: 1, scope: !2100, file: !48, line: 154, type: !379)
!2104 = !DILocation(line: 154, column: 44, scope: !2100)
!2105 = !DILocalVariable(name: "VtL", arg: 2, scope: !2100, file: !48, line: 154, type: !51)
!2106 = !DILocation(line: 154, column: 57, scope: !2100)
!2107 = !DILocalVariable(name: "A_out", arg: 3, scope: !2100, file: !48, line: 154, type: !59)
!2108 = !DILocation(line: 154, column: 77, scope: !2100)
!2109 = !DILocalVariable(name: "bits_to_shift", scope: !2100, file: !48, line: 159, type: !85)
!2110 = !DILocation(line: 159, column: 9, scope: !2100)
!2111 = !DILocalVariable(name: "words_to_shift", scope: !2100, file: !48, line: 160, type: !85)
!2112 = !DILocation(line: 160, column: 9, scope: !2100)
!2113 = !DILocalVariable(name: "m_vec_limbs", scope: !2100, file: !48, line: 161, type: !460)
!2114 = !DILocation(line: 161, column: 15, scope: !2100)
!2115 = !DILocation(line: 161, column: 47, scope: !2100)
!2116 = !DILocation(line: 161, column: 29, scope: !2100)
!2117 = !DILocalVariable(name: "A", scope: !2100, file: !48, line: 162, type: !2118)
!2118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 239616, elements: !2119)
!2119 = !{!2120}
!2120 = !DISubrange(count: 3744)
!2121 = !DILocation(line: 162, column: 14, scope: !2100)
!2122 = !DILocalVariable(name: "A_width", scope: !2100, file: !48, line: 163, type: !57)
!2123 = !DILocation(line: 163, column: 12, scope: !2100)
!2124 = !DILocation(line: 163, column: 32, scope: !2100)
!2125 = !DILocation(line: 163, column: 24, scope: !2100)
!2126 = !DILocation(line: 163, column: 43, scope: !2100)
!2127 = !DILocation(line: 163, column: 35, scope: !2100)
!2128 = !DILocation(line: 163, column: 34, scope: !2100)
!2129 = !DILocation(line: 163, column: 46, scope: !2100)
!2130 = !DILocation(line: 163, column: 51, scope: !2100)
!2131 = !DILocation(line: 163, column: 55, scope: !2100)
!2132 = !DILocation(line: 163, column: 22, scope: !2100)
!2133 = !DILocalVariable(name: "Mi", scope: !2100, file: !48, line: 164, type: !660)
!2134 = !DILocation(line: 164, column: 21, scope: !2100)
!2135 = !DILocalVariable(name: "Mj", scope: !2100, file: !48, line: 164, type: !660)
!2136 = !DILocation(line: 164, column: 26, scope: !2100)
!2137 = !DILocation(line: 167, column: 16, scope: !2138)
!2138 = distinct !DILexicalBlock(scope: !2100, file: !48, line: 167, column: 8)
!2139 = !DILocation(line: 167, column: 8, scope: !2138)
!2140 = !DILocation(line: 167, column: 19, scope: !2138)
!2141 = !DILocation(line: 167, column: 24, scope: !2138)
!2142 = !DILocalVariable(name: "mask", scope: !2143, file: !48, line: 168, type: !52)
!2143 = distinct !DILexicalBlock(scope: !2138, file: !48, line: 167, column: 29)
!2144 = !DILocation(line: 168, column: 18, scope: !2143)
!2145 = !DILocation(line: 169, column: 27, scope: !2143)
!2146 = !DILocation(line: 169, column: 19, scope: !2143)
!2147 = !DILocation(line: 169, column: 30, scope: !2143)
!2148 = !DILocation(line: 169, column: 35, scope: !2143)
!2149 = !DILocation(line: 169, column: 14, scope: !2143)
!2150 = !DILocation(line: 170, column: 14, scope: !2143)
!2151 = !DILocalVariable(name: "i", scope: !2152, file: !48, line: 171, type: !85)
!2152 = distinct !DILexicalBlock(scope: !2143, file: !48, line: 171, column: 9)
!2153 = !DILocation(line: 171, column: 18, scope: !2152)
!2154 = !DILocation(line: 171, column: 14, scope: !2152)
!2155 = !DILocation(line: 171, column: 25, scope: !2156)
!2156 = distinct !DILexicalBlock(scope: !2152, file: !48, line: 171, column: 9)
!2157 = !DILocation(line: 171, column: 37, scope: !2156)
!2158 = !DILocation(line: 171, column: 29, scope: !2156)
!2159 = !DILocation(line: 171, column: 48, scope: !2156)
!2160 = !DILocation(line: 171, column: 40, scope: !2156)
!2161 = !DILocation(line: 171, column: 39, scope: !2156)
!2162 = !DILocation(line: 171, column: 27, scope: !2156)
!2163 = !DILocation(line: 171, column: 9, scope: !2152)
!2164 = !DILocation(line: 173, column: 53, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2156, file: !48, line: 172, column: 9)
!2166 = !DILocation(line: 173, column: 13, scope: !2165)
!2167 = !DILocation(line: 173, column: 17, scope: !2165)
!2168 = !DILocation(line: 173, column: 19, scope: !2165)
!2169 = !DILocation(line: 173, column: 18, scope: !2165)
!2170 = !DILocation(line: 173, column: 33, scope: !2165)
!2171 = !DILocation(line: 173, column: 31, scope: !2165)
!2172 = !DILocation(line: 173, column: 45, scope: !2165)
!2173 = !DILocation(line: 173, column: 50, scope: !2165)
!2174 = !DILocation(line: 174, column: 9, scope: !2165)
!2175 = !DILocation(line: 171, column: 53, scope: !2156)
!2176 = !DILocation(line: 171, column: 9, scope: !2156)
!2177 = distinct !{!2177, !2163, !2178, !146}
!2178 = !DILocation(line: 174, column: 9, scope: !2152)
!2179 = !DILocation(line: 175, column: 5, scope: !2143)
!2180 = !DILocalVariable(name: "i", scope: !2181, file: !48, line: 177, type: !85)
!2181 = distinct !DILexicalBlock(scope: !2100, file: !48, line: 177, column: 5)
!2182 = !DILocation(line: 177, column: 14, scope: !2181)
!2183 = !DILocation(line: 177, column: 10, scope: !2181)
!2184 = !DILocation(line: 177, column: 21, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2181, file: !48, line: 177, column: 5)
!2186 = !DILocation(line: 177, column: 34, scope: !2185)
!2187 = !DILocation(line: 177, column: 26, scope: !2185)
!2188 = !DILocation(line: 177, column: 37, scope: !2185)
!2189 = !DILocation(line: 177, column: 23, scope: !2185)
!2190 = !DILocation(line: 177, column: 5, scope: !2181)
!2191 = !DILocalVariable(name: "j", scope: !2192, file: !48, line: 178, type: !85)
!2192 = distinct !DILexicalBlock(scope: !2193, file: !48, line: 178, column: 9)
!2193 = distinct !DILexicalBlock(scope: !2185, file: !48, line: 177, column: 47)
!2194 = !DILocation(line: 178, column: 18, scope: !2192)
!2195 = !DILocation(line: 178, column: 30, scope: !2192)
!2196 = !DILocation(line: 178, column: 22, scope: !2192)
!2197 = !DILocation(line: 178, column: 33, scope: !2192)
!2198 = !DILocation(line: 178, column: 14, scope: !2192)
!2199 = !DILocation(line: 178, column: 38, scope: !2200)
!2200 = distinct !DILexicalBlock(scope: !2192, file: !48, line: 178, column: 9)
!2201 = !DILocation(line: 178, column: 43, scope: !2200)
!2202 = !DILocation(line: 178, column: 40, scope: !2200)
!2203 = !DILocation(line: 178, column: 9, scope: !2192)
!2204 = !DILocation(line: 180, column: 18, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2200, file: !48, line: 178, column: 51)
!2206 = !DILocation(line: 180, column: 24, scope: !2205)
!2207 = !DILocation(line: 180, column: 28, scope: !2205)
!2208 = !DILocation(line: 180, column: 26, scope: !2205)
!2209 = !DILocation(line: 180, column: 50, scope: !2205)
!2210 = !DILocation(line: 180, column: 42, scope: !2205)
!2211 = !DILocation(line: 180, column: 40, scope: !2205)
!2212 = !DILocation(line: 180, column: 22, scope: !2205)
!2213 = !DILocation(line: 180, column: 16, scope: !2205)
!2214 = !DILocalVariable(name: "c", scope: !2215, file: !48, line: 181, type: !85)
!2215 = distinct !DILexicalBlock(scope: !2205, file: !48, line: 181, column: 13)
!2216 = !DILocation(line: 181, column: 22, scope: !2215)
!2217 = !DILocation(line: 181, column: 18, scope: !2215)
!2218 = !DILocation(line: 181, column: 29, scope: !2219)
!2219 = distinct !DILexicalBlock(scope: !2215, file: !48, line: 181, column: 13)
!2220 = !DILocation(line: 181, column: 41, scope: !2219)
!2221 = !DILocation(line: 181, column: 33, scope: !2219)
!2222 = !DILocation(line: 181, column: 31, scope: !2219)
!2223 = !DILocation(line: 181, column: 13, scope: !2215)
!2224 = !DILocalVariable(name: "k", scope: !2225, file: !48, line: 182, type: !85)
!2225 = distinct !DILexicalBlock(scope: !2226, file: !48, line: 182, column: 17)
!2226 = distinct !DILexicalBlock(scope: !2219, file: !48, line: 181, column: 50)
!2227 = !DILocation(line: 182, column: 26, scope: !2225)
!2228 = !DILocation(line: 182, column: 22, scope: !2225)
!2229 = !DILocation(line: 182, column: 33, scope: !2230)
!2230 = distinct !DILexicalBlock(scope: !2225, file: !48, line: 182, column: 17)
!2231 = !DILocation(line: 182, column: 37, scope: !2230)
!2232 = !DILocation(line: 182, column: 35, scope: !2230)
!2233 = !DILocation(line: 182, column: 17, scope: !2225)
!2234 = !DILocation(line: 184, column: 78, scope: !2235)
!2235 = distinct !DILexicalBlock(scope: !2230, file: !48, line: 183, column: 17)
!2236 = !DILocation(line: 184, column: 81, scope: !2235)
!2237 = !DILocation(line: 184, column: 85, scope: !2235)
!2238 = !DILocation(line: 184, column: 87, scope: !2235)
!2239 = !DILocation(line: 184, column: 86, scope: !2235)
!2240 = !DILocation(line: 184, column: 83, scope: !2235)
!2241 = !DILocation(line: 184, column: 103, scope: !2235)
!2242 = !DILocation(line: 184, column: 100, scope: !2235)
!2243 = !DILocation(line: 184, column: 32, scope: !2235)
!2244 = !DILocation(line: 184, column: 24, scope: !2235)
!2245 = !DILocation(line: 184, column: 37, scope: !2235)
!2246 = !DILocation(line: 184, column: 35, scope: !2235)
!2247 = !DILocation(line: 184, column: 41, scope: !2235)
!2248 = !DILocation(line: 184, column: 39, scope: !2235)
!2249 = !DILocation(line: 184, column: 46, scope: !2235)
!2250 = !DILocation(line: 184, column: 50, scope: !2235)
!2251 = !DILocation(line: 184, column: 48, scope: !2235)
!2252 = !DILocation(line: 184, column: 45, scope: !2235)
!2253 = !DILocation(line: 184, column: 66, scope: !2235)
!2254 = !DILocation(line: 184, column: 65, scope: !2235)
!2255 = !DILocation(line: 184, column: 43, scope: !2235)
!2256 = !DILocation(line: 184, column: 21, scope: !2235)
!2257 = !DILocation(line: 184, column: 75, scope: !2235)
!2258 = !DILocation(line: 185, column: 24, scope: !2259)
!2259 = distinct !DILexicalBlock(scope: !2235, file: !48, line: 185, column: 24)
!2260 = !DILocation(line: 185, column: 38, scope: !2259)
!2261 = !DILocation(line: 186, column: 86, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2259, file: !48, line: 185, column: 42)
!2263 = !DILocation(line: 186, column: 89, scope: !2262)
!2264 = !DILocation(line: 186, column: 93, scope: !2262)
!2265 = !DILocation(line: 186, column: 95, scope: !2262)
!2266 = !DILocation(line: 186, column: 94, scope: !2262)
!2267 = !DILocation(line: 186, column: 91, scope: !2262)
!2268 = !DILocation(line: 186, column: 115, scope: !2262)
!2269 = !DILocation(line: 186, column: 114, scope: !2262)
!2270 = !DILocation(line: 186, column: 108, scope: !2262)
!2271 = !DILocation(line: 186, column: 36, scope: !2262)
!2272 = !DILocation(line: 186, column: 28, scope: !2262)
!2273 = !DILocation(line: 186, column: 41, scope: !2262)
!2274 = !DILocation(line: 186, column: 39, scope: !2262)
!2275 = !DILocation(line: 186, column: 45, scope: !2262)
!2276 = !DILocation(line: 186, column: 43, scope: !2262)
!2277 = !DILocation(line: 186, column: 50, scope: !2262)
!2278 = !DILocation(line: 186, column: 54, scope: !2262)
!2279 = !DILocation(line: 186, column: 52, scope: !2262)
!2280 = !DILocation(line: 186, column: 69, scope: !2262)
!2281 = !DILocation(line: 186, column: 49, scope: !2262)
!2282 = !DILocation(line: 186, column: 74, scope: !2262)
!2283 = !DILocation(line: 186, column: 73, scope: !2262)
!2284 = !DILocation(line: 186, column: 47, scope: !2262)
!2285 = !DILocation(line: 186, column: 25, scope: !2262)
!2286 = !DILocation(line: 186, column: 83, scope: !2262)
!2287 = !DILocation(line: 187, column: 21, scope: !2262)
!2288 = !DILocation(line: 188, column: 17, scope: !2235)
!2289 = !DILocation(line: 182, column: 51, scope: !2230)
!2290 = !DILocation(line: 182, column: 17, scope: !2230)
!2291 = distinct !{!2291, !2233, !2292, !146}
!2292 = !DILocation(line: 188, column: 17, scope: !2225)
!2293 = !DILocation(line: 189, column: 13, scope: !2226)
!2294 = !DILocation(line: 181, column: 46, scope: !2219)
!2295 = !DILocation(line: 181, column: 13, scope: !2219)
!2296 = distinct !{!2296, !2223, !2297, !146}
!2297 = !DILocation(line: 189, column: 13, scope: !2215)
!2298 = !DILocation(line: 191, column: 17, scope: !2299)
!2299 = distinct !DILexicalBlock(scope: !2205, file: !48, line: 191, column: 17)
!2300 = !DILocation(line: 191, column: 22, scope: !2299)
!2301 = !DILocation(line: 191, column: 19, scope: !2299)
!2302 = !DILocation(line: 192, column: 22, scope: !2303)
!2303 = distinct !DILexicalBlock(scope: !2299, file: !48, line: 191, column: 25)
!2304 = !DILocation(line: 192, column: 28, scope: !2303)
!2305 = !DILocation(line: 192, column: 32, scope: !2303)
!2306 = !DILocation(line: 192, column: 30, scope: !2303)
!2307 = !DILocation(line: 192, column: 54, scope: !2303)
!2308 = !DILocation(line: 192, column: 46, scope: !2303)
!2309 = !DILocation(line: 192, column: 44, scope: !2303)
!2310 = !DILocation(line: 192, column: 26, scope: !2303)
!2311 = !DILocation(line: 192, column: 20, scope: !2303)
!2312 = !DILocalVariable(name: "c", scope: !2313, file: !48, line: 193, type: !85)
!2313 = distinct !DILexicalBlock(scope: !2303, file: !48, line: 193, column: 17)
!2314 = !DILocation(line: 193, column: 26, scope: !2313)
!2315 = !DILocation(line: 193, column: 22, scope: !2313)
!2316 = !DILocation(line: 193, column: 33, scope: !2317)
!2317 = distinct !DILexicalBlock(scope: !2313, file: !48, line: 193, column: 17)
!2318 = !DILocation(line: 193, column: 45, scope: !2317)
!2319 = !DILocation(line: 193, column: 37, scope: !2317)
!2320 = !DILocation(line: 193, column: 35, scope: !2317)
!2321 = !DILocation(line: 193, column: 17, scope: !2313)
!2322 = !DILocalVariable(name: "k", scope: !2323, file: !48, line: 194, type: !85)
!2323 = distinct !DILexicalBlock(scope: !2324, file: !48, line: 194, column: 21)
!2324 = distinct !DILexicalBlock(scope: !2317, file: !48, line: 193, column: 54)
!2325 = !DILocation(line: 194, column: 30, scope: !2323)
!2326 = !DILocation(line: 194, column: 26, scope: !2323)
!2327 = !DILocation(line: 194, column: 37, scope: !2328)
!2328 = distinct !DILexicalBlock(scope: !2323, file: !48, line: 194, column: 21)
!2329 = !DILocation(line: 194, column: 41, scope: !2328)
!2330 = !DILocation(line: 194, column: 39, scope: !2328)
!2331 = !DILocation(line: 194, column: 21, scope: !2323)
!2332 = !DILocation(line: 196, column: 81, scope: !2333)
!2333 = distinct !DILexicalBlock(scope: !2328, file: !48, line: 195, column: 21)
!2334 = !DILocation(line: 196, column: 84, scope: !2333)
!2335 = !DILocation(line: 196, column: 88, scope: !2333)
!2336 = !DILocation(line: 196, column: 90, scope: !2333)
!2337 = !DILocation(line: 196, column: 89, scope: !2333)
!2338 = !DILocation(line: 196, column: 86, scope: !2333)
!2339 = !DILocation(line: 196, column: 106, scope: !2333)
!2340 = !DILocation(line: 196, column: 103, scope: !2333)
!2341 = !DILocation(line: 196, column: 35, scope: !2333)
!2342 = !DILocation(line: 196, column: 27, scope: !2333)
!2343 = !DILocation(line: 196, column: 40, scope: !2333)
!2344 = !DILocation(line: 196, column: 38, scope: !2333)
!2345 = !DILocation(line: 196, column: 44, scope: !2333)
!2346 = !DILocation(line: 196, column: 42, scope: !2333)
!2347 = !DILocation(line: 196, column: 49, scope: !2333)
!2348 = !DILocation(line: 196, column: 53, scope: !2333)
!2349 = !DILocation(line: 196, column: 51, scope: !2333)
!2350 = !DILocation(line: 196, column: 48, scope: !2333)
!2351 = !DILocation(line: 196, column: 69, scope: !2333)
!2352 = !DILocation(line: 196, column: 68, scope: !2333)
!2353 = !DILocation(line: 196, column: 46, scope: !2333)
!2354 = !DILocation(line: 196, column: 25, scope: !2333)
!2355 = !DILocation(line: 196, column: 78, scope: !2333)
!2356 = !DILocation(line: 197, column: 28, scope: !2357)
!2357 = distinct !DILexicalBlock(scope: !2333, file: !48, line: 197, column: 28)
!2358 = !DILocation(line: 197, column: 42, scope: !2357)
!2359 = !DILocation(line: 198, column: 89, scope: !2360)
!2360 = distinct !DILexicalBlock(scope: !2357, file: !48, line: 197, column: 46)
!2361 = !DILocation(line: 198, column: 92, scope: !2360)
!2362 = !DILocation(line: 198, column: 96, scope: !2360)
!2363 = !DILocation(line: 198, column: 98, scope: !2360)
!2364 = !DILocation(line: 198, column: 97, scope: !2360)
!2365 = !DILocation(line: 198, column: 94, scope: !2360)
!2366 = !DILocation(line: 198, column: 118, scope: !2360)
!2367 = !DILocation(line: 198, column: 117, scope: !2360)
!2368 = !DILocation(line: 198, column: 111, scope: !2360)
!2369 = !DILocation(line: 198, column: 39, scope: !2360)
!2370 = !DILocation(line: 198, column: 31, scope: !2360)
!2371 = !DILocation(line: 198, column: 44, scope: !2360)
!2372 = !DILocation(line: 198, column: 42, scope: !2360)
!2373 = !DILocation(line: 198, column: 48, scope: !2360)
!2374 = !DILocation(line: 198, column: 46, scope: !2360)
!2375 = !DILocation(line: 198, column: 53, scope: !2360)
!2376 = !DILocation(line: 198, column: 57, scope: !2360)
!2377 = !DILocation(line: 198, column: 55, scope: !2360)
!2378 = !DILocation(line: 198, column: 72, scope: !2360)
!2379 = !DILocation(line: 198, column: 52, scope: !2360)
!2380 = !DILocation(line: 198, column: 77, scope: !2360)
!2381 = !DILocation(line: 198, column: 76, scope: !2360)
!2382 = !DILocation(line: 198, column: 50, scope: !2360)
!2383 = !DILocation(line: 198, column: 29, scope: !2360)
!2384 = !DILocation(line: 198, column: 86, scope: !2360)
!2385 = !DILocation(line: 199, column: 25, scope: !2360)
!2386 = !DILocation(line: 200, column: 21, scope: !2333)
!2387 = !DILocation(line: 194, column: 55, scope: !2328)
!2388 = !DILocation(line: 194, column: 21, scope: !2328)
!2389 = distinct !{!2389, !2331, !2390, !146}
!2390 = !DILocation(line: 200, column: 21, scope: !2323)
!2391 = !DILocation(line: 201, column: 17, scope: !2324)
!2392 = !DILocation(line: 193, column: 50, scope: !2317)
!2393 = !DILocation(line: 193, column: 17, scope: !2317)
!2394 = distinct !{!2394, !2321, !2395, !146}
!2395 = !DILocation(line: 201, column: 17, scope: !2313)
!2396 = !DILocation(line: 202, column: 13, scope: !2303)
!2397 = !DILocation(line: 204, column: 27, scope: !2205)
!2398 = !DILocation(line: 205, column: 16, scope: !2399)
!2399 = distinct !DILexicalBlock(scope: !2205, file: !48, line: 205, column: 16)
!2400 = !DILocation(line: 205, column: 30, scope: !2399)
!2401 = !DILocation(line: 206, column: 32, scope: !2402)
!2402 = distinct !DILexicalBlock(scope: !2399, file: !48, line: 205, column: 36)
!2403 = !DILocation(line: 207, column: 31, scope: !2402)
!2404 = !DILocation(line: 208, column: 13, scope: !2402)
!2405 = !DILocation(line: 209, column: 9, scope: !2205)
!2406 = !DILocation(line: 178, column: 46, scope: !2200)
!2407 = !DILocation(line: 178, column: 9, scope: !2200)
!2408 = distinct !{!2408, !2203, !2409, !146}
!2409 = !DILocation(line: 209, column: 9, scope: !2192)
!2410 = !DILocation(line: 210, column: 5, scope: !2193)
!2411 = !DILocation(line: 177, column: 42, scope: !2185)
!2412 = !DILocation(line: 177, column: 5, scope: !2185)
!2413 = distinct !{!2413, !2190, !2414, !146}
!2414 = !DILocation(line: 210, column: 5, scope: !2181)
!2415 = !DILocalVariable(name: "c", scope: !2416, file: !48, line: 212, type: !57)
!2416 = distinct !DILexicalBlock(scope: !2100, file: !48, line: 212, column: 5)
!2417 = !DILocation(line: 212, column: 17, scope: !2416)
!2418 = !DILocation(line: 212, column: 10, scope: !2416)
!2419 = !DILocation(line: 212, column: 24, scope: !2420)
!2420 = distinct !DILexicalBlock(scope: !2416, file: !48, line: 212, column: 5)
!2421 = !DILocation(line: 212, column: 28, scope: !2420)
!2422 = !DILocation(line: 212, column: 46, scope: !2420)
!2423 = !DILocation(line: 212, column: 38, scope: !2420)
!2424 = !DILocation(line: 212, column: 60, scope: !2420)
!2425 = !DILocation(line: 212, column: 52, scope: !2420)
!2426 = !DILocation(line: 212, column: 62, scope: !2420)
!2427 = !DILocation(line: 212, column: 74, scope: !2420)
!2428 = !DILocation(line: 212, column: 66, scope: !2420)
!2429 = !DILocation(line: 212, column: 65, scope: !2420)
!2430 = !DILocation(line: 212, column: 76, scope: !2420)
!2431 = !DILocation(line: 212, column: 49, scope: !2420)
!2432 = !DILocation(line: 212, column: 79, scope: !2420)
!2433 = !DILocation(line: 212, column: 83, scope: !2420)
!2434 = !DILocation(line: 212, column: 36, scope: !2420)
!2435 = !DILocation(line: 212, column: 35, scope: !2420)
!2436 = !DILocation(line: 212, column: 26, scope: !2420)
!2437 = !DILocation(line: 212, column: 5, scope: !2416)
!2438 = !DILocation(line: 214, column: 33, scope: !2439)
!2439 = distinct !DILexicalBlock(scope: !2420, file: !48, line: 213, column: 5)
!2440 = !DILocation(line: 214, column: 37, scope: !2439)
!2441 = !DILocation(line: 214, column: 35, scope: !2439)
!2442 = !DILocation(line: 214, column: 9, scope: !2439)
!2443 = !DILocation(line: 215, column: 5, scope: !2439)
!2444 = !DILocation(line: 212, column: 91, scope: !2420)
!2445 = !DILocation(line: 212, column: 5, scope: !2420)
!2446 = distinct !{!2446, !2437, !2447, !146}
!2447 = !DILocation(line: 215, column: 5, scope: !2416)
!2448 = !DILocalVariable(name: "tab", scope: !2100, file: !48, line: 217, type: !2449)
!2449 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 128, elements: !2450)
!2450 = !{!2451}
!2451 = !DISubrange(count: 16)
!2452 = !DILocation(line: 217, column: 19, scope: !2100)
!2453 = !DILocalVariable(name: "i", scope: !2454, file: !48, line: 218, type: !57)
!2454 = distinct !DILexicalBlock(scope: !2100, file: !48, line: 218, column: 5)
!2455 = !DILocation(line: 218, column: 17, scope: !2454)
!2456 = !DILocation(line: 218, column: 10, scope: !2454)
!2457 = !DILocation(line: 218, column: 24, scope: !2458)
!2458 = distinct !DILexicalBlock(scope: !2454, file: !48, line: 218, column: 5)
!2459 = !DILocation(line: 218, column: 26, scope: !2458)
!2460 = !DILocation(line: 218, column: 5, scope: !2454)
!2461 = !DILocation(line: 220, column: 41, scope: !2462)
!2462 = distinct !DILexicalBlock(scope: !2458, file: !48, line: 219, column: 5)
!2463 = !DILocation(line: 220, column: 28, scope: !2462)
!2464 = !DILocation(line: 220, column: 44, scope: !2462)
!2465 = !DILocation(line: 220, column: 22, scope: !2462)
!2466 = !DILocation(line: 220, column: 15, scope: !2462)
!2467 = !DILocation(line: 220, column: 14, scope: !2462)
!2468 = !DILocation(line: 220, column: 9, scope: !2462)
!2469 = !DILocation(line: 220, column: 20, scope: !2462)
!2470 = !DILocation(line: 221, column: 41, scope: !2462)
!2471 = !DILocation(line: 221, column: 28, scope: !2462)
!2472 = !DILocation(line: 221, column: 44, scope: !2462)
!2473 = !DILocation(line: 221, column: 22, scope: !2462)
!2474 = !DILocation(line: 221, column: 15, scope: !2462)
!2475 = !DILocation(line: 221, column: 14, scope: !2462)
!2476 = !DILocation(line: 221, column: 16, scope: !2462)
!2477 = !DILocation(line: 221, column: 9, scope: !2462)
!2478 = !DILocation(line: 221, column: 20, scope: !2462)
!2479 = !DILocation(line: 222, column: 41, scope: !2462)
!2480 = !DILocation(line: 222, column: 28, scope: !2462)
!2481 = !DILocation(line: 222, column: 44, scope: !2462)
!2482 = !DILocation(line: 222, column: 22, scope: !2462)
!2483 = !DILocation(line: 222, column: 15, scope: !2462)
!2484 = !DILocation(line: 222, column: 14, scope: !2462)
!2485 = !DILocation(line: 222, column: 16, scope: !2462)
!2486 = !DILocation(line: 222, column: 9, scope: !2462)
!2487 = !DILocation(line: 222, column: 20, scope: !2462)
!2488 = !DILocation(line: 223, column: 41, scope: !2462)
!2489 = !DILocation(line: 223, column: 28, scope: !2462)
!2490 = !DILocation(line: 223, column: 44, scope: !2462)
!2491 = !DILocation(line: 223, column: 22, scope: !2462)
!2492 = !DILocation(line: 223, column: 15, scope: !2462)
!2493 = !DILocation(line: 223, column: 14, scope: !2462)
!2494 = !DILocation(line: 223, column: 16, scope: !2462)
!2495 = !DILocation(line: 223, column: 9, scope: !2462)
!2496 = !DILocation(line: 223, column: 20, scope: !2462)
!2497 = !DILocation(line: 224, column: 5, scope: !2462)
!2498 = !DILocation(line: 218, column: 41, scope: !2458)
!2499 = !DILocation(line: 218, column: 5, scope: !2458)
!2500 = distinct !{!2500, !2460, !2501, !146}
!2501 = !DILocation(line: 224, column: 5, scope: !2454)
!2502 = !DILocalVariable(name: "low_bit_in_nibble", scope: !2100, file: !48, line: 226, type: !52)
!2503 = !DILocation(line: 226, column: 14, scope: !2100)
!2504 = !DILocalVariable(name: "c", scope: !2505, file: !48, line: 228, type: !57)
!2505 = distinct !DILexicalBlock(scope: !2100, file: !48, line: 228, column: 5)
!2506 = !DILocation(line: 228, column: 17, scope: !2505)
!2507 = !DILocation(line: 228, column: 10, scope: !2505)
!2508 = !DILocation(line: 228, column: 24, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2505, file: !48, line: 228, column: 5)
!2510 = !DILocation(line: 228, column: 28, scope: !2509)
!2511 = !DILocation(line: 228, column: 26, scope: !2509)
!2512 = !DILocation(line: 228, column: 5, scope: !2505)
!2513 = !DILocalVariable(name: "r", scope: !2514, file: !48, line: 230, type: !85)
!2514 = distinct !DILexicalBlock(scope: !2515, file: !48, line: 230, column: 9)
!2515 = distinct !DILexicalBlock(scope: !2509, file: !48, line: 229, column: 5)
!2516 = !DILocation(line: 230, column: 18, scope: !2514)
!2517 = !DILocation(line: 230, column: 30, scope: !2514)
!2518 = !DILocation(line: 230, column: 22, scope: !2514)
!2519 = !DILocation(line: 230, column: 14, scope: !2514)
!2520 = !DILocation(line: 230, column: 34, scope: !2521)
!2521 = distinct !DILexicalBlock(scope: !2514, file: !48, line: 230, column: 9)
!2522 = !DILocation(line: 230, column: 46, scope: !2521)
!2523 = !DILocation(line: 230, column: 38, scope: !2521)
!2524 = !DILocation(line: 230, column: 60, scope: !2521)
!2525 = !DILocation(line: 230, column: 52, scope: !2521)
!2526 = !DILocation(line: 230, column: 62, scope: !2521)
!2527 = !DILocation(line: 230, column: 74, scope: !2521)
!2528 = !DILocation(line: 230, column: 66, scope: !2521)
!2529 = !DILocation(line: 230, column: 65, scope: !2521)
!2530 = !DILocation(line: 230, column: 76, scope: !2521)
!2531 = !DILocation(line: 230, column: 49, scope: !2521)
!2532 = !DILocation(line: 230, column: 36, scope: !2521)
!2533 = !DILocation(line: 230, column: 9, scope: !2514)
!2534 = !DILocalVariable(name: "pos", scope: !2535, file: !48, line: 232, type: !57)
!2535 = distinct !DILexicalBlock(scope: !2521, file: !48, line: 231, column: 9)
!2536 = !DILocation(line: 232, column: 20, scope: !2535)
!2537 = !DILocation(line: 232, column: 27, scope: !2535)
!2538 = !DILocation(line: 232, column: 28, scope: !2535)
!2539 = !DILocation(line: 232, column: 26, scope: !2535)
!2540 = !DILocation(line: 232, column: 33, scope: !2535)
!2541 = !DILocation(line: 232, column: 32, scope: !2535)
!2542 = !DILocation(line: 232, column: 43, scope: !2535)
!2543 = !DILocation(line: 232, column: 41, scope: !2535)
!2544 = !DILocation(line: 232, column: 48, scope: !2535)
!2545 = !DILocation(line: 232, column: 49, scope: !2535)
!2546 = !DILocation(line: 232, column: 47, scope: !2535)
!2547 = !DILocation(line: 232, column: 45, scope: !2535)
!2548 = !DILocalVariable(name: "t0", scope: !2535, file: !48, line: 233, type: !52)
!2549 = !DILocation(line: 233, column: 22, scope: !2535)
!2550 = !DILocation(line: 233, column: 30, scope: !2535)
!2551 = !DILocation(line: 233, column: 28, scope: !2535)
!2552 = !DILocation(line: 233, column: 43, scope: !2535)
!2553 = !DILocation(line: 233, column: 41, scope: !2535)
!2554 = !DILocalVariable(name: "t1", scope: !2535, file: !48, line: 234, type: !52)
!2555 = !DILocation(line: 234, column: 22, scope: !2535)
!2556 = !DILocation(line: 234, column: 30, scope: !2535)
!2557 = !DILocation(line: 234, column: 28, scope: !2535)
!2558 = !DILocation(line: 234, column: 35, scope: !2535)
!2559 = !DILocation(line: 234, column: 43, scope: !2535)
!2560 = !DILocation(line: 234, column: 41, scope: !2535)
!2561 = !DILocalVariable(name: "t2", scope: !2535, file: !48, line: 235, type: !52)
!2562 = !DILocation(line: 235, column: 22, scope: !2535)
!2563 = !DILocation(line: 235, column: 30, scope: !2535)
!2564 = !DILocation(line: 235, column: 28, scope: !2535)
!2565 = !DILocation(line: 235, column: 35, scope: !2535)
!2566 = !DILocation(line: 235, column: 43, scope: !2535)
!2567 = !DILocation(line: 235, column: 41, scope: !2535)
!2568 = !DILocalVariable(name: "t3", scope: !2535, file: !48, line: 236, type: !52)
!2569 = !DILocation(line: 236, column: 22, scope: !2535)
!2570 = !DILocation(line: 236, column: 30, scope: !2535)
!2571 = !DILocation(line: 236, column: 28, scope: !2535)
!2572 = !DILocation(line: 236, column: 35, scope: !2535)
!2573 = !DILocation(line: 236, column: 43, scope: !2535)
!2574 = !DILocation(line: 236, column: 41, scope: !2535)
!2575 = !DILocalVariable(name: "t", scope: !2576, file: !48, line: 237, type: !57)
!2576 = distinct !DILexicalBlock(scope: !2535, file: !48, line: 237, column: 13)
!2577 = !DILocation(line: 237, column: 25, scope: !2576)
!2578 = !DILocation(line: 237, column: 18, scope: !2576)
!2579 = !DILocation(line: 237, column: 32, scope: !2580)
!2580 = distinct !DILexicalBlock(scope: !2576, file: !48, line: 237, column: 13)
!2581 = !DILocation(line: 237, column: 34, scope: !2580)
!2582 = !DILocation(line: 237, column: 13, scope: !2576)
!2583 = !DILocation(line: 239, column: 81, scope: !2584)
!2584 = distinct !DILexicalBlock(scope: !2580, file: !48, line: 238, column: 13)
!2585 = !DILocation(line: 239, column: 90, scope: !2584)
!2586 = !DILocation(line: 239, column: 89, scope: !2584)
!2587 = !DILocation(line: 239, column: 91, scope: !2584)
!2588 = !DILocation(line: 239, column: 84, scope: !2584)
!2589 = !DILocation(line: 239, column: 83, scope: !2584)
!2590 = !DILocation(line: 239, column: 97, scope: !2584)
!2591 = !DILocation(line: 239, column: 106, scope: !2584)
!2592 = !DILocation(line: 239, column: 105, scope: !2584)
!2593 = !DILocation(line: 239, column: 107, scope: !2584)
!2594 = !DILocation(line: 239, column: 100, scope: !2584)
!2595 = !DILocation(line: 239, column: 99, scope: !2584)
!2596 = !DILocation(line: 239, column: 95, scope: !2584)
!2597 = !DILocation(line: 239, column: 113, scope: !2584)
!2598 = !DILocation(line: 239, column: 122, scope: !2584)
!2599 = !DILocation(line: 239, column: 121, scope: !2584)
!2600 = !DILocation(line: 239, column: 123, scope: !2584)
!2601 = !DILocation(line: 239, column: 116, scope: !2584)
!2602 = !DILocation(line: 239, column: 115, scope: !2584)
!2603 = !DILocation(line: 239, column: 111, scope: !2584)
!2604 = !DILocation(line: 239, column: 129, scope: !2584)
!2605 = !DILocation(line: 239, column: 138, scope: !2584)
!2606 = !DILocation(line: 239, column: 137, scope: !2584)
!2607 = !DILocation(line: 239, column: 139, scope: !2584)
!2608 = !DILocation(line: 239, column: 132, scope: !2584)
!2609 = !DILocation(line: 239, column: 131, scope: !2584)
!2610 = !DILocation(line: 239, column: 127, scope: !2584)
!2611 = !DILocation(line: 239, column: 21, scope: !2584)
!2612 = !DILocation(line: 239, column: 23, scope: !2584)
!2613 = !DILocation(line: 239, column: 22, scope: !2584)
!2614 = !DILocation(line: 239, column: 33, scope: !2584)
!2615 = !DILocation(line: 239, column: 25, scope: !2584)
!2616 = !DILocation(line: 239, column: 24, scope: !2584)
!2617 = !DILocation(line: 239, column: 36, scope: !2584)
!2618 = !DILocation(line: 239, column: 41, scope: !2584)
!2619 = !DILocation(line: 239, column: 40, scope: !2584)
!2620 = !DILocation(line: 239, column: 51, scope: !2584)
!2621 = !DILocation(line: 239, column: 49, scope: !2584)
!2622 = !DILocation(line: 239, column: 57, scope: !2584)
!2623 = !DILocation(line: 239, column: 59, scope: !2584)
!2624 = !DILocation(line: 239, column: 58, scope: !2584)
!2625 = !DILocation(line: 239, column: 69, scope: !2584)
!2626 = !DILocation(line: 239, column: 61, scope: !2584)
!2627 = !DILocation(line: 239, column: 60, scope: !2584)
!2628 = !DILocation(line: 239, column: 72, scope: !2584)
!2629 = !DILocation(line: 239, column: 53, scope: !2584)
!2630 = !DILocation(line: 239, column: 17, scope: !2584)
!2631 = !DILocation(line: 239, column: 78, scope: !2584)
!2632 = !DILocation(line: 240, column: 13, scope: !2584)
!2633 = !DILocation(line: 237, column: 49, scope: !2580)
!2634 = !DILocation(line: 237, column: 13, scope: !2580)
!2635 = distinct !{!2635, !2582, !2636, !146}
!2636 = !DILocation(line: 240, column: 13, scope: !2576)
!2637 = !DILocation(line: 241, column: 9, scope: !2535)
!2638 = !DILocation(line: 230, column: 82, scope: !2521)
!2639 = !DILocation(line: 230, column: 9, scope: !2521)
!2640 = distinct !{!2640, !2533, !2641, !146}
!2641 = !DILocation(line: 241, column: 9, scope: !2514)
!2642 = !DILocation(line: 242, column: 5, scope: !2515)
!2643 = !DILocation(line: 228, column: 38, scope: !2509)
!2644 = !DILocation(line: 228, column: 5, scope: !2509)
!2645 = distinct !{!2645, !2512, !2646, !146}
!2646 = !DILocation(line: 242, column: 5, scope: !2505)
!2647 = !DILocalVariable(name: "r", scope: !2648, file: !48, line: 250, type: !85)
!2648 = distinct !DILexicalBlock(scope: !2100, file: !48, line: 250, column: 5)
!2649 = !DILocation(line: 250, column: 14, scope: !2648)
!2650 = !DILocation(line: 250, column: 10, scope: !2648)
!2651 = !DILocation(line: 250, column: 21, scope: !2652)
!2652 = distinct !DILexicalBlock(scope: !2648, file: !48, line: 250, column: 5)
!2653 = !DILocation(line: 250, column: 33, scope: !2652)
!2654 = !DILocation(line: 250, column: 25, scope: !2652)
!2655 = !DILocation(line: 250, column: 23, scope: !2652)
!2656 = !DILocation(line: 250, column: 5, scope: !2648)
!2657 = !DILocalVariable(name: "c", scope: !2658, file: !48, line: 252, type: !85)
!2658 = distinct !DILexicalBlock(scope: !2659, file: !48, line: 252, column: 9)
!2659 = distinct !DILexicalBlock(scope: !2652, file: !48, line: 251, column: 5)
!2660 = !DILocation(line: 252, column: 18, scope: !2658)
!2661 = !DILocation(line: 252, column: 14, scope: !2658)
!2662 = !DILocation(line: 252, column: 25, scope: !2663)
!2663 = distinct !DILexicalBlock(scope: !2658, file: !48, line: 252, column: 9)
!2664 = !DILocation(line: 252, column: 42, scope: !2663)
!2665 = !DILocation(line: 252, column: 29, scope: !2663)
!2666 = !DILocation(line: 252, column: 44, scope: !2663)
!2667 = !DILocation(line: 252, column: 27, scope: !2663)
!2668 = !DILocation(line: 252, column: 9, scope: !2658)
!2669 = !DILocalVariable(name: "i", scope: !2670, file: !48, line: 254, type: !85)
!2670 = distinct !DILexicalBlock(scope: !2671, file: !48, line: 254, column: 13)
!2671 = distinct !DILexicalBlock(scope: !2663, file: !48, line: 253, column: 9)
!2672 = !DILocation(line: 254, column: 22, scope: !2670)
!2673 = !DILocation(line: 254, column: 18, scope: !2670)
!2674 = !DILocation(line: 254, column: 29, scope: !2675)
!2675 = distinct !DILexicalBlock(scope: !2670, file: !48, line: 254, column: 13)
!2676 = !DILocation(line: 254, column: 33, scope: !2675)
!2677 = !DILocation(line: 254, column: 31, scope: !2675)
!2678 = !DILocation(line: 254, column: 45, scope: !2675)
!2679 = !DILocation(line: 254, column: 37, scope: !2675)
!2680 = !DILocation(line: 254, column: 35, scope: !2675)
!2681 = !DILocation(line: 254, column: 13, scope: !2670)
!2682 = !DILocation(line: 256, column: 46, scope: !2683)
!2683 = distinct !DILexicalBlock(scope: !2675, file: !48, line: 255, column: 13)
!2684 = !DILocation(line: 256, column: 48, scope: !2683)
!2685 = !DILocation(line: 256, column: 47, scope: !2683)
!2686 = !DILocation(line: 256, column: 55, scope: !2683)
!2687 = !DILocation(line: 256, column: 61, scope: !2683)
!2688 = !DILocation(line: 256, column: 59, scope: !2683)
!2689 = !DILocation(line: 256, column: 65, scope: !2683)
!2690 = !DILocation(line: 256, column: 63, scope: !2683)
!2691 = !DILocation(line: 256, column: 44, scope: !2683)
!2692 = !DILocation(line: 256, column: 69, scope: !2683)
!2693 = !DILocation(line: 256, column: 90, scope: !2683)
!2694 = !DILocation(line: 256, column: 77, scope: !2683)
!2695 = !DILocation(line: 256, column: 94, scope: !2683)
!2696 = !DILocation(line: 256, column: 96, scope: !2683)
!2697 = !DILocation(line: 256, column: 95, scope: !2683)
!2698 = !DILocation(line: 256, column: 92, scope: !2683)
!2699 = !DILocation(line: 256, column: 75, scope: !2683)
!2700 = !DILocation(line: 256, column: 101, scope: !2683)
!2701 = !DILocation(line: 256, column: 99, scope: !2683)
!2702 = !DILocation(line: 256, column: 130, scope: !2683)
!2703 = !DILocation(line: 256, column: 117, scope: !2683)
!2704 = !DILocation(line: 256, column: 132, scope: !2683)
!2705 = !DILocation(line: 256, column: 135, scope: !2683)
!2706 = !DILocation(line: 256, column: 134, scope: !2683)
!2707 = !DILocation(line: 256, column: 104, scope: !2683)
!2708 = !DILocation(line: 256, column: 17, scope: !2683)
!2709 = !DILocation(line: 257, column: 13, scope: !2683)
!2710 = !DILocation(line: 254, column: 50, scope: !2675)
!2711 = !DILocation(line: 254, column: 13, scope: !2675)
!2712 = distinct !{!2712, !2681, !2713, !146}
!2713 = !DILocation(line: 257, column: 13, scope: !2670)
!2714 = !DILocation(line: 258, column: 9, scope: !2671)
!2715 = !DILocation(line: 252, column: 50, scope: !2663)
!2716 = !DILocation(line: 252, column: 9, scope: !2663)
!2717 = distinct !{!2717, !2668, !2718, !146}
!2718 = !DILocation(line: 258, column: 9, scope: !2658)
!2719 = !DILocation(line: 259, column: 5, scope: !2659)
!2720 = !DILocation(line: 250, column: 38, scope: !2652)
!2721 = !DILocation(line: 250, column: 5, scope: !2652)
!2722 = distinct !{!2722, !2656, !2723, !146}
!2723 = !DILocation(line: 259, column: 5, scope: !2648)
!2724 = !DILocation(line: 260, column: 1, scope: !2100)
!2725 = distinct !DISubprogram(name: "mat_mul", scope: !894, file: !894, line: 78, type: !2726, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2726 = !DISubroutineType(types: !2727)
!2727 = !{null, !100, !100, !59, !85, !85, !85}
!2728 = !DILocalVariable(name: "a", arg: 1, scope: !2725, file: !894, line: 78, type: !100)
!2729 = !DILocation(line: 78, column: 49, scope: !2725)
!2730 = !DILocalVariable(name: "b", arg: 2, scope: !2725, file: !894, line: 78, type: !100)
!2731 = !DILocation(line: 78, column: 73, scope: !2725)
!2732 = !DILocalVariable(name: "c", arg: 3, scope: !2725, file: !894, line: 79, type: !59)
!2733 = !DILocation(line: 79, column: 36, scope: !2725)
!2734 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2725, file: !894, line: 79, type: !85)
!2735 = !DILocation(line: 79, column: 43, scope: !2725)
!2736 = !DILocalVariable(name: "row_a", arg: 5, scope: !2725, file: !894, line: 79, type: !85)
!2737 = !DILocation(line: 79, column: 58, scope: !2725)
!2738 = !DILocalVariable(name: "col_b", arg: 6, scope: !2725, file: !894, line: 79, type: !85)
!2739 = !DILocation(line: 79, column: 69, scope: !2725)
!2740 = !DILocalVariable(name: "i", scope: !2741, file: !894, line: 80, type: !85)
!2741 = distinct !DILexicalBlock(scope: !2725, file: !894, line: 80, column: 5)
!2742 = !DILocation(line: 80, column: 14, scope: !2741)
!2743 = !DILocation(line: 80, column: 10, scope: !2741)
!2744 = !DILocation(line: 80, column: 21, scope: !2745)
!2745 = distinct !DILexicalBlock(scope: !2741, file: !894, line: 80, column: 5)
!2746 = !DILocation(line: 80, column: 25, scope: !2745)
!2747 = !DILocation(line: 80, column: 23, scope: !2745)
!2748 = !DILocation(line: 80, column: 5, scope: !2741)
!2749 = !DILocalVariable(name: "j", scope: !2750, file: !894, line: 81, type: !85)
!2750 = distinct !DILexicalBlock(scope: !2751, file: !894, line: 81, column: 9)
!2751 = distinct !DILexicalBlock(scope: !2745, file: !894, line: 80, column: 53)
!2752 = !DILocation(line: 81, column: 18, scope: !2750)
!2753 = !DILocation(line: 81, column: 14, scope: !2750)
!2754 = !DILocation(line: 81, column: 25, scope: !2755)
!2755 = distinct !DILexicalBlock(scope: !2750, file: !894, line: 81, column: 9)
!2756 = !DILocation(line: 81, column: 29, scope: !2755)
!2757 = !DILocation(line: 81, column: 27, scope: !2755)
!2758 = !DILocation(line: 81, column: 9, scope: !2750)
!2759 = !DILocation(line: 82, column: 26, scope: !2760)
!2760 = distinct !DILexicalBlock(scope: !2755, file: !894, line: 81, column: 46)
!2761 = !DILocation(line: 82, column: 29, scope: !2760)
!2762 = !DILocation(line: 82, column: 33, scope: !2760)
!2763 = !DILocation(line: 82, column: 31, scope: !2760)
!2764 = !DILocation(line: 82, column: 36, scope: !2760)
!2765 = !DILocation(line: 82, column: 47, scope: !2760)
!2766 = !DILocation(line: 82, column: 18, scope: !2760)
!2767 = !DILocation(line: 82, column: 14, scope: !2760)
!2768 = !DILocation(line: 82, column: 16, scope: !2760)
!2769 = !DILocation(line: 83, column: 9, scope: !2760)
!2770 = !DILocation(line: 81, column: 36, scope: !2755)
!2771 = !DILocation(line: 81, column: 41, scope: !2755)
!2772 = !DILocation(line: 81, column: 9, scope: !2755)
!2773 = distinct !{!2773, !2758, !2774, !146}
!2774 = !DILocation(line: 83, column: 9, scope: !2750)
!2775 = !DILocation(line: 84, column: 5, scope: !2751)
!2776 = !DILocation(line: 80, column: 32, scope: !2745)
!2777 = !DILocation(line: 80, column: 42, scope: !2745)
!2778 = !DILocation(line: 80, column: 39, scope: !2745)
!2779 = !DILocation(line: 80, column: 5, scope: !2745)
!2780 = distinct !{!2780, !2748, !2781, !146}
!2781 = !DILocation(line: 84, column: 5, scope: !2741)
!2782 = !DILocation(line: 85, column: 1, scope: !2725)
!2783 = distinct !DISubprogram(name: "mat_add", scope: !894, file: !894, line: 87, type: !2784, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2784 = !DISubroutineType(types: !2785)
!2785 = !{null, !100, !100, !59, !85, !85}
!2786 = !DILocalVariable(name: "a", arg: 1, scope: !2783, file: !894, line: 87, type: !100)
!2787 = !DILocation(line: 87, column: 49, scope: !2783)
!2788 = !DILocalVariable(name: "b", arg: 2, scope: !2783, file: !894, line: 87, type: !100)
!2789 = !DILocation(line: 87, column: 73, scope: !2783)
!2790 = !DILocalVariable(name: "c", arg: 3, scope: !2783, file: !894, line: 88, type: !59)
!2791 = !DILocation(line: 88, column: 36, scope: !2783)
!2792 = !DILocalVariable(name: "m", arg: 4, scope: !2783, file: !894, line: 88, type: !85)
!2793 = !DILocation(line: 88, column: 43, scope: !2783)
!2794 = !DILocalVariable(name: "n", arg: 5, scope: !2783, file: !894, line: 88, type: !85)
!2795 = !DILocation(line: 88, column: 50, scope: !2783)
!2796 = !DILocalVariable(name: "i", scope: !2797, file: !894, line: 89, type: !85)
!2797 = distinct !DILexicalBlock(scope: !2783, file: !894, line: 89, column: 5)
!2798 = !DILocation(line: 89, column: 14, scope: !2797)
!2799 = !DILocation(line: 89, column: 10, scope: !2797)
!2800 = !DILocation(line: 89, column: 21, scope: !2801)
!2801 = distinct !DILexicalBlock(scope: !2797, file: !894, line: 89, column: 5)
!2802 = !DILocation(line: 89, column: 25, scope: !2801)
!2803 = !DILocation(line: 89, column: 23, scope: !2801)
!2804 = !DILocation(line: 89, column: 5, scope: !2797)
!2805 = !DILocalVariable(name: "j", scope: !2806, file: !894, line: 90, type: !85)
!2806 = distinct !DILexicalBlock(scope: !2807, file: !894, line: 90, column: 9)
!2807 = distinct !DILexicalBlock(scope: !2801, file: !894, line: 89, column: 33)
!2808 = !DILocation(line: 90, column: 18, scope: !2806)
!2809 = !DILocation(line: 90, column: 14, scope: !2806)
!2810 = !DILocation(line: 90, column: 25, scope: !2811)
!2811 = distinct !DILexicalBlock(scope: !2806, file: !894, line: 90, column: 9)
!2812 = !DILocation(line: 90, column: 29, scope: !2811)
!2813 = !DILocation(line: 90, column: 27, scope: !2811)
!2814 = !DILocation(line: 90, column: 9, scope: !2806)
!2815 = !DILocation(line: 91, column: 40, scope: !2816)
!2816 = distinct !DILexicalBlock(scope: !2811, file: !894, line: 90, column: 37)
!2817 = !DILocation(line: 91, column: 44, scope: !2816)
!2818 = !DILocation(line: 91, column: 48, scope: !2816)
!2819 = !DILocation(line: 91, column: 46, scope: !2816)
!2820 = !DILocation(line: 91, column: 38, scope: !2816)
!2821 = !DILocation(line: 91, column: 52, scope: !2816)
!2822 = !DILocation(line: 91, column: 58, scope: !2816)
!2823 = !DILocation(line: 91, column: 62, scope: !2816)
!2824 = !DILocation(line: 91, column: 66, scope: !2816)
!2825 = !DILocation(line: 91, column: 64, scope: !2816)
!2826 = !DILocation(line: 91, column: 56, scope: !2816)
!2827 = !DILocation(line: 91, column: 70, scope: !2816)
!2828 = !DILocation(line: 91, column: 32, scope: !2816)
!2829 = !DILocation(line: 91, column: 15, scope: !2816)
!2830 = !DILocation(line: 91, column: 19, scope: !2816)
!2831 = !DILocation(line: 91, column: 23, scope: !2816)
!2832 = !DILocation(line: 91, column: 21, scope: !2816)
!2833 = !DILocation(line: 91, column: 13, scope: !2816)
!2834 = !DILocation(line: 91, column: 27, scope: !2816)
!2835 = !DILocation(line: 91, column: 30, scope: !2816)
!2836 = !DILocation(line: 92, column: 9, scope: !2816)
!2837 = !DILocation(line: 90, column: 32, scope: !2811)
!2838 = !DILocation(line: 90, column: 9, scope: !2811)
!2839 = distinct !{!2839, !2814, !2840, !146}
!2840 = !DILocation(line: 92, column: 9, scope: !2806)
!2841 = !DILocation(line: 93, column: 5, scope: !2807)
!2842 = !DILocation(line: 89, column: 28, scope: !2801)
!2843 = !DILocation(line: 89, column: 5, scope: !2801)
!2844 = distinct !{!2844, !2804, !2845, !146}
!2845 = !DILocation(line: 93, column: 5, scope: !2797)
!2846 = !DILocation(line: 94, column: 1, scope: !2783)
!2847 = distinct !DISubprogram(name: "encode", scope: !48, file: !48, line: 32, type: !576, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2848 = !DILocalVariable(name: "m", arg: 1, scope: !2847, file: !48, line: 32, type: !100)
!2849 = !DILocation(line: 32, column: 41, scope: !2847)
!2850 = !DILocalVariable(name: "menc", arg: 2, scope: !2847, file: !48, line: 32, type: !59)
!2851 = !DILocation(line: 32, column: 59, scope: !2847)
!2852 = !DILocalVariable(name: "mlen", arg: 3, scope: !2847, file: !48, line: 32, type: !85)
!2853 = !DILocation(line: 32, column: 69, scope: !2847)
!2854 = !DILocalVariable(name: "i", scope: !2847, file: !48, line: 33, type: !85)
!2855 = !DILocation(line: 33, column: 9, scope: !2847)
!2856 = !DILocation(line: 34, column: 12, scope: !2857)
!2857 = distinct !DILexicalBlock(scope: !2847, file: !48, line: 34, column: 5)
!2858 = !DILocation(line: 34, column: 10, scope: !2857)
!2859 = !DILocation(line: 34, column: 17, scope: !2860)
!2860 = distinct !DILexicalBlock(scope: !2857, file: !48, line: 34, column: 5)
!2861 = !DILocation(line: 34, column: 21, scope: !2860)
!2862 = !DILocation(line: 34, column: 26, scope: !2860)
!2863 = !DILocation(line: 34, column: 19, scope: !2860)
!2864 = !DILocation(line: 34, column: 5, scope: !2857)
!2865 = !DILocation(line: 35, column: 21, scope: !2866)
!2866 = distinct !DILexicalBlock(scope: !2860, file: !48, line: 34, column: 44)
!2867 = !DILocation(line: 35, column: 20, scope: !2866)
!2868 = !DILocation(line: 35, column: 19, scope: !2866)
!2869 = !DILocation(line: 35, column: 29, scope: !2866)
!2870 = !DILocation(line: 35, column: 27, scope: !2866)
!2871 = !DILocation(line: 35, column: 36, scope: !2866)
!2872 = !DILocation(line: 35, column: 24, scope: !2866)
!2873 = !DILocation(line: 35, column: 9, scope: !2866)
!2874 = !DILocation(line: 35, column: 14, scope: !2866)
!2875 = !DILocation(line: 35, column: 17, scope: !2866)
!2876 = !DILocation(line: 36, column: 5, scope: !2866)
!2877 = !DILocation(line: 34, column: 31, scope: !2860)
!2878 = !DILocation(line: 34, column: 38, scope: !2860)
!2879 = !DILocation(line: 34, column: 5, scope: !2860)
!2880 = distinct !{!2880, !2864, !2881, !146}
!2881 = !DILocation(line: 36, column: 5, scope: !2857)
!2882 = !DILocation(line: 38, column: 9, scope: !2883)
!2883 = distinct !DILexicalBlock(scope: !2847, file: !48, line: 38, column: 9)
!2884 = !DILocation(line: 38, column: 14, scope: !2883)
!2885 = !DILocation(line: 38, column: 18, scope: !2883)
!2886 = !DILocation(line: 39, column: 21, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2883, file: !48, line: 38, column: 24)
!2888 = !DILocation(line: 39, column: 20, scope: !2887)
!2889 = !DILocation(line: 39, column: 9, scope: !2887)
!2890 = !DILocation(line: 39, column: 14, scope: !2887)
!2891 = !DILocation(line: 39, column: 17, scope: !2887)
!2892 = !DILocation(line: 40, column: 5, scope: !2887)
!2893 = !DILocation(line: 41, column: 1, scope: !2847)
!2894 = distinct !DISubprogram(name: "add_f", scope: !894, file: !894, line: 42, type: !2895, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2895 = !DISubroutineType(types: !2896)
!2896 = !{!50, !50, !50}
!2897 = !DILocalVariable(name: "a", arg: 1, scope: !2894, file: !894, line: 42, type: !50)
!2898 = !DILocation(line: 42, column: 49, scope: !2894)
!2899 = !DILocalVariable(name: "b", arg: 2, scope: !2894, file: !894, line: 42, type: !50)
!2900 = !DILocation(line: 42, column: 66, scope: !2894)
!2901 = !DILocation(line: 43, column: 12, scope: !2894)
!2902 = !DILocation(line: 43, column: 16, scope: !2894)
!2903 = !DILocation(line: 43, column: 14, scope: !2894)
!2904 = !DILocation(line: 43, column: 5, scope: !2894)
!2905 = distinct !DISubprogram(name: "lincomb", scope: !894, file: !894, line: 69, type: !2906, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2906 = !DISubroutineType(types: !2907)
!2907 = !{!50, !100, !100, !85, !85}
!2908 = !DILocalVariable(name: "a", arg: 1, scope: !2905, file: !894, line: 69, type: !100)
!2909 = !DILocation(line: 69, column: 58, scope: !2905)
!2910 = !DILocalVariable(name: "b", arg: 2, scope: !2905, file: !894, line: 70, type: !100)
!2911 = !DILocation(line: 70, column: 58, scope: !2905)
!2912 = !DILocalVariable(name: "n", arg: 3, scope: !2905, file: !894, line: 70, type: !85)
!2913 = !DILocation(line: 70, column: 65, scope: !2905)
!2914 = !DILocalVariable(name: "m", arg: 4, scope: !2905, file: !894, line: 70, type: !85)
!2915 = !DILocation(line: 70, column: 72, scope: !2905)
!2916 = !DILocalVariable(name: "ret", scope: !2905, file: !894, line: 71, type: !50)
!2917 = !DILocation(line: 71, column: 19, scope: !2905)
!2918 = !DILocalVariable(name: "i", scope: !2919, file: !894, line: 72, type: !85)
!2919 = distinct !DILexicalBlock(scope: !2905, file: !894, line: 72, column: 5)
!2920 = !DILocation(line: 72, column: 14, scope: !2919)
!2921 = !DILocation(line: 72, column: 10, scope: !2919)
!2922 = !DILocation(line: 72, column: 21, scope: !2923)
!2923 = distinct !DILexicalBlock(scope: !2919, file: !894, line: 72, column: 5)
!2924 = !DILocation(line: 72, column: 25, scope: !2923)
!2925 = !DILocation(line: 72, column: 23, scope: !2923)
!2926 = !DILocation(line: 72, column: 5, scope: !2919)
!2927 = !DILocation(line: 73, column: 27, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2923, file: !894, line: 72, column: 41)
!2929 = !DILocation(line: 73, column: 29, scope: !2928)
!2930 = !DILocation(line: 73, column: 34, scope: !2928)
!2931 = !DILocation(line: 73, column: 33, scope: !2928)
!2932 = !DILocation(line: 73, column: 21, scope: !2928)
!2933 = !DILocation(line: 73, column: 38, scope: !2928)
!2934 = !DILocation(line: 73, column: 15, scope: !2928)
!2935 = !DILocation(line: 73, column: 13, scope: !2928)
!2936 = !DILocation(line: 74, column: 5, scope: !2928)
!2937 = !DILocation(line: 72, column: 28, scope: !2923)
!2938 = !DILocation(line: 72, column: 38, scope: !2923)
!2939 = !DILocation(line: 72, column: 35, scope: !2923)
!2940 = !DILocation(line: 72, column: 5, scope: !2923)
!2941 = distinct !{!2941, !2926, !2942, !146}
!2942 = !DILocation(line: 74, column: 5, scope: !2919)
!2943 = !DILocation(line: 75, column: 12, scope: !2905)
!2944 = !DILocation(line: 75, column: 5, scope: !2905)
!2945 = distinct !DISubprogram(name: "mul_f", scope: !894, file: !894, line: 8, type: !2895, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!2946 = !DILocalVariable(name: "a", arg: 1, scope: !2945, file: !894, line: 8, type: !50)
!2947 = !DILocation(line: 8, column: 49, scope: !2945)
!2948 = !DILocalVariable(name: "b", arg: 2, scope: !2945, file: !894, line: 8, type: !50)
!2949 = !DILocation(line: 8, column: 66, scope: !2945)
!2950 = !DILocalVariable(name: "p", scope: !2945, file: !894, line: 10, type: !50)
!2951 = !DILocation(line: 10, column: 19, scope: !2945)
!2952 = !DILocation(line: 13, column: 10, scope: !2945)
!2953 = !DILocation(line: 13, column: 7, scope: !2945)
!2954 = !DILocation(line: 16, column: 11, scope: !2945)
!2955 = !DILocation(line: 16, column: 13, scope: !2945)
!2956 = !DILocation(line: 16, column: 18, scope: !2945)
!2957 = !DILocation(line: 16, column: 17, scope: !2945)
!2958 = !DILocation(line: 16, column: 10, scope: !2945)
!2959 = !DILocation(line: 16, column: 8, scope: !2945)
!2960 = !DILocation(line: 17, column: 11, scope: !2945)
!2961 = !DILocation(line: 17, column: 13, scope: !2945)
!2962 = !DILocation(line: 17, column: 18, scope: !2945)
!2963 = !DILocation(line: 17, column: 17, scope: !2945)
!2964 = !DILocation(line: 17, column: 7, scope: !2945)
!2965 = !DILocation(line: 18, column: 11, scope: !2945)
!2966 = !DILocation(line: 18, column: 13, scope: !2945)
!2967 = !DILocation(line: 18, column: 18, scope: !2945)
!2968 = !DILocation(line: 18, column: 17, scope: !2945)
!2969 = !DILocation(line: 18, column: 7, scope: !2945)
!2970 = !DILocation(line: 19, column: 11, scope: !2945)
!2971 = !DILocation(line: 19, column: 13, scope: !2945)
!2972 = !DILocation(line: 19, column: 18, scope: !2945)
!2973 = !DILocation(line: 19, column: 17, scope: !2945)
!2974 = !DILocation(line: 19, column: 7, scope: !2945)
!2975 = !DILocalVariable(name: "top_p", scope: !2945, file: !894, line: 22, type: !50)
!2976 = !DILocation(line: 22, column: 19, scope: !2945)
!2977 = !DILocation(line: 22, column: 27, scope: !2945)
!2978 = !DILocation(line: 22, column: 29, scope: !2945)
!2979 = !DILocalVariable(name: "out", scope: !2945, file: !894, line: 23, type: !50)
!2980 = !DILocation(line: 23, column: 19, scope: !2945)
!2981 = !DILocation(line: 23, column: 26, scope: !2945)
!2982 = !DILocation(line: 23, column: 31, scope: !2945)
!2983 = !DILocation(line: 23, column: 37, scope: !2945)
!2984 = !DILocation(line: 23, column: 28, scope: !2945)
!2985 = !DILocation(line: 23, column: 46, scope: !2945)
!2986 = !DILocation(line: 23, column: 52, scope: !2945)
!2987 = !DILocation(line: 23, column: 43, scope: !2945)
!2988 = !DILocation(line: 23, column: 59, scope: !2945)
!2989 = !DILocation(line: 23, column: 25, scope: !2945)
!2990 = !DILocation(line: 24, column: 12, scope: !2945)
!2991 = !DILocation(line: 24, column: 5, scope: !2945)
!2992 = !DILocalVariable(name: "M", arg: 1, scope: !63, file: !48, line: 111, type: !51)
!2993 = !DILocation(line: 111, column: 47, scope: !63)
!2994 = !DILocalVariable(name: "i", scope: !2995, file: !48, line: 117, type: !57)
!2995 = distinct !DILexicalBlock(scope: !63, file: !48, line: 117, column: 5)
!2996 = !DILocation(line: 117, column: 17, scope: !2995)
!2997 = !DILocation(line: 117, column: 10, scope: !2995)
!2998 = !DILocation(line: 117, column: 24, scope: !2999)
!2999 = distinct !DILexicalBlock(scope: !2995, file: !48, line: 117, column: 5)
!3000 = !DILocation(line: 117, column: 26, scope: !2999)
!3001 = !DILocation(line: 117, column: 5, scope: !2995)
!3002 = !DILocalVariable(name: "t", scope: !3003, file: !48, line: 119, type: !52)
!3003 = distinct !DILexicalBlock(scope: !2999, file: !48, line: 118, column: 5)
!3004 = !DILocation(line: 119, column: 18, scope: !3003)
!3005 = !DILocation(line: 119, column: 24, scope: !3003)
!3006 = !DILocation(line: 119, column: 26, scope: !3003)
!3007 = !DILocation(line: 119, column: 29, scope: !3003)
!3008 = !DILocation(line: 119, column: 38, scope: !3003)
!3009 = !DILocation(line: 119, column: 40, scope: !3003)
!3010 = !DILocation(line: 119, column: 41, scope: !3003)
!3011 = !DILocation(line: 119, column: 36, scope: !3003)
!3012 = !DILocation(line: 119, column: 46, scope: !3003)
!3013 = !DILocation(line: 120, column: 19, scope: !3003)
!3014 = !DILocation(line: 120, column: 21, scope: !3003)
!3015 = !DILocation(line: 120, column: 9, scope: !3003)
!3016 = !DILocation(line: 120, column: 11, scope: !3003)
!3017 = !DILocation(line: 120, column: 16, scope: !3003)
!3018 = !DILocation(line: 121, column: 19, scope: !3003)
!3019 = !DILocation(line: 121, column: 9, scope: !3003)
!3020 = !DILocation(line: 121, column: 11, scope: !3003)
!3021 = !DILocation(line: 121, column: 12, scope: !3003)
!3022 = !DILocation(line: 121, column: 16, scope: !3003)
!3023 = !DILocation(line: 122, column: 5, scope: !3003)
!3024 = !DILocation(line: 117, column: 33, scope: !2999)
!3025 = !DILocation(line: 117, column: 5, scope: !2999)
!3026 = distinct !{!3026, !3001, !3027, !146}
!3027 = !DILocation(line: 122, column: 5, scope: !2995)
!3028 = !DILocalVariable(name: "i", scope: !3029, file: !48, line: 124, type: !57)
!3029 = distinct !DILexicalBlock(scope: !63, file: !48, line: 124, column: 5)
!3030 = !DILocation(line: 124, column: 17, scope: !3029)
!3031 = !DILocation(line: 124, column: 10, scope: !3029)
!3032 = !DILocation(line: 124, column: 24, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !3029, file: !48, line: 124, column: 5)
!3034 = !DILocation(line: 124, column: 26, scope: !3033)
!3035 = !DILocation(line: 124, column: 5, scope: !3029)
!3036 = !DILocalVariable(name: "t0", scope: !3037, file: !48, line: 126, type: !52)
!3037 = distinct !DILexicalBlock(scope: !3033, file: !48, line: 125, column: 5)
!3038 = !DILocation(line: 126, column: 18, scope: !3037)
!3039 = !DILocation(line: 126, column: 25, scope: !3037)
!3040 = !DILocation(line: 126, column: 27, scope: !3037)
!3041 = !DILocation(line: 126, column: 32, scope: !3037)
!3042 = !DILocation(line: 126, column: 40, scope: !3037)
!3043 = !DILocation(line: 126, column: 42, scope: !3037)
!3044 = !DILocation(line: 126, column: 43, scope: !3037)
!3045 = !DILocation(line: 126, column: 38, scope: !3037)
!3046 = !DILocation(line: 126, column: 48, scope: !3037)
!3047 = !DILocalVariable(name: "t1", scope: !3037, file: !48, line: 127, type: !52)
!3048 = !DILocation(line: 127, column: 18, scope: !3037)
!3049 = !DILocation(line: 127, column: 25, scope: !3037)
!3050 = !DILocation(line: 127, column: 27, scope: !3037)
!3051 = !DILocation(line: 127, column: 28, scope: !3037)
!3052 = !DILocation(line: 127, column: 32, scope: !3037)
!3053 = !DILocation(line: 127, column: 40, scope: !3037)
!3054 = !DILocation(line: 127, column: 42, scope: !3037)
!3055 = !DILocation(line: 127, column: 43, scope: !3037)
!3056 = !DILocation(line: 127, column: 38, scope: !3037)
!3057 = !DILocation(line: 127, column: 48, scope: !3037)
!3058 = !DILocation(line: 128, column: 20, scope: !3037)
!3059 = !DILocation(line: 128, column: 23, scope: !3037)
!3060 = !DILocation(line: 128, column: 9, scope: !3037)
!3061 = !DILocation(line: 128, column: 11, scope: !3037)
!3062 = !DILocation(line: 128, column: 16, scope: !3037)
!3063 = !DILocation(line: 129, column: 20, scope: !3037)
!3064 = !DILocation(line: 129, column: 23, scope: !3037)
!3065 = !DILocation(line: 129, column: 9, scope: !3037)
!3066 = !DILocation(line: 129, column: 11, scope: !3037)
!3067 = !DILocation(line: 129, column: 12, scope: !3037)
!3068 = !DILocation(line: 129, column: 16, scope: !3037)
!3069 = !DILocation(line: 130, column: 19, scope: !3037)
!3070 = !DILocation(line: 130, column: 9, scope: !3037)
!3071 = !DILocation(line: 130, column: 11, scope: !3037)
!3072 = !DILocation(line: 130, column: 12, scope: !3037)
!3073 = !DILocation(line: 130, column: 16, scope: !3037)
!3074 = !DILocation(line: 131, column: 19, scope: !3037)
!3075 = !DILocation(line: 131, column: 9, scope: !3037)
!3076 = !DILocation(line: 131, column: 11, scope: !3037)
!3077 = !DILocation(line: 131, column: 12, scope: !3037)
!3078 = !DILocation(line: 131, column: 16, scope: !3037)
!3079 = !DILocation(line: 132, column: 5, scope: !3037)
!3080 = !DILocation(line: 124, column: 33, scope: !3033)
!3081 = !DILocation(line: 124, column: 5, scope: !3033)
!3082 = distinct !{!3082, !3035, !3083, !146}
!3083 = !DILocation(line: 132, column: 5, scope: !3029)
!3084 = !DILocalVariable(name: "i", scope: !3085, file: !48, line: 134, type: !57)
!3085 = distinct !DILexicalBlock(scope: !63, file: !48, line: 134, column: 5)
!3086 = !DILocation(line: 134, column: 17, scope: !3085)
!3087 = !DILocation(line: 134, column: 10, scope: !3085)
!3088 = !DILocation(line: 134, column: 24, scope: !3089)
!3089 = distinct !DILexicalBlock(scope: !3085, file: !48, line: 134, column: 5)
!3090 = !DILocation(line: 134, column: 26, scope: !3089)
!3091 = !DILocation(line: 134, column: 5, scope: !3085)
!3092 = !DILocalVariable(name: "t0", scope: !3093, file: !48, line: 136, type: !52)
!3093 = distinct !DILexicalBlock(scope: !3089, file: !48, line: 135, column: 5)
!3094 = !DILocation(line: 136, column: 18, scope: !3093)
!3095 = !DILocation(line: 136, column: 25, scope: !3093)
!3096 = !DILocation(line: 136, column: 27, scope: !3093)
!3097 = !DILocation(line: 136, column: 32, scope: !3093)
!3098 = !DILocation(line: 136, column: 41, scope: !3093)
!3099 = !DILocation(line: 136, column: 43, scope: !3093)
!3100 = !DILocation(line: 136, column: 44, scope: !3093)
!3101 = !DILocation(line: 136, column: 39, scope: !3093)
!3102 = !DILocation(line: 136, column: 50, scope: !3093)
!3103 = !DILocalVariable(name: "t1", scope: !3093, file: !48, line: 137, type: !52)
!3104 = !DILocation(line: 137, column: 18, scope: !3093)
!3105 = !DILocation(line: 137, column: 25, scope: !3093)
!3106 = !DILocation(line: 137, column: 27, scope: !3093)
!3107 = !DILocation(line: 137, column: 28, scope: !3093)
!3108 = !DILocation(line: 137, column: 32, scope: !3093)
!3109 = !DILocation(line: 137, column: 41, scope: !3093)
!3110 = !DILocation(line: 137, column: 43, scope: !3093)
!3111 = !DILocation(line: 137, column: 44, scope: !3093)
!3112 = !DILocation(line: 137, column: 39, scope: !3093)
!3113 = !DILocation(line: 137, column: 50, scope: !3093)
!3114 = !DILocation(line: 139, column: 20, scope: !3093)
!3115 = !DILocation(line: 139, column: 23, scope: !3093)
!3116 = !DILocation(line: 139, column: 9, scope: !3093)
!3117 = !DILocation(line: 139, column: 11, scope: !3093)
!3118 = !DILocation(line: 139, column: 17, scope: !3093)
!3119 = !DILocation(line: 140, column: 20, scope: !3093)
!3120 = !DILocation(line: 140, column: 23, scope: !3093)
!3121 = !DILocation(line: 140, column: 9, scope: !3093)
!3122 = !DILocation(line: 140, column: 11, scope: !3093)
!3123 = !DILocation(line: 140, column: 12, scope: !3093)
!3124 = !DILocation(line: 140, column: 17, scope: !3093)
!3125 = !DILocation(line: 141, column: 20, scope: !3093)
!3126 = !DILocation(line: 141, column: 9, scope: !3093)
!3127 = !DILocation(line: 141, column: 11, scope: !3093)
!3128 = !DILocation(line: 141, column: 12, scope: !3093)
!3129 = !DILocation(line: 141, column: 17, scope: !3093)
!3130 = !DILocation(line: 142, column: 20, scope: !3093)
!3131 = !DILocation(line: 142, column: 9, scope: !3093)
!3132 = !DILocation(line: 142, column: 11, scope: !3093)
!3133 = !DILocation(line: 142, column: 12, scope: !3093)
!3134 = !DILocation(line: 142, column: 17, scope: !3093)
!3135 = !DILocation(line: 143, column: 5, scope: !3093)
!3136 = !DILocation(line: 134, column: 32, scope: !3089)
!3137 = !DILocation(line: 134, column: 5, scope: !3089)
!3138 = distinct !{!3138, !3091, !3139, !146}
!3139 = !DILocation(line: 143, column: 5, scope: !3085)
!3140 = !DILocalVariable(name: "i", scope: !3141, file: !48, line: 145, type: !57)
!3141 = distinct !DILexicalBlock(scope: !63, file: !48, line: 145, column: 5)
!3142 = !DILocation(line: 145, column: 17, scope: !3141)
!3143 = !DILocation(line: 145, column: 10, scope: !3141)
!3144 = !DILocation(line: 145, column: 24, scope: !3145)
!3145 = distinct !DILexicalBlock(scope: !3141, file: !48, line: 145, column: 5)
!3146 = !DILocation(line: 145, column: 26, scope: !3145)
!3147 = !DILocation(line: 145, column: 5, scope: !3141)
!3148 = !DILocalVariable(name: "t", scope: !3149, file: !48, line: 147, type: !52)
!3149 = distinct !DILexicalBlock(scope: !3145, file: !48, line: 146, column: 5)
!3150 = !DILocation(line: 147, column: 18, scope: !3149)
!3151 = !DILocation(line: 147, column: 24, scope: !3149)
!3152 = !DILocation(line: 147, column: 26, scope: !3149)
!3153 = !DILocation(line: 147, column: 28, scope: !3149)
!3154 = !DILocation(line: 147, column: 36, scope: !3149)
!3155 = !DILocation(line: 147, column: 38, scope: !3149)
!3156 = !DILocation(line: 147, column: 39, scope: !3149)
!3157 = !DILocation(line: 147, column: 34, scope: !3149)
!3158 = !DILocation(line: 147, column: 44, scope: !3149)
!3159 = !DILocation(line: 148, column: 19, scope: !3149)
!3160 = !DILocation(line: 148, column: 21, scope: !3149)
!3161 = !DILocation(line: 148, column: 9, scope: !3149)
!3162 = !DILocation(line: 148, column: 11, scope: !3149)
!3163 = !DILocation(line: 148, column: 16, scope: !3149)
!3164 = !DILocation(line: 149, column: 19, scope: !3149)
!3165 = !DILocation(line: 149, column: 9, scope: !3149)
!3166 = !DILocation(line: 149, column: 11, scope: !3149)
!3167 = !DILocation(line: 149, column: 12, scope: !3149)
!3168 = !DILocation(line: 149, column: 16, scope: !3149)
!3169 = !DILocation(line: 150, column: 5, scope: !3149)
!3170 = !DILocation(line: 145, column: 32, scope: !3145)
!3171 = !DILocation(line: 145, column: 5, scope: !3145)
!3172 = distinct !{!3172, !3147, !3173, !146}
!3173 = !DILocation(line: 150, column: 5, scope: !3141)
!3174 = !DILocation(line: 151, column: 1, scope: !63)
!3175 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !657, file: !657, line: 61, type: !770, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3176 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3175, file: !657, line: 61, type: !460)
!3177 = !DILocation(line: 61, column: 36, scope: !3175)
!3178 = !DILocalVariable(name: "mat", arg: 2, scope: !3175, file: !657, line: 61, type: !100)
!3179 = !DILocation(line: 61, column: 70, scope: !3175)
!3180 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !3175, file: !657, line: 61, type: !660)
!3181 = !DILocation(line: 61, column: 91, scope: !3175)
!3182 = !DILocalVariable(name: "acc", arg: 4, scope: !3175, file: !657, line: 61, type: !51)
!3183 = !DILocation(line: 61, column: 109, scope: !3175)
!3184 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !3175, file: !657, line: 62, type: !460)
!3185 = !DILocation(line: 62, column: 36, scope: !3175)
!3186 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !3175, file: !657, line: 62, type: !460)
!3187 = !DILocation(line: 62, column: 56, scope: !3175)
!3188 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !3175, file: !657, line: 62, type: !460)
!3189 = !DILocation(line: 62, column: 76, scope: !3175)
!3190 = !DILocalVariable(name: "r", scope: !3191, file: !657, line: 64, type: !85)
!3191 = distinct !DILexicalBlock(scope: !3175, file: !657, line: 64, column: 5)
!3192 = !DILocation(line: 64, column: 14, scope: !3191)
!3193 = !DILocation(line: 64, column: 10, scope: !3191)
!3194 = !DILocation(line: 64, column: 21, scope: !3195)
!3195 = distinct !DILexicalBlock(scope: !3191, file: !657, line: 64, column: 5)
!3196 = !DILocation(line: 64, column: 25, scope: !3195)
!3197 = !DILocation(line: 64, column: 23, scope: !3195)
!3198 = !DILocation(line: 64, column: 5, scope: !3191)
!3199 = !DILocalVariable(name: "c", scope: !3200, file: !657, line: 65, type: !85)
!3200 = distinct !DILexicalBlock(scope: !3201, file: !657, line: 65, column: 9)
!3201 = distinct !DILexicalBlock(scope: !3195, file: !657, line: 64, column: 40)
!3202 = !DILocation(line: 65, column: 18, scope: !3200)
!3203 = !DILocation(line: 65, column: 14, scope: !3200)
!3204 = !DILocation(line: 65, column: 25, scope: !3205)
!3205 = distinct !DILexicalBlock(scope: !3200, file: !657, line: 65, column: 9)
!3206 = !DILocation(line: 65, column: 29, scope: !3205)
!3207 = !DILocation(line: 65, column: 27, scope: !3205)
!3208 = !DILocation(line: 65, column: 9, scope: !3200)
!3209 = !DILocalVariable(name: "k", scope: !3210, file: !657, line: 66, type: !85)
!3210 = distinct !DILexicalBlock(scope: !3211, file: !657, line: 66, column: 13)
!3211 = distinct !DILexicalBlock(scope: !3205, file: !657, line: 65, column: 44)
!3212 = !DILocation(line: 66, column: 22, scope: !3210)
!3213 = !DILocation(line: 66, column: 18, scope: !3210)
!3214 = !DILocation(line: 66, column: 29, scope: !3215)
!3215 = distinct !DILexicalBlock(scope: !3210, file: !657, line: 66, column: 13)
!3216 = !DILocation(line: 66, column: 33, scope: !3215)
!3217 = !DILocation(line: 66, column: 31, scope: !3215)
!3218 = !DILocation(line: 66, column: 13, scope: !3210)
!3219 = !DILocation(line: 67, column: 31, scope: !3220)
!3220 = distinct !DILexicalBlock(scope: !3215, file: !657, line: 66, column: 54)
!3221 = !DILocation(line: 67, column: 44, scope: !3220)
!3222 = !DILocation(line: 67, column: 53, scope: !3220)
!3223 = !DILocation(line: 67, column: 68, scope: !3220)
!3224 = !DILocation(line: 67, column: 72, scope: !3220)
!3225 = !DILocation(line: 67, column: 70, scope: !3220)
!3226 = !DILocation(line: 67, column: 86, scope: !3220)
!3227 = !DILocation(line: 67, column: 84, scope: !3220)
!3228 = !DILocation(line: 67, column: 65, scope: !3220)
!3229 = !DILocation(line: 67, column: 51, scope: !3220)
!3230 = !DILocation(line: 67, column: 90, scope: !3220)
!3231 = !DILocation(line: 67, column: 94, scope: !3220)
!3232 = !DILocation(line: 67, column: 98, scope: !3220)
!3233 = !DILocation(line: 67, column: 96, scope: !3220)
!3234 = !DILocation(line: 67, column: 109, scope: !3220)
!3235 = !DILocation(line: 67, column: 107, scope: !3220)
!3236 = !DILocation(line: 67, column: 113, scope: !3220)
!3237 = !DILocation(line: 67, column: 119, scope: !3220)
!3238 = !DILocation(line: 67, column: 134, scope: !3220)
!3239 = !DILocation(line: 67, column: 138, scope: !3220)
!3240 = !DILocation(line: 67, column: 136, scope: !3220)
!3241 = !DILocation(line: 67, column: 152, scope: !3220)
!3242 = !DILocation(line: 67, column: 150, scope: !3220)
!3243 = !DILocation(line: 67, column: 131, scope: !3220)
!3244 = !DILocation(line: 67, column: 117, scope: !3220)
!3245 = !DILocation(line: 67, column: 17, scope: !3220)
!3246 = !DILocation(line: 68, column: 13, scope: !3220)
!3247 = !DILocation(line: 66, column: 48, scope: !3215)
!3248 = !DILocation(line: 66, column: 13, scope: !3215)
!3249 = distinct !{!3249, !3218, !3250, !146}
!3250 = !DILocation(line: 68, column: 13, scope: !3210)
!3251 = !DILocation(line: 69, column: 9, scope: !3211)
!3252 = !DILocation(line: 65, column: 40, scope: !3205)
!3253 = !DILocation(line: 65, column: 9, scope: !3205)
!3254 = distinct !{!3254, !3208, !3255, !146}
!3255 = !DILocation(line: 69, column: 9, scope: !3200)
!3256 = !DILocation(line: 70, column: 5, scope: !3201)
!3257 = !DILocation(line: 64, column: 36, scope: !3195)
!3258 = !DILocation(line: 64, column: 5, scope: !3195)
!3259 = distinct !{!3259, !3198, !3260, !146}
!3260 = !DILocation(line: 70, column: 5, scope: !3191)
!3261 = !DILocation(line: 71, column: 1, scope: !3175)
!3262 = distinct !DISubprogram(name: "P1_times_Vt", scope: !657, file: !657, line: 82, type: !746, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3263 = !DILocalVariable(name: "p", arg: 1, scope: !3262, file: !657, line: 82, type: !379)
!3264 = !DILocation(line: 82, column: 39, scope: !3262)
!3265 = !DILocalVariable(name: "P1", arg: 2, scope: !3262, file: !657, line: 82, type: !660)
!3266 = !DILocation(line: 82, column: 58, scope: !3262)
!3267 = !DILocalVariable(name: "V", arg: 3, scope: !3262, file: !657, line: 82, type: !100)
!3268 = !DILocation(line: 82, column: 83, scope: !3262)
!3269 = !DILocalVariable(name: "acc", arg: 4, scope: !3262, file: !657, line: 82, type: !51)
!3270 = !DILocation(line: 82, column: 96, scope: !3262)
!3271 = !DILocation(line: 86, column: 66, scope: !3262)
!3272 = !DILocation(line: 86, column: 48, scope: !3262)
!3273 = !DILocation(line: 86, column: 70, scope: !3262)
!3274 = !DILocation(line: 86, column: 74, scope: !3262)
!3275 = !DILocation(line: 86, column: 77, scope: !3262)
!3276 = !DILocation(line: 86, column: 90, scope: !3262)
!3277 = !DILocation(line: 86, column: 82, scope: !3262)
!3278 = !DILocation(line: 86, column: 102, scope: !3262)
!3279 = !DILocation(line: 86, column: 94, scope: !3262)
!3280 = !DILocation(line: 86, column: 114, scope: !3262)
!3281 = !DILocation(line: 86, column: 106, scope: !3262)
!3282 = !DILocation(line: 86, column: 5, scope: !3262)
!3283 = !DILocation(line: 87, column: 1, scope: !3262)
!3284 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !657, file: !657, line: 32, type: !979, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3285 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3284, file: !657, line: 32, type: !460)
!3286 = !DILocation(line: 32, column: 59, scope: !3284)
!3287 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !3284, file: !657, line: 32, type: !660)
!3288 = !DILocation(line: 32, column: 88, scope: !3284)
!3289 = !DILocalVariable(name: "mat", arg: 3, scope: !3284, file: !657, line: 32, type: !100)
!3290 = !DILocation(line: 32, column: 117, scope: !3284)
!3291 = !DILocalVariable(name: "acc", arg: 4, scope: !3284, file: !657, line: 32, type: !51)
!3292 = !DILocation(line: 32, column: 132, scope: !3284)
!3293 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !3284, file: !657, line: 33, type: !460)
!3294 = !DILocation(line: 33, column: 59, scope: !3284)
!3295 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !3284, file: !657, line: 33, type: !460)
!3296 = !DILocation(line: 33, column: 82, scope: !3284)
!3297 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !3284, file: !657, line: 33, type: !460)
!3298 = !DILocation(line: 33, column: 105, scope: !3284)
!3299 = !DILocalVariable(name: "triangular", arg: 8, scope: !3284, file: !657, line: 33, type: !460)
!3300 = !DILocation(line: 33, column: 125, scope: !3284)
!3301 = !DILocalVariable(name: "bs_mat_entries_used", scope: !3284, file: !657, line: 34, type: !85)
!3302 = !DILocation(line: 34, column: 9, scope: !3284)
!3303 = !DILocalVariable(name: "r", scope: !3304, file: !657, line: 35, type: !85)
!3304 = distinct !DILexicalBlock(scope: !3284, file: !657, line: 35, column: 5)
!3305 = !DILocation(line: 35, column: 14, scope: !3304)
!3306 = !DILocation(line: 35, column: 10, scope: !3304)
!3307 = !DILocation(line: 35, column: 21, scope: !3308)
!3308 = distinct !DILexicalBlock(scope: !3304, file: !657, line: 35, column: 5)
!3309 = !DILocation(line: 35, column: 25, scope: !3308)
!3310 = !DILocation(line: 35, column: 23, scope: !3308)
!3311 = !DILocation(line: 35, column: 5, scope: !3304)
!3312 = !DILocalVariable(name: "c", scope: !3313, file: !657, line: 36, type: !85)
!3313 = distinct !DILexicalBlock(scope: !3314, file: !657, line: 36, column: 9)
!3314 = distinct !DILexicalBlock(scope: !3308, file: !657, line: 35, column: 43)
!3315 = !DILocation(line: 36, column: 18, scope: !3313)
!3316 = !DILocation(line: 36, column: 22, scope: !3313)
!3317 = !DILocation(line: 36, column: 35, scope: !3313)
!3318 = !DILocation(line: 36, column: 33, scope: !3313)
!3319 = !DILocation(line: 36, column: 14, scope: !3313)
!3320 = !DILocation(line: 36, column: 38, scope: !3321)
!3321 = distinct !DILexicalBlock(scope: !3313, file: !657, line: 36, column: 9)
!3322 = !DILocation(line: 36, column: 42, scope: !3321)
!3323 = !DILocation(line: 36, column: 40, scope: !3321)
!3324 = !DILocation(line: 36, column: 9, scope: !3313)
!3325 = !DILocalVariable(name: "k", scope: !3326, file: !657, line: 37, type: !85)
!3326 = distinct !DILexicalBlock(scope: !3327, file: !657, line: 37, column: 13)
!3327 = distinct !DILexicalBlock(scope: !3321, file: !657, line: 36, column: 60)
!3328 = !DILocation(line: 37, column: 22, scope: !3326)
!3329 = !DILocation(line: 37, column: 18, scope: !3326)
!3330 = !DILocation(line: 37, column: 29, scope: !3331)
!3331 = distinct !DILexicalBlock(scope: !3326, file: !657, line: 37, column: 13)
!3332 = !DILocation(line: 37, column: 33, scope: !3331)
!3333 = !DILocation(line: 37, column: 31, scope: !3331)
!3334 = !DILocation(line: 37, column: 13, scope: !3326)
!3335 = !DILocation(line: 38, column: 31, scope: !3336)
!3336 = distinct !DILexicalBlock(scope: !3331, file: !657, line: 37, column: 51)
!3337 = !DILocation(line: 38, column: 44, scope: !3336)
!3338 = !DILocation(line: 38, column: 53, scope: !3336)
!3339 = !DILocation(line: 38, column: 67, scope: !3336)
!3340 = !DILocation(line: 38, column: 65, scope: !3336)
!3341 = !DILocation(line: 38, column: 51, scope: !3336)
!3342 = !DILocation(line: 38, column: 88, scope: !3336)
!3343 = !DILocation(line: 38, column: 92, scope: !3336)
!3344 = !DILocation(line: 38, column: 96, scope: !3336)
!3345 = !DILocation(line: 38, column: 94, scope: !3336)
!3346 = !DILocation(line: 38, column: 110, scope: !3336)
!3347 = !DILocation(line: 38, column: 108, scope: !3336)
!3348 = !DILocation(line: 38, column: 114, scope: !3336)
!3349 = !DILocation(line: 38, column: 120, scope: !3336)
!3350 = !DILocation(line: 38, column: 135, scope: !3336)
!3351 = !DILocation(line: 38, column: 139, scope: !3336)
!3352 = !DILocation(line: 38, column: 137, scope: !3336)
!3353 = !DILocation(line: 38, column: 150, scope: !3336)
!3354 = !DILocation(line: 38, column: 148, scope: !3336)
!3355 = !DILocation(line: 38, column: 132, scope: !3336)
!3356 = !DILocation(line: 38, column: 118, scope: !3336)
!3357 = !DILocation(line: 38, column: 17, scope: !3336)
!3358 = !DILocation(line: 39, column: 13, scope: !3336)
!3359 = !DILocation(line: 37, column: 45, scope: !3331)
!3360 = !DILocation(line: 37, column: 13, scope: !3331)
!3361 = distinct !{!3361, !3334, !3362, !146}
!3362 = !DILocation(line: 39, column: 13, scope: !3326)
!3363 = !DILocation(line: 40, column: 33, scope: !3327)
!3364 = !DILocation(line: 41, column: 9, scope: !3327)
!3365 = !DILocation(line: 36, column: 56, scope: !3321)
!3366 = !DILocation(line: 36, column: 9, scope: !3321)
!3367 = distinct !{!3367, !3324, !3368, !146}
!3368 = !DILocation(line: 41, column: 9, scope: !3313)
!3369 = !DILocation(line: 42, column: 5, scope: !3314)
!3370 = !DILocation(line: 35, column: 39, scope: !3308)
!3371 = !DILocation(line: 35, column: 5, scope: !3308)
!3372 = distinct !{!3372, !3311, !3373, !146}
!3373 = !DILocation(line: 42, column: 5, scope: !3304)
!3374 = !DILocation(line: 43, column: 1, scope: !3284)
!3375 = distinct !DISubprogram(name: "mayo_sign", scope: !48, file: !48, line: 502, type: !1344, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3376 = !DILocalVariable(name: "p", arg: 1, scope: !3375, file: !48, line: 502, type: !379)
!3377 = !DILocation(line: 502, column: 36, scope: !3375)
!3378 = !DILocalVariable(name: "sm", arg: 2, scope: !3375, file: !48, line: 502, type: !59)
!3379 = !DILocation(line: 502, column: 54, scope: !3375)
!3380 = !DILocalVariable(name: "smlen", arg: 3, scope: !3375, file: !48, line: 503, type: !1346)
!3381 = !DILocation(line: 503, column: 23, scope: !3375)
!3382 = !DILocalVariable(name: "m", arg: 4, scope: !3375, file: !48, line: 503, type: !100)
!3383 = !DILocation(line: 503, column: 51, scope: !3375)
!3384 = !DILocalVariable(name: "mlen", arg: 5, scope: !3375, file: !48, line: 504, type: !57)
!3385 = !DILocation(line: 504, column: 22, scope: !3375)
!3386 = !DILocalVariable(name: "csk", arg: 6, scope: !3375, file: !48, line: 504, type: !100)
!3387 = !DILocation(line: 504, column: 49, scope: !3375)
!3388 = !DILocalVariable(name: "ret", scope: !3375, file: !48, line: 505, type: !85)
!3389 = !DILocation(line: 505, column: 9, scope: !3375)
!3390 = !DILocalVariable(name: "param_sig_bytes", scope: !3375, file: !48, line: 506, type: !460)
!3391 = !DILocation(line: 506, column: 15, scope: !3375)
!3392 = !DILocation(line: 506, column: 49, scope: !3375)
!3393 = !DILocation(line: 506, column: 33, scope: !3375)
!3394 = !DILocalVariable(name: "siglen", scope: !3375, file: !48, line: 507, type: !57)
!3395 = !DILocation(line: 507, column: 12, scope: !3375)
!3396 = !DILocation(line: 508, column: 13, scope: !3375)
!3397 = !DILocation(line: 508, column: 18, scope: !3375)
!3398 = !DILocation(line: 508, column: 5, scope: !3375)
!3399 = !DILocation(line: 508, column: 35, scope: !3375)
!3400 = !DILocation(line: 508, column: 38, scope: !3375)
!3401 = !DILocation(line: 509, column: 31, scope: !3375)
!3402 = !DILocation(line: 509, column: 34, scope: !3375)
!3403 = !DILocation(line: 509, column: 47, scope: !3375)
!3404 = !DILocation(line: 509, column: 52, scope: !3375)
!3405 = !DILocation(line: 509, column: 50, scope: !3375)
!3406 = !DILocation(line: 509, column: 69, scope: !3375)
!3407 = !DILocation(line: 509, column: 75, scope: !3375)
!3408 = !DILocation(line: 509, column: 11, scope: !3375)
!3409 = !DILocation(line: 509, column: 9, scope: !3375)
!3410 = !DILocation(line: 510, column: 9, scope: !3411)
!3411 = distinct !DILexicalBlock(scope: !3375, file: !48, line: 510, column: 9)
!3412 = !DILocation(line: 510, column: 13, scope: !3411)
!3413 = !DILocation(line: 510, column: 24, scope: !3411)
!3414 = !DILocation(line: 510, column: 27, scope: !3411)
!3415 = !DILocation(line: 510, column: 46, scope: !3411)
!3416 = !DILocation(line: 510, column: 37, scope: !3411)
!3417 = !DILocation(line: 510, column: 34, scope: !3411)
!3418 = !DILocation(line: 511, column: 16, scope: !3419)
!3419 = distinct !DILexicalBlock(scope: !3411, file: !48, line: 510, column: 62)
!3420 = !DILocation(line: 511, column: 23, scope: !3419)
!3421 = !DILocation(line: 511, column: 32, scope: !3419)
!3422 = !DILocation(line: 511, column: 30, scope: !3419)
!3423 = !DILocation(line: 511, column: 9, scope: !3419)
!3424 = !DILocation(line: 512, column: 9, scope: !3419)
!3425 = !DILocation(line: 515, column: 14, scope: !3375)
!3426 = !DILocation(line: 515, column: 23, scope: !3375)
!3427 = !DILocation(line: 515, column: 21, scope: !3375)
!3428 = !DILocation(line: 515, column: 6, scope: !3375)
!3429 = !DILocation(line: 515, column: 12, scope: !3375)
!3430 = !DILocation(line: 515, column: 5, scope: !3375)
!3431 = !DILabel(scope: !3375, name: "err", file: !48, line: 516, column: 1)
!3432 = !DILocation(line: 516, column: 1, scope: !3375)
!3433 = !DILocation(line: 517, column: 12, scope: !3375)
!3434 = !DILocation(line: 517, column: 5, scope: !3375)
!3435 = distinct !DISubprogram(name: "mayo_open", scope: !48, file: !48, line: 520, type: !1344, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3436 = !DILocalVariable(name: "p", arg: 1, scope: !3435, file: !48, line: 520, type: !379)
!3437 = !DILocation(line: 520, column: 36, scope: !3435)
!3438 = !DILocalVariable(name: "m", arg: 2, scope: !3435, file: !48, line: 520, type: !59)
!3439 = !DILocation(line: 520, column: 54, scope: !3435)
!3440 = !DILocalVariable(name: "mlen", arg: 3, scope: !3435, file: !48, line: 521, type: !1346)
!3441 = !DILocation(line: 521, column: 23, scope: !3435)
!3442 = !DILocalVariable(name: "sm", arg: 4, scope: !3435, file: !48, line: 521, type: !100)
!3443 = !DILocation(line: 521, column: 50, scope: !3435)
!3444 = !DILocalVariable(name: "smlen", arg: 5, scope: !3435, file: !48, line: 522, type: !57)
!3445 = !DILocation(line: 522, column: 22, scope: !3435)
!3446 = !DILocalVariable(name: "pk", arg: 6, scope: !3435, file: !48, line: 522, type: !100)
!3447 = !DILocation(line: 522, column: 50, scope: !3435)
!3448 = !DILocalVariable(name: "param_sig_bytes", scope: !3435, file: !48, line: 523, type: !460)
!3449 = !DILocation(line: 523, column: 15, scope: !3435)
!3450 = !DILocation(line: 523, column: 49, scope: !3435)
!3451 = !DILocation(line: 523, column: 33, scope: !3435)
!3452 = !DILocation(line: 524, column: 9, scope: !3453)
!3453 = distinct !DILexicalBlock(scope: !3435, file: !48, line: 524, column: 9)
!3454 = !DILocation(line: 524, column: 25, scope: !3453)
!3455 = !DILocation(line: 524, column: 17, scope: !3453)
!3456 = !DILocation(line: 524, column: 15, scope: !3453)
!3457 = !DILocation(line: 525, column: 9, scope: !3458)
!3458 = distinct !DILexicalBlock(scope: !3453, file: !48, line: 524, column: 42)
!3459 = !DILocalVariable(name: "result", scope: !3435, file: !48, line: 527, type: !85)
!3460 = !DILocation(line: 527, column: 9, scope: !3435)
!3461 = !DILocation(line: 527, column: 30, scope: !3435)
!3462 = !DILocation(line: 527, column: 33, scope: !3435)
!3463 = !DILocation(line: 527, column: 38, scope: !3435)
!3464 = !DILocation(line: 527, column: 36, scope: !3435)
!3465 = !DILocation(line: 527, column: 55, scope: !3435)
!3466 = !DILocation(line: 527, column: 63, scope: !3435)
!3467 = !DILocation(line: 527, column: 61, scope: !3435)
!3468 = !DILocation(line: 527, column: 80, scope: !3435)
!3469 = !DILocation(line: 528, column: 30, scope: !3435)
!3470 = !DILocation(line: 527, column: 18, scope: !3435)
!3471 = !DILocation(line: 530, column: 9, scope: !3472)
!3472 = distinct !DILexicalBlock(scope: !3435, file: !48, line: 530, column: 9)
!3473 = !DILocation(line: 530, column: 16, scope: !3472)
!3474 = !DILocation(line: 531, column: 17, scope: !3475)
!3475 = distinct !DILexicalBlock(scope: !3472, file: !48, line: 530, column: 28)
!3476 = !DILocation(line: 531, column: 25, scope: !3475)
!3477 = !DILocation(line: 531, column: 23, scope: !3475)
!3478 = !DILocation(line: 531, column: 10, scope: !3475)
!3479 = !DILocation(line: 531, column: 15, scope: !3475)
!3480 = !DILocation(line: 532, column: 17, scope: !3475)
!3481 = !DILocation(line: 532, column: 20, scope: !3475)
!3482 = !DILocation(line: 532, column: 25, scope: !3475)
!3483 = !DILocation(line: 532, column: 9, scope: !3475)
!3484 = !DILocation(line: 532, column: 43, scope: !3475)
!3485 = !DILocation(line: 532, column: 42, scope: !3475)
!3486 = !DILocation(line: 533, column: 5, scope: !3475)
!3487 = !DILocation(line: 535, column: 12, scope: !3435)
!3488 = !DILocation(line: 535, column: 5, scope: !3435)
!3489 = !DILocation(line: 536, column: 1, scope: !3435)
!3490 = distinct !DISubprogram(name: "mayo_verify", scope: !48, file: !48, line: 617, type: !3491, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3491 = !DISubroutineType(types: !3492)
!3492 = !{!85, !379, !100, !57, !100, !100}
!3493 = !DILocalVariable(name: "p", arg: 1, scope: !3490, file: !48, line: 617, type: !379)
!3494 = !DILocation(line: 617, column: 38, scope: !3490)
!3495 = !DILocalVariable(name: "m", arg: 2, scope: !3490, file: !48, line: 617, type: !100)
!3496 = !DILocation(line: 617, column: 62, scope: !3490)
!3497 = !DILocalVariable(name: "mlen", arg: 3, scope: !3490, file: !48, line: 618, type: !57)
!3498 = !DILocation(line: 618, column: 24, scope: !3490)
!3499 = !DILocalVariable(name: "sig", arg: 4, scope: !3490, file: !48, line: 618, type: !100)
!3500 = !DILocation(line: 618, column: 51, scope: !3490)
!3501 = !DILocalVariable(name: "cpk", arg: 5, scope: !3490, file: !48, line: 619, type: !100)
!3502 = !DILocation(line: 619, column: 38, scope: !3490)
!3503 = !DILocalVariable(name: "tEnc", scope: !3490, file: !48, line: 620, type: !1362)
!3504 = !DILocation(line: 620, column: 19, scope: !3490)
!3505 = !DILocalVariable(name: "t", scope: !3490, file: !48, line: 621, type: !1367)
!3506 = !DILocation(line: 621, column: 19, scope: !3490)
!3507 = !DILocalVariable(name: "y", scope: !3490, file: !48, line: 622, type: !3508)
!3508 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 2272, elements: !3509)
!3509 = !{!3510}
!3510 = !DISubrange(count: 284)
!3511 = !DILocation(line: 622, column: 19, scope: !3490)
!3512 = !DILocalVariable(name: "s", scope: !3490, file: !48, line: 623, type: !1394)
!3513 = !DILocation(line: 623, column: 19, scope: !3490)
!3514 = !DILocalVariable(name: "pk", scope: !3490, file: !48, line: 624, type: !3515)
!3515 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 7326720, elements: !3516)
!3516 = !{!3517}
!3517 = !DISubrange(count: 114480)
!3518 = !DILocation(line: 624, column: 14, scope: !3490)
!3519 = !DILocalVariable(name: "tmp", scope: !3490, file: !48, line: 625, type: !3520)
!3520 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 832, elements: !3521)
!3521 = !{!3522}
!3522 = !DISubrange(count: 104)
!3523 = !DILocation(line: 625, column: 19, scope: !3490)
!3524 = !DILocalVariable(name: "param_m", scope: !3490, file: !48, line: 627, type: !460)
!3525 = !DILocation(line: 627, column: 15, scope: !3490)
!3526 = !DILocation(line: 627, column: 33, scope: !3490)
!3527 = !DILocation(line: 627, column: 25, scope: !3490)
!3528 = !DILocalVariable(name: "param_n", scope: !3490, file: !48, line: 628, type: !460)
!3529 = !DILocation(line: 628, column: 15, scope: !3490)
!3530 = !DILocation(line: 628, column: 33, scope: !3490)
!3531 = !DILocation(line: 628, column: 25, scope: !3490)
!3532 = !DILocalVariable(name: "param_k", scope: !3490, file: !48, line: 629, type: !460)
!3533 = !DILocation(line: 629, column: 15, scope: !3490)
!3534 = !DILocation(line: 629, column: 33, scope: !3490)
!3535 = !DILocation(line: 629, column: 25, scope: !3490)
!3536 = !DILocalVariable(name: "param_m_bytes", scope: !3490, file: !48, line: 630, type: !460)
!3537 = !DILocation(line: 630, column: 15, scope: !3490)
!3538 = !DILocation(line: 630, column: 45, scope: !3490)
!3539 = !DILocation(line: 630, column: 31, scope: !3490)
!3540 = !DILocalVariable(name: "param_sig_bytes", scope: !3490, file: !48, line: 631, type: !460)
!3541 = !DILocation(line: 631, column: 15, scope: !3490)
!3542 = !DILocation(line: 631, column: 49, scope: !3490)
!3543 = !DILocation(line: 631, column: 33, scope: !3490)
!3544 = !DILocalVariable(name: "param_digest_bytes", scope: !3490, file: !48, line: 632, type: !460)
!3545 = !DILocation(line: 632, column: 15, scope: !3490)
!3546 = !DILocation(line: 632, column: 55, scope: !3490)
!3547 = !DILocation(line: 632, column: 36, scope: !3490)
!3548 = !DILocalVariable(name: "param_salt_bytes", scope: !3490, file: !48, line: 633, type: !460)
!3549 = !DILocation(line: 633, column: 15, scope: !3490)
!3550 = !DILocation(line: 633, column: 51, scope: !3490)
!3551 = !DILocation(line: 633, column: 34, scope: !3490)
!3552 = !DILocalVariable(name: "ret", scope: !3490, file: !48, line: 635, type: !85)
!3553 = !DILocation(line: 635, column: 9, scope: !3490)
!3554 = !DILocation(line: 635, column: 30, scope: !3490)
!3555 = !DILocation(line: 635, column: 33, scope: !3490)
!3556 = !DILocation(line: 635, column: 38, scope: !3490)
!3557 = !DILocation(line: 635, column: 15, scope: !3490)
!3558 = !DILocation(line: 636, column: 9, scope: !3559)
!3559 = distinct !DILexicalBlock(scope: !3490, file: !48, line: 636, column: 9)
!3560 = !DILocation(line: 636, column: 13, scope: !3559)
!3561 = !DILocation(line: 637, column: 9, scope: !3562)
!3562 = distinct !DILexicalBlock(scope: !3559, file: !48, line: 636, column: 25)
!3563 = !DILocalVariable(name: "P1", scope: !3490, file: !48, line: 640, type: !51)
!3564 = !DILocation(line: 640, column: 15, scope: !3490)
!3565 = !DILocation(line: 640, column: 20, scope: !3490)
!3566 = !DILocalVariable(name: "P2", scope: !3490, file: !48, line: 641, type: !51)
!3567 = !DILocation(line: 641, column: 15, scope: !3490)
!3568 = !DILocation(line: 641, column: 20, scope: !3490)
!3569 = !DILocation(line: 641, column: 40, scope: !3490)
!3570 = !DILocation(line: 641, column: 25, scope: !3490)
!3571 = !DILocation(line: 641, column: 23, scope: !3490)
!3572 = !DILocalVariable(name: "P3", scope: !3490, file: !48, line: 642, type: !51)
!3573 = !DILocation(line: 642, column: 15, scope: !3490)
!3574 = !DILocation(line: 642, column: 20, scope: !3490)
!3575 = !DILocation(line: 642, column: 40, scope: !3490)
!3576 = !DILocation(line: 642, column: 25, scope: !3490)
!3577 = !DILocation(line: 642, column: 23, scope: !3490)
!3578 = !DILocation(line: 657, column: 14, scope: !3490)
!3579 = !DILocation(line: 657, column: 19, scope: !3490)
!3580 = !DILocation(line: 657, column: 39, scope: !3490)
!3581 = !DILocation(line: 657, column: 42, scope: !3490)
!3582 = !DILocation(line: 657, column: 5, scope: !3490)
!3583 = !DILocation(line: 660, column: 5, scope: !3490)
!3584 = !DILocation(line: 660, column: 18, scope: !3490)
!3585 = !DILocation(line: 660, column: 38, scope: !3490)
!3586 = !DILocation(line: 660, column: 44, scope: !3490)
!3587 = !DILocation(line: 660, column: 62, scope: !3490)
!3588 = !DILocation(line: 661, column: 12, scope: !3490)
!3589 = !DILocation(line: 662, column: 14, scope: !3490)
!3590 = !DILocation(line: 662, column: 20, scope: !3490)
!3591 = !DILocation(line: 662, column: 35, scope: !3490)
!3592 = !DILocation(line: 662, column: 40, scope: !3490)
!3593 = !DILocation(line: 662, column: 61, scope: !3490)
!3594 = !DILocation(line: 662, column: 59, scope: !3490)
!3595 = !DILocation(line: 662, column: 5, scope: !3490)
!3596 = !DILocation(line: 663, column: 12, scope: !3490)
!3597 = !DILocation(line: 663, column: 18, scope: !3490)
!3598 = !DILocation(line: 663, column: 21, scope: !3490)
!3599 = !DILocation(line: 663, column: 5, scope: !3490)
!3600 = !DILocation(line: 666, column: 12, scope: !3490)
!3601 = !DILocation(line: 666, column: 17, scope: !3490)
!3602 = !DILocation(line: 666, column: 20, scope: !3490)
!3603 = !DILocation(line: 666, column: 30, scope: !3490)
!3604 = !DILocation(line: 666, column: 28, scope: !3490)
!3605 = !DILocation(line: 666, column: 5, scope: !3490)
!3606 = !DILocation(line: 668, column: 21, scope: !3490)
!3607 = !DILocation(line: 668, column: 24, scope: !3490)
!3608 = !DILocation(line: 668, column: 27, scope: !3490)
!3609 = !DILocation(line: 668, column: 31, scope: !3490)
!3610 = !DILocation(line: 668, column: 35, scope: !3490)
!3611 = !DILocation(line: 668, column: 39, scope: !3490)
!3612 = !DILocation(line: 668, column: 5, scope: !3490)
!3613 = !DILocation(line: 670, column: 16, scope: !3614)
!3614 = distinct !DILexicalBlock(scope: !3490, file: !48, line: 670, column: 9)
!3615 = !DILocation(line: 670, column: 19, scope: !3614)
!3616 = !DILocation(line: 670, column: 22, scope: !3614)
!3617 = !DILocation(line: 670, column: 9, scope: !3614)
!3618 = !DILocation(line: 670, column: 31, scope: !3614)
!3619 = !DILocation(line: 671, column: 9, scope: !3620)
!3620 = distinct !DILexicalBlock(scope: !3614, file: !48, line: 670, column: 37)
!3621 = !DILocation(line: 673, column: 5, scope: !3490)
!3622 = !DILocation(line: 674, column: 1, scope: !3490)
!3623 = distinct !DISubprogram(name: "mayo_expand_pk", scope: !48, file: !48, line: 608, type: !3624, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3624 = !DISubroutineType(types: !3625)
!3625 = !{!85, !379, !100, !51}
!3626 = !DILocalVariable(name: "p", arg: 1, scope: !3623, file: !48, line: 608, type: !379)
!3627 = !DILocation(line: 608, column: 41, scope: !3623)
!3628 = !DILocalVariable(name: "cpk", arg: 2, scope: !3623, file: !48, line: 608, type: !100)
!3629 = !DILocation(line: 608, column: 65, scope: !3623)
!3630 = !DILocalVariable(name: "pk", arg: 3, scope: !3623, file: !48, line: 609, type: !51)
!3631 = !DILocation(line: 609, column: 30, scope: !3623)
!3632 = !DILocation(line: 610, column: 18, scope: !3623)
!3633 = !DILocation(line: 610, column: 21, scope: !3623)
!3634 = !DILocation(line: 610, column: 25, scope: !3623)
!3635 = !DILocation(line: 610, column: 5, scope: !3623)
!3636 = !DILocation(line: 612, column: 19, scope: !3623)
!3637 = !DILocation(line: 612, column: 45, scope: !3623)
!3638 = !DILocation(line: 612, column: 25, scope: !3623)
!3639 = !DILocation(line: 612, column: 23, scope: !3623)
!3640 = !DILocation(line: 612, column: 49, scope: !3623)
!3641 = !DILocation(line: 612, column: 69, scope: !3623)
!3642 = !DILocation(line: 612, column: 54, scope: !3623)
!3643 = !DILocation(line: 612, column: 52, scope: !3623)
!3644 = !DILocation(line: 612, column: 89, scope: !3623)
!3645 = !DILocation(line: 612, column: 74, scope: !3623)
!3646 = !DILocation(line: 612, column: 72, scope: !3623)
!3647 = !DILocation(line: 612, column: 108, scope: !3623)
!3648 = !DILocation(line: 612, column: 93, scope: !3623)
!3649 = !DILocation(line: 612, column: 129, scope: !3623)
!3650 = !DILocation(line: 612, column: 111, scope: !3623)
!3651 = !DILocation(line: 612, column: 110, scope: !3623)
!3652 = !DILocation(line: 612, column: 141, scope: !3623)
!3653 = !DILocation(line: 612, column: 133, scope: !3623)
!3654 = !DILocation(line: 612, column: 5, scope: !3623)
!3655 = !DILocation(line: 614, column: 5, scope: !3623)
!3656 = distinct !DISubprogram(name: "eval_public_map", scope: !48, file: !48, line: 288, type: !3657, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3657 = !DISubroutineType(types: !3658)
!3658 = !{null, !379, !100, !660, !660, !660, !59}
!3659 = !DILocalVariable(name: "p", arg: 1, scope: !3656, file: !48, line: 288, type: !379)
!3660 = !DILocation(line: 288, column: 50, scope: !3656)
!3661 = !DILocalVariable(name: "s", arg: 2, scope: !3656, file: !48, line: 288, type: !100)
!3662 = !DILocation(line: 288, column: 74, scope: !3656)
!3663 = !DILocalVariable(name: "P1", arg: 3, scope: !3656, file: !48, line: 288, type: !660)
!3664 = !DILocation(line: 288, column: 93, scope: !3656)
!3665 = !DILocalVariable(name: "P2", arg: 4, scope: !3656, file: !48, line: 288, type: !660)
!3666 = !DILocation(line: 288, column: 113, scope: !3656)
!3667 = !DILocalVariable(name: "P3", arg: 5, scope: !3656, file: !48, line: 288, type: !660)
!3668 = !DILocation(line: 288, column: 133, scope: !3656)
!3669 = !DILocalVariable(name: "eval", arg: 6, scope: !3656, file: !48, line: 288, type: !59)
!3670 = !DILocation(line: 288, column: 152, scope: !3656)
!3671 = !DILocalVariable(name: "SPS", scope: !3656, file: !48, line: 289, type: !3672)
!3672 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 82944, elements: !3673)
!3673 = !{!3674}
!3674 = !DISubrange(count: 1296)
!3675 = !DILocation(line: 289, column: 14, scope: !3656)
!3676 = !DILocation(line: 291, column: 24, scope: !3656)
!3677 = !DILocation(line: 291, column: 27, scope: !3656)
!3678 = !DILocation(line: 291, column: 31, scope: !3656)
!3679 = !DILocation(line: 291, column: 35, scope: !3656)
!3680 = !DILocation(line: 291, column: 39, scope: !3656)
!3681 = !DILocation(line: 291, column: 42, scope: !3656)
!3682 = !DILocation(line: 291, column: 5, scope: !3656)
!3683 = !DILocalVariable(name: "zero", scope: !3656, file: !48, line: 292, type: !1367)
!3684 = !DILocation(line: 292, column: 19, scope: !3656)
!3685 = !DILocation(line: 293, column: 17, scope: !3656)
!3686 = !DILocation(line: 293, column: 20, scope: !3656)
!3687 = !DILocation(line: 293, column: 25, scope: !3656)
!3688 = !DILocation(line: 293, column: 31, scope: !3656)
!3689 = !DILocation(line: 293, column: 5, scope: !3656)
!3690 = !DILocation(line: 294, column: 1, scope: !3656)
!3691 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !657, file: !657, line: 277, type: !3692, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3692 = !DISubroutineType(types: !3693)
!3693 = !{null, !379, !660, !660, !660, !100, !51}
!3694 = !DILocalVariable(name: "p", arg: 1, scope: !3691, file: !657, line: 277, type: !379)
!3695 = !DILocation(line: 277, column: 60, scope: !3691)
!3696 = !DILocalVariable(name: "P1", arg: 2, scope: !3691, file: !657, line: 277, type: !660)
!3697 = !DILocation(line: 277, column: 79, scope: !3691)
!3698 = !DILocalVariable(name: "P2", arg: 3, scope: !3691, file: !657, line: 277, type: !660)
!3699 = !DILocation(line: 277, column: 99, scope: !3691)
!3700 = !DILocalVariable(name: "P3", arg: 4, scope: !3691, file: !657, line: 277, type: !660)
!3701 = !DILocation(line: 277, column: 119, scope: !3691)
!3702 = !DILocalVariable(name: "s", arg: 5, scope: !3691, file: !657, line: 277, type: !100)
!3703 = !DILocation(line: 277, column: 144, scope: !3691)
!3704 = !DILocalVariable(name: "SPS", arg: 6, scope: !3691, file: !657, line: 278, type: !51)
!3705 = !DILocation(line: 278, column: 49, scope: !3691)
!3706 = !DILocalVariable(name: "PS", scope: !3691, file: !657, line: 286, type: !3707)
!3707 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 1064448, elements: !3708)
!3708 = !{!3709}
!3709 = !DISubrange(count: 16632)
!3710 = !DILocation(line: 286, column: 14, scope: !3691)
!3711 = !DILocation(line: 287, column: 33, scope: !3691)
!3712 = !DILocation(line: 287, column: 37, scope: !3691)
!3713 = !DILocation(line: 287, column: 41, scope: !3691)
!3714 = !DILocation(line: 287, column: 45, scope: !3691)
!3715 = !DILocation(line: 287, column: 56, scope: !3691)
!3716 = !DILocation(line: 287, column: 48, scope: !3691)
!3717 = !DILocation(line: 287, column: 68, scope: !3691)
!3718 = !DILocation(line: 287, column: 60, scope: !3691)
!3719 = !DILocation(line: 287, column: 80, scope: !3691)
!3720 = !DILocation(line: 287, column: 72, scope: !3691)
!3721 = !DILocation(line: 287, column: 92, scope: !3691)
!3722 = !DILocation(line: 287, column: 84, scope: !3691)
!3723 = !DILocation(line: 287, column: 96, scope: !3691)
!3724 = !DILocation(line: 287, column: 5, scope: !3691)
!3725 = !DILocation(line: 290, column: 34, scope: !3691)
!3726 = !DILocation(line: 290, column: 38, scope: !3691)
!3727 = !DILocation(line: 290, column: 49, scope: !3691)
!3728 = !DILocation(line: 290, column: 41, scope: !3691)
!3729 = !DILocation(line: 290, column: 61, scope: !3691)
!3730 = !DILocation(line: 290, column: 53, scope: !3691)
!3731 = !DILocation(line: 290, column: 73, scope: !3691)
!3732 = !DILocation(line: 290, column: 65, scope: !3691)
!3733 = !DILocation(line: 290, column: 77, scope: !3691)
!3734 = !DILocation(line: 290, column: 5, scope: !3691)
!3735 = !DILocation(line: 292, column: 1, scope: !3691)
!3736 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !657, file: !657, line: 151, type: !3737, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!3737 = !DISubroutineType(types: !3738)
!3738 = !{null, !660, !660, !660, !100, !460, !460, !460, !460, !51}
!3739 = !DILocalVariable(name: "P1", arg: 1, scope: !3736, file: !657, line: 151, type: !660)
!3740 = !DILocation(line: 151, column: 64, scope: !3736)
!3741 = !DILocalVariable(name: "P2", arg: 2, scope: !3736, file: !657, line: 151, type: !660)
!3742 = !DILocation(line: 151, column: 84, scope: !3736)
!3743 = !DILocalVariable(name: "P3", arg: 3, scope: !3736, file: !657, line: 151, type: !660)
!3744 = !DILocation(line: 151, column: 104, scope: !3736)
!3745 = !DILocalVariable(name: "S", arg: 4, scope: !3736, file: !657, line: 151, type: !100)
!3746 = !DILocation(line: 151, column: 129, scope: !3736)
!3747 = !DILocalVariable(name: "m", arg: 5, scope: !3736, file: !657, line: 152, type: !460)
!3748 = !DILocation(line: 152, column: 58, scope: !3736)
!3749 = !DILocalVariable(name: "v", arg: 6, scope: !3736, file: !657, line: 152, type: !460)
!3750 = !DILocation(line: 152, column: 71, scope: !3736)
!3751 = !DILocalVariable(name: "o", arg: 7, scope: !3736, file: !657, line: 152, type: !460)
!3752 = !DILocation(line: 152, column: 84, scope: !3736)
!3753 = !DILocalVariable(name: "k", arg: 8, scope: !3736, file: !657, line: 152, type: !460)
!3754 = !DILocation(line: 152, column: 97, scope: !3736)
!3755 = !DILocalVariable(name: "PS", arg: 9, scope: !3736, file: !657, line: 152, type: !51)
!3756 = !DILocation(line: 152, column: 110, scope: !3736)
!3757 = !DILocalVariable(name: "n", scope: !3736, file: !657, line: 154, type: !460)
!3758 = !DILocation(line: 154, column: 15, scope: !3736)
!3759 = !DILocation(line: 154, column: 19, scope: !3736)
!3760 = !DILocation(line: 154, column: 23, scope: !3736)
!3761 = !DILocation(line: 154, column: 21, scope: !3736)
!3762 = !DILocalVariable(name: "m_vec_limbs", scope: !3736, file: !657, line: 155, type: !460)
!3763 = !DILocation(line: 155, column: 15, scope: !3736)
!3764 = !DILocation(line: 155, column: 30, scope: !3736)
!3765 = !DILocation(line: 155, column: 32, scope: !3736)
!3766 = !DILocation(line: 155, column: 37, scope: !3736)
!3767 = !DILocalVariable(name: "accumulator", scope: !3736, file: !657, line: 157, type: !3768)
!3768 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 17031168, elements: !3769)
!3769 = !{!3770}
!3770 = !DISubrange(count: 266112)
!3771 = !DILocation(line: 157, column: 14, scope: !3736)
!3772 = !DILocalVariable(name: "P1_used", scope: !3736, file: !657, line: 158, type: !85)
!3773 = !DILocation(line: 158, column: 9, scope: !3736)
!3774 = !DILocalVariable(name: "row", scope: !3775, file: !657, line: 159, type: !85)
!3775 = distinct !DILexicalBlock(scope: !3736, file: !657, line: 159, column: 5)
!3776 = !DILocation(line: 159, column: 14, scope: !3775)
!3777 = !DILocation(line: 159, column: 10, scope: !3775)
!3778 = !DILocation(line: 159, column: 23, scope: !3779)
!3779 = distinct !DILexicalBlock(scope: !3775, file: !657, line: 159, column: 5)
!3780 = !DILocation(line: 159, column: 29, scope: !3779)
!3781 = !DILocation(line: 159, column: 27, scope: !3779)
!3782 = !DILocation(line: 159, column: 5, scope: !3775)
!3783 = !DILocalVariable(name: "j", scope: !3784, file: !657, line: 160, type: !85)
!3784 = distinct !DILexicalBlock(scope: !3785, file: !657, line: 160, column: 9)
!3785 = distinct !DILexicalBlock(scope: !3779, file: !657, line: 159, column: 39)
!3786 = !DILocation(line: 160, column: 18, scope: !3784)
!3787 = !DILocation(line: 160, column: 22, scope: !3784)
!3788 = !DILocation(line: 160, column: 14, scope: !3784)
!3789 = !DILocation(line: 160, column: 27, scope: !3790)
!3790 = distinct !DILexicalBlock(scope: !3784, file: !657, line: 160, column: 9)
!3791 = !DILocation(line: 160, column: 31, scope: !3790)
!3792 = !DILocation(line: 160, column: 29, scope: !3790)
!3793 = !DILocation(line: 160, column: 9, scope: !3784)
!3794 = !DILocalVariable(name: "col", scope: !3795, file: !657, line: 161, type: !85)
!3795 = distinct !DILexicalBlock(scope: !3796, file: !657, line: 161, column: 13)
!3796 = distinct !DILexicalBlock(scope: !3790, file: !657, line: 160, column: 39)
!3797 = !DILocation(line: 161, column: 22, scope: !3795)
!3798 = !DILocation(line: 161, column: 18, scope: !3795)
!3799 = !DILocation(line: 161, column: 31, scope: !3800)
!3800 = distinct !DILexicalBlock(scope: !3795, file: !657, line: 161, column: 13)
!3801 = !DILocation(line: 161, column: 37, scope: !3800)
!3802 = !DILocation(line: 161, column: 35, scope: !3800)
!3803 = !DILocation(line: 161, column: 13, scope: !3795)
!3804 = !DILocation(line: 162, column: 27, scope: !3805)
!3805 = distinct !DILexicalBlock(scope: !3800, file: !657, line: 161, column: 47)
!3806 = !DILocation(line: 162, column: 40, scope: !3805)
!3807 = !DILocation(line: 162, column: 46, scope: !3805)
!3808 = !DILocation(line: 162, column: 56, scope: !3805)
!3809 = !DILocation(line: 162, column: 54, scope: !3805)
!3810 = !DILocation(line: 162, column: 43, scope: !3805)
!3811 = !DILocation(line: 162, column: 70, scope: !3805)
!3812 = !DILocation(line: 162, column: 87, scope: !3805)
!3813 = !DILocation(line: 162, column: 93, scope: !3805)
!3814 = !DILocation(line: 162, column: 91, scope: !3805)
!3815 = !DILocation(line: 162, column: 97, scope: !3805)
!3816 = !DILocation(line: 162, column: 95, scope: !3805)
!3817 = !DILocation(line: 162, column: 102, scope: !3805)
!3818 = !DILocation(line: 162, column: 109, scope: !3805)
!3819 = !DILocation(line: 162, column: 111, scope: !3805)
!3820 = !DILocation(line: 162, column: 117, scope: !3805)
!3821 = !DILocation(line: 162, column: 115, scope: !3805)
!3822 = !DILocation(line: 162, column: 121, scope: !3805)
!3823 = !DILocation(line: 162, column: 119, scope: !3805)
!3824 = !DILocation(line: 162, column: 107, scope: !3805)
!3825 = !DILocation(line: 162, column: 126, scope: !3805)
!3826 = !DILocation(line: 162, column: 125, scope: !3805)
!3827 = !DILocation(line: 162, column: 82, scope: !3805)
!3828 = !DILocation(line: 162, column: 17, scope: !3805)
!3829 = !DILocation(line: 163, column: 13, scope: !3805)
!3830 = !DILocation(line: 161, column: 43, scope: !3800)
!3831 = !DILocation(line: 161, column: 13, scope: !3800)
!3832 = distinct !{!3832, !3803, !3833, !146}
!3833 = !DILocation(line: 163, column: 13, scope: !3795)
!3834 = !DILocation(line: 164, column: 21, scope: !3796)
!3835 = !DILocation(line: 165, column: 9, scope: !3796)
!3836 = !DILocation(line: 160, column: 35, scope: !3790)
!3837 = !DILocation(line: 160, column: 9, scope: !3790)
!3838 = distinct !{!3838, !3793, !3839, !146}
!3839 = !DILocation(line: 165, column: 9, scope: !3784)
!3840 = !DILocalVariable(name: "j", scope: !3841, file: !657, line: 167, type: !85)
!3841 = distinct !DILexicalBlock(scope: !3785, file: !657, line: 167, column: 9)
!3842 = !DILocation(line: 167, column: 18, scope: !3841)
!3843 = !DILocation(line: 167, column: 14, scope: !3841)
!3844 = !DILocation(line: 167, column: 25, scope: !3845)
!3845 = distinct !DILexicalBlock(scope: !3841, file: !657, line: 167, column: 9)
!3846 = !DILocation(line: 167, column: 29, scope: !3845)
!3847 = !DILocation(line: 167, column: 27, scope: !3845)
!3848 = !DILocation(line: 167, column: 9, scope: !3841)
!3849 = !DILocalVariable(name: "col", scope: !3850, file: !657, line: 168, type: !85)
!3850 = distinct !DILexicalBlock(scope: !3851, file: !657, line: 168, column: 13)
!3851 = distinct !DILexicalBlock(scope: !3845, file: !657, line: 167, column: 37)
!3852 = !DILocation(line: 168, column: 22, scope: !3850)
!3853 = !DILocation(line: 168, column: 18, scope: !3850)
!3854 = !DILocation(line: 168, column: 31, scope: !3855)
!3855 = distinct !DILexicalBlock(scope: !3850, file: !657, line: 168, column: 13)
!3856 = !DILocation(line: 168, column: 37, scope: !3855)
!3857 = !DILocation(line: 168, column: 35, scope: !3855)
!3858 = !DILocation(line: 168, column: 13, scope: !3850)
!3859 = !DILocation(line: 169, column: 27, scope: !3860)
!3860 = distinct !DILexicalBlock(scope: !3855, file: !657, line: 168, column: 47)
!3861 = !DILocation(line: 169, column: 40, scope: !3860)
!3862 = !DILocation(line: 169, column: 46, scope: !3860)
!3863 = !DILocation(line: 169, column: 52, scope: !3860)
!3864 = !DILocation(line: 169, column: 50, scope: !3860)
!3865 = !DILocation(line: 169, column: 56, scope: !3860)
!3866 = !DILocation(line: 169, column: 54, scope: !3860)
!3867 = !DILocation(line: 169, column: 59, scope: !3860)
!3868 = !DILocation(line: 169, column: 58, scope: !3860)
!3869 = !DILocation(line: 169, column: 43, scope: !3860)
!3870 = !DILocation(line: 169, column: 72, scope: !3860)
!3871 = !DILocation(line: 169, column: 89, scope: !3860)
!3872 = !DILocation(line: 169, column: 95, scope: !3860)
!3873 = !DILocation(line: 169, column: 93, scope: !3860)
!3874 = !DILocation(line: 169, column: 99, scope: !3860)
!3875 = !DILocation(line: 169, column: 97, scope: !3860)
!3876 = !DILocation(line: 169, column: 104, scope: !3860)
!3877 = !DILocation(line: 169, column: 111, scope: !3860)
!3878 = !DILocation(line: 169, column: 114, scope: !3860)
!3879 = !DILocation(line: 169, column: 120, scope: !3860)
!3880 = !DILocation(line: 169, column: 118, scope: !3860)
!3881 = !DILocation(line: 169, column: 125, scope: !3860)
!3882 = !DILocation(line: 169, column: 123, scope: !3860)
!3883 = !DILocation(line: 169, column: 129, scope: !3860)
!3884 = !DILocation(line: 169, column: 127, scope: !3860)
!3885 = !DILocation(line: 169, column: 109, scope: !3860)
!3886 = !DILocation(line: 169, column: 135, scope: !3860)
!3887 = !DILocation(line: 169, column: 133, scope: !3860)
!3888 = !DILocation(line: 169, column: 84, scope: !3860)
!3889 = !DILocation(line: 169, column: 17, scope: !3860)
!3890 = !DILocation(line: 170, column: 13, scope: !3860)
!3891 = !DILocation(line: 168, column: 43, scope: !3855)
!3892 = !DILocation(line: 168, column: 13, scope: !3855)
!3893 = distinct !{!3893, !3858, !3894, !146}
!3894 = !DILocation(line: 170, column: 13, scope: !3850)
!3895 = !DILocation(line: 171, column: 9, scope: !3851)
!3896 = !DILocation(line: 167, column: 33, scope: !3845)
!3897 = !DILocation(line: 167, column: 9, scope: !3845)
!3898 = distinct !{!3898, !3848, !3899, !146}
!3899 = !DILocation(line: 171, column: 9, scope: !3841)
!3900 = !DILocation(line: 172, column: 5, scope: !3785)
!3901 = !DILocation(line: 159, column: 35, scope: !3779)
!3902 = !DILocation(line: 159, column: 5, scope: !3779)
!3903 = distinct !{!3903, !3782, !3904, !146}
!3904 = !DILocation(line: 172, column: 5, scope: !3775)
!3905 = !DILocalVariable(name: "P3_used", scope: !3736, file: !657, line: 174, type: !85)
!3906 = !DILocation(line: 174, column: 9, scope: !3736)
!3907 = !DILocalVariable(name: "row", scope: !3908, file: !657, line: 175, type: !85)
!3908 = distinct !DILexicalBlock(scope: !3736, file: !657, line: 175, column: 5)
!3909 = !DILocation(line: 175, column: 14, scope: !3908)
!3910 = !DILocation(line: 175, column: 20, scope: !3908)
!3911 = !DILocation(line: 175, column: 10, scope: !3908)
!3912 = !DILocation(line: 175, column: 23, scope: !3913)
!3913 = distinct !DILexicalBlock(scope: !3908, file: !657, line: 175, column: 5)
!3914 = !DILocation(line: 175, column: 29, scope: !3913)
!3915 = !DILocation(line: 175, column: 27, scope: !3913)
!3916 = !DILocation(line: 175, column: 5, scope: !3908)
!3917 = !DILocalVariable(name: "j", scope: !3918, file: !657, line: 176, type: !85)
!3918 = distinct !DILexicalBlock(scope: !3919, file: !657, line: 176, column: 9)
!3919 = distinct !DILexicalBlock(scope: !3913, file: !657, line: 175, column: 39)
!3920 = !DILocation(line: 176, column: 18, scope: !3918)
!3921 = !DILocation(line: 176, column: 22, scope: !3918)
!3922 = !DILocation(line: 176, column: 14, scope: !3918)
!3923 = !DILocation(line: 176, column: 27, scope: !3924)
!3924 = distinct !DILexicalBlock(scope: !3918, file: !657, line: 176, column: 9)
!3925 = !DILocation(line: 176, column: 31, scope: !3924)
!3926 = !DILocation(line: 176, column: 29, scope: !3924)
!3927 = !DILocation(line: 176, column: 9, scope: !3918)
!3928 = !DILocalVariable(name: "col", scope: !3929, file: !657, line: 177, type: !85)
!3929 = distinct !DILexicalBlock(scope: !3930, file: !657, line: 177, column: 13)
!3930 = distinct !DILexicalBlock(scope: !3924, file: !657, line: 176, column: 39)
!3931 = !DILocation(line: 177, column: 22, scope: !3929)
!3932 = !DILocation(line: 177, column: 18, scope: !3929)
!3933 = !DILocation(line: 177, column: 31, scope: !3934)
!3934 = distinct !DILexicalBlock(scope: !3929, file: !657, line: 177, column: 13)
!3935 = !DILocation(line: 177, column: 37, scope: !3934)
!3936 = !DILocation(line: 177, column: 35, scope: !3934)
!3937 = !DILocation(line: 177, column: 13, scope: !3929)
!3938 = !DILocation(line: 178, column: 27, scope: !3939)
!3939 = distinct !DILexicalBlock(scope: !3934, file: !657, line: 177, column: 47)
!3940 = !DILocation(line: 178, column: 40, scope: !3939)
!3941 = !DILocation(line: 178, column: 45, scope: !3939)
!3942 = !DILocation(line: 178, column: 55, scope: !3939)
!3943 = !DILocation(line: 178, column: 53, scope: !3939)
!3944 = !DILocation(line: 178, column: 43, scope: !3939)
!3945 = !DILocation(line: 178, column: 68, scope: !3939)
!3946 = !DILocation(line: 178, column: 85, scope: !3939)
!3947 = !DILocation(line: 178, column: 91, scope: !3939)
!3948 = !DILocation(line: 178, column: 89, scope: !3939)
!3949 = !DILocation(line: 178, column: 95, scope: !3939)
!3950 = !DILocation(line: 178, column: 93, scope: !3939)
!3951 = !DILocation(line: 178, column: 100, scope: !3939)
!3952 = !DILocation(line: 178, column: 107, scope: !3939)
!3953 = !DILocation(line: 178, column: 109, scope: !3939)
!3954 = !DILocation(line: 178, column: 115, scope: !3939)
!3955 = !DILocation(line: 178, column: 113, scope: !3939)
!3956 = !DILocation(line: 178, column: 119, scope: !3939)
!3957 = !DILocation(line: 178, column: 117, scope: !3939)
!3958 = !DILocation(line: 178, column: 105, scope: !3939)
!3959 = !DILocation(line: 178, column: 125, scope: !3939)
!3960 = !DILocation(line: 178, column: 123, scope: !3939)
!3961 = !DILocation(line: 178, column: 80, scope: !3939)
!3962 = !DILocation(line: 178, column: 17, scope: !3939)
!3963 = !DILocation(line: 179, column: 13, scope: !3939)
!3964 = !DILocation(line: 177, column: 43, scope: !3934)
!3965 = !DILocation(line: 177, column: 13, scope: !3934)
!3966 = distinct !{!3966, !3937, !3967, !146}
!3967 = !DILocation(line: 179, column: 13, scope: !3929)
!3968 = !DILocation(line: 180, column: 21, scope: !3930)
!3969 = !DILocation(line: 181, column: 9, scope: !3930)
!3970 = !DILocation(line: 176, column: 35, scope: !3924)
!3971 = !DILocation(line: 176, column: 9, scope: !3924)
!3972 = distinct !{!3972, !3927, !3973, !146}
!3973 = !DILocation(line: 181, column: 9, scope: !3918)
!3974 = !DILocation(line: 182, column: 5, scope: !3919)
!3975 = !DILocation(line: 175, column: 35, scope: !3913)
!3976 = !DILocation(line: 175, column: 5, scope: !3913)
!3977 = distinct !{!3977, !3916, !3978, !146}
!3978 = !DILocation(line: 182, column: 5, scope: !3908)
!3979 = !DILocalVariable(name: "i", scope: !3736, file: !657, line: 185, type: !85)
!3980 = !DILocation(line: 185, column: 9, scope: !3736)
!3981 = !DILocation(line: 186, column: 5, scope: !3736)
!3982 = !DILocation(line: 186, column: 12, scope: !3736)
!3983 = !DILocation(line: 186, column: 16, scope: !3736)
!3984 = !DILocation(line: 186, column: 20, scope: !3736)
!3985 = !DILocation(line: 186, column: 18, scope: !3736)
!3986 = !DILocation(line: 186, column: 14, scope: !3736)
!3987 = !DILocation(line: 187, column: 29, scope: !3988)
!3988 = distinct !DILexicalBlock(scope: !3736, file: !657, line: 186, column: 23)
!3989 = !DILocation(line: 187, column: 42, scope: !3988)
!3990 = !DILocation(line: 187, column: 56, scope: !3988)
!3991 = !DILocation(line: 187, column: 58, scope: !3988)
!3992 = !DILocation(line: 187, column: 65, scope: !3988)
!3993 = !DILocation(line: 187, column: 63, scope: !3988)
!3994 = !DILocation(line: 187, column: 54, scope: !3988)
!3995 = !DILocation(line: 187, column: 78, scope: !3988)
!3996 = !DILocation(line: 187, column: 83, scope: !3988)
!3997 = !DILocation(line: 187, column: 87, scope: !3988)
!3998 = !DILocation(line: 187, column: 85, scope: !3988)
!3999 = !DILocation(line: 187, column: 81, scope: !3988)
!4000 = !DILocation(line: 187, column: 9, scope: !3988)
!4001 = !DILocation(line: 188, column: 10, scope: !3988)
!4002 = distinct !{!4002, !3981, !4003, !146}
!4003 = !DILocation(line: 189, column: 5, scope: !3736)
!4004 = !DILocation(line: 191, column: 1, scope: !3736)
!4005 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !657, file: !657, line: 195, type: !4006, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!4006 = !DISubroutineType(types: !4007)
!4007 = !{null, !660, !100, !85, !85, !85, !51}
!4008 = !DILocalVariable(name: "PS", arg: 1, scope: !4005, file: !657, line: 195, type: !660)
!4009 = !DILocation(line: 195, column: 65, scope: !4005)
!4010 = !DILocalVariable(name: "S", arg: 2, scope: !4005, file: !657, line: 195, type: !100)
!4011 = !DILocation(line: 195, column: 90, scope: !4005)
!4012 = !DILocalVariable(name: "m", arg: 3, scope: !4005, file: !657, line: 195, type: !85)
!4013 = !DILocation(line: 195, column: 97, scope: !4005)
!4014 = !DILocalVariable(name: "k", arg: 4, scope: !4005, file: !657, line: 195, type: !85)
!4015 = !DILocation(line: 195, column: 104, scope: !4005)
!4016 = !DILocalVariable(name: "n", arg: 5, scope: !4005, file: !657, line: 195, type: !85)
!4017 = !DILocation(line: 195, column: 112, scope: !4005)
!4018 = !DILocalVariable(name: "SPS", arg: 6, scope: !4005, file: !657, line: 195, type: !51)
!4019 = !DILocation(line: 195, column: 125, scope: !4005)
!4020 = !DILocalVariable(name: "accumulator", scope: !4005, file: !657, line: 196, type: !4021)
!4021 = !DICompositeType(tag: DW_TAG_array_type, baseType: !52, size: 1327104, elements: !4022)
!4022 = !{!4023}
!4023 = !DISubrange(count: 20736)
!4024 = !DILocation(line: 196, column: 14, scope: !4005)
!4025 = !DILocalVariable(name: "m_vec_limbs", scope: !4005, file: !657, line: 197, type: !460)
!4026 = !DILocation(line: 197, column: 15, scope: !4005)
!4027 = !DILocation(line: 197, column: 30, scope: !4005)
!4028 = !DILocation(line: 197, column: 32, scope: !4005)
!4029 = !DILocation(line: 197, column: 37, scope: !4005)
!4030 = !DILocalVariable(name: "row", scope: !4031, file: !657, line: 198, type: !85)
!4031 = distinct !DILexicalBlock(scope: !4005, file: !657, line: 198, column: 5)
!4032 = !DILocation(line: 198, column: 14, scope: !4031)
!4033 = !DILocation(line: 198, column: 10, scope: !4031)
!4034 = !DILocation(line: 198, column: 23, scope: !4035)
!4035 = distinct !DILexicalBlock(scope: !4031, file: !657, line: 198, column: 5)
!4036 = !DILocation(line: 198, column: 29, scope: !4035)
!4037 = !DILocation(line: 198, column: 27, scope: !4035)
!4038 = !DILocation(line: 198, column: 5, scope: !4031)
!4039 = !DILocalVariable(name: "j", scope: !4040, file: !657, line: 199, type: !85)
!4040 = distinct !DILexicalBlock(scope: !4041, file: !657, line: 199, column: 9)
!4041 = distinct !DILexicalBlock(scope: !4035, file: !657, line: 198, column: 39)
!4042 = !DILocation(line: 199, column: 18, scope: !4040)
!4043 = !DILocation(line: 199, column: 14, scope: !4040)
!4044 = !DILocation(line: 199, column: 25, scope: !4045)
!4045 = distinct !DILexicalBlock(scope: !4040, file: !657, line: 199, column: 9)
!4046 = !DILocation(line: 199, column: 29, scope: !4045)
!4047 = !DILocation(line: 199, column: 27, scope: !4045)
!4048 = !DILocation(line: 199, column: 9, scope: !4040)
!4049 = !DILocalVariable(name: "col", scope: !4050, file: !657, line: 200, type: !85)
!4050 = distinct !DILexicalBlock(scope: !4051, file: !657, line: 200, column: 13)
!4051 = distinct !DILexicalBlock(scope: !4045, file: !657, line: 199, column: 37)
!4052 = !DILocation(line: 200, column: 22, scope: !4050)
!4053 = !DILocation(line: 200, column: 18, scope: !4050)
!4054 = !DILocation(line: 200, column: 31, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4050, file: !657, line: 200, column: 13)
!4056 = !DILocation(line: 200, column: 37, scope: !4055)
!4057 = !DILocation(line: 200, column: 35, scope: !4055)
!4058 = !DILocation(line: 200, column: 13, scope: !4050)
!4059 = !DILocation(line: 201, column: 31, scope: !4060)
!4060 = distinct !DILexicalBlock(scope: !4055, file: !657, line: 200, column: 50)
!4061 = !DILocation(line: 201, column: 44, scope: !4060)
!4062 = !DILocation(line: 201, column: 50, scope: !4060)
!4063 = !DILocation(line: 201, column: 54, scope: !4060)
!4064 = !DILocation(line: 201, column: 52, scope: !4060)
!4065 = !DILocation(line: 201, column: 58, scope: !4060)
!4066 = !DILocation(line: 201, column: 56, scope: !4060)
!4067 = !DILocation(line: 201, column: 65, scope: !4060)
!4068 = !DILocation(line: 201, column: 63, scope: !4060)
!4069 = !DILocation(line: 201, column: 47, scope: !4060)
!4070 = !DILocation(line: 201, column: 78, scope: !4060)
!4071 = !DILocation(line: 201, column: 95, scope: !4060)
!4072 = !DILocation(line: 201, column: 101, scope: !4060)
!4073 = !DILocation(line: 201, column: 99, scope: !4060)
!4074 = !DILocation(line: 201, column: 105, scope: !4060)
!4075 = !DILocation(line: 201, column: 103, scope: !4060)
!4076 = !DILocation(line: 201, column: 110, scope: !4060)
!4077 = !DILocation(line: 201, column: 117, scope: !4060)
!4078 = !DILocation(line: 201, column: 119, scope: !4060)
!4079 = !DILocation(line: 201, column: 125, scope: !4060)
!4080 = !DILocation(line: 201, column: 123, scope: !4060)
!4081 = !DILocation(line: 201, column: 129, scope: !4060)
!4082 = !DILocation(line: 201, column: 127, scope: !4060)
!4083 = !DILocation(line: 201, column: 115, scope: !4060)
!4084 = !DILocation(line: 201, column: 134, scope: !4060)
!4085 = !DILocation(line: 201, column: 133, scope: !4060)
!4086 = !DILocation(line: 201, column: 90, scope: !4060)
!4087 = !DILocation(line: 201, column: 21, scope: !4060)
!4088 = !DILocation(line: 202, column: 13, scope: !4060)
!4089 = !DILocation(line: 200, column: 44, scope: !4055)
!4090 = !DILocation(line: 200, column: 13, scope: !4055)
!4091 = distinct !{!4091, !4058, !4092, !146}
!4092 = !DILocation(line: 202, column: 13, scope: !4050)
!4093 = !DILocation(line: 203, column: 9, scope: !4051)
!4094 = !DILocation(line: 199, column: 33, scope: !4045)
!4095 = !DILocation(line: 199, column: 9, scope: !4045)
!4096 = distinct !{!4096, !4048, !4097, !146}
!4097 = !DILocation(line: 203, column: 9, scope: !4040)
!4098 = !DILocation(line: 204, column: 5, scope: !4041)
!4099 = !DILocation(line: 198, column: 35, scope: !4035)
!4100 = !DILocation(line: 198, column: 5, scope: !4035)
!4101 = distinct !{!4101, !4038, !4102, !146}
!4102 = !DILocation(line: 204, column: 5, scope: !4031)
!4103 = !DILocalVariable(name: "i", scope: !4005, file: !657, line: 207, type: !85)
!4104 = !DILocation(line: 207, column: 9, scope: !4005)
!4105 = !DILocation(line: 208, column: 5, scope: !4005)
!4106 = !DILocation(line: 208, column: 12, scope: !4005)
!4107 = !DILocation(line: 208, column: 16, scope: !4005)
!4108 = !DILocation(line: 208, column: 18, scope: !4005)
!4109 = !DILocation(line: 208, column: 17, scope: !4005)
!4110 = !DILocation(line: 208, column: 14, scope: !4005)
!4111 = !DILocation(line: 209, column: 29, scope: !4112)
!4112 = distinct !DILexicalBlock(scope: !4005, file: !657, line: 208, column: 21)
!4113 = !DILocation(line: 209, column: 42, scope: !4112)
!4114 = !DILocation(line: 209, column: 56, scope: !4112)
!4115 = !DILocation(line: 209, column: 58, scope: !4112)
!4116 = !DILocation(line: 209, column: 65, scope: !4112)
!4117 = !DILocation(line: 209, column: 63, scope: !4112)
!4118 = !DILocation(line: 209, column: 54, scope: !4112)
!4119 = !DILocation(line: 209, column: 78, scope: !4112)
!4120 = !DILocation(line: 209, column: 84, scope: !4112)
!4121 = !DILocation(line: 209, column: 88, scope: !4112)
!4122 = !DILocation(line: 209, column: 86, scope: !4112)
!4123 = !DILocation(line: 209, column: 82, scope: !4112)
!4124 = !DILocation(line: 209, column: 9, scope: !4112)
!4125 = !DILocation(line: 210, column: 10, scope: !4112)
!4126 = distinct !{!4126, !4105, !4127, !146}
!4127 = !DILocation(line: 211, column: 5, scope: !4005)
!4128 = !DILocation(line: 212, column: 1, scope: !4005)
!4129 = distinct !DISubprogram(name: "m_vec_add", scope: !859, file: !859, line: 17, type: !4130, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!4130 = !DISubroutineType(types: !4131)
!4131 = !{null, !85, !660, !51}
!4132 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4129, file: !859, line: 17, type: !85)
!4133 = !DILocation(line: 17, column: 27, scope: !4129)
!4134 = !DILocalVariable(name: "in", arg: 2, scope: !4129, file: !859, line: 17, type: !660)
!4135 = !DILocation(line: 17, column: 56, scope: !4129)
!4136 = !DILocalVariable(name: "acc", arg: 3, scope: !4129, file: !859, line: 17, type: !51)
!4137 = !DILocation(line: 17, column: 70, scope: !4129)
!4138 = !DILocalVariable(name: "i", scope: !4139, file: !859, line: 18, type: !85)
!4139 = distinct !DILexicalBlock(scope: !4129, file: !859, line: 18, column: 5)
!4140 = !DILocation(line: 18, column: 14, scope: !4139)
!4141 = !DILocation(line: 18, column: 10, scope: !4139)
!4142 = !DILocation(line: 18, column: 21, scope: !4143)
!4143 = distinct !DILexicalBlock(scope: !4139, file: !859, line: 18, column: 5)
!4144 = !DILocation(line: 18, column: 25, scope: !4143)
!4145 = !DILocation(line: 18, column: 23, scope: !4143)
!4146 = !DILocation(line: 18, column: 5, scope: !4139)
!4147 = !DILocation(line: 19, column: 19, scope: !4148)
!4148 = distinct !DILexicalBlock(scope: !4143, file: !859, line: 18, column: 43)
!4149 = !DILocation(line: 19, column: 22, scope: !4148)
!4150 = !DILocation(line: 19, column: 9, scope: !4148)
!4151 = !DILocation(line: 19, column: 13, scope: !4148)
!4152 = !DILocation(line: 19, column: 16, scope: !4148)
!4153 = !DILocation(line: 20, column: 5, scope: !4148)
!4154 = !DILocation(line: 18, column: 39, scope: !4143)
!4155 = !DILocation(line: 18, column: 5, scope: !4143)
!4156 = distinct !{!4156, !4146, !4157, !146}
!4157 = !DILocation(line: 20, column: 5, scope: !4139)
!4158 = !DILocation(line: 21, column: 1, scope: !4129)
!4159 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !859, file: !859, line: 49, type: !4160, scopeLine: 49, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!4160 = !DISubroutineType(types: !4161)
!4161 = !{null, !85, !51, !51}
!4162 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4159, file: !859, line: 49, type: !85)
!4163 = !DILocation(line: 49, column: 38, scope: !4159)
!4164 = !DILocalVariable(name: "bins", arg: 2, scope: !4159, file: !859, line: 49, type: !51)
!4165 = !DILocation(line: 49, column: 61, scope: !4159)
!4166 = !DILocalVariable(name: "out", arg: 3, scope: !4159, file: !859, line: 49, type: !51)
!4167 = !DILocation(line: 49, column: 77, scope: !4159)
!4168 = !DILocation(line: 51, column: 26, scope: !4159)
!4169 = !DILocation(line: 51, column: 39, scope: !4159)
!4170 = !DILocation(line: 51, column: 51, scope: !4159)
!4171 = !DILocation(line: 51, column: 49, scope: !4159)
!4172 = !DILocation(line: 51, column: 44, scope: !4159)
!4173 = !DILocation(line: 51, column: 64, scope: !4159)
!4174 = !DILocation(line: 51, column: 77, scope: !4159)
!4175 = !DILocation(line: 51, column: 75, scope: !4159)
!4176 = !DILocation(line: 51, column: 69, scope: !4159)
!4177 = !DILocation(line: 51, column: 5, scope: !4159)
!4178 = !DILocation(line: 52, column: 22, scope: !4159)
!4179 = !DILocation(line: 52, column: 35, scope: !4159)
!4180 = !DILocation(line: 52, column: 47, scope: !4159)
!4181 = !DILocation(line: 52, column: 45, scope: !4159)
!4182 = !DILocation(line: 52, column: 40, scope: !4159)
!4183 = !DILocation(line: 52, column: 60, scope: !4159)
!4184 = !DILocation(line: 52, column: 72, scope: !4159)
!4185 = !DILocation(line: 52, column: 70, scope: !4159)
!4186 = !DILocation(line: 52, column: 65, scope: !4159)
!4187 = !DILocation(line: 52, column: 5, scope: !4159)
!4188 = !DILocation(line: 53, column: 26, scope: !4159)
!4189 = !DILocation(line: 53, column: 39, scope: !4159)
!4190 = !DILocation(line: 53, column: 52, scope: !4159)
!4191 = !DILocation(line: 53, column: 50, scope: !4159)
!4192 = !DILocation(line: 53, column: 44, scope: !4159)
!4193 = !DILocation(line: 53, column: 65, scope: !4159)
!4194 = !DILocation(line: 53, column: 77, scope: !4159)
!4195 = !DILocation(line: 53, column: 75, scope: !4159)
!4196 = !DILocation(line: 53, column: 70, scope: !4159)
!4197 = !DILocation(line: 53, column: 5, scope: !4159)
!4198 = !DILocation(line: 54, column: 22, scope: !4159)
!4199 = !DILocation(line: 54, column: 35, scope: !4159)
!4200 = !DILocation(line: 54, column: 47, scope: !4159)
!4201 = !DILocation(line: 54, column: 45, scope: !4159)
!4202 = !DILocation(line: 54, column: 40, scope: !4159)
!4203 = !DILocation(line: 54, column: 60, scope: !4159)
!4204 = !DILocation(line: 54, column: 72, scope: !4159)
!4205 = !DILocation(line: 54, column: 70, scope: !4159)
!4206 = !DILocation(line: 54, column: 65, scope: !4159)
!4207 = !DILocation(line: 54, column: 5, scope: !4159)
!4208 = !DILocation(line: 55, column: 26, scope: !4159)
!4209 = !DILocation(line: 55, column: 39, scope: !4159)
!4210 = !DILocation(line: 55, column: 51, scope: !4159)
!4211 = !DILocation(line: 55, column: 49, scope: !4159)
!4212 = !DILocation(line: 55, column: 44, scope: !4159)
!4213 = !DILocation(line: 55, column: 64, scope: !4159)
!4214 = !DILocation(line: 55, column: 77, scope: !4159)
!4215 = !DILocation(line: 55, column: 75, scope: !4159)
!4216 = !DILocation(line: 55, column: 69, scope: !4159)
!4217 = !DILocation(line: 55, column: 5, scope: !4159)
!4218 = !DILocation(line: 56, column: 22, scope: !4159)
!4219 = !DILocation(line: 56, column: 35, scope: !4159)
!4220 = !DILocation(line: 56, column: 47, scope: !4159)
!4221 = !DILocation(line: 56, column: 45, scope: !4159)
!4222 = !DILocation(line: 56, column: 40, scope: !4159)
!4223 = !DILocation(line: 56, column: 60, scope: !4159)
!4224 = !DILocation(line: 56, column: 72, scope: !4159)
!4225 = !DILocation(line: 56, column: 70, scope: !4159)
!4226 = !DILocation(line: 56, column: 65, scope: !4159)
!4227 = !DILocation(line: 56, column: 5, scope: !4159)
!4228 = !DILocation(line: 57, column: 26, scope: !4159)
!4229 = !DILocation(line: 57, column: 39, scope: !4159)
!4230 = !DILocation(line: 57, column: 52, scope: !4159)
!4231 = !DILocation(line: 57, column: 50, scope: !4159)
!4232 = !DILocation(line: 57, column: 44, scope: !4159)
!4233 = !DILocation(line: 57, column: 65, scope: !4159)
!4234 = !DILocation(line: 57, column: 78, scope: !4159)
!4235 = !DILocation(line: 57, column: 76, scope: !4159)
!4236 = !DILocation(line: 57, column: 70, scope: !4159)
!4237 = !DILocation(line: 57, column: 5, scope: !4159)
!4238 = !DILocation(line: 58, column: 22, scope: !4159)
!4239 = !DILocation(line: 58, column: 35, scope: !4159)
!4240 = !DILocation(line: 58, column: 47, scope: !4159)
!4241 = !DILocation(line: 58, column: 45, scope: !4159)
!4242 = !DILocation(line: 58, column: 40, scope: !4159)
!4243 = !DILocation(line: 58, column: 60, scope: !4159)
!4244 = !DILocation(line: 58, column: 72, scope: !4159)
!4245 = !DILocation(line: 58, column: 70, scope: !4159)
!4246 = !DILocation(line: 58, column: 65, scope: !4159)
!4247 = !DILocation(line: 58, column: 5, scope: !4159)
!4248 = !DILocation(line: 59, column: 26, scope: !4159)
!4249 = !DILocation(line: 59, column: 39, scope: !4159)
!4250 = !DILocation(line: 59, column: 52, scope: !4159)
!4251 = !DILocation(line: 59, column: 50, scope: !4159)
!4252 = !DILocation(line: 59, column: 44, scope: !4159)
!4253 = !DILocation(line: 59, column: 65, scope: !4159)
!4254 = !DILocation(line: 59, column: 78, scope: !4159)
!4255 = !DILocation(line: 59, column: 76, scope: !4159)
!4256 = !DILocation(line: 59, column: 70, scope: !4159)
!4257 = !DILocation(line: 59, column: 5, scope: !4159)
!4258 = !DILocation(line: 60, column: 22, scope: !4159)
!4259 = !DILocation(line: 60, column: 35, scope: !4159)
!4260 = !DILocation(line: 60, column: 47, scope: !4159)
!4261 = !DILocation(line: 60, column: 45, scope: !4159)
!4262 = !DILocation(line: 60, column: 40, scope: !4159)
!4263 = !DILocation(line: 60, column: 60, scope: !4159)
!4264 = !DILocation(line: 60, column: 72, scope: !4159)
!4265 = !DILocation(line: 60, column: 70, scope: !4159)
!4266 = !DILocation(line: 60, column: 65, scope: !4159)
!4267 = !DILocation(line: 60, column: 5, scope: !4159)
!4268 = !DILocation(line: 61, column: 26, scope: !4159)
!4269 = !DILocation(line: 61, column: 39, scope: !4159)
!4270 = !DILocation(line: 61, column: 52, scope: !4159)
!4271 = !DILocation(line: 61, column: 50, scope: !4159)
!4272 = !DILocation(line: 61, column: 44, scope: !4159)
!4273 = !DILocation(line: 61, column: 65, scope: !4159)
!4274 = !DILocation(line: 61, column: 77, scope: !4159)
!4275 = !DILocation(line: 61, column: 75, scope: !4159)
!4276 = !DILocation(line: 61, column: 70, scope: !4159)
!4277 = !DILocation(line: 61, column: 5, scope: !4159)
!4278 = !DILocation(line: 62, column: 22, scope: !4159)
!4279 = !DILocation(line: 62, column: 35, scope: !4159)
!4280 = !DILocation(line: 62, column: 47, scope: !4159)
!4281 = !DILocation(line: 62, column: 45, scope: !4159)
!4282 = !DILocation(line: 62, column: 40, scope: !4159)
!4283 = !DILocation(line: 62, column: 60, scope: !4159)
!4284 = !DILocation(line: 62, column: 72, scope: !4159)
!4285 = !DILocation(line: 62, column: 70, scope: !4159)
!4286 = !DILocation(line: 62, column: 65, scope: !4159)
!4287 = !DILocation(line: 62, column: 5, scope: !4159)
!4288 = !DILocation(line: 63, column: 26, scope: !4159)
!4289 = !DILocation(line: 63, column: 39, scope: !4159)
!4290 = !DILocation(line: 63, column: 52, scope: !4159)
!4291 = !DILocation(line: 63, column: 50, scope: !4159)
!4292 = !DILocation(line: 63, column: 44, scope: !4159)
!4293 = !DILocation(line: 63, column: 65, scope: !4159)
!4294 = !DILocation(line: 63, column: 77, scope: !4159)
!4295 = !DILocation(line: 63, column: 75, scope: !4159)
!4296 = !DILocation(line: 63, column: 70, scope: !4159)
!4297 = !DILocation(line: 63, column: 5, scope: !4159)
!4298 = !DILocation(line: 64, column: 22, scope: !4159)
!4299 = !DILocation(line: 64, column: 35, scope: !4159)
!4300 = !DILocation(line: 64, column: 47, scope: !4159)
!4301 = !DILocation(line: 64, column: 45, scope: !4159)
!4302 = !DILocation(line: 64, column: 40, scope: !4159)
!4303 = !DILocation(line: 64, column: 60, scope: !4159)
!4304 = !DILocation(line: 64, column: 72, scope: !4159)
!4305 = !DILocation(line: 64, column: 70, scope: !4159)
!4306 = !DILocation(line: 64, column: 65, scope: !4159)
!4307 = !DILocation(line: 64, column: 5, scope: !4159)
!4308 = !DILocation(line: 65, column: 17, scope: !4159)
!4309 = !DILocation(line: 65, column: 30, scope: !4159)
!4310 = !DILocation(line: 65, column: 37, scope: !4159)
!4311 = !DILocation(line: 65, column: 35, scope: !4159)
!4312 = !DILocation(line: 65, column: 50, scope: !4159)
!4313 = !DILocation(line: 65, column: 5, scope: !4159)
!4314 = !DILocation(line: 66, column: 1, scope: !4159)
!4315 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !859, file: !859, line: 40, type: !4130, scopeLine: 40, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!4316 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4315, file: !859, line: 40, type: !85)
!4317 = !DILocation(line: 40, column: 38, scope: !4315)
!4318 = !DILocalVariable(name: "in", arg: 2, scope: !4315, file: !859, line: 40, type: !660)
!4319 = !DILocation(line: 40, column: 67, scope: !4315)
!4320 = !DILocalVariable(name: "acc", arg: 3, scope: !4315, file: !859, line: 40, type: !51)
!4321 = !DILocation(line: 40, column: 81, scope: !4315)
!4322 = !DILocalVariable(name: "mask_lsb", scope: !4315, file: !859, line: 41, type: !52)
!4323 = !DILocation(line: 41, column: 14, scope: !4315)
!4324 = !DILocalVariable(name: "i", scope: !4325, file: !859, line: 42, type: !85)
!4325 = distinct !DILexicalBlock(scope: !4315, file: !859, line: 42, column: 5)
!4326 = !DILocation(line: 42, column: 13, scope: !4325)
!4327 = !DILocation(line: 42, column: 9, scope: !4325)
!4328 = !DILocation(line: 42, column: 18, scope: !4329)
!4329 = distinct !DILexicalBlock(scope: !4325, file: !859, line: 42, column: 5)
!4330 = !DILocation(line: 42, column: 22, scope: !4329)
!4331 = !DILocation(line: 42, column: 20, scope: !4329)
!4332 = !DILocation(line: 42, column: 5, scope: !4325)
!4333 = !DILocalVariable(name: "t", scope: !4334, file: !859, line: 43, type: !52)
!4334 = distinct !DILexicalBlock(scope: !4329, file: !859, line: 42, column: 39)
!4335 = !DILocation(line: 43, column: 18, scope: !4334)
!4336 = !DILocation(line: 43, column: 22, scope: !4334)
!4337 = !DILocation(line: 43, column: 25, scope: !4334)
!4338 = !DILocation(line: 43, column: 30, scope: !4334)
!4339 = !DILocation(line: 43, column: 28, scope: !4334)
!4340 = !DILocation(line: 44, column: 21, scope: !4334)
!4341 = !DILocation(line: 44, column: 24, scope: !4334)
!4342 = !DILocation(line: 44, column: 29, scope: !4334)
!4343 = !DILocation(line: 44, column: 27, scope: !4334)
!4344 = !DILocation(line: 44, column: 32, scope: !4334)
!4345 = !DILocation(line: 44, column: 41, scope: !4334)
!4346 = !DILocation(line: 44, column: 43, scope: !4334)
!4347 = !DILocation(line: 44, column: 38, scope: !4334)
!4348 = !DILocation(line: 44, column: 9, scope: !4334)
!4349 = !DILocation(line: 44, column: 13, scope: !4334)
!4350 = !DILocation(line: 44, column: 16, scope: !4334)
!4351 = !DILocation(line: 45, column: 5, scope: !4334)
!4352 = !DILocation(line: 42, column: 36, scope: !4329)
!4353 = !DILocation(line: 42, column: 5, scope: !4329)
!4354 = distinct !{!4354, !4332, !4355, !146}
!4355 = !DILocation(line: 45, column: 5, scope: !4325)
!4356 = !DILocation(line: 46, column: 1, scope: !4315)
!4357 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !859, file: !859, line: 31, type: !4130, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!4358 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4357, file: !859, line: 31, type: !85)
!4359 = !DILocation(line: 31, column: 34, scope: !4357)
!4360 = !DILocalVariable(name: "in", arg: 2, scope: !4357, file: !859, line: 31, type: !660)
!4361 = !DILocation(line: 31, column: 63, scope: !4357)
!4362 = !DILocalVariable(name: "acc", arg: 3, scope: !4357, file: !859, line: 31, type: !51)
!4363 = !DILocation(line: 31, column: 77, scope: !4357)
!4364 = !DILocalVariable(name: "mask_msb", scope: !4357, file: !859, line: 32, type: !52)
!4365 = !DILocation(line: 32, column: 14, scope: !4357)
!4366 = !DILocalVariable(name: "i", scope: !4367, file: !859, line: 33, type: !85)
!4367 = distinct !DILexicalBlock(scope: !4357, file: !859, line: 33, column: 5)
!4368 = !DILocation(line: 33, column: 13, scope: !4367)
!4369 = !DILocation(line: 33, column: 9, scope: !4367)
!4370 = !DILocation(line: 33, column: 18, scope: !4371)
!4371 = distinct !DILexicalBlock(scope: !4367, file: !859, line: 33, column: 5)
!4372 = !DILocation(line: 33, column: 22, scope: !4371)
!4373 = !DILocation(line: 33, column: 20, scope: !4371)
!4374 = !DILocation(line: 33, column: 5, scope: !4367)
!4375 = !DILocalVariable(name: "t", scope: !4376, file: !859, line: 34, type: !52)
!4376 = distinct !DILexicalBlock(scope: !4371, file: !859, line: 33, column: 39)
!4377 = !DILocation(line: 34, column: 18, scope: !4376)
!4378 = !DILocation(line: 34, column: 22, scope: !4376)
!4379 = !DILocation(line: 34, column: 25, scope: !4376)
!4380 = !DILocation(line: 34, column: 30, scope: !4376)
!4381 = !DILocation(line: 34, column: 28, scope: !4376)
!4382 = !DILocation(line: 35, column: 21, scope: !4376)
!4383 = !DILocation(line: 35, column: 24, scope: !4376)
!4384 = !DILocation(line: 35, column: 29, scope: !4376)
!4385 = !DILocation(line: 35, column: 27, scope: !4376)
!4386 = !DILocation(line: 35, column: 32, scope: !4376)
!4387 = !DILocation(line: 35, column: 42, scope: !4376)
!4388 = !DILocation(line: 35, column: 44, scope: !4376)
!4389 = !DILocation(line: 35, column: 50, scope: !4376)
!4390 = !DILocation(line: 35, column: 38, scope: !4376)
!4391 = !DILocation(line: 35, column: 9, scope: !4376)
!4392 = !DILocation(line: 35, column: 13, scope: !4376)
!4393 = !DILocation(line: 35, column: 16, scope: !4376)
!4394 = !DILocation(line: 36, column: 5, scope: !4376)
!4395 = !DILocation(line: 33, column: 36, scope: !4371)
!4396 = !DILocation(line: 33, column: 5, scope: !4371)
!4397 = distinct !{!4397, !4374, !4398, !146}
!4398 = !DILocation(line: 36, column: 5, scope: !4367)
!4399 = !DILocation(line: 37, column: 1, scope: !4357)
!4400 = distinct !DISubprogram(name: "m_vec_copy", scope: !859, file: !859, line: 10, type: !4130, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !47, retainedNodes: !66)
!4401 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !4400, file: !859, line: 10, type: !85)
!4402 = !DILocation(line: 10, column: 28, scope: !4400)
!4403 = !DILocalVariable(name: "in", arg: 2, scope: !4400, file: !859, line: 10, type: !660)
!4404 = !DILocation(line: 10, column: 57, scope: !4400)
!4405 = !DILocalVariable(name: "out", arg: 3, scope: !4400, file: !859, line: 10, type: !51)
!4406 = !DILocation(line: 10, column: 71, scope: !4400)
!4407 = !DILocalVariable(name: "i", scope: !4408, file: !859, line: 11, type: !85)
!4408 = distinct !DILexicalBlock(scope: !4400, file: !859, line: 11, column: 5)
!4409 = !DILocation(line: 11, column: 14, scope: !4408)
!4410 = !DILocation(line: 11, column: 10, scope: !4408)
!4411 = !DILocation(line: 11, column: 21, scope: !4412)
!4412 = distinct !DILexicalBlock(scope: !4408, file: !859, line: 11, column: 5)
!4413 = !DILocation(line: 11, column: 25, scope: !4412)
!4414 = !DILocation(line: 11, column: 23, scope: !4412)
!4415 = !DILocation(line: 11, column: 5, scope: !4408)
!4416 = !DILocation(line: 12, column: 18, scope: !4417)
!4417 = distinct !DILexicalBlock(scope: !4412, file: !859, line: 11, column: 43)
!4418 = !DILocation(line: 12, column: 21, scope: !4417)
!4419 = !DILocation(line: 12, column: 9, scope: !4417)
!4420 = !DILocation(line: 12, column: 13, scope: !4417)
!4421 = !DILocation(line: 12, column: 16, scope: !4417)
!4422 = !DILocation(line: 13, column: 5, scope: !4417)
!4423 = !DILocation(line: 11, column: 39, scope: !4412)
!4424 = !DILocation(line: 11, column: 5, scope: !4412)
!4425 = distinct !{!4425, !4415, !4426, !146}
!4426 = !DILocation(line: 13, column: 5, scope: !4408)
!4427 = !DILocation(line: 14, column: 1, scope: !4400)
