(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_04 - type_1
obj_02 obj_08 obj_13 obj_12 - type_3
obj_06 obj_01 obj_07 obj_09 - type_2
obj_11 obj_03 obj_05 - object)
(:init
(pred_3 obj_10 obj_07)
(pred_4 obj_10 obj_02)
(pred_4 obj_10 obj_08)
(pred_3 obj_04 obj_09)
(pred_4 obj_04 obj_13)
(pred_4 obj_04 obj_12)
(pred_2 obj_11 obj_01)
(pred_2 obj_03 obj_07)
(pred_2 obj_05 obj_06)
)
(:goal
(and
(pred_2 obj_11 obj_09)
(pred_2 obj_03 obj_06)
(pred_2 obj_05 obj_09)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_09)))
)
)