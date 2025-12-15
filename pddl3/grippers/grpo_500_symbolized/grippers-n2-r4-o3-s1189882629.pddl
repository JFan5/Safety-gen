(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_10 - type_1
obj_01 obj_07 obj_13 obj_03 - type_3
obj_08 obj_12 obj_06 obj_09 - type_2
obj_05 obj_02 obj_11 - object)
(:init
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_01)
(pred_4 obj_04 obj_07)
(pred_3 obj_10 obj_09)
(pred_4 obj_10 obj_13)
(pred_4 obj_10 obj_03)
(pred_2 obj_05 obj_12)
(pred_2 obj_02 obj_09)
(pred_2 obj_11 obj_06)
)
(:goal
(and
(pred_2 obj_05 obj_09)
(pred_2 obj_02 obj_09)
(pred_2 obj_11 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_06)))
)
)