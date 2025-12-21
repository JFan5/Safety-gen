(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_03 - type_1
obj_14 obj_05 obj_09 obj_08 - type_3
obj_13 obj_11 obj_02 obj_07 - type_2
obj_01 obj_06 obj_04 obj_12 - object)
(:init
(pred_4 obj_10 obj_07)
(pred_2 obj_10 obj_14)
(pred_2 obj_10 obj_05)
(pred_4 obj_03 obj_13)
(pred_2 obj_03 obj_09)
(pred_2 obj_03 obj_08)
(pred_3 obj_01 obj_07)
(pred_3 obj_06 obj_02)
(pred_3 obj_04 obj_07)
(pred_3 obj_12 obj_13)
)
(:goal
(and
(pred_3 obj_01 obj_02)
(pred_3 obj_06 obj_07)
(pred_3 obj_04 obj_13)
(pred_3 obj_12 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_02)))
)
)