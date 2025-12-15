(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_08 - type_1
obj_01 obj_07 obj_02 obj_04 - type_3
obj_03 obj_12 obj_11 obj_09 - type_2
obj_06 obj_10 obj_05 - object)
(:init
(pred_2 obj_13 obj_12)
(pred_1 obj_13 obj_01)
(pred_1 obj_13 obj_07)
(pred_2 obj_08 obj_03)
(pred_1 obj_08 obj_02)
(pred_1 obj_08 obj_04)
(pred_4 obj_06 obj_11)
(pred_4 obj_10 obj_11)
(pred_4 obj_05 obj_11)
)
(:goal
(and
(pred_4 obj_06 obj_03)
(pred_4 obj_10 obj_09)
(pred_4 obj_05 obj_03)
)
)

(:constraints
  (always (not (pred_2 obj_13 obj_11)))
)
)