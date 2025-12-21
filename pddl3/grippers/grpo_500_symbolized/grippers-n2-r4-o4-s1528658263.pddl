(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_1
obj_03 obj_02 obj_06 obj_07 - type_3
obj_09 obj_14 obj_12 obj_08 - type_2
obj_04 obj_05 obj_13 obj_01 - object)
(:init
(pred_4 obj_10 obj_14)
(pred_2 obj_10 obj_03)
(pred_2 obj_10 obj_02)
(pred_4 obj_11 obj_09)
(pred_2 obj_11 obj_06)
(pred_2 obj_11 obj_07)
(pred_3 obj_04 obj_14)
(pred_3 obj_05 obj_09)
(pred_3 obj_13 obj_12)
(pred_3 obj_01 obj_14)
)
(:goal
(and
(pred_3 obj_04 obj_12)
(pred_3 obj_05 obj_09)
(pred_3 obj_13 obj_08)
(pred_3 obj_01 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_12)))
)
)