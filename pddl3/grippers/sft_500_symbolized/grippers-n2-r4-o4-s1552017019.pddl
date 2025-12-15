(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_3
obj_14 obj_13 obj_05 obj_09 - type_2
obj_03 obj_01 obj_11 obj_04 - type_1
obj_07 obj_10 obj_06 obj_12 - object)
(:init
(pred_3 obj_02 obj_03)
(pred_4 obj_02 obj_14)
(pred_4 obj_02 obj_13)
(pred_3 obj_08 obj_03)
(pred_4 obj_08 obj_05)
(pred_4 obj_08 obj_09)
(pred_1 obj_07 obj_03)
(pred_1 obj_10 obj_11)
(pred_1 obj_06 obj_03)
(pred_1 obj_12 obj_04)
)
(:goal
(and
(pred_1 obj_07 obj_04)
(pred_1 obj_10 obj_03)
(pred_1 obj_06 obj_11)
(pred_1 obj_12 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_11)))
)
)