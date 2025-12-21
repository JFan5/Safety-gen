(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_13 - type_1
obj_06 obj_14 obj_05 obj_09 - type_3
obj_07 obj_02 obj_12 obj_11 - type_2
obj_03 obj_10 obj_01 obj_04 - object)
(:init
(pred_4 obj_08 obj_07)
(pred_2 obj_08 obj_06)
(pred_2 obj_08 obj_14)
(pred_4 obj_13 obj_12)
(pred_2 obj_13 obj_05)
(pred_2 obj_13 obj_09)
(pred_3 obj_03 obj_07)
(pred_3 obj_10 obj_11)
(pred_3 obj_01 obj_07)
(pred_3 obj_04 obj_02)
)
(:goal
(and
(pred_3 obj_03 obj_12)
(pred_3 obj_10 obj_11)
(pred_3 obj_01 obj_11)
(pred_3 obj_04 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_12)))
)
)