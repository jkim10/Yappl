; ModuleID = 'MicroC'
source_filename = "MicroC"

@a = global i32 0
@b = global i32 0
@fmt = private unnamed_addr constant [4 x i8] c"%d\0A\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00"

declare i32 @printf(i8*, ...)

define i32 @gcd(i32 %a, i32 %b) {
entry:
  %a1 = alloca i32
  store i32 %a, i32* %a1
  %b2 = alloca i32
  store i32 %b, i32* %b2
  br label %while

while:                                            ; preds = %if_end, %entry
  %a3 = load i32, i32* %a1
  %b4 = load i32, i32* %b2
  %tmp = icmp ne i32 %a3, %b4
  br i1 %tmp, label %while_body, label %while_end

while_body:                                       ; preds = %while
  %b5 = load i32, i32* %b2
  %a6 = load i32, i32* %a1
  %tmp7 = icmp slt i32 %b5, %a6
  br i1 %tmp7, label %then, label %else

then:                                             ; preds = %while_body
  %a8 = load i32, i32* %a1
  %b9 = load i32, i32* %b2
  %tmp10 = sub i32 %a8, %b9
  store i32 %tmp10, i32* %a1
  br label %if_end

else:                                             ; preds = %while_body
  %b11 = load i32, i32* %b2
  %a12 = load i32, i32* %a1
  %tmp13 = sub i32 %b11, %a12
  store i32 %tmp13, i32* %b2
  br label %if_end

if_end:                                           ; preds = %else, %then
  br label %while

while_end:                                        ; preds = %while
  %a14 = load i32, i32* %a1
  ret i32 %a14
}

define i32 @main() {
entry:
  %x = alloca i32
  %y = alloca i32
  store i32 18, i32* @a
  store i32 9, i32* @b
  store i32 14, i32* %x
  store i32 3, i32* %y
  %x1 = load i32, i32* %x
  %y2 = load i32, i32* %y
  %tmp = urem i32 %x1, %y2
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i32 %tmp)
  %gcd_result = call i32 @gcd(i32 3, i32 15)
  %printf3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i32 %gcd_result)
  %gcd_result4 = call i32 @gcd(i32 99, i32 121)
  %printf5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i32 %gcd_result4)
  %b = load i32, i32* @b
  %a = load i32, i32* @a
  %gcd_result6 = call i32 @gcd(i32 %a, i32 %b)
  %printf7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i32 %gcd_result6)
  ret i32 0
}
