(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_13 - type_1
obj_08 obj_06 obj_09 obj_10 - type_2
obj_04 obj_12 obj_03 obj_11 - type_3
obj_02 obj_07 obj_01 - object)
(:init
(pred_1 obj_05 obj_03)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_06)
(pred_1 obj_13 obj_04)
(pred_3 obj_13 obj_09)
(pred_3 obj_13 obj_10)
(pred_2 obj_02 obj_04)
(pred_2 obj_07 obj_03)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_02 obj_04)
(pred_2 obj_07 obj_12)
(pred_2 obj_01 obj_12)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_11)))
)
)