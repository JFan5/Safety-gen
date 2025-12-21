(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_04 obj_07 obj_09 obj_06 - type_3
obj_02 obj_05 obj_11 obj_03 - type_2
obj_12 obj_08 obj_13 - object)
(:init
(pred_4 obj_10 obj_11)
(pred_2 obj_10 obj_04)
(pred_2 obj_10 obj_07)
(pred_4 obj_01 obj_05)
(pred_2 obj_01 obj_09)
(pred_2 obj_01 obj_06)
(pred_3 obj_12 obj_05)
(pred_3 obj_08 obj_03)
(pred_3 obj_13 obj_05)
)
(:goal
(and
(pred_3 obj_12 obj_05)
(pred_3 obj_08 obj_05)
(pred_3 obj_13 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_10 obj_03)))
)
)