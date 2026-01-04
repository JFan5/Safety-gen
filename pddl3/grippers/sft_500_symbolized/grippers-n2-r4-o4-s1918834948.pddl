(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_05 obj_01 - type_1
obj_14 obj_12 obj_07 obj_02 - type_3
obj_11 obj_13 obj_06 obj_08 - type_2
obj_09 obj_10 obj_03 obj_04 - object)
(:init
(pred_2 obj_05 obj_06)
(pred_3 obj_05 obj_14)
(pred_3 obj_05 obj_12)
(pred_2 obj_01 obj_13)
(pred_3 obj_01 obj_07)
(pred_3 obj_01 obj_02)
(pred_4 obj_09 obj_11)
(pred_4 obj_10 obj_06)
(pred_4 obj_03 obj_13)
(pred_4 obj_04 obj_06)
)
(:goal
(and
(pred_4 obj_09 obj_11)
(pred_4 obj_10 obj_11)
(pred_4 obj_03 obj_13)
(pred_4 obj_04 obj_11)
)
)

(:constraints
  (always (not (pred_2 obj_05 obj_11)))
)
)