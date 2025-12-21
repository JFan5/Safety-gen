(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_06 obj_09 obj_03 obj_01 - type_2
obj_10 obj_05 obj_02 - type_3
obj_12 obj_08 obj_04 - object)
(:init
(pred_1 obj_07 obj_10)
(pred_3 obj_07 obj_06)
(pred_3 obj_07 obj_09)
(pred_1 obj_11 obj_02)
(pred_3 obj_11 obj_03)
(pred_3 obj_11 obj_01)
(pred_2 obj_12 obj_10)
(pred_2 obj_08 obj_05)
(pred_2 obj_04 obj_05)
)
(:goal
(and
(pred_2 obj_12 obj_02)
(pred_2 obj_08 obj_05)
(pred_2 obj_04 obj_05)
)
)

(:constraints
  (always (not (pred_1 obj_07 obj_02)))
)
)