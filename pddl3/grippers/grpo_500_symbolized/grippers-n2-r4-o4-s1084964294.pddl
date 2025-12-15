(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_06 - type_1
obj_07 obj_10 obj_04 obj_13 - type_3
obj_08 obj_11 obj_02 obj_12 - type_2
obj_01 obj_05 obj_03 obj_14 - object)
(:init
(pred_3 obj_09 obj_02)
(pred_4 obj_09 obj_07)
(pred_4 obj_09 obj_10)
(pred_3 obj_06 obj_11)
(pred_4 obj_06 obj_04)
(pred_4 obj_06 obj_13)
(pred_2 obj_01 obj_02)
(pred_2 obj_05 obj_12)
(pred_2 obj_03 obj_12)
(pred_2 obj_14 obj_08)
)
(:goal
(and
(pred_2 obj_01 obj_02)
(pred_2 obj_05 obj_11)
(pred_2 obj_03 obj_02)
(pred_2 obj_14 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_12)))
)
)