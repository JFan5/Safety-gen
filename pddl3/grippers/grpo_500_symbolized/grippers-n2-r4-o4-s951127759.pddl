(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_12 - type_1
obj_07 obj_14 obj_11 obj_03 - type_3
obj_01 obj_02 obj_08 obj_09 - type_2
obj_05 obj_06 obj_04 obj_10 - object)
(:init
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_07)
(pred_4 obj_13 obj_14)
(pred_3 obj_12 obj_09)
(pred_4 obj_12 obj_11)
(pred_4 obj_12 obj_03)
(pred_2 obj_05 obj_08)
(pred_2 obj_06 obj_02)
(pred_2 obj_04 obj_02)
(pred_2 obj_10 obj_02)
)
(:goal
(and
(pred_2 obj_05 obj_02)
(pred_2 obj_06 obj_08)
(pred_2 obj_04 obj_02)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_08)))
)
)