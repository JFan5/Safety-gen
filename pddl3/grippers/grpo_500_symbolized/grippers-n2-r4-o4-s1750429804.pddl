(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_08 - type_1
obj_05 obj_11 obj_04 obj_02 - type_3
obj_03 obj_13 obj_12 obj_06 - type_2
obj_14 obj_07 obj_09 obj_10 - object)
(:init
(pred_3 obj_01 obj_12)
(pred_4 obj_01 obj_05)
(pred_4 obj_01 obj_11)
(pred_3 obj_08 obj_12)
(pred_4 obj_08 obj_04)
(pred_4 obj_08 obj_02)
(pred_2 obj_14 obj_03)
(pred_2 obj_07 obj_13)
(pred_2 obj_09 obj_06)
(pred_2 obj_10 obj_06)
)
(:goal
(and
(pred_2 obj_14 obj_13)
(pred_2 obj_07 obj_13)
(pred_2 obj_09 obj_13)
(pred_2 obj_10 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_06)))
)
)