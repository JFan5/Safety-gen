(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_08 obj_01 - type_1
obj_05 obj_10 obj_03 obj_04 - type_2
obj_12 obj_14 obj_11 obj_06 - type_3
obj_09 obj_02 obj_07 obj_13 - object)
(:init
(pred_4 obj_08 obj_11)
(pred_1 obj_08 obj_05)
(pred_1 obj_08 obj_10)
(pred_4 obj_01 obj_12)
(pred_1 obj_01 obj_03)
(pred_1 obj_01 obj_04)
(pred_2 obj_09 obj_12)
(pred_2 obj_02 obj_11)
(pred_2 obj_07 obj_11)
(pred_2 obj_13 obj_06)
)
(:goal
(and
(pred_2 obj_09 obj_06)
(pred_2 obj_02 obj_11)
(pred_2 obj_07 obj_11)
(pred_2 obj_13 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_08 obj_06)))
)
)