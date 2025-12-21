(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_07 obj_02 - type_1
obj_10 obj_04 obj_05 obj_06 - type_3
obj_09 obj_11 obj_03 - type_2
obj_08 obj_12 obj_01 - object)
(:init
(pred_4 obj_07 obj_09)
(pred_2 obj_07 obj_10)
(pred_2 obj_07 obj_04)
(pred_4 obj_02 obj_03)
(pred_2 obj_02 obj_05)
(pred_2 obj_02 obj_06)
(pred_3 obj_08 obj_03)
(pred_3 obj_12 obj_09)
(pred_3 obj_01 obj_09)
)
(:goal
(and
(pred_3 obj_08 obj_03)
(pred_3 obj_12 obj_09)
(pred_3 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_4 obj_07 obj_03)))
)
)