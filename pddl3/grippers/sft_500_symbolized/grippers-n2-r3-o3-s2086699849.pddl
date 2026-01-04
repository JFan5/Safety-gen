(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_04 - type_2
obj_09 obj_07 obj_08 obj_06 - type_3
obj_03 obj_12 obj_02 - type_1
obj_05 obj_11 obj_10 - object)
(:init
(pred_2 obj_01 obj_12)
(pred_1 obj_01 obj_09)
(pred_1 obj_01 obj_07)
(pred_2 obj_04 obj_02)
(pred_1 obj_04 obj_08)
(pred_1 obj_04 obj_06)
(pred_3 obj_05 obj_02)
(pred_3 obj_11 obj_02)
(pred_3 obj_10 obj_02)
)
(:goal
(and
(pred_3 obj_05 obj_12)
(pred_3 obj_11 obj_03)
(pred_3 obj_10 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_01 obj_02)))
)
)