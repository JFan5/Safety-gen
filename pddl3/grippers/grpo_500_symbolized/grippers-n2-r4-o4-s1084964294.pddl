(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_07 - type_1
obj_04 obj_05 obj_10 obj_06 - type_3
obj_11 obj_14 obj_09 obj_03 - type_2
obj_02 obj_01 obj_12 obj_08 - object)
(:init
(pred_4 obj_13 obj_09)
(pred_2 obj_13 obj_04)
(pred_2 obj_13 obj_05)
(pred_4 obj_07 obj_14)
(pred_2 obj_07 obj_10)
(pred_2 obj_07 obj_06)
(pred_3 obj_02 obj_09)
(pred_3 obj_01 obj_03)
(pred_3 obj_12 obj_03)
(pred_3 obj_08 obj_11)
)
(:goal
(and
(pred_3 obj_02 obj_09)
(pred_3 obj_01 obj_14)
(pred_3 obj_12 obj_09)
(pred_3 obj_08 obj_14)
)
)

(:constraints
  (always (not (pred_4 obj_13 obj_03)))
)
)