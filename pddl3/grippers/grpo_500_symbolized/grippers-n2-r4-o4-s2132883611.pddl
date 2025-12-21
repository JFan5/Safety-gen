(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_05 - type_1
obj_07 obj_03 obj_12 obj_10 - type_3
obj_09 obj_14 obj_11 obj_13 - type_2
obj_06 obj_01 obj_08 obj_02 - object)
(:init
(pred_4 obj_04 obj_14)
(pred_2 obj_04 obj_07)
(pred_2 obj_04 obj_03)
(pred_4 obj_05 obj_09)
(pred_2 obj_05 obj_12)
(pred_2 obj_05 obj_10)
(pred_3 obj_06 obj_13)
(pred_3 obj_01 obj_11)
(pred_3 obj_08 obj_13)
(pred_3 obj_02 obj_13)
)
(:goal
(and
(pred_3 obj_06 obj_14)
(pred_3 obj_01 obj_14)
(pred_3 obj_08 obj_14)
(pred_3 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_4 obj_04 obj_11)))
)
)