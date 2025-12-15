(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_08 obj_09 obj_12 obj_14 - type_2
obj_04 obj_10 obj_13 obj_02 - type_3
obj_05 obj_07 obj_03 obj_01 - object)
(:init
(pred_4 obj_11 obj_13)
(pred_3 obj_11 obj_08)
(pred_3 obj_11 obj_09)
(pred_4 obj_06 obj_10)
(pred_3 obj_06 obj_12)
(pred_3 obj_06 obj_14)
(pred_2 obj_05 obj_10)
(pred_2 obj_07 obj_10)
(pred_2 obj_03 obj_04)
(pred_2 obj_01 obj_02)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_07 obj_13)
(pred_2 obj_03 obj_02)
(pred_2 obj_01 obj_10)
)
)

(:constraints
  (always (not (pred_4 obj_11 obj_02)))
)
)