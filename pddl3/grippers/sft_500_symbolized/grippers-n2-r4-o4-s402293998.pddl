(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_10 - type_1
obj_01 obj_14 obj_13 obj_06 - type_3
obj_05 obj_09 obj_12 obj_02 - type_2
obj_03 obj_08 obj_04 obj_07 - object)
(:init
(pred_3 obj_11 obj_09)
(pred_2 obj_11 obj_01)
(pred_2 obj_11 obj_14)
(pred_3 obj_10 obj_02)
(pred_2 obj_10 obj_13)
(pred_2 obj_10 obj_06)
(pred_4 obj_03 obj_02)
(pred_4 obj_08 obj_02)
(pred_4 obj_04 obj_02)
(pred_4 obj_07 obj_12)
)
(:goal
(and
(pred_4 obj_03 obj_12)
(pred_4 obj_08 obj_12)
(pred_4 obj_04 obj_12)
(pred_4 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_12)))
)
)