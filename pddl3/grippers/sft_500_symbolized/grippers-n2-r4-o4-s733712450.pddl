(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_14 - type_1
obj_09 obj_04 obj_05 obj_11 - type_2
obj_12 obj_03 obj_06 obj_13 - type_3
obj_08 obj_01 obj_10 obj_07 - object)
(:init
(pred_1 obj_02 obj_12)
(pred_3 obj_02 obj_09)
(pred_3 obj_02 obj_04)
(pred_1 obj_14 obj_12)
(pred_3 obj_14 obj_05)
(pred_3 obj_14 obj_11)
(pred_2 obj_08 obj_13)
(pred_2 obj_01 obj_12)
(pred_2 obj_10 obj_13)
(pred_2 obj_07 obj_03)
)
(:goal
(and
(pred_2 obj_08 obj_06)
(pred_2 obj_01 obj_13)
(pred_2 obj_10 obj_03)
(pred_2 obj_07 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_02 obj_06)))
)
)