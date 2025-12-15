(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_11 obj_06 - type_1
obj_04 obj_09 obj_02 obj_03 - type_3
obj_10 obj_07 obj_01 obj_12 - type_2
obj_08 obj_05 obj_13 - object)
(:init
(pred_3 obj_11 obj_07)
(pred_4 obj_11 obj_04)
(pred_4 obj_11 obj_09)
(pred_3 obj_06 obj_12)
(pred_4 obj_06 obj_02)
(pred_4 obj_06 obj_03)
(pred_2 obj_08 obj_07)
(pred_2 obj_05 obj_12)
(pred_2 obj_13 obj_01)
)
(:goal
(and
(pred_2 obj_08 obj_10)
(pred_2 obj_05 obj_12)
(pred_2 obj_13 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_11 obj_01)))
)
)