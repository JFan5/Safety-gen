(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_04 - type_2
obj_07 obj_08 obj_05 obj_14 - type_3
obj_09 obj_13 obj_02 obj_10 - type_1
obj_06 obj_11 obj_01 obj_12 - object)
(:init
(pred_3 obj_03 obj_13)
(pred_2 obj_03 obj_07)
(pred_2 obj_03 obj_08)
(pred_3 obj_04 obj_13)
(pred_2 obj_04 obj_05)
(pred_2 obj_04 obj_14)
(pred_1 obj_06 obj_13)
(pred_1 obj_11 obj_02)
(pred_1 obj_01 obj_10)
(pred_1 obj_12 obj_09)
)
(:goal
(and
(pred_1 obj_06 obj_13)
(pred_1 obj_11 obj_02)
(pred_1 obj_01 obj_02)
(pred_1 obj_12 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_02)))
)
)