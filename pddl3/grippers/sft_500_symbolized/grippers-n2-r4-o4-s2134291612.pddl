(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_13 - type_1
obj_07 obj_06 obj_10 obj_14 - type_3
obj_01 obj_02 obj_12 obj_04 - type_2
obj_08 obj_05 obj_03 obj_09 - object)
(:init
(pred_4 obj_11 obj_02)
(pred_1 obj_11 obj_07)
(pred_1 obj_11 obj_06)
(pred_4 obj_13 obj_01)
(pred_1 obj_13 obj_10)
(pred_1 obj_13 obj_14)
(pred_2 obj_08 obj_02)
(pred_2 obj_05 obj_12)
(pred_2 obj_03 obj_02)
(pred_2 obj_09 obj_02)
)
(:goal
(and
(pred_2 obj_08 obj_12)
(pred_2 obj_05 obj_12)
(pred_2 obj_03 obj_01)
(pred_2 obj_09 obj_02)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_12)))
)
)