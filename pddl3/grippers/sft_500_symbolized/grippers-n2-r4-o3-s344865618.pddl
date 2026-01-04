(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_04 - type_2
obj_05 obj_03 obj_01 obj_08 - type_1
obj_02 obj_09 obj_10 obj_12 - type_3
obj_06 obj_11 obj_13 - object)
(:init
(pred_1 obj_07 obj_10)
(pred_2 obj_07 obj_05)
(pred_2 obj_07 obj_03)
(pred_1 obj_04 obj_10)
(pred_2 obj_04 obj_01)
(pred_2 obj_04 obj_08)
(pred_3 obj_06 obj_10)
(pred_3 obj_11 obj_09)
(pred_3 obj_13 obj_09)
)
(:goal
(and
(pred_3 obj_06 obj_02)
(pred_3 obj_11 obj_09)
(pred_3 obj_13 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_02)))
)
)