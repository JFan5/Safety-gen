(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_03 obj_13 - type_1
obj_10 obj_02 obj_01 obj_12 - type_2
obj_07 obj_09 obj_05 obj_06 - type_3
obj_08 obj_04 obj_11 - object)
(:init
(pred_1 obj_03 obj_05)
(pred_3 obj_03 obj_10)
(pred_3 obj_03 obj_02)
(pred_1 obj_13 obj_09)
(pred_3 obj_13 obj_01)
(pred_3 obj_13 obj_12)
(pred_2 obj_08 obj_05)
(pred_2 obj_04 obj_09)
(pred_2 obj_11 obj_09)
)
(:goal
(and
(pred_2 obj_08 obj_06)
(pred_2 obj_04 obj_06)
(pred_2 obj_11 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_06)))
)
)