(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_03 - type_1
obj_12 obj_02 obj_07 obj_05 - type_3
obj_06 obj_08 obj_09 - type_2
obj_01 obj_10 obj_04 - object)
(:init
(pred_2 obj_11 obj_06)
(pred_1 obj_11 obj_12)
(pred_1 obj_11 obj_02)
(pred_2 obj_03 obj_06)
(pred_1 obj_03 obj_07)
(pred_1 obj_03 obj_05)
(pred_4 obj_01 obj_06)
(pred_4 obj_10 obj_08)
(pred_4 obj_04 obj_09)
)
(:goal
(and
(pred_4 obj_01 obj_08)
(pred_4 obj_10 obj_09)
(pred_4 obj_04 obj_09)
)
)

(:constraints
  (always (not (pred_2 obj_11 obj_09)))
)
)