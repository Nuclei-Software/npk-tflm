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


PLATFORM_FLAGS = \
  -fno-common \
  -mexplicit-relocs \
  -fno-builtin-printf \
  -fno-exceptions \
  -DNMSIS_NN \
  -DTF_LITE_USE_GLOBAL_MIN \
  -DTF_LITE_USE_GLOBAL_MAX \
  -DTF_LITE_MCU_DEBUG_LOG \
  -DTF_LITE_USE_GLOBAL_CMATH_FUNCTIONS \
  -D_DEFAULT_SOURCE \
  -fno-unwind-tables \
  -funsigned-char \
  -Wvla \
  -Wall \
  -Wextra \
  -Wsign-compare \
  -Wdouble-promotion \
  -Wshadow \
  -Wunused-variable \
  -Wmissing-field-initializers \
  -Wno-unused-parameter \
  -Wno-write-strings \
  -Wunused-function \
  -Wno-unused-function \
  -fno-delete-null-pointer-checks \
  -fomit-frame-pointer

CXXFLAGS += $(PLATFORM_FLAGS) \
  -fno-threadsafe-statics \
  -fno-use-cxa-atexit \
  -fpermissive \
  -fno-rtti \
  --std=gnu++11

CFLAGS += $(PLATFORM_FLAGS)

LDFLAGS += \
  -lstdc++ \
  -lm