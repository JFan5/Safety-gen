(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_3
obj_01 obj_10 obj_08 obj_14 - type_2
obj_09 obj_04 obj_05 obj_06 - type_1
obj_03 obj_13 obj_02 obj_07 - object)
(:init
(pred_3 obj_12 obj_05)
(pred_2 obj_12 obj_01)
(pred_2 obj_12 obj_10)
(pred_3 obj_11 obj_09)
(pred_2 obj_11 obj_08)
(pred_2 obj_11 obj_14)
(pred_1 obj_03 obj_04)
(pred_1 obj_13 obj_09)
(pred_1 obj_02 obj_04)
(pred_1 obj_07 obj_06)
)
(:goal
(and
(pred_1 obj_03 obj_05)
(pred_1 obj_13 obj_05)
(pred_1 obj_02 obj_06)
(pred_1 obj_07 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_06)))
)
)