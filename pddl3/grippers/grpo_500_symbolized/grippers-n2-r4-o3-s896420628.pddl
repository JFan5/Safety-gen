(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_12 - type_1
obj_03 obj_01 obj_04 obj_10 - type_3
obj_13 obj_06 obj_09 obj_02 - type_2
obj_08 obj_11 obj_05 - object)
(:init
(pred_4 obj_07 obj_09)
(pred_2 obj_07 obj_03)
(pred_2 obj_07 obj_01)
(pred_4 obj_12 obj_06)
(pred_2 obj_12 obj_04)
(pred_2 obj_12 obj_10)
(pred_3 obj_08 obj_06)
(pred_3 obj_11 obj_13)
(pred_3 obj_05 obj_02)
)
(:goal
(and
(pred_3 obj_08 obj_13)
(pred_3 obj_11 obj_13)
(pred_3 obj_05 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_02)))
)
)