(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_05 - type_2
obj_02 obj_07 obj_11 obj_04 - type_3
obj_13 obj_03 obj_10 obj_06 - type_1
obj_09 obj_08 obj_01 - object)
(:init
(pred_4 obj_12 obj_13)
(pred_3 obj_12 obj_02)
(pred_3 obj_12 obj_07)
(pred_4 obj_05 obj_13)
(pred_3 obj_05 obj_11)
(pred_3 obj_05 obj_04)
(pred_2 obj_09 obj_13)
(pred_2 obj_08 obj_10)
(pred_2 obj_01 obj_10)
)
(:goal
(and
(pred_2 obj_09 obj_13)
(pred_2 obj_08 obj_10)
(pred_2 obj_01 obj_13)
)
)

(:constraints
  (always (not (pred_4 obj_12 obj_10)))
)
)