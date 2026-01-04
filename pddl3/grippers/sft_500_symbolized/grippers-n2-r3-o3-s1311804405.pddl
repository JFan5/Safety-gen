(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_07 - type_2
obj_05 obj_06 obj_08 obj_03 - type_3
obj_02 obj_11 obj_09 - type_1
obj_04 obj_12 obj_10 - object)
(:init
(pred_1 obj_01 obj_02)
(pred_3 obj_01 obj_05)
(pred_3 obj_01 obj_06)
(pred_1 obj_07 obj_11)
(pred_3 obj_07 obj_08)
(pred_3 obj_07 obj_03)
(pred_2 obj_04 obj_02)
(pred_2 obj_12 obj_02)
(pred_2 obj_10 obj_09)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_12 obj_09)
(pred_2 obj_10 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_01 obj_09)))
)
)