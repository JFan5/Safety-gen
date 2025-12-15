(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_02 obj_07 obj_05 obj_08 - type_3
obj_03 obj_01 obj_09 - type_2
obj_10 obj_11 obj_12 - object)
(:init
(pred_3 obj_04 obj_03)
(pred_4 obj_04 obj_02)
(pred_4 obj_04 obj_07)
(pred_3 obj_06 obj_03)
(pred_4 obj_06 obj_05)
(pred_4 obj_06 obj_08)
(pred_2 obj_10 obj_09)
(pred_2 obj_11 obj_09)
(pred_2 obj_12 obj_01)
)
(:goal
(and
(pred_2 obj_10 obj_09)
(pred_2 obj_11 obj_01)
(pred_2 obj_12 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_09)))
)
)