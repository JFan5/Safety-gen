(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_05 - type_1
obj_14 obj_06 obj_01 obj_07 - type_3
obj_08 obj_02 obj_12 obj_13 - type_2
obj_10 obj_11 obj_03 obj_04 - object)
(:init
(pred_3 obj_09 obj_02)
(pred_4 obj_09 obj_14)
(pred_4 obj_09 obj_06)
(pred_3 obj_05 obj_12)
(pred_4 obj_05 obj_01)
(pred_4 obj_05 obj_07)
(pred_2 obj_10 obj_13)
(pred_2 obj_11 obj_12)
(pred_2 obj_03 obj_08)
(pred_2 obj_04 obj_02)
)
(:goal
(and
(pred_2 obj_10 obj_13)
(pred_2 obj_11 obj_12)
(pred_2 obj_03 obj_02)
(pred_2 obj_04 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_12)))
)
)