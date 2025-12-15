(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_05 - type_3
obj_13 obj_07 obj_02 obj_06 - type_2
obj_11 obj_01 obj_04 obj_09 - type_1
obj_12 obj_03 obj_08 - object)
(:init
(pred_3 obj_10 obj_04)
(pred_2 obj_10 obj_13)
(pred_2 obj_10 obj_07)
(pred_3 obj_05 obj_11)
(pred_2 obj_05 obj_02)
(pred_2 obj_05 obj_06)
(pred_4 obj_12 obj_09)
(pred_4 obj_03 obj_11)
(pred_4 obj_08 obj_01)
)
(:goal
(and
(pred_4 obj_12 obj_11)
(pred_4 obj_03 obj_04)
(pred_4 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_10 obj_09)))
)
)