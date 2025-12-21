(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_12 obj_06 - type_1
obj_05 obj_03 obj_02 obj_01 - type_3
obj_11 obj_04 obj_09 - type_2
obj_07 obj_10 obj_08 - object)
(:init
(pred_4 obj_12 obj_11)
(pred_2 obj_12 obj_05)
(pred_2 obj_12 obj_03)
(pred_4 obj_06 obj_11)
(pred_2 obj_06 obj_02)
(pred_2 obj_06 obj_01)
(pred_3 obj_07 obj_09)
(pred_3 obj_10 obj_09)
(pred_3 obj_08 obj_04)
)
(:goal
(and
(pred_3 obj_07 obj_09)
(pred_3 obj_10 obj_11)
(pred_3 obj_08 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_09)))
)
)