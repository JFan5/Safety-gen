(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_1
obj_02 obj_07 obj_09 obj_10 - type_2
obj_13 obj_11 obj_03 obj_04 - type_3
obj_06 obj_08 obj_01 - object)
(:init
(pred_1 obj_12 obj_11)
(pred_3 obj_12 obj_02)
(pred_3 obj_12 obj_07)
(pred_1 obj_05 obj_11)
(pred_3 obj_05 obj_09)
(pred_3 obj_05 obj_10)
(pred_2 obj_06 obj_13)
(pred_2 obj_08 obj_03)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_08 obj_11)
(pred_2 obj_01 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_03)))
)
)