(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_08 obj_07 - type_1
obj_04 obj_05 obj_02 obj_03 - type_2
obj_12 obj_06 obj_09 - type_3
obj_01 obj_10 obj_11 - object)
(:init
(pred_1 obj_08 obj_06)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_05)
(pred_1 obj_07 obj_06)
(pred_3 obj_07 obj_02)
(pred_3 obj_07 obj_03)
(pred_2 obj_01 obj_12)
(pred_2 obj_10 obj_06)
(pred_2 obj_11 obj_12)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_10 obj_06)
(pred_2 obj_11 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_09)))
)
)