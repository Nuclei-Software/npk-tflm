MIDDLEWARE_TFLM := $(NUCLEI_SDK_MIDDLEWARE)/tflm

TFLM_THIRD_PARTY := $(MIDDLEWARE_TFLM)/third_party


INCDIRS += $(MIDDLEWARE_TFLM) \
  $(TFLM_THIRD_PARTY)/gemmlowp \
  $(TFLM_THIRD_PARTY)/flatbuffers/include \
  $(TFLM_THIRD_PARTY)/ruy \
  $(TFLM_THIRD_PARTY)/kissfft \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro


CXX_SRCDIRS += $(MIDDLEWARE_TFLM)/tensorflow/lite/core/api \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/core/c \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/experimental/microfrontend/lib \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/schema \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/kernels \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/kernels/internal \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/kernels/internal/reference \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro/models \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro/arena_allocator \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro/tflite_bridge \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro/kernels \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro/kernels/nmsis_nn \
  $(MIDDLEWARE_TFLM)/tensorflow/lite/micro/memory_planner

C_SRCDIRS += $(MIDDLEWARE_TFLM)/tensorflow/lite/experimental/microfrontend/lib \
  $(TFLM_THIRD_PARTY)/kissfft \
  $(wildcard $(TFLM_THIRD_PARTY)/kissfft/*/)

ADDITIONAL_DEFINES := \
  -DNMSIS_NN \
  -DTF_LITE_USE_GLOBAL_MIN \
  -DTF_LITE_USE_GLOBAL_MAX \
  -DTF_LITE_MCU_DEBUG_LOG \
  -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS \
  -D_DEFAULT_SOURCE

CC_WARNINGS := \
  -Wsign-compare \
  -Wdouble-promotion \
  -Wshadow \
  -Wunused-variable \
  -Wunused-function \
  -Wswitch \
  -Wvla \
  -Wall \
  -Wextra \
  -Wmissing-field-initializers \
  -Wstrict-aliasing \
  -Wno-unused-parameter

TFLM_COMMON_FLAGS = \
  -mexplicit-relocs \
  -fno-builtin-printf \
  -fno-exceptions \
  -fno-unwind-tables \
  -funsigned-char \
  -Wno-write-strings \
  -fno-delete-null-pointer-checks \
  -fomit-frame-pointer \
  $(ADDITIONAL_DEFINES) \
  $(CC_WARNINGS)

CXXFLAGS += $(TFLM_COMMON_FLAGS) \
  -std=gnu++11 \
  -fno-rtti \
  -fno-threadsafe-statics \
  -fno-use-cxa-atexit \
  -fpermissive

CFLAGS += $(TFLM_COMMON_FLAGS)

LDFLAGS += \
  -lstdc++ \
  -lm
