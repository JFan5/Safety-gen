(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_04 obj_06 obj_14 obj_03 - type_3
obj_13 obj_10 obj_02 obj_12 - type_2
obj_11 obj_01 obj_08 obj_09 - object)
(:init
(pred_4 obj_05 obj_02)
(pred_2 obj_05 obj_04)
(pred_2 obj_05 obj_06)
(pred_4 obj_07 obj_13)
(pred_2 obj_07 obj_14)
(pred_2 obj_07 obj_03)
(pred_3 obj_11 obj_13)
(pred_3 obj_01 obj_12)
(pred_3 obj_08 obj_10)
(pred_3 obj_09 obj_12)
)
(:goal
(and
(pred_3 obj_11 obj_13)
(pred_3 obj_01 obj_02)
(pred_3 obj_08 obj_13)
(pred_3 obj_09 obj_12)
)
)

(:constraints
  (always (not (pred_4 obj_05 obj_12)))
)
)