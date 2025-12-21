(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_1
obj_10 obj_01 obj_09 obj_14 - type_2
obj_02 obj_13 obj_08 obj_06 - type_3
obj_04 obj_07 obj_03 obj_05 - object)
(:init
(pred_1 obj_12 obj_08)
(pred_3 obj_12 obj_10)
(pred_3 obj_12 obj_01)
(pred_1 obj_11 obj_13)
(pred_3 obj_11 obj_09)
(pred_3 obj_11 obj_14)
(pred_2 obj_04 obj_13)
(pred_2 obj_07 obj_06)
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_02)
)
(:goal
(and
(pred_2 obj_04 obj_08)
(pred_2 obj_07 obj_02)
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_06)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_06)))
)
)