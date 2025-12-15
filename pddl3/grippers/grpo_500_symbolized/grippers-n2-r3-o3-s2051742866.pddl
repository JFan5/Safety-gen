(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_11 - type_1
obj_10 obj_09 obj_04 obj_07 - type_3
obj_06 obj_03 obj_12 - type_2
obj_02 obj_01 obj_08 - object)
(:init
(pred_3 obj_05 obj_12)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_09)
(pred_3 obj_11 obj_06)
(pred_4 obj_11 obj_04)
(pred_4 obj_11 obj_07)
(pred_2 obj_02 obj_06)
(pred_2 obj_01 obj_03)
(pred_2 obj_08 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_12)
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_06)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_03)))
)
)