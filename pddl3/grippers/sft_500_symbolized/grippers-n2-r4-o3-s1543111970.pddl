(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_12 - type_1
obj_06 obj_04 obj_07 obj_13 - type_3
obj_03 obj_01 obj_11 obj_09 - type_2
obj_08 obj_05 obj_10 - object)
(:init
(pred_4 obj_02 obj_03)
(pred_1 obj_02 obj_06)
(pred_1 obj_02 obj_04)
(pred_4 obj_12 obj_01)
(pred_1 obj_12 obj_07)
(pred_1 obj_12 obj_13)
(pred_2 obj_08 obj_09)
(pred_2 obj_05 obj_03)
(pred_2 obj_10 obj_01)
)
(:goal
(and
(pred_2 obj_08 obj_09)
(pred_2 obj_05 obj_11)
(pred_2 obj_10 obj_09)
)
)

(:constraints
  (always (not (pred_4 obj_02 obj_11)))
)
)