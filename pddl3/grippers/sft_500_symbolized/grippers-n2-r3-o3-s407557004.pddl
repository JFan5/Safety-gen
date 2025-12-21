(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_06 obj_08 - type_1
obj_12 obj_07 obj_04 obj_05 - type_2
obj_11 obj_02 obj_09 - type_3
obj_03 obj_10 obj_01 - object)
(:init
(pred_1 obj_06 obj_02)
(pred_3 obj_06 obj_12)
(pred_3 obj_06 obj_07)
(pred_1 obj_08 obj_09)
(pred_3 obj_08 obj_04)
(pred_3 obj_08 obj_05)
(pred_2 obj_03 obj_02)
(pred_2 obj_10 obj_02)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_03 obj_02)
(pred_2 obj_10 obj_09)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_06 obj_09)))
)
)