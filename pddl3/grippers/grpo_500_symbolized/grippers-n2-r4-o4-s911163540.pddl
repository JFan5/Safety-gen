(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_13 - type_1
obj_14 obj_12 obj_04 obj_03 - type_3
obj_09 obj_11 obj_05 obj_06 - type_2
obj_02 obj_01 obj_10 obj_07 - object)
(:init
(pred_3 obj_08 obj_05)
(pred_4 obj_08 obj_14)
(pred_4 obj_08 obj_12)
(pred_3 obj_13 obj_11)
(pred_4 obj_13 obj_04)
(pred_4 obj_13 obj_03)
(pred_2 obj_02 obj_09)
(pred_2 obj_01 obj_06)
(pred_2 obj_10 obj_09)
(pred_2 obj_07 obj_09)
)
(:goal
(and
(pred_2 obj_02 obj_06)
(pred_2 obj_01 obj_05)
(pred_2 obj_10 obj_09)
(pred_2 obj_07 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_08 obj_06)))
)
)