; ModuleID = 'add4.ll'
source_filename = "add4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@arr1 = local_unnamed_addr global [4 x i32] zeroinitializer
@arr2 = local_unnamed_addr global [4 x i32] zeroinitializer

; Function Attrs: mustprogress nofree nosync nounwind willreturn
define dso_local void @add4_bench() local_unnamed_addr #0 {
  tail call void @llvm.experimental.noalias.scope.decl(metadata !5)
  %1 = load i32, ptr @arr1, align 4, !tbaa !8, !alias.scope !5
  %2 = icmp slt i32 %1, 0
  %3 = load i32, ptr @arr2, align 4, !tbaa !8, !noalias !5
  br i1 %2, label %4, label %15

4:                                                ; preds = %0
  %5 = add nsw i32 %3, %1
  %6 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr2, i64 0, i64 1), align 4, !tbaa !8, !noalias !5
  %7 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 1), align 4, !tbaa !8, !alias.scope !5
  %8 = add nsw i32 %7, %6
  %9 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr2, i64 0, i64 2), align 4, !tbaa !8, !noalias !5
  %10 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 2), align 4, !tbaa !8, !alias.scope !5
  %11 = add nsw i32 %10, %9
  %12 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr2, i64 0, i64 3), align 4, !tbaa !8, !noalias !5
  %13 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 3), align 4, !tbaa !8, !alias.scope !5
  %14 = add nsw i32 %13, %12
  br label %add4.exit

15:                                               ; preds = %0
  %16 = sub nsw i32 %1, %3
  %17 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr2, i64 0, i64 1), align 4, !tbaa !8, !noalias !5
  %18 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 1), align 4, !tbaa !8, !alias.scope !5
  %19 = sub nsw i32 %18, %17
  %20 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr2, i64 0, i64 2), align 4, !tbaa !8, !noalias !5
  %21 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 2), align 4, !tbaa !8, !alias.scope !5
  %22 = sub nsw i32 %21, %20
  %23 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr2, i64 0, i64 3), align 4, !tbaa !8, !noalias !5
  %24 = load i32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 3), align 4, !tbaa !8, !alias.scope !5
  %25 = sub nsw i32 %24, %23
  br label %add4.exit

add4.exit:                                        ; preds = %4, %15
  %26 = phi i32 [ %23, %15 ], [ %12, %4 ]
  %27 = phi i32 [ %22, %15 ], [ %11, %4 ]
  %28 = phi i32 [ %20, %15 ], [ %9, %4 ]
  %29 = phi i32 [ %19, %15 ], [ %8, %4 ]
  %30 = phi i32 [ %17, %15 ], [ %6, %4 ]
  %31 = phi i32 [ %16, %15 ], [ %5, %4 ]
  %32 = phi i32 [ %25, %15 ], [ %14, %4 ]
  store i32 %32, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 3), align 4, !tbaa !8, !alias.scope !5
  %33 = icmp slt i32 %31, 0
  br i1 %33, label %34, label %39

34:                                               ; preds = %add4.exit
  %35 = add nsw i32 %31, %3
  %36 = add nsw i32 %29, %30
  %37 = add nsw i32 %27, %28
  %38 = add nsw i32 %32, %26
  br label %add4.exit1

39:                                               ; preds = %add4.exit
  %40 = sub nsw i32 %31, %3
  %41 = sub nsw i32 %29, %30
  %42 = sub nsw i32 %27, %28
  %43 = sub nsw i32 %32, %26
  br label %add4.exit1

add4.exit1:                                       ; preds = %34, %39
  %44 = phi i32 [ %42, %39 ], [ %37, %34 ]
  %45 = phi i32 [ %41, %39 ], [ %36, %34 ]
  %46 = phi i32 [ %40, %39 ], [ %35, %34 ]
  %47 = phi i32 [ %43, %39 ], [ %38, %34 ]
  %48 = icmp slt i32 %46, 0
  br i1 %48, label %49, label %54

49:                                               ; preds = %add4.exit1
  %50 = add nsw i32 %46, %3
  %51 = add nsw i32 %45, %30
  %52 = add nsw i32 %44, %28
  %53 = add nsw i32 %47, %26
  br label %add4.exit2

54:                                               ; preds = %add4.exit1
  %55 = sub nsw i32 %46, %3
  %56 = sub nsw i32 %45, %30
  %57 = sub nsw i32 %44, %28
  %58 = sub nsw i32 %47, %26
  br label %add4.exit2

add4.exit2:                                       ; preds = %49, %54
  %59 = phi i32 [ %57, %54 ], [ %52, %49 ]
  %60 = phi i32 [ %56, %54 ], [ %51, %49 ]
  %61 = phi i32 [ %55, %54 ], [ %50, %49 ]
  %62 = phi i32 [ %58, %54 ], [ %53, %49 ]
  %63 = icmp slt i32 %61, 0
  br i1 %63, label %64, label %69

64:                                               ; preds = %add4.exit2
  %65 = add nsw i32 %61, %3
  store i32 %65, ptr @arr1, align 4, !tbaa !8, !alias.scope !12
  %66 = add nsw i32 %60, %30
  store i32 %66, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 1), align 4, !tbaa !8, !alias.scope !12
  %67 = add nsw i32 %59, %28
  store i32 %67, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 2), align 4, !tbaa !8, !alias.scope !12
  %68 = add nsw i32 %62, %26
  br label %add4.exit3

69:                                               ; preds = %add4.exit2
  %70 = sub nsw i32 %61, %3
  store i32 %70, ptr @arr1, align 4, !tbaa !8, !alias.scope !12
  %71 = sub nsw i32 %60, %30
  store i32 %71, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 1), align 4, !tbaa !8, !alias.scope !12
  %72 = sub nsw i32 %59, %28
  store i32 %72, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 2), align 4, !tbaa !8, !alias.scope !12
  %73 = sub nsw i32 %62, %26
  br label %add4.exit3

add4.exit3:                                       ; preds = %64, %69
  %storemerge6 = phi i32 [ %73, %69 ], [ %68, %64 ]
  store i32 %storemerge6, ptr getelementptr inbounds ([4 x i32], ptr @arr1, i64 0, i64 3), align 4, !tbaa !8, !alias.scope !12
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local void @add4(ptr noalias nocapture noundef %0, ptr nocapture noundef readonly %1) local_unnamed_addr #1 {
  %3 = load i32, ptr %0, align 4, !tbaa !8
  %4 = icmp slt i32 %3, 0
  %5 = load i32, ptr %1, align 4, !tbaa !8
  br i1 %4, label %6, label %23

6:                                                ; preds = %2
  %7 = add nsw i32 %5, %3
  store i32 %7, ptr %0, align 4, !tbaa !8
  %8 = getelementptr inbounds i32, ptr %1, i64 1
  %9 = load i32, ptr %8, align 4, !tbaa !8
  %10 = getelementptr inbounds i32, ptr %0, i64 1
  %11 = load i32, ptr %10, align 4, !tbaa !8
  %12 = add nsw i32 %11, %9
  store i32 %12, ptr %10, align 4, !tbaa !8
  %13 = getelementptr inbounds i32, ptr %1, i64 2
  %14 = load i32, ptr %13, align 4, !tbaa !8
  %15 = getelementptr inbounds i32, ptr %0, i64 2
  %16 = load i32, ptr %15, align 4, !tbaa !8
  %17 = add nsw i32 %16, %14
  store i32 %17, ptr %15, align 4, !tbaa !8
  %18 = getelementptr inbounds i32, ptr %1, i64 3
  %19 = load i32, ptr %18, align 4, !tbaa !8
  %20 = getelementptr inbounds i32, ptr %0, i64 3
  %21 = load i32, ptr %20, align 4, !tbaa !8
  %22 = add nsw i32 %21, %19
  store i32 %22, ptr %20, align 4, !tbaa !8
  br label %40

23:                                               ; preds = %2
  %24 = sub nsw i32 %3, %5
  store i32 %24, ptr %0, align 4, !tbaa !8
  %25 = getelementptr inbounds i32, ptr %1, i64 1
  %26 = load i32, ptr %25, align 4, !tbaa !8
  %27 = getelementptr inbounds i32, ptr %0, i64 1
  %28 = load i32, ptr %27, align 4, !tbaa !8
  %29 = sub nsw i32 %28, %26
  store i32 %29, ptr %27, align 4, !tbaa !8
  %30 = getelementptr inbounds i32, ptr %1, i64 2
  %31 = load i32, ptr %30, align 4, !tbaa !8
  %32 = getelementptr inbounds i32, ptr %0, i64 2
  %33 = load i32, ptr %32, align 4, !tbaa !8
  %34 = sub nsw i32 %33, %31
  store i32 %34, ptr %32, align 4, !tbaa !8
  %35 = getelementptr inbounds i32, ptr %1, i64 3
  %36 = load i32, ptr %35, align 4, !tbaa !8
  %37 = getelementptr inbounds i32, ptr %0, i64 3
  %38 = load i32, ptr %37, align 4, !tbaa !8
  %39 = sub nsw i32 %38, %36
  store i32 %39, ptr %37, align 4, !tbaa !8
  br label %40

40:                                               ; preds = %23, %6
  ret void
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #2

attributes #0 = { mustprogress nofree nosync nounwind willreturn }
attributes #1 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6}
!6 = distinct !{!6, !7, !"add4: argument 0"}
!7 = distinct !{!7, !"add4"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!13}
!13 = distinct !{!13, !14, !"add4: argument 0"}
!14 = distinct !{!14, !"add4"}
