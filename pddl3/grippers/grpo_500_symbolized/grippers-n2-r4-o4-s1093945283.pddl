(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_1
obj_12 obj_05 obj_03 obj_14 - type_3
obj_10 obj_04 obj_06 obj_11 - type_2
obj_07 obj_13 obj_01 obj_08 - object)
(:init
(pred_3 obj_09 obj_11)
(pred_4 obj_09 obj_12)
(pred_4 obj_09 obj_05)
(pred_3 obj_02 obj_11)
(pred_4 obj_02 obj_03)
(pred_4 obj_02 obj_14)
(pred_2 obj_07 obj_04)
(pred_2 obj_13 obj_06)
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_06)
)
(:goal
(and
(pred_2 obj_07 obj_04)
(pred_2 obj_13 obj_11)
(pred_2 obj_01 obj_04)
(pred_2 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_09 obj_06)))
)
)