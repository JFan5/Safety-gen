(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_3
obj_13 obj_06 obj_04 obj_12 - type_1
obj_03 obj_09 obj_11 obj_07 - type_2
obj_01 obj_10 obj_05 - object)
(:init
(pred_3 obj_02 obj_07)
(pred_4 obj_02 obj_13)
(pred_4 obj_02 obj_06)
(pred_3 obj_08 obj_03)
(pred_4 obj_08 obj_04)
(pred_4 obj_08 obj_12)
(pred_2 obj_01 obj_11)
(pred_2 obj_10 obj_07)
(pred_2 obj_05 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_11)
(pred_2 obj_10 obj_11)
(pred_2 obj_05 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_11)))
)
)