(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_13 - type_1
obj_04 obj_08 obj_06 obj_12 - type_3
obj_09 obj_07 obj_03 obj_02 - type_2
obj_10 obj_05 obj_01 - object)
(:init
(pred_3 obj_11 obj_02)
(pred_4 obj_11 obj_04)
(pred_4 obj_11 obj_08)
(pred_3 obj_13 obj_09)
(pred_4 obj_13 obj_06)
(pred_4 obj_13 obj_12)
(pred_2 obj_10 obj_09)
(pred_2 obj_05 obj_02)
(pred_2 obj_01 obj_03)
)
(:goal
(and
(pred_2 obj_10 obj_09)
(pred_2 obj_05 obj_02)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_03)))
)
)