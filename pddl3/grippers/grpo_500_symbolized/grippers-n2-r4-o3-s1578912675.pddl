(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_02 obj_13 obj_05 obj_01 - type_3
obj_06 obj_12 obj_09 obj_03 - type_2
obj_04 obj_10 obj_08 - object)
(:init
(pred_3 obj_07 obj_06)
(pred_4 obj_07 obj_02)
(pred_4 obj_07 obj_13)
(pred_3 obj_11 obj_06)
(pred_4 obj_11 obj_05)
(pred_4 obj_11 obj_01)
(pred_2 obj_04 obj_09)
(pred_2 obj_10 obj_09)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_04 obj_12)
(pred_2 obj_10 obj_03)
(pred_2 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_09)))
)
)