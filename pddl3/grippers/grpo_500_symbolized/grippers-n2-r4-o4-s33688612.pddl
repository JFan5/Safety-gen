(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_1
obj_07 obj_01 obj_08 obj_10 - type_3
obj_14 obj_05 obj_02 obj_12 - type_2
obj_09 obj_06 obj_11 obj_13 - object)
(:init
(pred_3 obj_03 obj_02)
(pred_4 obj_03 obj_07)
(pred_4 obj_03 obj_01)
(pred_3 obj_04 obj_02)
(pred_4 obj_04 obj_08)
(pred_4 obj_04 obj_10)
(pred_2 obj_09 obj_02)
(pred_2 obj_06 obj_12)
(pred_2 obj_11 obj_12)
(pred_2 obj_13 obj_05)
)
(:goal
(and
(pred_2 obj_09 obj_14)
(pred_2 obj_06 obj_12)
(pred_2 obj_11 obj_14)
(pred_2 obj_13 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_12)))
)
)