(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_08 - type_1
obj_01 obj_06 obj_05 obj_07 - type_2
obj_09 obj_13 obj_11 obj_03 - type_3
obj_02 obj_04 obj_10 - object)
(:init
(pred_1 obj_12 obj_03)
(pred_3 obj_12 obj_01)
(pred_3 obj_12 obj_06)
(pred_1 obj_08 obj_09)
(pred_3 obj_08 obj_05)
(pred_3 obj_08 obj_07)
(pred_2 obj_02 obj_11)
(pred_2 obj_04 obj_11)
(pred_2 obj_10 obj_03)
)
(:goal
(and
(pred_2 obj_02 obj_03)
(pred_2 obj_04 obj_09)
(pred_2 obj_10 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_11)))
)
)