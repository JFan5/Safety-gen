(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_04 - type_3
obj_02 obj_07 obj_08 obj_12 - type_2
obj_05 obj_06 obj_09 - type_1
obj_03 obj_11 obj_10 - object)
(:init
(pred_3 obj_01 obj_06)
(pred_2 obj_01 obj_02)
(pred_2 obj_01 obj_07)
(pred_3 obj_04 obj_06)
(pred_2 obj_04 obj_08)
(pred_2 obj_04 obj_12)
(pred_4 obj_03 obj_05)
(pred_4 obj_11 obj_09)
(pred_4 obj_10 obj_09)
)
(:goal
(and
(pred_4 obj_03 obj_05)
(pred_4 obj_11 obj_09)
(pred_4 obj_10 obj_05)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_09)))
)
)