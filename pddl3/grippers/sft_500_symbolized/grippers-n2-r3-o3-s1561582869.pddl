(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_07 - type_1
obj_11 obj_03 obj_08 obj_02 - type_2
obj_01 obj_06 obj_09 - type_3
obj_12 obj_10 obj_04 - object)
(:init
(pred_1 obj_05 obj_01)
(pred_3 obj_05 obj_11)
(pred_3 obj_05 obj_03)
(pred_1 obj_07 obj_09)
(pred_3 obj_07 obj_08)
(pred_3 obj_07 obj_02)
(pred_2 obj_12 obj_01)
(pred_2 obj_10 obj_09)
(pred_2 obj_04 obj_09)
)
(:goal
(and
(pred_2 obj_12 obj_09)
(pred_2 obj_10 obj_01)
(pred_2 obj_04 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_09)))
)
)