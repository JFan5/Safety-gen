(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_04 obj_07 - type_1
obj_13 obj_01 obj_02 obj_08 - type_3
obj_11 obj_05 obj_12 obj_09 - type_2
obj_10 obj_06 obj_03 - object)
(:init
(pred_3 obj_04 obj_12)
(pred_4 obj_04 obj_13)
(pred_4 obj_04 obj_01)
(pred_3 obj_07 obj_12)
(pred_4 obj_07 obj_02)
(pred_4 obj_07 obj_08)
(pred_2 obj_10 obj_09)
(pred_2 obj_06 obj_09)
(pred_2 obj_03 obj_11)
)
(:goal
(and
(pred_2 obj_10 obj_05)
(pred_2 obj_06 obj_05)
(pred_2 obj_03 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_04 obj_09)))
)
)