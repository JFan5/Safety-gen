(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_11 - type_1
obj_08 obj_05 obj_10 obj_14 - type_3
obj_04 obj_03 obj_06 obj_12 - type_2
obj_07 obj_02 obj_01 obj_13 - object)
(:init
(pred_3 obj_09 obj_12)
(pred_4 obj_09 obj_08)
(pred_4 obj_09 obj_05)
(pred_3 obj_11 obj_03)
(pred_4 obj_11 obj_10)
(pred_4 obj_11 obj_14)
(pred_2 obj_07 obj_12)
(pred_2 obj_02 obj_12)
(pred_2 obj_01 obj_06)
(pred_2 obj_13 obj_06)
)
(:goal
(and
(pred_2 obj_07 obj_06)
(pred_2 obj_02 obj_04)
(pred_2 obj_01 obj_06)
(pred_2 obj_13 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_06)))
)
)