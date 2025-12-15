(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_10 obj_11 - type_2
obj_02 obj_08 obj_01 obj_06 - type_1
obj_04 obj_05 obj_09 - type_3
obj_07 obj_03 obj_12 - object)
(:init
(pred_2 obj_10 obj_04)
(pred_3 obj_10 obj_02)
(pred_3 obj_10 obj_08)
(pred_2 obj_11 obj_04)
(pred_3 obj_11 obj_01)
(pred_3 obj_11 obj_06)
(pred_1 obj_07 obj_05)
(pred_1 obj_03 obj_05)
(pred_1 obj_12 obj_09)
)
(:goal
(and
(pred_1 obj_07 obj_04)
(pred_1 obj_03 obj_09)
(pred_1 obj_12 obj_05)
)
)

(:constraints
  (always (not (pred_2 obj_10 obj_09)))
)
)