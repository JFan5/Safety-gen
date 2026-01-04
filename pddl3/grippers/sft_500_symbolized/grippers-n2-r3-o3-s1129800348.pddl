(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_11 - type_2
obj_05 obj_07 obj_08 obj_02 - type_3
obj_03 obj_09 obj_06 - type_1
obj_04 obj_01 obj_10 - object)
(:init
(pred_3 obj_12 obj_03)
(pred_2 obj_12 obj_05)
(pred_2 obj_12 obj_07)
(pred_3 obj_11 obj_03)
(pred_2 obj_11 obj_08)
(pred_2 obj_11 obj_02)
(pred_4 obj_04 obj_09)
(pred_4 obj_01 obj_09)
(pred_4 obj_10 obj_06)
)
(:goal
(and
(pred_4 obj_04 obj_03)
(pred_4 obj_01 obj_06)
(pred_4 obj_10 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_12 obj_06)))
)
)