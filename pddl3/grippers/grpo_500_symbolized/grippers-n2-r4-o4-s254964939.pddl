(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_10 - type_1
obj_03 obj_01 obj_05 obj_07 - type_3
obj_06 obj_09 obj_12 obj_14 - type_2
obj_11 obj_08 obj_02 obj_04 - object)
(:init
(pred_3 obj_13 obj_14)
(pred_4 obj_13 obj_03)
(pred_4 obj_13 obj_01)
(pred_3 obj_10 obj_14)
(pred_4 obj_10 obj_05)
(pred_4 obj_10 obj_07)
(pred_2 obj_11 obj_09)
(pred_2 obj_08 obj_12)
(pred_2 obj_02 obj_09)
(pred_2 obj_04 obj_06)
)
(:goal
(and
(pred_2 obj_11 obj_06)
(pred_2 obj_08 obj_09)
(pred_2 obj_02 obj_12)
(pred_2 obj_04 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_12)))
)
)