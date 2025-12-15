(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_01 - type_3
obj_09 obj_13 obj_08 obj_04 - type_2
obj_11 obj_07 obj_10 obj_06 - type_1
obj_03 obj_02 obj_05 - object)
(:init
(pred_1 obj_12 obj_11)
(pred_4 obj_12 obj_09)
(pred_4 obj_12 obj_13)
(pred_1 obj_01 obj_06)
(pred_4 obj_01 obj_08)
(pred_4 obj_01 obj_04)
(pred_2 obj_03 obj_11)
(pred_2 obj_02 obj_07)
(pred_2 obj_05 obj_11)
)
(:goal
(and
(pred_2 obj_03 obj_11)
(pred_2 obj_02 obj_10)
(pred_2 obj_05 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_12 obj_10)))
)
)