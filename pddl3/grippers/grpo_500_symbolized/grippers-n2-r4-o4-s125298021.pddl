(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_07 - type_1
obj_05 obj_03 obj_08 obj_13 - type_3
obj_09 obj_01 obj_02 obj_06 - type_2
obj_14 obj_10 obj_11 obj_04 - object)
(:init
(pred_4 obj_12 obj_02)
(pred_2 obj_12 obj_05)
(pred_2 obj_12 obj_03)
(pred_4 obj_07 obj_01)
(pred_2 obj_07 obj_08)
(pred_2 obj_07 obj_13)
(pred_3 obj_14 obj_06)
(pred_3 obj_10 obj_09)
(pred_3 obj_11 obj_01)
(pred_3 obj_04 obj_01)
)
(:goal
(and
(pred_3 obj_14 obj_02)
(pred_3 obj_10 obj_01)
(pred_3 obj_11 obj_09)
(pred_3 obj_04 obj_01)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_06)))
)
)