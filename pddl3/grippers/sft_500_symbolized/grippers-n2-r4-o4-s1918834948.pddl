(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_02 - type_1
obj_07 obj_12 obj_09 obj_05 - type_2
obj_11 obj_04 obj_14 obj_10 - type_3
obj_01 obj_06 obj_13 obj_08 - object)
(:init
(pred_1 obj_03 obj_14)
(pred_3 obj_03 obj_07)
(pred_3 obj_03 obj_12)
(pred_1 obj_02 obj_04)
(pred_3 obj_02 obj_09)
(pred_3 obj_02 obj_05)
(pred_2 obj_01 obj_11)
(pred_2 obj_06 obj_14)
(pred_2 obj_13 obj_04)
(pred_2 obj_08 obj_14)
)
(:goal
(and
(pred_2 obj_01 obj_11)
(pred_2 obj_06 obj_11)
(pred_2 obj_13 obj_04)
(pred_2 obj_08 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_03 obj_11)))
)
)