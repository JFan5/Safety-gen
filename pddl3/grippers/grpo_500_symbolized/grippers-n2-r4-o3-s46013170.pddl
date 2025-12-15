(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_02 - type_1
obj_06 obj_07 obj_04 obj_10 - type_3
obj_03 obj_09 obj_11 obj_01 - type_2
obj_12 obj_08 obj_05 - object)
(:init
(pred_3 obj_13 obj_03)
(pred_4 obj_13 obj_06)
(pred_4 obj_13 obj_07)
(pred_3 obj_02 obj_01)
(pred_4 obj_02 obj_04)
(pred_4 obj_02 obj_10)
(pred_2 obj_12 obj_11)
(pred_2 obj_08 obj_01)
(pred_2 obj_05 obj_09)
)
(:goal
(and
(pred_2 obj_12 obj_11)
(pred_2 obj_08 obj_11)
(pred_2 obj_05 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_13 obj_11)))
)
)